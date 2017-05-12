require 'excel'

RSpec.describe Excel do
  describe '#create_upns' do
    it 'returns an array of upns' do
      upns = Excel.new.create_upns(6)

      expect(upns.length).to eq(6)
    end
  end
end
