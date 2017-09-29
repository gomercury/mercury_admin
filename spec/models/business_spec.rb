require 'rails_helper'

RSpec.describe Business, type: :model do
	let(:business) { FactoryGirl.create(:business) }

	it "should have valid factory" do
		expect(business).to be_valid
	end
end
