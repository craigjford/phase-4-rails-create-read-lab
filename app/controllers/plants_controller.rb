class PlantsController < ApplicationController

    def index
        render json: Plant.all, except: [:created_at, :updated_at], status: :ok
    end

    def show 
        plant = Plant.find_by(:id => params[:id])
        if plant
            render json: plant, except: [:created_at, :updated_at], status: :ok
        else
            render json: {error: "Plant not found"}, status: :not_found    
        end
    end

    def create    
        plant = Plant.create(plant_params)
        render json: plant, except: [:created_at, :updated_at], status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
