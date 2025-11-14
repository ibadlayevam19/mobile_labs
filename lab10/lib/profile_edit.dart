import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final user = FirebaseAuth.instance.currentUser;

  final _nameController = TextEditingController();
  final _photoController = TextEditingController();

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = user?.displayName ?? "";
    _photoController.text = user?.photoURL ?? "";
  }

  Future<void> saveProfile() async {
    if (user == null) return;

    setState(() => isSaving = true);

    try {
      await user!.updateDisplayName(_nameController.text.trim());
      await user!.updatePhotoURL(_photoController.text.trim());
      await user!.reload();

      // Refresh the currentUser reference
      FirebaseAuth.instance.currentUser;

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Profile updated.")));
        Navigator.pop(context); // return to home page
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }

    setState(() => isSaving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Preview photo
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _photoController.text.isNotEmpty
                    ? NetworkImage(_photoController.text.trim())
                    : null,
                child: _photoController.text.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Display Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _photoController,
              decoration: const InputDecoration(
                labelText: "Photo URL",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 40),

            isSaving
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: saveProfile,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save Profile",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
