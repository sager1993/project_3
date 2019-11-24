class CausesController < ApplicationController

    def index
        @causes = Cause.all
    end
​
    def new
        @cause = Cause.new
    end
​
    def create
        @cause = Cause.create(causes_params)
        if @cause.save
            redirect_to causes_path
        else
            render :new
        end
    end
​
    private
    def causes_params
        params.require(:cause).permit(:body)
    end

end
