class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
		@users = User.all.order("id")
		@games = Game.unscoped.order(score: :desc).includes(:user).page(params[:page])
  end
	
	def show
		redirect_to user_games_path(current_user)
	end
end
