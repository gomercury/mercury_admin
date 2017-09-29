class BusinessesController < ApplicationController
	def create
	end

	def index
		@businesses = Business.all
	end

	def edit
		@business = Business.find(params[:id])
	end

	def update
		@business = Business.find(params[:id])
		if !valid_address?(params)
			flash.now[:fail] = "Select a valid business address"
			render :edit
		elsif @business.update_attributes(business_params)
			Spawnling.new do
				BusinessService.update(business_params)
			end
			flash[:success] = "updated business"
			redirect_to edit_business_path(@business)
		else
			flash.now[:fail] = @business.errors.full_messages.first
			render :edit
		end
	end

	private

		def valid_address?(params)
			latitude = params[:business][:latitude]
			longitude = params[:business][:longitude]
			if longitude == "" || latitude == ""
				return false
			end
			return true
		end
end
