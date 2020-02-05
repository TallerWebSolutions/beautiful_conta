class DocumentsController < BasicsController
	before_action :find_document, only: [:show, :edit, :update, :destroy]

	def index
		@documents = current_user.documents.paginate(page: params[:page], per_page: @per_page)
	end

	def show
	end

	def new
		@document = current_user.documents.new
	end

	def create
		@document = current_user.documents.create(document_params)
		if @document.save
			redirect_to documents_path, notice: 'Adicionamos seu documento com sucesso'
		else
			render :new, notice: 'error'
		end
	end

	def edit
	end

	def update
		if @document.update(document_params)
			redirect_to documents_path, notice: 'Atualizamos seu documento com sucesso'
		else
			render :edit, notice: 'error'
		end
	end

	def destroy
		if @document.destroy
			redirect_to documents_path, notice: 'Seu documento foi excluído com sucesso'
		else
			redirect_to documents_path, notice: 'Houve um erro na sua solicitação'
		end
	end

	private
	def find_document
		@document = current_user.documents.find(params[:id])
	end

	def document_params
		params.require(:document).permit(:name, :notes)
	end
end
