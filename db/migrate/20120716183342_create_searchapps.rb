class CreateSearchapps < ActiveRecord::Migration
  def change
    create_table :searchapps do |t|
      t.string :file_name
      t.text :content

      t.timestamps
    end
  end
end
