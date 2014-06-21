class TodosController < ApplicationController

	def index
		@completed_todos = Todo.completed
		@pending_todos = Todo.pending
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(params[:todo])
    if @todo.save
      redirect_to root_path
    else
    	flash[:notice] = "1-100 characters required!"
      redirect_to root_path
    end
	end

	def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!(:completed)
    @todo.save!
    redirect_to root_path
  end

	def destroy
		 Todo.find(params[:id]).destroy
		 redirect_to root_path
	end
end
