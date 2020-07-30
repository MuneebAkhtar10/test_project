class Project < ApplicationRecord
  validates_associated :bugs
	validates :title, presence: true,uniqueness: true ,
                    length: { minimum: 5 }, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  belongs_to :user
  has_many :usersprojects, dependent: :destroy
  has_many :bugs, dependent: :destroy
  has_many :users, through: :usersprojects
end
