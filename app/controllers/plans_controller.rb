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
  end

  def update
  end

  def destroy
  end
end
