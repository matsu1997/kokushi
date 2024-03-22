import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';



class mail extends StatefulWidget {
  @override
  mail(this.name);
  String name;
  State<mail> createState() => _mailState();
}

class _mailState extends State<mail> {
  late TextEditingController _emailController;

  late TextEditingController _bodyController;

  late TextEditingController _subjectController;

  late TextEditingController _ccController;

  late TextEditingController _bccController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _bodyController = TextEditingController();
    _subjectController = TextEditingController();
    _ccController = TextEditingController();
    _bccController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _bodyController.dispose();
    _subjectController.dispose();
    _ccController.dispose();
    _bccController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('メール送信',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
        centerTitle: true,elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
            Text('shinkyuapp2022@gmail.com'),
              const SizedBox(height: 50),
            Text(widget.name),
              const SizedBox(height: 50),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(hintText: '本文'),
              ),
              const SizedBox(height: 50),
              ElevatedButton( style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  onPressed: _sendEmail, child: Text('送信する')),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendEmail() async {
    final email = Email(
      body: _bodyController.text,
      subject: widget.name,
      recipients: ["shinkyuapp2022@gmail.com"],
      // cc: [_ccController.text],
      // bcc: [_bccController.text],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
    _bodyController.clear();
  }
}
