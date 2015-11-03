class GamesController < InheritedResources::Base
  before_action :correct_user, only: :show

  def show
		@works = Game.find_by_id(params[:id]).clons.first.works.order('id')
		@watch_cards = Game.find_by_id(params[:id]).watch_cards.order("id")
		@relationship = Relationship.new
		@relationships = Relationship.order(favorability: :desc).where(clon_id:Game.find_by_id(params[:id]).clons.first.id,favorability:1..100)
		@people = Game.find_by_id(params[:id]).people.order("id").drop(1)
  end

  def index
	  @games =current_user.games.order("id DESC").page(params[:page])	
	end

	def new
    @user = User.find(current_user.id)
		@game = @user.games.build(score: 0, turn: 0, phase: 0)
	end

  def create
    @user = User.find(current_user.id)
    @game = @user.games.build(game_params)
    @game.save
		Person.order("id").each{|k| @game.people << k}
    genre = (params[:anime] == "アニメ版で開始")? 0 : 2
    Work.where(genre:genre).shuffle[0..9].sort.each do |s|
			rel = @game.clons.first.relationships.new(work_id:s.id,favorability:0)
			rel.save
		end
    #@game.watch_cards_init
		until @game.watch_cards.count >= 4 do
			k = @game.clons.first.relationships.shuffle[0..2].sort.map{|s| s.work}
		  @game.watch_cards.new(work_ids:k)
    @game.save
		end
    #respond_with(@game)
		respond_to do |format|
			format.html { redirect_to [@user,@games]}
			format.js
		end
	end

  private

	  def correct_user
			@game = Game.find_by_id(params[:id])
			redirect_to(root_path) if (current_user.id != @game.user_id && !@game.ended?)
		end

    def game_params
      params.require(:game).permit(:score, :turn, :user_id)
    end
end

