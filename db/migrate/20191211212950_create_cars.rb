class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :title
      t.string :car_type
      t.integer :color

      t.timestamps
    end
  end
end
