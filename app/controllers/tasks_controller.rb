class TasksController < ApplicationController
  before_action :require_login

  def index
    @tasks = Task.where(user_id: current_user.id)  
    @categories = Category.all
  end
  
  def new
    @task = Task.new
    respond_to do |format|
      format.html { render partial: 'form', locals: { task: @task } }
    end
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id  

    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :due_date, :category_id) 
  end
end
