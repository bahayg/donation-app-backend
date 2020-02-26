class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def index
        @user = User.all
        render json: @user
    end

    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid?
            render json: { user: UserSerializer.new(@user), jwt: issue_token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :is_admin)
    end

end