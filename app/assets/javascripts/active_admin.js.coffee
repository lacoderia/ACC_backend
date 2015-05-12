#= require active_admin/base
//= require maps/active_admin_maps

@roadsideAssistanceCheck = (ra_id, solved) ->
	$.ajax "/roadside_assistances/#{ra_id}/solved?solved=#{solved}",
		type: 'POST'
		dataType: 'html'
		error: (jqXHR, textStatus, errorThrown) ->
			alert('Error. Intenta de nuevo.')
		success: (data, textStatus, jqXHR) ->
			$("#ra_link_#{ra_id}").attr('onclick', "roadsideAssistanceCheck(#{ra_id}, #{!solved})")

@activeUserCheck = (user_id, active) ->
	$.ajax "/users/#{user_id}/active?active=#{active}",
		type: 'POST'
		dataType: 'html'
		error: (jqXHR, textStatus, errorThrown) ->
			alert('Error. Intenta de nuevo.')
		success: (data, textStatus, jqXHR) ->
			$("#user_link_#{user_id}").attr('onclick', "activeUserCheck(#{user_id}, #{!active})")


@activeAgreementCheck = (agreement_id, active) ->
	$.ajax "/agreements/#{agreement_id}/active?active=#{active}",
		type: 'POST'
		dataType: 'html'
		error: (jqXHR, textStatus, errorThrown) ->
			alert('Error. Intenta de nuevo.')
		success: (data, textStatus, jqXHR) ->
			$("#agreement_link_#{agreement_id}").attr('onclick', "activeAgreementCheck(#{agreement_id}, #{!active})")


@activePerkCheck = (perk_id, active) ->
	$.ajax "/perks/#{perk_id}/active?active=#{active}",
		type: 'POST'
		dataType: 'html'
		error: (jqXHR, textStatus, errorThrown) ->
			alert('Error. Intenta de nuevo.')
		success: (data, textStatus, jqXHR) ->
			$("#perk_link_#{user_id}").attr('onclick', "activePerkCheck(#{perk_id}, #{!active})")


@activeLocationCheck = (location_id, active) ->
	$.ajax "/locations/#{location_id}/active?active=#{active}",
		type: 'POST'
		dataType: 'html'
		error: (jqXHR, textStatus, errorThrown) ->
			alert('Error. Intenta de nuevo.')
		success: (data, textStatus, jqXHR) ->
			$("#location_link_#{user_id}").attr('onclick', "activeLocationCheck(#{location_id}, #{!active})")
