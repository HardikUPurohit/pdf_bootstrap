class CreateDiagnosisAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnosis_admissions do |t|
      t.references :admission, foreign_key: true
      t.references :diagnosis, foreign_key: true

      t.timestamps
    end
  end
end
