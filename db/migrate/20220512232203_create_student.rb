class CreateStudent < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :school_id
      t.integer :age
      t.boolean :frl
    end
  end
end
