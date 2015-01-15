require "rails_helper"

RSpec.describe Category, :type => :model do
  before  { @category = FactoryGirl.build :category }
  subject { @category }

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
