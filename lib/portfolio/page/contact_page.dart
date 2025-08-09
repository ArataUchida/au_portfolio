import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentController = TextEditingController();

  Future<void> sendEmail() async {
    final url = Uri.parse('http://192.168.1.10:8000/send_mail/');

    final request = http.MultipartRequest('POST', url);
    request.fields['name'] = _nameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['comment'] = _commentController.text;

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      print('成功: ${response.body}');
      _showDialog('送信成功', 'メールが送信されました。\nご覧いただき誠にありがとうございます。');

      // フォームリセット
      _formKey.currentState?.reset();
      _nameController.clear();
      _emailController.clear();
      _commentController.clear();
    } else {
      print('失敗: ${response.statusCode} ${response.body}');
      _showDialog('送信失敗', 'メールの送信に失敗しました。\nもう一度お試しください。');
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Contact me',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 20),
                const Text(
                  '最後までご覧いただきありがとうございます。',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 名前
                    SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '名前を入力してください';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    // メールアドレス
                    SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: 'Mail Address',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'メールアドレスを入力してください';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // コメント
                SizedBox(
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: TextFormField(
                      controller: _commentController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'Comment',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'コメントを入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sendEmail();
                    }
                  },
                  child: const Text('SEND'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}