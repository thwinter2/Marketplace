require 'rails_helper'

RSpec.describe Feedback, type: :model do
	subject{
		described_class.new(email: "rspec@test.com", note: "RSpec Feedback Test")
	}
	it "is valid with valid attributes" do
  		expect(subject).to be_valid
  	end

  	it "is not valid without a email" do
  		subject.email = nil
  		expect(subject).to_not be_valid
 	end

 	it "is not valid without a note" do
 		subject.note = nil
 		expect(subject).to_not be_valid
 	end

 	it "is valid with proper email format" do
 		subject.email.match(/\w+@[a-zA-Z]+\.[a-zA-Z]{2,}/)
 		expect(subject).to be_valid
 	end
end
