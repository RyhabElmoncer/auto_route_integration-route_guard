 # 🚀 auto_route_guard_flutter

Ce projet Flutter utilise **auto_route** pour gérer la navigation et inclut la fonctionnalité de **route guards** pour sécuriser et restreindre l'accès aux pages spécifiques.

---

## 📋 Fonctionnalités

- **Gestion des Routes Automatique** : Navigation simplifiée avec auto_route.
- **Guards de Sécurité** : Protégez les routes avec des conditions (ex. : authentification).
- **Support des Arguments** : Passez des données entre les pages facilement.

---

## 🛠️ Installation et Configuration

### Ajouter les Dépendances
Ajoutez les dépendances nécessaires dans votre fichier `pubspec.yaml` :
```yaml
dependencies:
  auto_route: ^5.0.4

dev_dependencies:
  auto_route_generator: ^5.0.4
  build_runner: ^2.4.6
### Installez-les avec la commande suivante :

flutter pub get

### Configurer le Routeur

    Créez un fichier nommé app_router.dart dans le dossier lib/router/ :
        Déclarez les routes de votre application.
        Ajoutez les guards si nécessaire.

    Exemple de configuration :

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'auth_guard.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: ProfileScreen, guards: [AuthGuard]),
    AutoRoute(page: LoginScreen),
  ],
)
class $AppRouter {}

    Générez le fichier de route avec cette commande :

flutter pub run build_runner build

### Ajouter les Guards

    Créez un fichier auth_guard.dart dans lib/guards/ :

import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // Vérifiez si l'utilisateur est authentifié
    final isAuthenticated = false; // Remplacez par votre logique d'authentification

    if (isAuthenticated) {
      resolver.next();
    } else {
      router.push(LoginRoute()); // Redirigez l'utilisateur vers la page de connexion
    }
  }
}

    Ajoutez les guards aux routes nécessitant une protection.

🏃‍♂️ Utilisation
Naviguer Entre les Pages

Utilisez le routeur généré pour naviguer entre les pages :

context.router.push(ProfileRoute());

Régénérer les Routes

À chaque modification de configuration dans app_router.dart, exécutez :

flutter pub run build_runner build

En cas de conflits :

flutter pub run build_runner build --delete-conflicting-outputs

📂 Structure du Projet

lib/
├── router/
│   ├── app_router.dart       # Déclaration des routes et guards
│   └── app_router.gr.dart    # Fichier généré automatiquement
├── guards/
│   └── auth_guard.dart       # Implémentation des guards
├── screens/
│   ├── home_screen.dart      # Page d'accueil
│   ├── profile_screen.dart   # Page de profil
│   └── login_screen.dart     # Page de connexion
└── main.dart                 # Point d'entrée de l'application

🔄 Commandes Essentielles

    Installer les dépendances :

flutter pub get

Générer les fichiers Auto Route :

flutter pub run build_runner build

Supprimer les fichiers conflictuels et régénérer :

    flutter pub run build_runner build --delete-conflicting-outputs

📖 Documentation Complémentaire

    Documentation officielle Auto Route
    Documentation Flutter

🤝 Contribution

Les contributions sont les bienvenues ! Veuillez ouvrir une issue ou soumettre une pull request.

