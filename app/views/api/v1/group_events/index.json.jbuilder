json.array! @group_events do |group_event|
    json.extract! group_event, :id, :name, :location, :description, :start_date, :end_date, :status
  end