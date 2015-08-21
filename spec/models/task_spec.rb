require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to :room }
  it { is_expected.to validate_presence_of :name }
end
