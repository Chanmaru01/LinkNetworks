class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  # GET /memos
  def index
    @memos = current_user.memos.all
  end

  # GET /memos/new
  def new
    @memo = current_user.memos.new
  end

  # GET /memos/1/edit
  def edit
  end

  # POST /memos
  def create
    @memo = current_user.memos.new(memo_params)

    if @memo.save
      @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /memos/1
  def update
    if @memo.update(memo_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /memos/1
  def destroy
    @memo.destroy
  end

  private
    def set_memo
      @memo = current_user.memos.find_by(id: params[:id])
      redirect_to(memos_url, alert: "ERROR!!") if @memo.blank?
    end

    def memo_params
      params.require(:memo).permit(:title, :user_id)
    end
end
