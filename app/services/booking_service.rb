class BookingService
	attr_reader :booking_params
	include ServiceObject

	def initialize(booking_params)
	  @booking_params = booking_params
	end

	def call
	  verify_bookings!    
	end

	private
	def verify_bookings!
		return false unless date_range
		p Room.find(booking_params[:room_id])
	    bookings = Room.find(booking_params[:room_id]).bookings
	    p bookings
	    if bookings.conflict(date_range).exists?
          false
	    else
	  	 val =  bookings.new(booking_params).tap(&:save!)
	  	 p val
	  	  true
	    end
	end

	def date_range
	  s_date = safe_parse(booking_params[:start])
	  e_date = safe_parse(booking_params[:end])
	  Range.new(s_date, e_date) if s_date <= e_date
	end

	def safe_parse(value)
	  Date.parse(value.to_s)
      rescue ArgumentError
       	nil
	end

end