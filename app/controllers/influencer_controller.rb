class InfluencerController < ApplicationController
	skip_before_action :verify_authenticity_token

	#Influencer Creation
	def new_influencer
		values = influencer_params
		@influencer = Influencer.new(values)
		if @influencer.save
			data = @influencer
			message = "Influencer created successfully"
			status = "success"
		else
			message = Influencer.errors.full_messages
			status = "fail"
		end
		result = {"influencer": data, "message": message, "status": status }
		render json: data, status: :ok
	end

	def update_influencer
		values = update_params
		@influencer = Influencer.find(values[:id])
		values.delete :id
		if @influencer.update_attributes(values)
			data = @influencer
			message = "Influencer updated successfully"
			status = "success"
		else
			message = Influencer.errors.full_messages
			status = "fail"
		end
		result = {"influencer": data, "message": message, "status": status }
		render json: result,message: message
	end

	def delete_influencer
		@influencer = Influencer.find(params[:id])
		if @influencer.destroy
			message = "Influencer deleted successfully"
			is_deleted = true
		else
			message = Influencer.errors.full_messages
			is_deleted = false
		end
		render json: {"message": message, "is_deleted": is_deleted}
	end

	def influencer_list
		@influencers = Influencer.all
		render json: @influencers, status: :ok
	end

	#Influencer Application to Campaign


	def influence_params
   		params.require(:influencer).permit(:first_name, :last_name, :middle_name, :email, :phone, :gender, :bio, :location, :dob)
	end

	def update_params
   		params.require(:influencer).permit(:id, :first_name, :last_name, :middle_name, :email, :phone, :gender, :bio, :location, :dob)
	end
end
