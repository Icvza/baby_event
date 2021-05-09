module EventsHelper
    def set_event
        @event = Event.find_by(params[:id])
    end

    def event_params
      params.require(:event).permit(:content, :time, :user_id, :baby_id)
    end 

    def require_ownership
      if set_event.user_id != current_user.id
        redirect_to user_path(params[:id])
     end
    end

    def require_ownership_for_nested_route
      if current_user.id != params[:id].to_i
        redirect_to user_path(params[:id])
      end
    end
end
