class CampersController < ApplicationController
    #renders all campers to page with /campers route
    def index
        render json: Camper.all
    end

    #renders individual camper with all corresponding activities by using id
    #separate serializer than index 
    def show
        render json: find_camper, serializer: CamperActivitySerializer
    end

    #creates new camper instance
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    #helper function to find camper by id
    def find_camper
        Camper.find(params[:id])
    end

    
    def camper_params
        params.permit(:name, :age)
    end
end
