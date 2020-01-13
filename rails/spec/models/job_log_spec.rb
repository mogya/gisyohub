require 'rails_helper'

RSpec.describe JobLog, type: :model do
  describe 'variables method' do
    let(:job_log) do
      build(
        :job_log,
        variable_json: <<-END_OF_JSON
           {\"since_id\":123,\"flag\":false}
        END_OF_JSON
      )
    end

    it 'can get contents of variable_json' do
      expect(job_log.variables[:since_id]).to eq 123
    end

    it 'can set contents of variable_json' do
      job_log.variables[:new_field] = 'xyz'
      job_log.save
      new_record = JobLog.find(job_log.id)
      expect(new_record.variables[:new_field]).to eq 'xyz'
    end
  end
end
