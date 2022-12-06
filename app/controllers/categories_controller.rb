class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy] 

    def index
        # @user = User.find params[:user_id]
        @categories = Category.all
    end

    def new
        # @user = User.find params[:user_id]
        @category = Category.new
    end

    def create
        # @user = User.find params[:user_id]
        # @category = @user.categories.new(category_params)
        @category = Category.new(category_params)

        respond_to do |format|
            if @category.save
                # format.html { redirect_to user_category_url(@user, @category), notice: "Category was successfully created." }
                format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
                format.json { render :show, status: :created, location: @category }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
    end
    
    def edit
    end

    def update
        respond_to do |format|
            if @category.update(category_params)
              format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
              format.json { render :show, status: :ok, location: @category }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @category.destroy

        respond_to do |format|
            format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private 
    
    def set_category
        # @user = User.find(params[:user_id])
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :details)
    end
    
end
