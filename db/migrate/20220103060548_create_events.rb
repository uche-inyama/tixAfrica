class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.text :address
      t.text :theme
      t.text :details
      t.string :image
      t.string :event_type
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
