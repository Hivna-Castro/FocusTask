class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.where(user_id: current_user.id)  
    @categories = Category.all
  end
  
  def new
    @task = Task.new
    @categories = Category.all
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id  

    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!'
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :due_date, :category_id) 
  end
end
