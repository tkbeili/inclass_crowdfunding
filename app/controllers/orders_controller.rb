class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reward_level

  def new
    @order = Order.new
  end

  def create

  end

  private

  def find_reward_level
    @reward_level = RewardLevel.find(params[:reward_level_id])
  end

end
