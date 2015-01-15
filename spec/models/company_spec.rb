require "rails_helper"

RSpec.describe Company, :type => :model do
  before  { @company = FactoryGirl.build :company }
  subject { @company }

  # validity
  it { should be_valid }

  # attributes
  it { should respond_to :name }

  # validations
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  # associations
  it { should have_many :jobs }
end
