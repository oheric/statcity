class PlayersController < ApplicationController

	before_action :set_player, only: [:destroy]

	def index
		@players = Player.all
		@player = Player.new
		
		
	end

	def new
		@players= Player.all
		render json: @players, status: 200
	end

	def create
		@player = Player.new(player_params)
		@player.save
		redirect_to players_path
	end
	
	def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
end

private
	def set_player
		      @player = Player.find(params[:id])
		    end  

	def player_params
		params.require(:player).permit(:name, :yahooid, :cost)
	end
end
