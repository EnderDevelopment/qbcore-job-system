CREATE TABLE IF NOT EXISTS qbcore_jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_name VARCHAR(50) NOT NULL,
    job_label VARCHAR(50) NOT NULL,
    blip_sprite INT,
    blip_color INT,
    blip_scale FLOAT
);

INSERT INTO qbcore_jobs (job_name, job_label, blip_sprite, blip_color, blip_scale) VALUES
('jengi', 'Jengi', 446, 5, 1.0);