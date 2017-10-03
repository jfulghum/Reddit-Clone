class SubsController < ApplicationController

  before_action :require_signature

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub
      redirect_to subs_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end

  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update

    @sub = current_user.subs.find(params[:id])
    if @sub.update(user_params)
      redirect_to subs_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end

  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @sub = Sub.all
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
