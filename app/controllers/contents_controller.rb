class ContentsController < BasicsController
    def index
		@contents = Content.all.paginate(page: params[:page], per_page: @per_page)
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
	def find_content
		@content = Content.find(params[:id])
	end

	def content_params
	end
end
