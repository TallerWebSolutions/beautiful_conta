class Api::V1::ClientsController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]

    def index
        @clients = User.clients.paginate(page: params[:page], per_page: 20)
        render json: { clients: @users }, status: 200
    end

    def show
    end

    def create
        @user = User.create(user_params.merge(user_type: 'Client'))
		if @user.save!
			render json: { user: @user }, status: 200
		end
    end

    def update
        if @user.update(user_params)
            render json: { user: @user}, status: 200
        end
    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:name, :last_name, :email, :phone, :password, :password_confirmation)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
