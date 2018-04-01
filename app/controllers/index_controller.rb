class IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboard_messages = DashboardMessage.order('created_at DESC').page(params[:page])
  end
end
