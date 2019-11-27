class CausesController < ApplicationController
    before_action :is_owner, only: [:destroy, :edit]
    before_action :is_organization, only: [:new, :create]
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

    def show
        @cause = Cause.find(params[:id])
        @supports = @cause.supports 
    end

    def destroy
        Cause.find(params[:id]).destroy
        redirect_to causes_path
    end

    def edit
        @cause = Cause.find(params[:id])
    end


    def update
        cause = Cause.find(params[:id])

        @cause = cause.update(causes_params)

        redirect_to causes_path
    end


    
    private
    def causes_params
        params.require(:cause).permit(:name, :description, :category, :img)
    end

    def is_owner
        if user_signed_in?
            if current_user.id == Cause.find(params[:id]).user_id
                return true
            else
            redirect_to causes_path
            end
        else
        redirect_to new_user_session_path
        end
    end

    def is_organization
        if user_signed_in?
            if current_user.role == "organization"
                return true
            else
            redirect_to causes_path
            end
        else
            redirect_to new_user_session_path
        end
    end
end