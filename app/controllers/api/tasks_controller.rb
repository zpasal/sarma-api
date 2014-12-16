class Api::TasksController < ApiController
  def index
    render json: current_user.tasks.order(params[:order])
  end
end