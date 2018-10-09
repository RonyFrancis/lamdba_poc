class CreateContactPhones < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_phones do |t|
      t.string :pb_no
      t.integer :contact_id
      t.timestamps
    end
  end
end
