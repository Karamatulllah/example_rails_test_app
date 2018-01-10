class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create]


  def index
      @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New category added successfully !!!"
      redirect_to category_path(@category)
    else
      flash[:danger] = "Something went wrong !!!"
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end


  private
    def category_params
      params.require(:category).permit(:name)

    end

    def require_admin
      if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger] = "only admin can create new category"
        redirect_to categories_path

      end

    end


end
