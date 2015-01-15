require "rails_helper"

RSpec.describe Job, :type => :model do
  before  { @job = FactoryGirl.build :job }
  subject { @job }

  # validity
  it { should be_valid }

  # attributes
  it { should respond_to :guid }
  it { should respond_to :url }
  it { should respond_to :title }
  it { should respond_to :summary }
  it { should respond_to :published_at }

  # validations
  it { should validate_presence_of :guid }
  it { should validate_uniqueness_of :guid }
  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :url }

  # associations
  it { should belong_to :company }
end
