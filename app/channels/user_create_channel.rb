class UserCreateChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'user_create'
	end
end
