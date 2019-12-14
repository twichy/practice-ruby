class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
