class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.integer :tender_id
      t.text :message

      t.timestamps
    end
  end
end
