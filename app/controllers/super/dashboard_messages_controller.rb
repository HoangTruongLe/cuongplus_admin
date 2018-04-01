class Super::DashboardMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dashboard_message, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @dashboard_messages = DashboardMessage.page(params[:page])
  end

  def show
  end

  def new
    @dashboard_message = DashboardMessage.new
  end

  def edit
  end

  def create
    @dashboard_message = DashboardMessage.new(dashboard_message_params)
    if @dashboard_message.save
      redirect_to dashboard_path, notice: 'Dashboard message was successfully created.'
    else
      render :new
    end
  end

  def update
    if @dashboard_message.update(dashboard_message_params)
      redirect_to dashboard_path, notice: 'Dashboard message was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dashboard_message.destroy
    redirect_to dashboard_path, notice: 'Dashboard message was successfully destroyed.'
  end

  private
    def set_dashboard_message
      @dashboard_message = DashboardMessage.find(params[:id])
    end

    def dashboard_message_params
      params.require(:dashboard_message).permit(:title, :body)
    end
end
