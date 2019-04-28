class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :local
      t.string :salary
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
