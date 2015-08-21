require 'rails_helper'

RSpec.describe Room, type: :model do
  it { is_expected.to have_many :tasks }
  it { should validate_presence_of :name }
end
