class ShiftFinder
  def self.for(object)
    new(object: object)
  end

  def initialize(object:)
    @object = object
  end

  def next
    future.first
  end

  def on(date=Date.today)
    all.where(date: date.strftime('%Y%m%d').to_i)
  end

  def future
    all.
      where(date: (current_day+1..Float::INFINITY)).
      or(all.where(date: current_day, minute_start: (current_minute..1440)))
  end

  def all
    Shift.
      where(user_location_id: user_location_ids).
      order(:date, :minute_start)
  end

  def find_by(options)
    all.find_by(options)
  end

  private

  attr_reader :object

  def current_day
    Date.today.to_s(:number).to_i
  end

  def current_minute
    (Time.now.hour * 60) + Time.now.min
  end

  def user_location_ids
    object.user_locations.pluck(:id)
  end
end
