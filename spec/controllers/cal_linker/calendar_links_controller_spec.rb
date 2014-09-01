require 'spec_helper'

module CalLinker
  describe CalendarLinksController, type: :controller do
    routes { CalLinker::Engine.routes }

    describe 'get #show' do
      it 'returns http success' do
        event = FactoryGirl.create(:test_event)
        get :show, id: event.id, resource_type: event.class.name
        expect(response).to be_success
      end

      it 'assigns resource on request' do
        event = FactoryGirl.create(:test_event)
        get :show, id: event.id, resource_type: event.class.name
        expect(assigns(:resource)).to be(event.class)
      end

      it 'raises error if resource_type param not present' do
        event = FactoryGirl.create(:test_event)
        expect {
          get :show, id: event.id
        }.to raise_error(ResourceTypeNotDeclaredError)
      end

      it 'raises error if resource type does not exist' do
        event = FactoryGirl.create(:test_event)
        expect {
          get :show, id: event.id, resource_type: 'Blah'
        }.to raise_error(NameError)
      end

      it 'finds the correct event' do
        event = FactoryGirl.create(:test_event)
        get :show, id: event.id, resource_type: event.class.name
        expect(assigns(:event)).to eq(event)
      end

      it 'creates valid vcs file' do
        event = FactoryGirl.create(:test_event)
        get :show, id: event.id, resource_type: event.class.name
        vcs_file = create_calendar_object(event).events.first
        received_file = Icalendar.parse(response.body).first.events.first
        expect(received_file.dtstart.to_s).to eq(vcs_file.dtstart.to_s)
        expect(received_file.dtend.to_s).to eq(vcs_file.dtend.to_s)
        expect(received_file.summary).to eq(vcs_file.summary)
      end
    end

    def create_calendar_object(event)
      calendar = Icalendar::Calendar.new
      calendar.event do |e|
        e.dtstart = event.starting_at
        e.dtend = event.ending_at
        e.summary = event.name
      end
      calendar
    end
  end
end
