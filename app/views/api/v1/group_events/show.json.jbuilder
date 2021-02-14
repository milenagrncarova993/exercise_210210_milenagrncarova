json.extract! @group_event, :id, :name, :location, :description, :start_date, :end_date, :status
json.comments @group_event.comments do |comment|
  json.extract! comment, :id, :content
end