class Project < ActiveRecord::Base
  validates :title, presence: { message: 'Title should be exist' },
                    uniqueness: { case_sensitive: false, message: 'This Project already exist' }

  belongs_to :user
  has_many :scenarios, dependent: :destroy
end
