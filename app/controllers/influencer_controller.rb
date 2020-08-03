class InfluencerController < ApplicationController
	skip_before_action :verify_authenticity_token

	#Influencer Creation
	def new_influencer
		values = influence_params
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
		@influencer = Influencer.find_by(id: values[:id])
		byebug
		if @influencer
			values.delete :id
			if @influencer.update_attributes(values)
				data = @influencer
				message = "Influencer updated successfully"
				status = "success"
			else
				message = Influencer.errors.full_messages
				status = "fail"
			end
		else
			data = {}
			message = "No Influencer found with given id"
			status = "fail"
		end
		result = {"influencer": data, "message": message, "status": status }
		render json: result,message: message
	end

	def delete_influencer
		@influencer = Influencer.find_by(id: params[:id])
		if @influencer
			if @influencer.destroy
				message = "Influencer deleted successfully"
				is_deleted = true
			else
				message = Influencer.errors.full_messages
				is_deleted = false
			end
		else
			message = "No Influencer found with given id"
			is_deleted = "false"
		end
		render json: {"message": message, "is_deleted": is_deleted}
	end

	def influencer_list
		@influencers = Influencer.all
		render json: @influencers, status: :ok
	end

	#Influencer Application to Campaign
	def influence_apply
		@influencer = Influencer.find_by(id: params[:influencer_id])
		if @influencer
			@campaign = Campaign.find_by(id: params[:campaign_id])
			if @campaign
				@application = @influencer.campaign_applications.new(campaign_id: @campaign.id)
				if @application.save
					message = "Application to Campaign succesfully created"
					data = @application
				else
					message = CampaignApplication.errors.full_messages
				end
			else
				message = "No Campaign exits with given id"
			end
		else
			message = "No influencer exists with given id"
		end
		render json: {"Application details":@application, "message":message}
	end


	def influence_params
   		params.require(:influencer).permit(:first_name, :last_name, :middle_name, :email, :phone, :gender, :bio, :location, :dob)
	end

	def update_params
   		params.require(:influencer).permit(:id, :first_name, :last_name, :middle_name, :email, :phone, :gender, :bio, :location, :dob)
	end
end
