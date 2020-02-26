class CharitiesController < ApplicationController
    def index
        @charities = Charity.all
        render json: @charities
    end

    def show 
        @charity = Charity.find(params[:id])
        render json: @charity
    end

    def create
        @charity = Charity.create(charity_params)
        if @charity
            render json: { charity: CharitySerializer.new(@charity) }, status: :created
        else
            render json: { error: 'failed to create charity' }, status: :not_acceptable
        end
    end

    def destroy
        @charity = Charity.find(params[:id])
        @charity.destroy
    end


    private

    def charity_params
        params.require(:charity).permit(:user_id, :name, :image, :address, :city)
    end

end 