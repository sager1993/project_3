class CausesController < ApplicationController
    before_action :is_owner, only: [:destroy, :edit]
    def index 
        @causes = Cause.all
    end

    def new
        @cause = Cause.new
    end

    def create
        if user_signed_in?
        @cause = current_user.causes.create(causes_params)
        if @cause.save
            redirect_to causes_path   
        else
              render :new 
          end
          else
            redirect_to new_user_session_path
          end
    end

    

    def destroy
        Cause.find(params[:id]).destroy
        redirect_to causes_path
    end

    def edit
        @cause = Cause.find(params[:id])
    end

    def update
        if user_signed_in?
            cause = Cause.find(params[:id])

            @cause = cause.update(causes_params)

            redirect_to causes_path
        else
            redirect_to new_user_session_path
        end
    end
    
    private
    def causes_params
        params.require(:cause).permit(:name, :description, :category)
    end

    def is_owner
        if current_user.id == Cause.find(params[:id]).user_id
            return true
        else
            redirect_to causes_path
        end
    end
end