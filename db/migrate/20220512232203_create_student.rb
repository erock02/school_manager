class CreateStudent < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :age
      t.boolean :frl

      t.timestamps
    end
  end
end
