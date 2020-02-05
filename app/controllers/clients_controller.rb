class ClientsController < BasicsController
	before_action :find_client, only: [:show, :edit, :update, :destroy]

	def index
		@clients = User.clients.paginate(page: params[:page], per_page: @per_page)
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def find_client
		@client = User.find(params[:id])
	end

	def client_params
	end
end
