class Api::V1::TodosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        todos = Todo.all
        render json: todos
    end

    def todo_params
        params.require(:todo).permit(:title, :done, :todotime)
      end

    def create
        todo = Todo.new(todo_params)
        if todo.save
          render json: todo, status: :created
        else
          render json: { errors: todo.errors }, status:    :unprocessable_entity
        end    
    end
    def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        head 204
    end
    def update
        todo = Todo.find(params[:id])
        if todo.update(todo_params)
          render json: todo, status: :ok
        else
          render json: { errors: todo.errors }, status: :unprocessable_entity
        end
      end



end
