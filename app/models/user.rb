class User < ActiveRecord::Base
  has_many :answers
  has_many :given_assignments, class_name: 'Assignment', foreign_key: :teacher_id
  has_many :assignments, class_name: 'Assignment', foreign_key: :student_id
  has_many :comments, class_name: 'Comment', foreign_key: :student_id
  has_many :employees
  has_many :schools, through: :employees
  has_many :friendships
  has_many :sent_friendships, -> { where status: 'Pending' }, class_name: 'Friendship'
  has_many :accepted_friendships, -> { where status: 'Accepted' }, class_name: 'Friendship'
  has_many :blocked_friendships, -> { where status: 'Blocked' }, class_name: 'Friendship'
  has_many :friends, -> { where status: 'Accepted' }, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_sent_friendships, -> { where status: 'Pending' }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_accepted_friendships, -> { where status: 'Accepted' }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_blocked_friendships, -> { where status: 'Blocked' }, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_friends, -> { where status: 'Accepted' }, through: :inverse_friendships, source: :user
  has_many :subscriptions
end
