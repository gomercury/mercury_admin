class UserDestroyBroadcastJob < ApplicationJob
	queue_as :default

	def perform(user)
		ActionCable.server.broadcast "user_destroy", { id: user.id }
	end
end
