class Api::V1::Admin::MessagesController < Api::V1::AdminController

    def index
        @users = User.last_messages.paginate(page: params[:page], per_page: @per_page)
        render json: { users: @users.map { |user| user.as_json.merge(messages: user.messages.order('messages.created_at DESC').limit(20).reverse) } }, status: 200 
    end
end
