class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task_params = params.require(:task).permit(:title, :details)
    new_task = Task.create(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    Task.destroy(params[:id])
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    task_params = params.require(:task).permit(:title, :details)
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end
end
