$(document).ready ->
	window.wiselinks = new Wiselinks($('#yield-container'))

	# load filepicker widget on wiselink redirect
	$(document).off('page:done').on(
		'page:done'
		(event, $target, status, url, data) ->
			filepicker.constructWidget($('form input[type="filepicker"]')) if $('form input[type="filepicker"]')[0]
	)
