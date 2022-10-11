class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: '新しいタスクが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'タスクが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'タスクが削除されました'
  end


  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :detail)
    end

end
