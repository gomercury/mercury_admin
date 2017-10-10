$(document).ready ->
	window.wiselinks = new Wiselinks($('#yield-container'))

	$(document).off('page:done').on(
		'page:done'
		(event, $target, status, url, data) ->
			# load filepicker widget on wiselink redirect
			filepicker.constructWidget($('form input[type="filepicker"]')) if $('form input[type="filepicker"]')[0]

			# format phone number field
			if $('input[type="tel"]').length
				$('input[type="tel"]').mask('(000) 000-0000')

			# autogrow textarea height to fit content inside
			if $('textarea').length
				$('textarea').autogrow()
	)
