class CreatePatientDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_diagnoses do |t|
      t.references :patient, foreign_key: true
      t.references :diagnosis, foreign_key: true

      t.timestamps
    end
  end
end
