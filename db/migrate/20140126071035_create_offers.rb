class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :offers, [:user_id, :created_at]
  end
end
