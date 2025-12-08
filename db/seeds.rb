Medication.destroy_all
Appointment.destroy_all
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

a1 = Appointment.create!(
  title: "Consulta com Dr. Rodrigo",
  occurs_at: "23/12/25",
  specialty: "Oftalmologia",
  notes: "To cego, enxergo mais nada",
  patient_id: enzo.id
)

a2 = Appointment.create!(
  title: "Limpeza e Check-up",
  occurs_at: "15/01/26",
  specialty: "Odontologia",
  notes: "Siso tá doendo demais, socorro",
  patient_id: joao.id
)

a3 = Appointment.create!(
  title: "Retorno Cardiologista",
  occurs_at: "10/02/26",
  specialty: "Cardiologia",
  notes: "Coração acelerado depois de tomar muito café codando",
  patient_id: maria.id
)

a4 = Appointment.create!(
  title: "Avaliação Joelho",
  occurs_at: "05/03/26",
  specialty: "Ortopedia",
  notes: "Joguei bola no fim de semana e travei o joelho",
  patient_id: joao.id
)

a5 = Appointment.create!(
  title: "Consulta Nutricionista",
  occurs_at: "20/01/26",
  specialty: "Nutrição",
  notes: "Preciso de uma dieta urgente, comi demais no Natal",
  patient_id: maria.id
)

a6 = Appointment.create!(
  title: "Exame de Alergia",
  occurs_at: "12/04/26",
  specialty: "Dermatologia",
  notes: "Apareceram umas manchas vermelhas depois da praia",
  patient_id: enzo.id
)
