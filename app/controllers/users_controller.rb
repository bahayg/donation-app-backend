class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    # def index
    #     @user = User.all
    #     render json: @user
    # end

    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid?
            render json: { user: UserSerializer.new(@user), jwt: issue_token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def get_users_charities
        # byebug
        @user =User.find(params[:id])
        @user_charities = Charity.where(user_id: @user.id)
        # @users_charities = Charities.all.select{|charities| charity.user_id == @user.id}
        render :json => @user_charities
    end

    # def destroy
    # end

    private

    def user_params
        params.require(:user).permit(:username, :password, :is_admin)
    end

end