class GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :edit, :update, :destroy]

  def index
      @group_events = GroupEvent.all
  end

  def show

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

  def edit

  end

  def update
    @group_event.update(group_event_params)

    redirect_to group_event_path(@group_event)
  end

  def destroy
    @group_event.destroy

    redirect_to group_event_path
  end

  private

  def group_event_params
    params.require(:group_event).permit(:name, :description, :location, :start_date, :end_date)
  end

  def set_group_event
    @group_event = GroupEvent.find(params[:id])
  end


end
