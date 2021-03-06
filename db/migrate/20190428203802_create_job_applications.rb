class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
