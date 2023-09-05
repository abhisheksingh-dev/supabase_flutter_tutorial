// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(
      {required String message, Function? onTap, String? onTapName}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 3),
        content: GlassMorphism(
          blur: 10,
          color: Colors.black,
          opacity: 0.1,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder(
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: const Duration(seconds: 3),
                  builder: (context, double t, _) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: LinearProgressIndicator(
                        color: Colors.blueAccent,
                        backgroundColor: Colors.grey,
                        value: t,
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: MediaQuery.of(this).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      (onTap != null)
                          ? TextButton(
                              onPressed: () => onTap,
                              child: Text(
                                onTapName ?? 'Action',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void errorSnakBar(
      {required String message,
      void Function()? onTap,
      Color? color,
      String? onTapName,
      TextStyle? onTapStyle}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: GlassMorphism(
          blur: 10,
          color: Colors.black,
          opacity: 0.1,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder(
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: const Duration(seconds: 3),
                  builder: (context, double t, _) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: LinearProgressIndicator(
                        color: Colors.red[900],
                        backgroundColor: Colors.grey,
                        value: t,
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: MediaQuery.of(this).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.error,
                          color: Colors.red[900],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      (onTap != null)
                          ? TextButton(
                              onPressed: onTap,
                              child: Text(
                                onTapName ?? "Action",
                                style: onTapStyle,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
