class GroupEventsController < ApplicationController

  def index
    @group_events = GroupEvent.all
    json_response(@group_events)
  end

  def show
    @group_event = GroupEvent.find(params[:id])
    json_response(@group_event)
  end

  def new
    @group_event = GroupEvent.new 
    @json_response(@group_event)
  end

  def create
    @group_event = GroupEvent.new(group_event_params)
    @group_event.user = current_user
     if @group_event.save
     redirect_to group_events_path(@group_event)
     else
      render :new
     end
    json_response(@group_event,:created)
    end

  def edit
    @group_event = GroupEvent.find(params[:id])
  end

  def update
    @group_event = GroupEvent.find(params[:id])
    @group_event.update(group_event_params)

    redirect_to group_event_path(@group_event)
    head :no_content
  end

  def destroy
    @group_event = GroupEvent.find(params[:id])
    @group_event.destroy

    redirect_to group_event_path
    head :no_content
  end

  private

  def group_event_params
    params.require(:group_event).permit(:name, :description, :location, :start_date, :end_date, :status)
  end


end
