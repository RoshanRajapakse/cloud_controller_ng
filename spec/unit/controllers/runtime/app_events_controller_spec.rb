require 'spec_helper'

## NOTICE: Prefer request specs over controller specs as per ADR #0003 ##

module VCAP::CloudController
  RSpec.describe VCAP::CloudController::AppEventsController do
    describe 'Query Parameters' do
      it { expect(VCAP::CloudController::AppEventsController).to be_queryable_by(:timestamp) }
      it { expect(VCAP::CloudController::AppEventsController).to be_queryable_by(:app_guid) }
    end

    describe 'Attributes' do
      it do
        expect(VCAP::CloudController::AppEventsController).to have_creatable_attributes({
          instance_guid: { type: 'string', required: true },
          instance_index: { type: 'integer', required: true },
          exit_status: { type: 'integer', required: true },
          timestamp: { type: 'string', required: true },
          app_guid: { type: 'string', required: true },
        })
      end

      it do
        expect(VCAP::CloudController::AppEventsController).to have_updatable_attributes({
          instance_guid: { type: 'string' },
          instance_index: { type: 'integer' },
          exit_status: { type: 'integer' },
          timestamp: { type: 'string' },
          app_guid: { type: 'string' },
        })
      end

      it 'is deprecated' do
        get '/v2/app_events'
        expect(last_response).to be_a_deprecated_response
      end
    end
  end
end
