class CharitiesController < ApplicationController
    def index
        @charities = Charity.all
        render json: @charities
    end

    def get_charities_requests
        @charity =Charity.find(params[:charity_id])
        @charity_requests = Request.where(charity_id: @charity.id).sort_by{|request| (request.expiration_date.split('/').join)}
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

    def update
        @charity = Charity.find(params[:id])
        @charity.update(charity_params)
        render json: @charity
    end

    def destroy
        @charity = Charity.find(params[:id])
        @charity_requests = Request.where(charity_id: @charity.id)
        @charity_requests.destroy_all
        @charity.destroy
        render json: {message: "charity and its requests are destroyed", id:@charity.id}
    end

    private

    def charity_params
        params.require(:charity).permit(:user_id, :name, :image, :address, :city)
    end

end 