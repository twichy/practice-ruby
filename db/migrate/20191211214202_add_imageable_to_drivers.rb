class AddImageableToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_reference :drivers, :imageable, polymorphic: true
  end
end
