class AddImageableToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :imageable, polymorphic: true
  end
end
