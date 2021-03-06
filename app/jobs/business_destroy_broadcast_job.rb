class BusinessDestroyBroadcastJob < ApplicationJob
	queue_as :default

	def perform(business)
		ActionCable.server.broadcast "business_destroy", { id: business.id }
	end
end
