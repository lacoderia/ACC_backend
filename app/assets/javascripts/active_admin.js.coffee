#= require active_admin/base

@roadsideAssistanceCheck = (ra_id, solved) ->
	$.ajax "/roadside_assistances/#{ra_id}/solved?solved=#{solved}",
		type: 'POST'
		dataType: 'html'
		error: (jqXHR, textStatus, errorThrown) ->
			alert('Error. Intenta de nuevo.')
		success: (data, textStatus, jqXHR) ->
			$("#ra_link_#{ra_id}").attr('onclick', "roadsideAssistanceCheck(#{ra_id}, #{!solved})")

