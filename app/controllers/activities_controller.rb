class ActivitiesController < ApplicationController
    #renders all activies to page with route /activities
    def index
        render json: Activity.all
    end

    #deletes an activity and all its corresponding signups
    def destroy
        find_activity.destroy!
        render json: {}, status: :no_content
    end

    private

    #helper function to find activity by params
    def find_activity
        Activity.find(params[:id])
    end
end
