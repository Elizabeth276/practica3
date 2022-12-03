import 'package:flutter/material.dart';
import 'package:practica3/providers/provider_theme.dart';
import 'package:practica3/settings/styles.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
              color: Theme.of(context).backgroundColor,
              urlImage: 'assets/page1.png',
              title: 'DESARROLLO WEB',
              subtitle:
                  'Aprende con nosotros las mejores tecnologías utilizadas en la industria para el desarrollo web. Tenemos los mejores cursos impartidos por profesionales muy reconocidos.',
              provider: theme,
            ),
            buildPage(
              color: Theme.of(context).primaryColor,
              urlImage: 'assets/page2.png',
              title: 'DESARROLLO MÓVIL',
              subtitle:
                  'Conoce los mejores frameworks para el desarrollo de aplicaciones móviles. Te enseñamos a programar aplicaciones para Android e IOS, de manera nativa o con ayuda de frameworks multiplataforma, la elección depende de ti.',
              provider: theme,
            ),
            buildPage(
              color: Theme.of(context).primaryColorDark,
              urlImage: 'assets/page3.png',
              title: 'TRABAJA EN EQUIPO',
              subtitle:
                  'El trabajo en equipo es muy importante en el mundo de la programación, conoce metodologías que te permitiran llevar un control sobre tus proyectos y mantener un gran flujo de trabajo con tu equipo de desarrollo.',
              provider: theme,
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                primary: Colors.white,
                backgroundColor: Theme.of(context).primaryColorLight,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text('Get Started', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dash');
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              color: Theme.of(context).secondaryHeaderColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: Text(
                      'SKIP',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Theme.of(context).primaryColorLight,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'NEXT',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Container buildPage(
          {required Color color,
          required String urlImage,
          required String title,
          required String subtitle,
          required ThemeProvider provider}) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 220,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 64),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      provider.setthemData(lightTheme());
                    },
                    child: Icon(Icons.sunny),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.setthemData(darkTheme());
                    },
                    child: Icon(Icons.dark_mode),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.setthemData(personalizedTheme());
                    },
                    child: Icon(Icons.question_mark),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
