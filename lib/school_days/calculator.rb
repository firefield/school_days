
module SchoolDays
  class Calculator
    def initialize(days, calendar_name)
      @days = days
      @calendar = SchoolDays.config.calendars[calendar_name]
    end

    def after(time = Time.now)
      # example: 2.school_days.after(tuesday)
      date = time
      date = time.to_date if time.is_a?(Time)

      @days.times do
        begin
          date = date + 1
          raise SchoolDays::DateNotInSchoolCalendar unless is_in_school_year?(date)
          # (if we are not in the school year at all, stop calculating, because
          # once we go outside we'll never find another school day. WD-rpw 01-26-2011)
        end until date.school_day?(@calendar)
      end
      date
    end
    alias_method :from_now, :after
    alias_method :since, :after


    def before(time = Time.now)
      # example: 2.school_days.after(tuesday)
      date = time
      date = time.to_date if time.is_a?(Time)

      @days.times do
        begin
          date = date - 1
          raise SchoolDays::DateNotInSchoolCalendar unless is_in_school_year?(date)
          # (if we are not in the school year at all, stop calculating, because
          # once we go outside we'll never find another school day. WD-rpw 01-26-2011)
        end until date.school_day?(@calendar)
      end
      date      
    end
    alias_method :until, :before

    # a new method, more of a helper for this API then an actual public method...
    # however, this will return the session a date is associated with, or nil
    # if this falls totally outside the known school year
    def school_session_for_date(date)
      @calendar.school_sessions.detect do |school_session|
        school_session[:start_date] < date && date < school_session[:end_date]
      end
    end

    # another semi-private method. TODO: it seems useful to expose this, but how?
    def is_in_school_year?(date)
      # included exceptional days can be outside the school year
      return true if @calendar.included_day_exceptions.include? date

      # ok, now check ranges
      @calendar.school_year_start < date && date < @calendar.school_year_end
    end
  end
end
