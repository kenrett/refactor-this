class TodosController < ApplicationController
  before_filter :load_todos

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    params[:todo][:list_name] = params[:todo][:list_name].downcase.gsub(' ', '-')
    @todo = Todo.new params[:todo]
    if @todo.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find params[:id]
  end

  def update
    @todo = Todo.find params[:id]
    params[:todo][:list_name] = params[:todo][:list_name].downcase.gsub(' ', '-')
    if @todo.update_attributes params[:todo]
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  private

  def load_todos
    @todos = Todo.all
  end
end
