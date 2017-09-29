class UsersController < ApplicationController
	before_action :admin_user

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "updated user"
			redirect_to users_path
		else
			flash.now[:fail] = @user.errors.full_messages.first
			render :edit
		end
	end

	private

		def user_params
			if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
		    params[:user].delete(:password)
		    params[:user].delete(:password_confirmation)
			end
			params.require(:user).permit(:name, :email, :role, :password)
		end
end
