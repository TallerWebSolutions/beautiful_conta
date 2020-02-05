class ContactsController < BasicsController
	before_action :find_contact, only: [:show, :edit, :update, :destroy]

	def index
		@contacts = current_user.contacts.paginate(page: params[:page], per_page: @per_page)
	end

	def show
	end

	def new
		@contact = current_user.contacts.new
	end

	def create
		@contact = current_user.contacts.create(contact_params)
		if @contact.save
			redirect_to contacts_path, notice: 'Contato criado com sucesso!'
		else
			render :new, notice: 'ERROR!'
		end
	end

	def edit
	end

	def update
		if @contact.update(contact_params)
			redirect_to contacts_path, notice: 'Contato atualizado com sucesso!'
		else
			render :edit, notice: 'ERROR!'
		end
	end

	def destroy
		if @contact.destroy
			redirect_to contacts_path, notice: 'Contato apagado com sucesso!'
		else
			redirect_to contacts_path, notice: 'Houve um erro na sua solicitação'
		end
	end

	private
	def find_contact
		@contact = current_user.contacts.find(params[:id])
	end

	def contact_params
		params.require(:contact).permit(:avatar, :name, :phone, :email)
	end
end
