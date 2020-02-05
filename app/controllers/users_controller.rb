class UsersController < BasicsController

	def index
		@users = User.not_clients.paginate(page: params[:page], per_page: @per_page)
	end

	def show
	end

	def new
	end

	def create
		@user = User.create(user_params.merge(user_type: 'Manager'))
		if @user.save
			redirect_to users_path, notice: "Usuário criado com sucesso!"
		end

	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def find_user
	end

	def user_params
		params.require(:user).permit(:name, :last_name, :email, :phone, :password, :password_confirmation, :zipcode, :address, :number, :complement, :neighborhood, :city, :state)
	end
end
