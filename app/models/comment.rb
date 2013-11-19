class Comment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :homework
  belongs_to :page
end
