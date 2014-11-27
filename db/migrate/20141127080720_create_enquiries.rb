class CreateEnquiries < ActiveRecord::Migration
  def up
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.boolean :sent
      t.boolean :seen
      t.timestamps
    end
  end

  def down
    drop_table :enquiries
  end
end
