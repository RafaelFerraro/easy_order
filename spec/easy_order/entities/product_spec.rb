require 'spec_helper'

describe Product do
  describe 'attributes' do
    it { expect(subject.respond_to? :title).to be_truthy }
    it { expect(subject.respond_to? :description).to be_truthy }
    it { expect(subject.respond_to? :size).to be_truthy }
    it { expect(subject.respond_to? :color).to be_truthy }
    it { expect(subject.respond_to? :sale_price).to be_truthy }
    it { expect(subject.respond_to? :purchase_price).to be_truthy }
    it { expect(subject.respond_to? :quantity).to be_truthy }
    it { expect(subject.respond_to? :sub_category_id).to be_truthy }
  end

  describe '.update' do
    let(:product) { instance_double('Product') }

    it 'updates the instance of Product' do
      allow(ProductRepository).to receive(:update)

      expect(product).to receive(:update).with({ name: 'name', description: 'description' })
      described_class.update(product, { name: 'name', description: 'description' })
    end

    it 'updates the Product on Repository' do
      allow(product).to receive(:update)

      expect(ProductRepository).to receive(:update).with(product)
      described_class.update(product, { name: 'name', description: 'description' })
    end
  end
end