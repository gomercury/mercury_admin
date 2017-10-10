class UserUpdateChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'user_update'
	end
end
