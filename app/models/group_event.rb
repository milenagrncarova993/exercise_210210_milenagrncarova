class GroupEvent < ApplicationRecord
  belongs_to :user
  has_many :group_events
end
