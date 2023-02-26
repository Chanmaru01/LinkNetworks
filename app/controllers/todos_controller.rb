class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :sort]

  # GET /todos/new
  def new
    @todo = @memo.todos.new
  end

  # GET /todos/1/edit
  def edit
  end

  def sort
  end

  # POST /todos
  def create
    @todo = @memo.todos.new(todo_params)

    if @todo.save
      @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  private
    def set_memo
      @memo = current_user.memos.find_by(id: params[:memo_id])
      redirect_to(memos_url, alert: "ERROR!!") if @memo.blank?
    end

    def set_todo
      @todo = @memo.todos.find_by(id: params[:id])
    end

    def todo_params
      params.require(:todo).permit(:content, :memo_id, :position, :done)
    end
end
