# MiniRPG — Rebuild (LÖVE + multi-plateforme + iOS)

## Structure recommandée

- `game/` : source de vérité (LÖVE)
- `build/` : artifacts (ex: `game.love`)
- `platform/ios/` : runner iOS + Xcode

## Build desktop (dev)

```bash
love game
```

## Build du bundle `game.love`

```bash
./scripts/build_love.sh
```

## iOS (Xcode)

> `love.xcodeproj` n'est pas dans ce dépôt : il est fourni par le source iOS de LÖVE.

1. Récupère le source iOS de LÖVE + les libs Apple/iOS correspondantes.
2. Place le source dans `platform/ios/love/`.
3. Ouvre `platform/ios/love/platform/xcode/ios/love.xcodeproj` → target **love-ios**.
4. Ajoute `build/game.love` dans **Copy Bundle Resources**.
5. Configure Signing & Capabilities (Team + Bundle ID unique).
6. Build & Run (iPhone ou Simulator).
