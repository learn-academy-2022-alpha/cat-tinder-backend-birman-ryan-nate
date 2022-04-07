class AnimalsController < ApplicationController

        def index
         animals = Animal.all
         render json: animals
        end
        def create
         animal = Animal.create(strong_animal_params)
         render json: animal
        end
        def update
         animal = Animal.find(params[:id])
         animal.update(strong_animal_params)
         if animal.valid?
          render json: animal
         else
         render json: animal.errors
         end
        end
        def destroy
         animal = Animal.find(params[:id])
         if animal.destroy
          render json: animal
         else
          render json: animal.errors
        end
        end
        private
        def strong_animal_params
         params.require(:animal).permit(:name, :age, :enjoys, :image)
      end
end
