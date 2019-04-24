# frozen_string_literal: true

puts 'Create Facility'

facility = Facility.find_or_create_by(name: 'Blue Alps Ski Camp')

puts 'Created Facility'

puts 'Create Patient'

patient = Patient.find_or_create_by(first_name: 'Thomas', middle_name: '', last_name: 'Schudel') do |p|
  p.mr = '30997'
  p.gender = 0
  p.dob = DateTime.now - 43.years
end

puts 'Created Patient'

puts 'Create Admission'

admission_date = DateTime.now - 30.days
admission = Admission.find_or_create_by(patient_id: patient.id) do |a|
  a.moment = admission_date
  a.facility_id = facility.id
end

puts 'Created Admission'

puts 'Create Diagnosis'

diagnosis = Diagnosis.find_or_create_by(code: '(S82.101)') do |d|
  d.description = 'a fracture of upper end of the right tibia'
end

puts 'Created Diagnosis'

puts 'Create Admission Diagnosis'

DiagnosisAdmission.find_or_create_by(diagnosis_id: diagnosis.id, admission_id: admission.id)

puts 'Created Admission Diagnosis'

puts 'Create Symptom'

symptoms = ['severe pain', 'swelling', 'limited bending of the joint']
symptoms.each do |symptom|
  Symptom.find_or_create_by(description: symptom) do |s|
    s.admission_id = admission.id
  end
end

puts 'Created Symptom'

puts 'Create Observation'
observation_time = DateTime.now + 30.minutes - 30.days
Observation.find_or_create_by(description: 'No soft tissues were damaged.') do |o|
  o.moment = observation_time
  o.admission_id = admission.id
end

puts 'Created Observation'

puts 'Create Allergies'

allergies = ['hypersensitivity to aspirin or NSAIDs', 'gluten intolerance']

allergies.each do |allergy|
  Allergy.find_or_create_by(description: allergy) do |a|
    a.patient_id = patient.id
  end
end

puts 'Created alltergies'

puts 'Create Chronic Diagnosis'

diagnosis = Diagnosis.find_or_create_by(code: '(J45)') do |d|
  d.description = 'Asthma'
end

PatientChronicCondition.find_or_create_by(chronic_condition_id: diagnosis.id, patient_id: patient.id)

puts 'Created Chronic Diagnosis'

puts 'Create MedicationOrder and OrderFrequency'

medication = MedicationOrder.find_or_create_by(name: 'Acetaminophen') do |m|
  m.dosage = 500
  m.unit = 0
  m.route = 0
  m.necessity = 'relieve pain'
  m.patient_id = patient.id
end

OrderFrequency.find_or_create_by(value: 'q4') do |f|
  f.unit = 0
  f.medication_order_id = medication.id
end

medication = MedicationOrder.find_or_create_by(name: 'Naproxen') do |m|
  m.dosage = 500
  m.unit = 0
  m.necessity = 'relieve swelling'
  m.patient_id = patient.id
end

OrderFrequency.find_or_create_by(value: 'q6') do |f|
  f.unit = 0
  f.medication_order_id = medication.id
end

puts 'Created MedicationOrder and OrderFrequency'

puts 'Create DiagnosticProcedure'

DiagnosticProcedure.find_or_create_by(description: 'an exploratory radiography',
                                      moment: 'February 18, 2018, 5:15 pm'.to_datetime,
                                      patient_id: patient.id)

puts 'Created DiagnosticProcedure'

puts 'Create PatientDiagnosis'

diagnosis = Diagnosis.find_or_create_by(code: '(S82.101A)') do |d|
  d.description = 'a closed fracture in the right tibia'
end

PatientDiagnosis.find_or_create_by(patient_id: patient.id, diagnosis_id: diagnosis.id)

puts 'Created PatientDiagnosis'

puts 'Create Treatments'

Treatment.find_or_create_by(description: 'temporary bracing the right leg') do |t|
  t.patient_id = patient.id
  t.necessity = 'restrict the motion'
end

puts 'Created Tratments'
