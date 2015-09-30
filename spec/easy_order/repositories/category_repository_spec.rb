require 'spec_helper'

describe CategoryRepository do
  describe '.include' do
    it 'includes the Lotus::Repository module' do
      expect(described_class.include? Lotus::Repository).to be_truthy
    end
  end
end
