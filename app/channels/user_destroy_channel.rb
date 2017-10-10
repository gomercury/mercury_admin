class UserDestroyChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'user_destroy'
	end
end
