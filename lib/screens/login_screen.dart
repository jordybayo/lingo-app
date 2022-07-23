import 'package:flutter/material.dart';

enum RememberQ { yes, no }

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RememberQ? _question = RememberQ.no;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blueAccent),
            ),
            const Text('Please login to continue using our app.'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: const EdgeInsets.all(5),
                    ),
                    onPressed: null,
                    child: Image.asset(
                      'assets/images/fb_btn.png',
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.all(5),
                      ),
                      onPressed: null,
                      child: Image.asset(
                        'assets/images/google_btn.png',
                        height: 50,
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Or sign up with email',
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio<RememberQ>(
                        value: RememberQ.yes,
                        groupValue: _question,
                        onChanged: (RememberQ? value) {
                          setState(() => _question = value);
                        }),
                    const Text('I agree with private Policy')
                  ],
                ),
                const Text('Forgot password')
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text('Don\'t have an account ?'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
