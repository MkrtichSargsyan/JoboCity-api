class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :company
      t.string :location
      t.text :qualifications,array: true, default: []
      t.text :company_description
      t.string :logo
      t.string :position
      t.string :date

      t.timestamps
    end
  end
end
