class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(strong_task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update(strong_task_params)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

private

def strong_task_params
  params.require(:task).permit(:title, :details, :completed)
end
end
