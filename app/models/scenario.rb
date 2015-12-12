class Scenario < ActiveRecord::Base
  validates :step, presence: true

  belongs_to :project
end
