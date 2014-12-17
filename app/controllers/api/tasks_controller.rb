class Api::TasksController < ApiController
  before_filter :restrict_api_access

  def index
    render response: current_user.tasks
  end

  def create
    check_required([:title])

    task = Task.new(task_params)
    task.user_id = current_user.id
    task.save!

    render response: task
  end

  def show
    render response: current_user.tasks.find(params[:id])
  end

  private
    def task_params
      # params.require(:task).permit(:title)
      params.permit(:title)
    end

end