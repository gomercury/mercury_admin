class UserCreateBroadcastJob < ApplicationJob
	queue_as :default

	def perform(user)
		ActionCable.server.broadcast "user_create", { user: render_user(user) }
	end

	private

		def render_user(user)
			ApplicationController.renderer.render(partial: 'users/user', locals: { user: user} )
		end
end
