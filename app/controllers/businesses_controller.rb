class BusinessesController < ApplicationController
	before_action :admin_user

	def new
		@business = Business.new
	end

	def create
		@business = Business.new(business_params)
		response = BusinessService.create(business_params)
		if response.code == 201
			mercury_business_id = JSON.parse(response.body)["business"]["id"]
			@business.mercury_business_id = mercury_business_id
			if @business.save
				access_token = JSON.parse(response.body)["api_key"]["access_token"]
				api_key = ApiKey.new(
					business_id: @business.id,
					access_token: access_token,
				)
				if api_key.save
					redirect_to businesses_path
				else
					@business.destroy
					flash.now[:fail] = api_key.errors.full_messages.first
					render :new
				end
			else
				flash.now[:fail] = @business.errors.full_messages.first
				render :new
			end
		else
			flash.now[:fail] = JSON.parse(response.body)["errors"].first
			render :new
		end
	end

	def index
		@businesses = Business.by_created_at
	end

	def edit
		@business = Business.find(params[:id])
	end

	def update
		@business = Business.find(params[:id])
		response = BusinessService.update(@business, business_params)
		if response.code == 200
			if @business.update_attributes(business_params)
				redirect_to businesses_path
			else
				flash.now[:fail] = @business.errors.full_messages.first
				render :edit
			end
		else
			flash.now[:fail] = JSON.parse(response.body)["errors"].first
			render :edit
		end
	end

	def destroy
		@business = Business.find(params[:id])
		response = BusinessService.destroy(@business)
		if response.code == 200
			if @business.destroy
				redirect_to businesses_path
			else
				flash.now[:fail] = @business.errors.full_messages.first
				render :index
			end
		else
			flash.now[:fail] = JSON.parse(response.body)["errors"].first
			render :index
		end
	end

	private

		def business_params
			params.require(:business).permit(
				:name,
				:thumbnail,
				:email,
				:phone,
				:address,
				:longitude,
				:latitude,
				:description,
				:facebook,
				:instagram,
				:yelp,
				:twitter,
			)
		end
end
