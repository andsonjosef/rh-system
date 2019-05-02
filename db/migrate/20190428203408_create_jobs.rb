class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :local, null: false
      t.string :salary, null: false
      t.string :employment_type, null: false
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
