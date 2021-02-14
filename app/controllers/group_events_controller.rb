class GroupEventsController < ApplicationController

  def index
    @group_events = GroupEvent.all
  end

  def show
    @group_event = GroupEvent.find(params[:id])
  end

  def edit
    @group_event = GroupEvent.find(params[:id])
  end

  def new
    @user = current_user
    @group_event = GroupEvent.new 
  end

  def create
    @user = current_user
    @group_event = GroupEvent.new(group_event_params)
    @group_event.user = current_user
     if @group_event.save
     redirect_to group_event_path(@group_event)
     else
      render :new
     end
    end

  def update
    @group_event = GroupEvent.find(params[:id])
    @group_event.update(group_event_params)

    redirect_to group_event_path(@group_event)
  end

  def destroy
    @group_event = GroupEvent.find(params[:id])
    @group_event.destroy

    redirect_to group_event_path

  end

  private

  def group_event_params
    params.require(:group_event).permit(:name, :description, :location, :start_date, :end_date, :status)
  end
end
