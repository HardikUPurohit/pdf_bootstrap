class CreatePatientChronicConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_chronic_conditions do |t|
      t.references :chronic_condition, foreign_key: {to_table: :diagnoses}
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
