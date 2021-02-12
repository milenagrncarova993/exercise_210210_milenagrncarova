class GroupEventsController < ApplicationController

  def index
      @group_events = GroupEvent.all
  end

  def show
    @group_event = GroupEvent.find(params[:id])
  end

  def new
    @group_event = GroupEvent.new 
  end

  def create
    @group_event = GroupEvent.new(group_event_params)
    @group_event.user = current_user
    @group_event.save
    redirect_to group_events_path(@group_event)
  end

  private

  def group_event_params
    params.require(:group_event).permit(:name, :description, :location, :start_date, :end_date)
  end


end
