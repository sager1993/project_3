class SupportsController < ApplicationController
    
    before_action :is_owner, only: [:destroy, :update, :edit]
    def index 
        @supports = Support.all
    end

    def new
        @support = Support.new
    end

    def create
        if user_signed_in?
        cause = Cause.find(params[:support][:cause_id])
        @support = current_user.supports.create(supports_params)
            if @support.save
            redirect_to cause   
            else
              render :new 
            end
        else
            redirect_to new_user_session_path
        end
    end

    def edit
        @support = Support.find(params[:id])
    end

    def update
        cause = Cause.find(params[:support][:cause_id])
            
        support = Support.find(params[:id])

        @support = support.update(supports_params)

        redirect_to cause
    end
    

    def destroy
        cause_num = Support.find(params[:id])[:cause_id]
        cause = Cause.find(cause_num)

        Support.find(params[:id]).destroy

        redirect_to cause
    end



    private
    def supports_params
        params.require(:support).permit(:body, :title, :cause_id, :user_id, :id)
    end

    def is_owner
        cause_num = Support.find(params[:id]).cause_id
        cause = Cause.find(cause_num)
        if user_signed_in?
            if current_user.id == Support.find(params[:id]).user_id
            return true
            else
            redirect_to cause
            end
        else
            redirect_to new_user_session_path
        end
    end
end
