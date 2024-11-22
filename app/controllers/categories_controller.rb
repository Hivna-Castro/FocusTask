class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.where(user_id: current_user.id)  
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id  

    if @category.save
      redirect_to categories_path, notice: 'Categoria criada com sucesso!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Categoria atualizada com sucesso!'
    else
      flash.now[:alert] = "Erro ao atualizar a categoria."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Categoria excluída com sucesso.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :color) 
  end
end

