class CharitiesController < ApplicationController
    def index
        @charities = Charity.all
        render json: @charities
    end

    # def show 
    #     @charity = Charity.find(params[:id])
    #     render json: @charity
    # end

    private

    def charity_params
        params.require(:charity).permit(:user_id, :name, :image, :address, :city)
    end

end 