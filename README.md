# Create singnarete on WebAssembly for NCMB (Nifcloud mobile backend)

## Dependence

- Rust
- Cargo

# Usage

Edit src/lib.rs

```
// Change to your client key
let key = "YOUR_CLIENT_KEY";
```

Build it

```
$ make all
```

Generate ncmb.wasm.

## Special thanks!

[String to uppercase](https://arkada38.github.io/2017/12/04/rust-wasm-string-to-uppercase/)

## License

MIT