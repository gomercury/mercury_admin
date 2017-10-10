class UserUpdateBroadcastJob < ApplicationJob
	queue_as :default

	def perform(user)
		ActionCable.server.broadcast "user_update", { id: user.id, user: render_user(user) }
	end

	private

		def render_user(user)
			ApplicationController.renderer.render(partial: 'users/user', locals: { user: user} )
		end
end
