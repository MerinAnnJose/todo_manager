class TodosController < ApplicationController
    def index
        #render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
        render "index"
    end

    def show
        id = params[:id]
        todo = Todo.find(id)
        render plain: todo.to_pleasant_string
    end

    def create
        todo_text = params[:todo_text]
        due_date = Date.today + params[:due_date]
        todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
        render plain: todo.to_pleasant_string + " has been created"
    end
end
