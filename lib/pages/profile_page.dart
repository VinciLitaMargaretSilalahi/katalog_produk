import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // =========================
            // HEADER PROFIL
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),

              child: Column(
                children: [
                  // Foto profil
                  Container(
                    width: 100,
                    height: 100,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade50,
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Vinci Silalahi',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'vincisilalahi@email.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Tombol edit profil
                  OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Fitur edit profil ',
                          ),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),

                    label: const Text(
                      'Edit Profil',
                    ),

                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // INFORMASI AKUN
            // =========================
            _judulSection(
              'Informasi Akun',
            ),

            _menuItem(
              icon: Icons.person_outline,
              title: 'Data Pribadi',
              subtitle: 'Kelola informasi pribadi',
              onTap: () {},
            ),

            _menuItem(
              icon: Icons.email_outlined,
              title: 'Email',
              subtitle: 'vincisilalahi@email.com',
              onTap: () {},
            ),

            _menuItem(
              icon: Icons.phone_outlined,
              title: 'Nomor Telepon',
              subtitle: '0842325011',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            // =========================
            // PENGATURAN
            // =========================
            _judulSection(
              'Pengaturan',
            ),

            _menuItem(
              icon: Icons.notifications_none,
              title: 'Notifikasi',
              subtitle: 'Atur pemberitahuan aplikasi',
              onTap: () {},
            ),

            _menuItem(
              icon: Icons.lock_outline,
              title: 'Keamanan',
              subtitle: 'Pengaturan keamanan akun',
              onTap: () {},
            ),

            _menuItem(
              icon: Icons.help_outline,
              title: 'Bantuan',
              subtitle: 'Pusat bantuan aplikasi',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            // =========================
            // TENTANG APLIKASI
            // =========================
            _judulSection(
              'Tentang Aplikasi',
            ),

            _menuItem(
              icon: Icons.info_outline,
              title: 'Tentang Katalog Produk',
              subtitle: 'Versi aplikasi 1.0.0',
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Katalog Produk',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(
                    Icons.shopping_bag,
                    size: 40,
                  ),
                  children: const [
                    Text(
                      'Aplikasi katalog produk sederhana '
                      'yang dibuat menggunakan Flutter.',
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 25),

            // =========================
            // LOGOUT
            // =========================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: SizedBox(
                width: double.infinity,

                child: OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Keluar dari Aplikasi?',
                          ),

                          content: const Text(
                            'Apakah Anda yakin ingin keluar?',
                          ),

                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Batal',
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Logout berhasil',
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Keluar',
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),

                  label: const Text(
                    'Keluar',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),

                    side: const BorderSide(
                      color: Colors.red,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Katalog Produk © 2026',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // =========================
  // JUDUL SECTION
  // =========================
  Widget _judulSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        0,
        16,
        8,
      ),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // =========================
  // MENU PROFIL
  // =========================
  Widget _menuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        onTap: onTap,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),

        leading: Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),

        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}