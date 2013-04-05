module SchoolDays
  module DateExtensions
    def school_day?(calendar = nil)
      calendar = SchoolDays.config.calendars['default'] unless calendar

      # first, check the exceptional days and see if we can get a quick match
      return false if calendar.holiday_exceptions.include? self
      return true if calendar.included_day_exceptions.include? self

      # Now, the laborous part.

      # First, check to see if we are a week day
      weekday = [1,2,3,4,5].include?(self.wday)
      has_school = false

      if weekday
        has_school = true

        # ok, now check to see if this weekday is in the school sessions
        has_school = calendar.school_sessions.any? do |current_session|
          current_session[:start_date] <= self && current_session[:end_date] >= self
        end
      end

      has_school
    end

    def school_night?(calendar = nil)
      (self + 1).school_day?(calendar)
    end
  end
end

class Date
  include SchoolDays::DateExtensions
end
