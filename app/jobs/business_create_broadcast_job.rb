class BusinessCreateBroadcastJob < ApplicationJob
	queue_as :default

	def perform(business)
		ActionCable.server.broadcast "businesses_create", { id: business.id, business: render_business(business) }
	end

	private

		def render_business(business)
			ApplicationController.renderer.render(partial: 'businesses/business', locals: { business: business} )
		end
end
