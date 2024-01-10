# Leptos CSR with vite and stylance

This is a cargo-generate template for using Leptos in CSR mode with Vite as bundler and stylance for styles.

**Warning:** This repo is meant to be used with cargo generate only, the repo is sprinkled with cargo generate templating tags like {{package-name}} and thus trying to locally clone this repo without the help of cargo generate wont result in a working project. (You'd have to manually replace the templating tags if you try to do that).

## Why use Vite instead of trunk?
Vite has a few advantages over trunk
* Currently trunk will rebuild the whole pipeline whenever any of the dependencies changes. This makes iteration slow if all you wanted was to edit a css style and see the changes on the browser. With this template's setup cargo-watch is used to rebuild the wasm and then Vite will watch that wasm file for changes.
* Vite is a full fledged javascript bundler and will properly bundle and minify wasm-bindgen js snippets. Trunk currently does not minify or bundle external snippets (they just get copied into the final build as separate files).
* Using vite allows you to use the whole NodeJS ecosystem to make hybrid rust + js applications if you so desire.

Trunk has one important advantage over vite:
* No NodeJS dependency! This pleases the rust gods and simplifies the build process.

## Installation

Install the following cargo tools:
```bash
cargo install cargo-generate wasm-pack cargo-watch just stylance-cli
```

Run cargo generate:
```
cargo generate --git https://github.com/basro/leptos-vite-stylance-starter.git
```

Make sure you have NodeJS installed in your system then run:
```bash
npm install
```
This will install vite and sass locally for this project (as dev dependencies).

## Usage

### Development
During development simply run:
```bash
just dev
```

This will simultaneously run:
* vite in dev mode (which will create a dev server)
* stylance-cli in watch mode
* cargo-watch to rebuild the wasm


### Release
To make a release build run:

```bash
just build
```

which will first build your wasm file, then build styles with stylance-cli and finally use vite to bundle it into the dist folder.
