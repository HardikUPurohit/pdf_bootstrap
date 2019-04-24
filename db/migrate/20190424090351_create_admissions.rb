class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.datetime :moment
      t.references :facility, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
