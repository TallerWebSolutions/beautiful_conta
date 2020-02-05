class ServicesController < BasicsController
	before_action :find_service, only: [:show, :edit, :update, :destroy]

	def index
		@services = current_user.services.paginate(page: params[:page], per_page: @per_page)
	end

	def show
	end

	def new
		@service = current_user.services.new
	end

	def create
		@service = current_user.services.create(service_params)
		if @service.save
			redirect_to services_path, notice: 'Seu serviço foi criado com sucesso!'
		else
			render :new, notice: 'error'
		end
	end

	def edit
	end

	def update
		if @service.update(service_params)
			redirect_to services_path, notice: 'Seu serviço foi atualizado com sucesso!'
		else
			render :edit, notice: 'error'
		end
	end

	def destroy
	end

	private
	def find_service
		@service = current_user.services.find(params[:id])
	end

	def service_params
		params.require(:service).permit(:category_id, :name, :value, :duration)
	end
end
