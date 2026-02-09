# iOS (LÖVE runner)

Ce dossier contient uniquement les instructions pour fuser le jeu LÖVE avec le runner iOS.

## Étapes rapides

> `love.xcodeproj` n'est pas versionné dans ce dépôt : il provient du source iOS de LÖVE.
> Le script ci-dessous le récupère pour un setup "one click".

1. Récupère le source iOS de LÖVE et ses dépendances Apple/iOS.
   ```bash
   ./scripts/setup_ios.sh
   ```
2. Ouvre `platform/ios/love/platform/xcode/ios/love.xcodeproj` et sélectionne la target **love-ios**.
4. Génére le bundle du jeu :

   ```bash
   ./scripts/build_love.sh
   ```

4. Dans Xcode, ajoute `build/game.love` à **Build Phases → Copy Bundle Resources**.
5. Configure Signing & Capabilities (Team + Bundle ID unique) puis **Build & Run**.

Le dossier `game/` reste la source de vérité : aucune logique de jeu dans le runner iOS.
