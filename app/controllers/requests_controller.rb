class RequestsController < ApplicationController
    def index
        @requests = Request.all
        render json: @requests
    end

    def create
        @request = Request.create(request_params)
        
        if @request
            render json: {request: RequestSerializer.new(@request), status: :created}
        else
            render json: { error: 'failed to create your request'}, status: :not_acceptable
        end
    end

    def update
        @request = Request.find(params[:id])
        @request.update(request_params)
        render :json => request
    end

    def destroy
        @request = Request.find(params[:id])
        @request.destroy
        render json: {message: "requets is destroyed", id: @request.id}
    end

    private

    def request_params
        params.require(:request).permit(:user_id, :charity_id, :expiration_date, :info, :status)
    end

end