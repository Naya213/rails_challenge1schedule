class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @record_count = @plans.count
    @now_date = Date.current
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
       flash[:notice] = "予定の追加に失敗しました"
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
       flash[:notice] = "スケジュールを更新しました"
       redirect_to :plans
     else
       render "edit"
     end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :plans
  end
end
