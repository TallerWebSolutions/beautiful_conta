class Api::V1::Admin::ContentsController < Api::V1::AdminController

    before_action :find_content, only: [:update]

    def index
        @contents = Content.all.paginate(page: params[:page], per_page: @per_page)
        render json: { contents: @contents }, status: 200
    end

    def create
        @content = Content.create(content_params)
        if @content.save
            render json: { content: @content }, status: 200
        else
            render json: { message: 'Houve um erro na sua solicitação'}, status: 400
        end
    end

    def update
        if @content.update(content_params)
            render json: { content: @content }, status: 200
        else
            render json: { message: 'Houve um erro na sua solicitação'}, status: 400
        end        
    end

    private

    def content_params
        params.require(:content).permit(:id, :title, :description, :action, :arguments, :video_url, :status, :publish_date)
    end

    def find_content
        @content = Content.find(params[:id])
    end
end
