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

1. Récupère le source iOS de LÖVE + les libs Apple/iOS correspondantes.
2. Ouvre `love.xcodeproj` → target **love-ios**.
3. Ajoute `build/game.love` dans **Copy Bundle Resources**.
4. Configure Signing & Capabilities (Team + Bundle ID unique).
5. Build & Run (iPhone ou Simulator).
