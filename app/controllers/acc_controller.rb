class AccController < ApplicationController
	before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, only: [:pico_placa]

  def pico_placa
  	@picoplaca = ''
  	if params[:ciudad]
  		ciudad = params[:ciudad].to_i
  		day = Time.zone.now.day
  		wday = Time.zone.now.wday
  		if (wday > 0 && wday < 6)
	  		if ciudad == 1
	  			@picoplaca = day % 2 != 0 ? '1-3-5-7-9' : '0-2-4-6-8'
	  		else
	  			case wday
	  			when 1
	  				case ciudad
	  				when 2
	  					@picoplaca = '1-2'	
	  				when 3
	  					@picoplaca = '7-8'
	  				when 4
	  					@picoplaca = '1-2'
	  				when 5
	  					@picoplaca = '2-3-4-5'
	  				end
	  			when 2
	  				case ciudad
	  				when 2
	  					@picoplaca = '3-4'	
	  				when 3
	  					@picoplaca = '9-0'
	  				when 4
	  					@picoplaca = '3-4'
	  				when 5
	  					@picoplaca = '6-7-8-9'
	  				end
	  			when 3
	  				case ciudad
	  				when 2
	  					@picoplaca = '5-6'	
	  				when 3
	  					@picoplaca = '1-2'
	  				when 4
	  					@picoplaca = '5-6'
	  				when 5
	  					@picoplaca = '0-1-2-3'
	  				end
	  			when 4
	  				case ciudad
	  				when 2
	  					@picoplaca = '7-8'
	  				when 3
	  					@picoplaca = '3-4'
	  				when 4
	  					@picoplaca = '7-8'
	  				when 5
	  					@picoplaca = '4-5-6-7'
	  				end	
	  			when 5
	  				case ciudad
	  				when 2
	  					@picoplaca = '9-0'	
	  				when 3
	  					@picoplaca = '5-6'
	  				when 4
	  					@picoplaca = '9-0'
	  				when 5
	  					@picoplaca = '8-9-0-1'
	  				end	
	  			end
	  		end
	  	end
  	end	
  end
end
