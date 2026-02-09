# iOS (LÖVE runner)

Ce dossier contient uniquement les instructions pour fuser le jeu LÖVE avec le runner iOS.

## Étapes rapides

1. Récupère le source iOS de LÖVE et ses dépendances Apple/iOS.
2. Place le source LÖVE dans `platform/ios/love/` (ou un autre chemin stable).
3. Ouvre `love.xcodeproj` et sélectionne la target **love-ios**.
4. Génére le bundle du jeu :

   ```bash
   ./scripts/build_love.sh
   ```

5. Dans Xcode, ajoute `build/game.love` à **Build Phases → Copy Bundle Resources**.
6. Configure Signing & Capabilities (Team + Bundle ID unique) puis **Build & Run**.

Le dossier `game/` reste la source de vérité : aucune logique de jeu dans le runner iOS.
