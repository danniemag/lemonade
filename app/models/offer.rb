class Offer < ApplicationRecord
  include AASM

  aasm :column => 'offer_state' do
    state :disabled, :initial => true
    state :enabled

    event :enable do
      transitions :from => :disabled, :to => :enabled
    end

    event :disable do
      transitions :from => :enabled, :to => :disabled
    end
  end
end
