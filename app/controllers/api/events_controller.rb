module Api
  class EventsController < ApiController
    def create
      #TODO create using current_user
      @event = Event.new(event_params)
      
      if @event.save
        render json: @event
      else
        render json: @event.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.try(:destroy)
      render json: {}
    end
    
    def index
      @events = Event.search(params[:search])
      render json: @events
    end
    
    def show
      @event = Event.find(params[:id])
      render json: @event
    end
    
    private
    
    def event_params
      params.require(:events).permit(:title, :description, :start_time, :end_time, :category, :longtitude, :latitude)
    end
  end
end
