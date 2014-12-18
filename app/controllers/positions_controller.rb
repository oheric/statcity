class PositionsController < ApplicationController
	before_action :set_position, only: [:destroy]
	def index
		@positions = Position.all
		@position = Position.new
		
	end

	def new
		@positions = Position.all
		render json: @positions, status: 200
		
	end

	def create
		@position = Position.new(position_params)
		@position.save
		redirect_to positions_path
	
	end

	def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :no_content }
    end
end

private 
def set_position
		      @position = Position.find(params[:id])
		    end  
	def position_params
		params.require(:position).permit(:positiontype)
	end
end
