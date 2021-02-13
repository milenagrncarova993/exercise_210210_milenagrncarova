class GroupEvent < ApplicationRecord
  belongs_to :user
  
  CATEGORY = [
    "SAVED",
    "DRAFTS"
  ]
  validates_presence_of :name, :location, :description, :start_date, :end_date
  validates :status, inclusion: { in: CATEGORY }

end
