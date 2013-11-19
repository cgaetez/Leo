class School < ActiveRecord::Base
  has_many :courses
  has_many :employees
  has_many :users, through: :employees
end
