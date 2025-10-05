-- Buat tabel siswa
CREATE TABLE siswa (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    umur INT,
    jurusan VARCHAR(50)
);

-- Buat tabel nilai
CREATE TABLE nilai (
    id SERIAL PRIMARY KEY,
    siswa_id INT REFERENCES siswa(id) ON DELETE CASCADE,
    mata_pelajaran VARCHAR(100),
    nilai INT
);

-- Tambah data siswa (5 siswa)
INSERT INTO siswa (nama, umur, jurusan) VALUES
('Andi', 16, 'IPA'),
('Budi', 17, 'IPS'),
('Citra', 16, 'IPA'),
('Dewi', 17, 'Bahasa'),
('Eko', 16, 'IPS');

-- Tambah data nilai (minimal 1 nilai per siswa)
INSERT INTO nilai (siswa_id, mata_pelajaran, nilai) VALUES
(1, 'Matematika', 85),
(1, 'Bahasa Inggris', 88),
(2, 'Matematika', 78),
(3, 'Fisika', 90),
(4, 'Bahasa Indonesia', 95),
(5, 'Ekonomi', 80);

------------------------------------------------------
-- QUERY
------------------------------------------------------

-- Tampilkan semua siswa
SELECT * FROM siswa;

-- Tampilkan siswa jurusan IPA
SELECT * FROM siswa WHERE jurusan = 'IPA';

-- Tampilkan nilai rata-rata tiap siswa (JOIN + GROUP BY)
SELECT s.nama, AVG(n.nilai) AS rata_nilai
FROM siswa s
JOIN nilai n ON s.id = n.siswa_id
GROUP BY s.nama;

------------------------------------------------------
-- UPDATE & DELETE
------------------------------------------------------

-- Ubah jurusan Budi jadi IPA
UPDATE siswa 
SET jurusan = 'IPA' 
WHERE nama = 'Budi';

-- Hapus nilai dengan id = 3
DELETE FROM nilai WHERE id = 3;
