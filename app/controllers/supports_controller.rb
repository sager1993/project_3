class SupportsController < ApplicationController
    # permissions
    # Only the support's owner can edit and destroy their support
    before_action :is_owner, only: [:destroy, :update, :edit]

    # Full CRUD Controller for the support.
    # Show all supports
    def index 
        @supports = Support.all
    end

    # A new support action, initializes a new support object
    def new
        @support = Support.new
    end

    # Create a new support action, it creates and fills the new support object
    def create
        # check if the user logged in
        if user_signed_in?
        # get the parent cause id, so they get to be redirected to it.
        cause = Cause.find(params[:support][:cause_id])
        # Create a new support and declare it in @support to be passed to the view
        @support = current_user.supports.create(supports_params)
            # once saved, go to the parent cause page
            if @support.save
            redirect_to cause   
            # if it's not saved initialize a new one 
            else
              render :new 
            end
        else
             # if the user not logged, redirect them to sign up
            redirect_to new_user_session_path
        end
    end

    # edit action for a secific support, by their id then it passes to the view
    def edit
        @support = Support.find(params[:id])
    end

    # update action for the cause
    def update
        # look for the specific support, and store it in a variable
        support = Support.find(params[:id])
        
        # pass the parent cause id to updated support params
        params[:support][:cause_id] = support.cause_id
        
        # update that specific support using the update params
        @support = support.update(supports_params)

        # redirect to parent cause page
        # get the cause id
        cause_num = support[:cause_id]
        # get the cause
        cause = Cause.find(cause_num)

        # redirect to parent cause page that contains 
        # the support and other supports on the same cause
        redirect_to cause
    end
    

    def destroy
        # redirect to parent cause page
        # get the cause id
        cause_num = Support.find(params[:id])[:cause_id]
        # get the cause
        cause = Cause.find(cause_num)

        # destroy the support post
        Support.find(params[:id]).destroy

        # redirect to parent cause page that contains 
        # the support and other supports on the same cause
        redirect_to cause
    end



    private
    # passes the supports params
    def supports_params
        params.require(:support).permit(:body, :title, :cause_id, :user_id, :id)
    end

    # Chack if the logged user is the owner of the support
    def is_owner
        cause_num = Support.find(params[:id]).cause_id
        cause = Cause.find(cause_num)
        if user_signed_in?
            if current_user.id == Support.find(params[:id]).user_id
            return true
            else
            # return them to the page they were at
            redirect_to cause
            end
        else
            # if the user not logged, redirect them to sign up
            redirect_to new_user_session_path
        end
    end
end
