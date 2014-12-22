class TeamsController < ApplicationController
	before_action :set_team, only: [:edit, :update, :destroy]
	def index
		@teams = Team.all
		@team = Team.new
		
	
	end

	def show
		@team = Team.find(params[:team])
		@player = Player.new
	end
# rendering to json
	def new
		@teams = Team.all
		render json: @teams, status: 200
	end

	def create
		@team = Team.new(team_params)
		@team.save
		redirect_to teams_path
		
end

def edit
	
end

def update
	
	if @team.update_attributes(params.require(:team).permit(:teamname))
		redirect_to teams_path
	else 
		render 'edit'
	end
end

def new_player
    @id = params[:team_id]
    @team = Team.find(@id)
    @team.players << Player.new(params.require(:player).permit(:name, :yahooid))
    if @team.save
      redirect_to teams_path(:teams => @id)
    end
  end





def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end


private
	def team_params
		params.require(:team).permit(:teamname)
	end

	def set_team
	    @team = Team.find(params[:id])
	    end
end