module MobileApi
  class ShiftPresenter
    def self.for(shift)
      new(shift: shift)
    end

    def initialize(shift:)
      @shift = shift
    end

    def as_json(_options={})
      {
        id: shift.id,
        city_state_zip: address.city_state_zip,
        city: location.city,
        day: date.day,
        end_time: end_time,
        label: time_label,
        location_name: location.name,
        location_line_1: location.line_1,
        location_line_2: location.line_2,
        postalcode: location.postalcode,
        short_month: date.strftime("%b"),
        start_time: start_time,
        state: location.county_province,
        time_zone: location.time_zone
      }
    end

    private

    attr_reader :shift

    def address
      @_address ||= AddressFormatter.for(shift.location)
    end

    def date
      Date.parse(shift.date.to_s)
    end

    def end_time
      MinutesToTime.for(shift.minute_end)
    end

    def location
      shift.location
    end

    def start_time
      MinutesToTime.for(shift.minute_start)
    end

    def time_label
      "#{start_time} - #{end_time}"
    end
  end
end
