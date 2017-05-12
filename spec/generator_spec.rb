require 'generator'

RSpec.describe Generator do

  describe '#validate' do
    it 'checks first character of a UPN is valid' do
      upn1 = 'H801200001001'
      upn2 = '801200001001H'
      upn3 = 'I801200001001'

      expect(Generator.new.validate(upn1)).to eq(true)
      expect(Generator.new.validate(upn2)).to eq(false)
      expect(Generator.new.validate(upn3)).to eq(false)

    end

    it 'checks UPN is correct length' do
      upn1 = 'H801200001001'
      upn2 = 'H324'
      upn3 = 'J431054000010303044134'

      expect(Generator.new.validate(upn1)).to eq(true)
      expect(Generator.new.validate(upn2)).to eq(false)
      expect(Generator.new.validate(upn3)).to eq(false)
    end

    it 'checks for a valid UPN' do
      upn = 'H801200001001'

      expect(Generator.new.validate(upn)).to eq(true)
    end

    it 'checks for an invalid UPN' do
      upn = 'Y211814788634'

      expect(Generator.new.validate(upn)).to eq(false)
    end

  end

  describe '#generate' do
    it 'generates a valid UPN' do
      upn = Generator.new.generate

      expect(Generator.new.validate(upn.to_s)).to eq(true)
    end
  end

  describe '#generate_many' do
    it 'generates x number of UPNs' do
      upns = Generator.new.generate_many(25)

      expect(upns.length).to eq(25)
      expect(Generator.new.validate(upns[0])).to eq(true)
      expect(Generator.new.validate(upns[3])).to eq(true)
      expect(Generator.new.validate(upns[19])).to eq(true)
    end
  end
end
