Medication.destroy_all
Patient.destroy_all
User.destroy_all

User.create!(email: "teste@email.com", password: "123123")

joao = Patient.create!(name: "João Grilo", birth: "01/02/03", user_id: User.last.id)
maria = Patient.create!(name: "Maria José", birth: "02/03/04", user_id: User.last.id)
enzo = Patient.create!(name: "Enzo Souza", birth: "03/04/05", user_id: User.last.id)

m1 = Medication.create!(name: "Vitamina D", dosage: "1 cápsula semanal", patient_id: joao.id)

m2 = Medication.create!(
  name: "Omeprazol 20mg",
  dosage: "1 cápsula por dia em jejum",
  patient_id: maria.id
  )

m3 = Medication.create!(
  name: "Dipirona 500mg",
  dosage: "1 comprimido a cada 6 horas em caso de dor",
  patient_id: enzo.id
)

m4 = Medication.create!(
  name: "Amoxicilina 875mg",
  dosage: "1 comprimido a cada 12 horas por 7 dias",
  patient_id: joao.id
)

m5 = Medication.create!(
  name: "Losartana 50mg",
  dosage: "1 comprimido de uso contínuo pela manhã",
  patient_id: maria.id
)

m6 = Medication.create!(
  name: "Ibuprofeno 600mg",
  dosage: "1 comprimido a cada 8 horas após as refeições",
  patient_id: enzo.id
)
