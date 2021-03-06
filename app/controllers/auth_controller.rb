class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :show, :index]
    # Login
      def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          # issue that user a token\
        #   token = issue_token(user)
            # render json: {id: user.id, username: user.username, jwt: token}, status: :created
            render json: { user: UserSerializer.new(@user), jwt: issue_token }, status: :created
        else
          render json: {error: 'That user could not be found'}, status: 401
        end
      end

      def show
        if logged_in?
          render json: {user: UserSerializer.new(@user), jwt: issue_token}, status: :accepted
        else
          render json: {error: 'No user could be found'}, status: :unauthorized
        end
      end

    #   def destroy
    #   end
end