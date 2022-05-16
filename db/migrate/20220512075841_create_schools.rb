class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_address
      t.boolean :active

      t.timestamps
    end
  end
end
