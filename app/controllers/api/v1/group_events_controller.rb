class Api::V1::GroupEventsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_restaurant, only: [ :show, :update, :destroy ]

    def index
      @group_events = policy_scope(GroupEvent)
    end

    def show
    end

    def create
        @group_event = GroupEvent.new(group_event_params)
        @group_event.user = current_user
        authorize @group_event
        if @group_event.save
          render :show, status: :created
        else
          render_error
        end
      end

    def update
        if @group_event.update(group_event_params)
          render :show
        else
          render_error
        end
      end

    def destroy
        @group_event.destroy
        head :no_content
    end
  
    private
  
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
      authorize @group_event  # For Pundit
    end
  end

  def group_event_params
    params.require(:group_event).permit(:name, :location, :description, :start_date, :end_date, :status)
  end

  def render_error
    render json: { errors: @group_event.errors.full_messages },
      status: :unprocessable_entity
  end