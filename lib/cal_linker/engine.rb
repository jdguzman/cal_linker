module CalLinker
  class Engine < ::Rails::Engine
    isolate_namespace CalLinker
    require 'icalendar'
  end
end
