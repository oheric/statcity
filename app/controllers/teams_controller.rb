class TeamsController < ApplicationController
	before_action :set_team, only: [:destroy]
	def index
		@teams = Team.all
		@team = Team.new
		
	
	end

	def show
		@team = Team.find(params[:team])
		@player = Player.new
	end

	def new
		@teams = Team.all
		render json: @teams, status: 200
	end

	def create
		@team = Team.new(team_params)
		@team.save
		redirect_to teams_path
		
end

def new_player
	#since we will use post_id twice in our controller, pull it out into a variable so we don't call params[:post_id] twice
    @id = params[:team_id]

    #grab a post by id so we can add the comment to it
    @team = Team.find(@id)

    #Mongoid provides us with the '<<' syntax to tack on another embedded document in the 'embeds_many' relationship
    #so that is exactly what we do here, first pulling the needed params out of the request and building a new comment
    #object with them. We then add the new Comment object into the embeds_many relationship
    @team.players << Player.new(params.require(:player).permit(:name, :yahooid))

    #we then persist all of these changes to mongodb using the @post.save method call
    if @team.save

      #here is the tricky part...what we do here is essentially redirect_to our one_path, and we pass the @id as a parameter,
      #so the one_path(which is our 'one' action method) thinks it's getting called like normal with the :post being an id,        #so it just behaves like it  normally does, grabbing a post from the db with an id that matches 
      #:post(which we have set here to have an id as a value). Since we already saved our comment in the 
      #db, the 'one' method pulls out the updated post. 
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