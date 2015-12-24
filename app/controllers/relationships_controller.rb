class RelationshipsController < ApplicationController

	def create
		# it means update Relationships
		@game = Game.find_by_id(params[:game_id])
		err = 0
		if params[:clone].nil?
			unless params[:relationship].nil? || @game.phase == 0
				t = params[:relationship][:favorability].scan(/:(\w+)=>+(\d+)/).map{|k, v| [k.to_sym, v.to_i] }.to_h
				msg = @game.mission_phase(t)

			else
				msg = 'Please select one choice.'
				err = 1
			end

		elsif !params[:clone][:work_ids].nil? && @game.phase? == :watch
			@game.watch_phase(params[:clone][:work_ids])
			msg = 'Post was successfully created.'
		else
			msg = 'Please select one choice.'
			err = 1
		end

		if err==0
			respond_to do |format|
				format.html { redirect_to @game , notice: msg}
				format.js
			end
		else
			respond_to do |format|
				format.html { redirect_to @game , alert: msg}
				format.js
			end
		end
	end
end
