class CausesController < ApplicationController
    # permissions
    # Only owner can edit and destroy their causes
    before_action :is_owner, only: [:destroy, :edit]
    # Only organizations can create causes
    before_action :is_organization, only: [:new, :create]

    # Full CRUD Controller for the causes.
    # Show all causes
    def index 
        @causes = Cause.all
    end

    # A new cause action, initializes a new cause object
    def new
        @cause = Cause.new
    end

    # Create a new Cause action, it creates and a fills a the new cause object
    def create
        # check if the user logged in
        if user_signed_in?
            # Create a new cause and declare it in @cause to be passed to the view
            @cause = current_user.causes.create(causes_params)
                # once saved show all the causes
                if @cause.save
                    redirect_to causes_path
                # if it's not saved initialize a new
                else
                    render :new 
                end
        else
            # if the user not logged, redirect them to sign up
            redirect_to new_user_session_path
        end
    end

    # show a specific cause action
    def show
        # it looks for the specific cause by the id, then passes it to the view
        @cause = Cause.find(params[:id])
        # It looks for the supports of the specific cause, then passes them to the view
        @supports = @cause.supports 
    end

    # edit action for a secific cause, by id then it passes to the view
    def edit
        @cause = Cause.find(params[:id])
    end

    # update action for the cause
    def update
        # look for the specific cause, and store it
        cause = Cause.find(params[:id])

        # update that specific cause using the update params
        @cause = cause.update(causes_params)

        # redirect to the causes index
        redirect_to causes_path
    end

    # destroy action, it deletes them and all of their dependencies
    def destroy
        Cause.find(params[:id]).destroy
        redirect_to causes_path
    end


    private
    # passes the causes params
    def causes_params
        params.require(:cause).permit(:name, :description, :category, :img)
    end

    # Chack if the logged user is the owner of the cause
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

    # Check if the user role is "organization", to allow the user to create causes
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