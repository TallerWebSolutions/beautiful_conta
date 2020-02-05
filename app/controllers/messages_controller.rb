class MessagesController < BasicsController
	before_action :find_message, only: [:show, :edit, :update, :destroy]
	
	def index
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
	def find_message
	end

	def message_params
	end
end
