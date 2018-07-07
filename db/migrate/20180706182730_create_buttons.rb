class CreateButtons < ActiveRecord::Migration[5.2]
  def change
    create_table :buttons do |t|
      t.string :shape
      t.string :color
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
