module DeviseHelper
	# Return flash notification when signup fails
	def devise_error_messages!
		if resource.errors.any?
	  	"<div class='flash fail'><div class='container'>#{resource.errors.full_messages.first.humanize}</div></div>".html_safe
	  end
	end
end
