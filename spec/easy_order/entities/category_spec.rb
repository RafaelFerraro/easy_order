require 'spec_helper'

describe Category do
  describe '.include' do
    it 'includes the Lotus::Entity module' do
      expect(described_class.include? Lotus::Entity).to be_truthy
    end
  end

  describe '#attributes' do
    it 'responds to name attribute' do
      expect(subject.respond_to? :name).to be_truthy
    end

    it 'responds to description attribute' do
      expect(subject.respond_to? :description).to be_truthy
    end

    it 'responds to created_at attribute' do
      expect(subject.respond_to? :created_at).to be_truthy
    end

    it 'responds to updated_at attribute' do
      expect(subject.respond_to? :updated_at).to be_truthy
    end
  end
end
