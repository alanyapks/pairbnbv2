class AddGuestsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :guests_number, :integer
  end
end
