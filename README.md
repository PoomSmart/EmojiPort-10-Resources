# EmojiPort Resources (iOS 10+)

Resource package that ships the latest emoji metadata and keyword search index files from a recent iOS version to devices running iOS 10 and later. It enables older devices to recognize and display newer emoji through the [EmojiPort](https://poomsmart.github.io/repo/) tweak family.

## Packages

The project is split into three DEBs so the correct trie format is installed for each iOS version:

| Package | Firmware | Contents |
|---------|----------|----------|
| `com.ps.emojiport10resources` | ≥ 10.0 | Emoji metadata (`emojimeta_*.dat`), character images (`emoji2.dat`), monochrome symbols, string tables, plist assets |
| `com.ps.emojiport10resources-assets17` | ≥ 17.0 | Marisa LOUDS trie keyword index files (`*2.dat`) |
| `com.ps.emojiport10resources-assets16` | < 17.0 | CFBurstTrie keyword index files (`*_16.dat`) |

The main package depends on exactly one of the two assets packages. The assets packages conflict with each other so only one is installed at a time.

## Building

Requires [Theos](https://theos.dev). Run `build.sh` from the project root to produce all DEBs in `packages/`:

```bash
./build.sh
```

## Updating assets

Keyword search index files are converted from `CoreEmoji.framework` using the [emoji-meta-reader](../emoji-meta-reader) tool. Its `generator.sh` reads the trie `.dat` files from a CoreEmoji.framework path (e.g. an iOS simulator), converts them to both Marisa (`*2.dat`) and CFBurstTrie (`*_16.dat`) formats, and writes the results directly into the `assets-17/` and `assets-16/` layout trees.

```bash
../emoji-meta-reader/generator.sh /path/to/CoreEmoji.framework
```
