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
		@brand = Brand.find(values[:id])
		values.delete :id
		if @brand.update_attributes(values)
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

	def delete_brand
		@brand = Brand.find(params[:id])
		if @brand.destroy
			message = "Brand deleted successfully"
			is_deleted = true
		else
			message = Brand.errors.full_messages
			is_deleted = false
		end
		render json: {"message": message, "is_deleted": is_deleted}
	end

	#Campaign Creation

	#Campaign Active status

	#Shortlist influencers for Campaign

	#Send campaign brief to influencers

	#Recieve acceptance from influencers to Campaign

	#Run Campaign 

	def brand_params
   		params.require(:brand).permit(:name, :email, :phone, :about, :website)
	end
	def update_params
   		params.require(:brand).permit(:id, :name, :email, :phone, :about, :website)
	end
end
