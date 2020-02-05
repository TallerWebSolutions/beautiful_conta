class BasicsController < ApplicationController
	layout 'admin'
	before_action :authenticate_user!
	@per_page = 15
end
