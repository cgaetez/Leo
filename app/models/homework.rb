class Homework < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :course
  has_many :answers
  has_many :assignments
  has_many :comments
end
