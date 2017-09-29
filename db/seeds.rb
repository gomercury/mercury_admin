# create business
businesses = [
	{
		mercury_business_id: 2,
		name: "Gary Danko",
		thumbnail: "https://cdn.filepicker.io/api/file/OlRdT6GvTra0siz0pZLO",
		email: "cheung.ying.lon@gmail.com",
		phone: "4157492060",
		address: "800 N Point St, San Francisco, CA 94109",
		latitude: 37.7749029,
		longitude: -122.4374737,
		description: "Bota is an authentic Spanish style tapas and paella bar located in the heart of Union Square in San Francisco. A place to go to share food, savor rustic flavors and enjoy Spanish wine in a casual, yet chic, environment.",
		facebook: "https://www.facebook.com/restaurantgarydanko/",
		instagram: "https://www.instagram.com/garydankosf/",
		yelp: "https://www.yelp.com/biz/gary-danko-san-francisco",
		twitter: "https://twitter.com/hashtag/GaryDanko",
	},
]

if !Business.all.any?
	businesses.each do |params|
		business = Business.new(
			mercury_business_id: params[:mercury_business_id],
			name: params[:name],
			thumbnail: params[:thumbnail],
			email: params[:email],
			phone: params[:phone],
			address: params[:address],
			latitude: params[:latitude],
			longitude: params[:longitude],
			description: params[:description],
			facebook: params[:facebook],
			instagram: params[:instagram],
			yelp: params[:yelp],
			twitter: params[:twitter],
		)
		if business.save
			puts "business created: #{business.name}"
		else
			puts "error creating business #{business.name}: " + business.errors.full_messages.first
		end
	end
end
