class AddOfferStateToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :offer_state, :string
  end
end
