CREATE DATABASE clinic;

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE
);

ALTER TABLE patients ADD CONSTRAINT patient_id PRIMARY KEY (id)

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(50),
    CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patients(id)
);
ALTER TABLE medical_histories ADD CONSTRAINT medical_history_id PRIMARY KEY (id);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    generated_at TIMESTAMP,
    total_anount DECIMAL,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT medical_history_id FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT invoices_id PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT invoices_id FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT invoice_item_id PRIMARY KEY(id)
);

CREATE TABLE tratments(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(250),
    name VARCHAR(150),
    CONSTRAINT tratments_id PRIMARY KEY(id)
);
ALTER TABLE invoice_items ADD CONSTRAINT tratments_id FOREIGN KEY(treatment_id) REFERENCES tratments(id);

CREATE TABLE treatment_history (
    medical_history_id INT,
    treatment_id INT,
    CONSTRAINT medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT tratments_id FOREIGN KEY(treatment_id) REFERENCES tratments(id)
);
