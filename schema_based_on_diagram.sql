CREATE TABLE IF NOT EXISTS patients(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth date NOT NULL,
)

CREATE TABLE IF NOT EXISTS medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admited_at timestamp NOT NULL,
    patient_id INT,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
)

CREATE TABLE IF NOT EXISTS medical_histories_treatment(
    medical_histories_id int,
    treatments_id int,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatments_id) REFERENCES treatments(id)
)

CREATE TABLE IF NOT EXISTS treatments(
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
)

CREATE INDEX patient_id_fk ON medical_histories(patient_id);
CREATE INDEX medical_histories_id_fk ON medical_histories_treatment(medical_histories_id);
CREATE INDEX treatments_id_fk ON medical_histories_treatment(treatments_id);