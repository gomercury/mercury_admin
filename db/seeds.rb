# create admin user accounts
users = [
	{
		email: "cheung.ying.lon@gmail.com",
		name: "alex",
	},
	{
		email: "jordanwan210@gmail.com",
		name: "jordan",
	},
	{
		email: "melodytay1992@gmail.com",
		name: "mello",
	},
]
users.each do |params|
	if !User.where(email: params[:email]).any?
		user = User.new(
			email: params[:email],
			name: params[:name],
			password: "password",
			role: "admin",
		)
		if user.save
			puts "created user: #{user.email}"
		else
			puts "error creating user #{user.email}: " + user.errors.full_messages.first
		end
	end
end
