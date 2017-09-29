# change business photo once filepicker uploads it
@onBusinessPhotoUpload = (event) ->
	$('.photo').html '<img class="photo" src="' + event.fpfile.url + '/convert?fit=crop&h=160&w=160">'

initializeAutocomplete = ->
  input = document.getElementById('business_address')
  autocomplete = new (google.maps.places.Autocomplete)(input)

  # don't submit form on return
  google.maps.event.addDomListener input, 'keydown', (event) ->
  	$('#business_latitude').val ''
  	$('#business_longitude').val ''
	  if event.keyCode == 13
	    event.preventDefault()
	  return

	# autocomplete business latitude and longitude
  google.maps.event.addListener autocomplete, 'place_changed', ->
	  place = autocomplete.getPlace()
	  lat = place.geometry.location.lat()
	  lng = place.geometry.location.lng()
	  $('#business_latitude').val lat
	  $('#business_longitude').val lng
	  return
  return

$(document).ready ->
	# autogrow textarea height to fit content inside
	if $('#business_description')[0]
		$('#business_description').autogrow()

	# autocomplete address with google places api
	if $('#business_address').length
		google.maps.event.addDomListener window, 'load', initializeAutocomplete
