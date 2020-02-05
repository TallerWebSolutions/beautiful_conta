class Api::V1::Admin::UsersController < Api::V1::AdminController
    before_action :find_user, only: [:show, :update, :destroy]

    def index
        @users = User.not_clients.paginate(page: params[:page], per_page: 20)
        render json: { users: @users }, status: 200
    end

    def show
    end

    def create
        @user = User.create(user_params.merge(user_type: 'Manager'))
		if @user.save
			render json: { user: @user}, status: 200
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
        params.require(:user).permit(:name, :last_name, :email, :phone, :password, :password_confirmation, :zipcode, :address, :number, :complement, :neighborhood, :city, :state)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
