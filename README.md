# EduTech SMK — Mobile Cross-Platform LMS

Final project untuk mata kuliah Mobile Cross-Platform Development. Aplikasi dirancang sebagai LMS SMK berbasis Flutter dengan target Android dan Web, serta Firebase sebagai backend pada fase integrasi berikutnya.

## Status pengerjaan

- Phase 1A — Flutter & Android environment: selesai
- Phase 1B — Project Flutter & GitHub: selesai
- Phase 1C — Flutter Web: teruji
- Phase 1D — Android physical device: teruji
- Phase 1E — Architecture & professional theme: selesai
- Phase 2 — Firebase integration: belum dimulai

## Struktur utama

```text
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── theme/
│   └── services/
└── features/
    ├── auth/
    ├── student/
    ├── teacher/
    ├── wali_kelas/
    ├── bk/
    ├── piket/
    ├── admin/
    └── shared/
```

Arsitektur dipisahkan per fitur supaya implementasi role, Firebase, dan pengembangan Web Admin dapat dilakukan secara bertahap tanpa mencampur tanggung jawab antar-modul.

## Role

Role yang sudah didefinisikan pada fondasi aplikasi:

- Siswa
- Guru Mapel
- Wali Kelas
- Guru BK
- Guru Piket
- Admin

Target minimum final akan memprioritaskan Siswa, Guru Mapel, Wali Kelas, dan Guru BK sebelum modul tambahan diperluas.

## Validasi lokal

Setelah menarik perubahan terbaru:

```bash
git pull
flutter pub get
flutter analyze
flutter test
```

Web:

```bash
flutter run -d web-server --web-port 8080
```

Android physical device:

```bash
flutter devices
flutter run -d <DEVICE_ID>
```

## Catatan fase

Firebase belum diinisialisasi pada Phase 1. Authentication, Firestore, Storage, Cloud Messaging, dan Hosting akan dikonfigurasi secara terkontrol pada Phase 2.
