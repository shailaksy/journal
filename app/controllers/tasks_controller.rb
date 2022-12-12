class TasksController < ApplicationController

    before_action :set_task, only: %i[show edit update destroy] 

    def index
        @category = Category.find params[:category_id]
        @tasks = Task.all
    end

    def new
        @task = Task.new
        @category = Category.find params[:category_id]
    end

    def create
        @category = Category.find params[:category_id]
        @task = @category.tasks.new(task_params)
        
        respond_to do |format|
            if @task.save
                format.html { redirect_to category_task_url(@category, @task), notice: "Task was successfully created." }
                format.json { render :show, status: :created, location: @task }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @task.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
    end
    
    def edit
    end

    def update
        respond_to do |format|
            if @task.update(task_params)
              format.html { redirect_to category_task_url(@category, @task), notice: "Task was successfully updated." }
              format.json { render :show, status: :ok, location: @task }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @task.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @task.destroy

        respond_to do |format|
            format.html { redirect_to category_tasks_url, notice: "Task was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_task
        @category = Category.find(params[:category_id])
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :details, :deadline)
    end
    
end
