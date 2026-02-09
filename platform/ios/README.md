# iOS (LÖVE runner)

Ce dossier contient uniquement les instructions pour fuser le jeu LÖVE avec le runner iOS.

## Étapes rapides

> `love.xcodeproj` n'est pas versionné dans ce dépôt : il provient du source iOS de LÖVE.
> Pour un flux "one click", il faut que le runner iOS soit déjà présent dans `platform/ios/love/`.

1. Récupère le source iOS de LÖVE et place-le dans `platform/ios/love/`.
2. Ouvre `platform/ios/love/platform/xcode/ios/love.xcodeproj` et sélectionne la target **love-ios**.
3. Génére le bundle du jeu :

   ```bash
   ./scripts/build_love.sh
   ```

4. Dans Xcode, ajoute `build/game.love` à **Build Phases → Copy Bundle Resources**.
5. Configure Signing & Capabilities (Team + Bundle ID unique) puis **Build & Run**.

Le dossier `game/` reste la source de vérité : aucune logique de jeu dans le runner iOS.
