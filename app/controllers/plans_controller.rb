class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start_day, :finish_day, :all_day, :memo))
     if @plan.save
       flash[:notice] = "新規予定を追加しました"
       redirect_to :plans
     else
       render "new"
     end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
     if @plan.update(params.require(:plan).permit(:title, :start_day, :finish_day, :all_day, :memo))
       flash[:notice] = "ユーザーIDが「#{@plan.id}」の情報を更新しました"
       redirect_to :plans
     else
       render "edit"
     end
  end

  def destroy
  end
end
