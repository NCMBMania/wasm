all:
	cargo +nightly build --target wasm32-unknown-unknown --release
	cp target/wasm32-unknown-unknown/release/ncmb.wasm ./
clean:
	rm -Rf ./target