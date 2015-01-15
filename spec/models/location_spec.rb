require "rails_helper"

RSpec.describe Location, :type => :model do
  before  { @location = FactoryGirl.build :location }
  subject { @location }

  # validity
  it { should be_valid }

  # attributes
  it { should respond_to :name }

  # validations
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  # associations
  it { should have_and_belong_to_many :jobs }
end
