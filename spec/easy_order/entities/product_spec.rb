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
end