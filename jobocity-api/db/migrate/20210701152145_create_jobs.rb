class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :company
      t.string :location
      t.text :technologies,array: true, default: []
      t.string :logo
      t.string :position
      t.string :date

      t.timestamps
    end
  end
end
