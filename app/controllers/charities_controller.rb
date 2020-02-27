class CharitiesController < ApplicationController
    def index
        @charities = Charity.all
        render json: @charities
    end

    
    def get_charities_requests
        # byebug
        @charity =Charity.find(params[:charity_id])
        @charity_requests = Request.where(charity_id: @charity.id)
        # @users_charities = Charities.all.select{|charities| charity.user_id == @user.id}
        render :json => @charity_requests
        
    end

    def create
        @charity = Charity.create(charity_params)
        if @charity
            render json: { charity: CharitySerializer.new(@charity) }, status: :created
        else
            render json: { error: 'failed to create charity' }, status: :not_acceptable
        end
    end

    # def update
    # end

    def destroy
        @charity = Charity.find(params[:id])
        @charity.destroy
        render json: {message: "destroyed", id:@charity.id}
    end

    private

    def charity_params
        params.require(:charity).permit(:user_id, :name, :image, :address, :city)
    end

end 