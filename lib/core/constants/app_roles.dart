enum AppRole {
  student,
  subjectTeacher,
  homeroomTeacher,
  counselor,
  dutyTeacher,
  admin,
}

extension AppRolePresentation on AppRole {
  String get label => switch (this) {
        AppRole.student => 'Siswa',
        AppRole.subjectTeacher => 'Guru Mapel',
        AppRole.homeroomTeacher => 'Wali Kelas',
        AppRole.counselor => 'Guru BK',
        AppRole.dutyTeacher => 'Guru Piket',
        AppRole.admin => 'Admin',
      };

  String get description => switch (this) {
        AppRole.student => 'Materi, tugas, nilai, presensi, dan konseling.',
        AppRole.subjectTeacher => 'Materi, tugas, penilaian, presensi, dan monitoring.',
        AppRole.homeroomTeacher => 'Monitoring kelas, alert, pelanggaran, dan laporan.',
        AppRole.counselor => 'Konseling privat, penanganan kasus, dan tracking.',
        AppRole.dutyTeacher => 'Presensi cepat, kejadian harian, dan broadcast urgensi.',
        AppRole.admin => 'Manajemen data sekolah dan portal administrasi.',
      };

  bool get isMinimumFinalTarget => switch (this) {
        AppRole.student ||
        AppRole.subjectTeacher ||
        AppRole.homeroomTeacher ||
        AppRole.counselor => true,
        AppRole.dutyTeacher || AppRole.admin => false,
      };
}
