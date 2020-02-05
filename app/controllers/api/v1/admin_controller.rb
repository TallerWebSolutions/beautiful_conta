class Api::V1::AdminController < ApplicationController
    @per_page = 20
    before_action :authenticate_user!, :verify_permission

    private
    def verify_permission
        render( json: { message: 'Você não tem permissão para acessar'}, status: 400) if current_user.user_type == 'Client'
    end
end
