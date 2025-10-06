-- membuat tabel siswa
CREATE TABLE siswa (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    umur INT,
    jurusan VARCHAR(50)
);

-- membuat tabel nilai
CREATE TABLE nilai (
    id SERIAL PRIMARY KEY,
    siswa_id INT REFERENCES siswa(id) ON DELETE CASCADE,
    mata_pelajaran VARCHAR(100),
    nilai INT
);

-- menambah data siswa
INSERT INTO siswa (nama, umur, jurusan) VALUES
('Andi', 16, 'IPA'),
('Budi', 17, 'IPS'),
('Citra', 16, 'IPA'),
('Dewi', 17, 'Bahasa'),
('Eko', 16, 'IPS'),
('Levi', 17, 'IPA'),
('Dafa', 16, 'IPS');

-- menambah data nilai
INSERT INTO nilai (siswa_id, mata_pelajaran, nilai) VALUES
(1, 'Matematika', 85),
(1, 'Bahasa Inggris', 88),
(2, 'Matematika', 78),
(3, 'Fisika', 90),
(4, 'Bahasa Indonesia', 95),
(5, 'Ekonomi', 80);
(6, 'Seni Budaya', 85);


-- menampilkan semua siswa
SELECT * FROM siswa;

-- menampilkan siswa jurusan IPA
SELECT * FROM siswa WHERE jurusan = 'IPA';

-- menampilkan nilai rata-rata tiap siswa (JOIN dan GROUP BY)
SELECT siswa.nama, AVG(n.nilai) AS rata_nilai
FROM siswa
JOIN nilai ON siswa.id = nilai.siswa_id
GROUP BY siswa.nama;

-- ubah jurusan salah satu siswa
UPDATE siswa 
SET jurusan = 'Bahasa' 
WHERE nama = 'Dafa';

-- hapus satu data nilai siswa
DELETE FROM nilai WHERE id = 3;
