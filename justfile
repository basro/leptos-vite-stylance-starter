default:
  @just --list

dev:
	stylance . --watch & \
	npx vite --clearScreen false & \
	cargo-watch \
	-s 'just _build-wasm dev' \
	-w './src' \
	-i '*.css' -i '*.scss'

build-wasm:
	@just _build-wasm release

build-styles:
	stylance .

build: build-wasm build-styles
	npx vite build

_build-wasm profile:
	wasm-pack build \
		--target web \
		--{{profile}} \
		--out-name client \
		--weak-refs 
