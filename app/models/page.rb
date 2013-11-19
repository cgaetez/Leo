class Page < ActiveRecord::Base
  belongs_to :homework
  has_many :answers
  has_many :comments
end
