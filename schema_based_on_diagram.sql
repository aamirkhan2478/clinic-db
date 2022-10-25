CREATE TABLE IF NOT EXISTS patients(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth date NOT NULL
);

CREATE TABLE IF NOT EXISTS medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admited_at timestamp NOT NULL,
    patient_id INT,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE IF NOT EXISTS treatments(
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE invoices (
	id SERIAL PRIMARY KEY NOT NULL,
	total_amount DECIMAL NOT NULL,
	payed_at TIMESTAMP NOT NULL,
	medical_history_id INT NOT NULL,
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE IF NOT EXISTS medical_histories_treatment(
    medical_histories_id int,
    treatments_id int,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY NOT NULL,
	unit_price DECIMAL NOT NULL,
	quantity INT NOT NULL,
	total_price DECIMAL NOT NULL,
	invoice_id INT NOT NULL,
	treatment_id INT NOT NULL,
	FOREIGN KEY (invoice_id) REFERENCES invoices (id),
	FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX patient_id_fk ON medical_histories(patient_id);
CREATE INDEX medical_histories_id_fk ON medical_histories_treatment(medical_histories_id);
CREATE INDEX treatments_id_fk ON medical_histories_treatment(treatments_id);
CREATE INDEX invoice_id_fk ON invoice_items(invoice_id);
