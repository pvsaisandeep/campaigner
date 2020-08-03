class BrandController < ApplicationController
	skip_before_action :verify_authenticity_token

	#Brand Creation
	def new_brand
		values = brand_params
		@brand = Brand.new(values)
		if @brand.save
			data = @brand
			message = "Brand created successfully"
			status = "success"
		else
			message = Brand.errors.full_messages
			status = "fail"
		end
		result = {"brand_details": data, "message": message, "status": status }
		render json: result,message: message
	end

	def brand_list
		@brands = Brand.all
		render json: @brands, status: :ok
	end

	def update_brand
		values = update_params
		@brand = Brand.find_by(id: values[:id])
		if @brand
			values.delete :id
			if @brand.update_attributes(values)
				data = @brand
				message = "Brand created successfully"
				status = "success"
			else
				message = Brand.errors.full_messages
				status = "fail"
			end
		else
			data = {}
			message = "No Brand found with given id"
			status = "fail"
		end
		result = {"brand_details": data, "message": message, "status": status }
		render json: result,message: message
	end

	def delete_brand
		@brand = Brand.find_by(id: params[:id])
		if @brand
			if @brand.destroy
				message = "Brand deleted successfully"
				is_deleted = true
			else
				message = Brand.errors.full_messages
				is_deleted = false
			end
		else
			message = "No Brand found with given id"
			is_deleted = false
		end
		render json: {"message": message, "is_deleted": is_deleted}
	end

	#Campaign Creation
	def campaign_list
		@campaigns = Campaign.all
		render json: @campaigns, status: :ok
	end

	def new_campaign
		values = new_campaign_params

		@brand = Brand.find_by(id: values[:brand_id])
		if @brand
			values[:start_time] = DateTime.parse(values[:start_time])
			values[:end_time] = DateTime.parse(values[:end_time])
			@campaign = Campaign.new(values)
			if @campaign.save
				campaign_details = @campaign
				message = "Campaign Created successfully"
				status = "success"
			else
				campaign_details = {}
				message = Campaign.errors.full_messages
				status = "fail"
			end
			brand_details = @brand
		else
			brand_details = {}
			message = "Brand not found with given id"
			status = "fail"
		end
		result = {"brand_details": brand_details,"campaign_details":campaign_details, "message": message, "status": status }
		render json: result,message: message
	end

	def update_campaign
		values = update_campaign_params
		@campaign = Campaign.find_by(id: values[:campaign_id])
		@brand = Brand.find_by(id: values[:brand_id])
		if @campaign
			if @brand.blank? & !values[:brand_id].blank?
				message = "No Brand with given Id "
				brand_details = {}
			else
				values.delete :campaign_id
				values[:start_time] = DateTime.parse(values[:start_time]) if !values[:start_time].blank?
				values[:end_time] = DateTime.parse(values[:end_time]) if !values[:end_time].blank?
				if @campaign.update_attributes(values)
					campaign_details = @campaign
					message = "Campaign Updated successfully"
					status = "success"
				    brand_details = @campaign.brand
				else
					campaign_details = {}
					message = Campaign.errors.full_messages
					status = "fail"
				end
			end
		else
			campaign_details = {}
			message = "Campaign not found with given id"
			status = "fail"
		end
		result = {"brand_details": brand_details,"campaign_details":campaign_details, "message": message, "status": status }
		render json: result,message: message
	end

	def delete_campaign
		@campaign = Campaign.find_by(id: params[:id])
		if @campaign
			if @campaign.destroy
				message = "Campaign deleted successfully"
				is_deleted = true
			else
				message = Campaign.errors.full_messages
				is_deleted = false
			end
		else
			message = "No campaign found with given id"
			is_deleted = false
		end
		render json: {"message": message, "is_deleted": is_deleted}
	end

	#Shortlist influencers for Campaign
	def create_campaign_shortlist
		@campaign = Campaign.find_by(id: params[:campaign_id])
		
	end

	#Send campaign brief to influencers

	#Recieve acceptance from influencers to Campaign

	#Run Campaign 

	def brand_params
   		params.require(:brand).permit(:name, :email, :phone, :about, :website)
	end
	def update_params
   		params.require(:brand).permit(:id, :name, :email, :phone, :about, :website)
	end

	def new_campaign_params
		params.require(:campaign).permit(:brand_id, :name, :start_time, :end_time, :campaign_active, :about)
	end

	def update_campaign_params
		params.require(:campaign).permit(:campaign_id, :brand_id, :name, :start_time, :end_time, :campaign_active, :about)
	end
end
