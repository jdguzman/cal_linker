module CalLinker
  class CalendarLinksController < ApplicationController
    before_filter :load_resource
    attr_reader :resource

    def show
      @event = resource.find(params[:id])
      @calendar = build_calendar
      send_data(@calendar.to_ical, type: 'text/calendar', disposition: 'inline', filename: 'calendar.vcs')
    end

    private

    def load_resource
      unless params['resource_type'].present?
        raise ResourceTypeNotDeclaredError.new "Must pass a resource_type param."
      end

      @resource ||= params['resource_type'].constantize
    rescue NameError
      raise NameError.new "The resource type provided does not exist."
    end

    def build_calendar
      calendar = Icalendar::Calendar.new
      calendar.event do |e|
        e.dtstart = @event.starting_at
        e.dtend = @event.ending_at
        e.summary = @event.name
      end
      calendar
    end
  end
end
