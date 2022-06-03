require_relative '../lib/elemental'

describe Elemental do
  class NewPage < described_class
    link :odd1, '#odd-selector', text: 'Some Link'
    button :odd2, '.odd_selector2', text: 'Some Button', match: :first
    field :odd3, '.odd_selector3'
    element :odd4, '#odd_selector4', text: 'Some Selector'

    field :blocky_one, ->(index) { "someValue_#{index}" }
    element :some, ->(name) { "someCrazyName_#{name}" }
  end

  context 'selectors' do
    subject { NewPage.new }

    before do
      allow_any_instance_of(Capybara::DSL).to receive(:find).and_return('doubled')
      allow_any_instance_of(Capybara::DSL).to receive(:find_button).and_return('doubled button')
    end

    it 'responds to link selector name' do
      expect(subject).to respond_to(:odd1).with(0).arguments
    end

    it 'returns defined options' do
      expect(subject.odd1).to eq('#odd-selector')
    end

    it 'responds to link selector with name_type' do
      expect(subject).to respond_to(:odd1_link).with(0).arguments
    end

    it 'returns defined options' do
      expect(subject.odd2).to eq('.odd_selector2')
    end

    it 'responds to button selector name' do
      expect(subject).to respond_to(:odd2).with(0).arguments
    end

    it 'responds to button selector name_type' do
      expect(subject).to respond_to(:odd2_button).with(0).arguments
    end

    it 'calls find button with the selector' do
      expect(subject.odd2_button).to eq('doubled button')
    end

    it 'responds to field selector by name' do
      expect(subject).to respond_to(:odd3).with(0).arguments
    end

    it 'responds to element selector by name' do
      expect(subject).to respond_to(:odd4).with(0).arguments
    end

    it 'responds to element selector by name_element' do
      expect(subject).to respond_to(:odd4_element).with(0).arguments
    end

    it 'responds with a block' do
      expect(subject).to respond_to(:blocky_one).with(1).arguments
    end

    it 'responds with a block as field' do
      expect(subject).to respond_to(:blocky_one_field).with(1).arguments
    end

    it 'responds to field with a block' do
      expect(subject.blocky_one(1)).to eq('someValue_1')
    end

    it 'responds with element named method' do
      expect(subject.some_element(1)).to eq('doubled')
    end

    it 'responds with the selector name' do
      expect(subject.some(1)).to eq('someCrazyName_1')
    end
  end

  context 'class' do
    it 'responds correctly to .link' do
      expect(NewPage).to respond_to(:link)
    end

    it 'responds correctly to .button' do
      expect(NewPage).to respond_to(:button)
    end

    it 'responds correctly to .field' do
      expect(NewPage).to respond_to(:field)
    end

    it 'responds correctly to .element' do
      expect(NewPage).to respond_to(:element)
    end

    it 'do not respond to defined element' do
      expect(NewPage).not_to respond_to(:odd1)
    end

    it 'do not respond to garbage' do
      expect(NewPage).not_to respond_to(:crap)
    end
  end
end
