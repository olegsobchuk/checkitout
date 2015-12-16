class Scenario < ActiveRecord::Base
  include CapybaraMethods

  FAILD_STATUSES = [false, {'status'=>'fail'}]

  validates :step, presence: true
  validate :check_method

  belongs_to :project

  scope :steps_with_id_list, ->(project, title) do
    where(project_id: project, title: title).order(:order).pluck(:id, :step)
  end

  def self.build_list(project, scenario_title)
    session = Capster.session
    steps_with_id_list.each do |step|
      id = step.first
      command = step.last
      next if command.match(/^\s*#/)
      result = eval('session.' + command)
      raise "faild on #{comand}" if FAILD_STATUSES.include?(result)
    end
  rescue => e
    # TODO save error message
    e.message
    session.reset!
  end

  private

  def check_method
    unless /^(?<method>\s*(\w|_){3,30})(\s|\()/ =~ step && Scenario::DSL_METHODS.include?(method.to_sym)
      error.add(:scenario, "Can't find method \"#{method}\"")
    end
  end
end
