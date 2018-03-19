rustc +nightly --target wasm32-unknown-unknown src/main.rs --crate-type cdylib -o build/main.big.wasm \
      -L 'dependency=/Volumes/SD/Dropbox (MOONGIFT)/moongift-team/DevRel/niftycloud_mb/wasm/ncmb/target/wasm32-unknown-unknown/debug/deps' \
      --extern 'sha2=/Volumes/SD/Dropbox (MOONGIFT)/moongift-team/DevRel/niftycloud_mb/wasm/ncmb/target/wasm32-unknown-unknown/debug/deps/libsha2-31a2a575a333a920.rlib' \
      --extern 'hmac=/Volumes/SD/Dropbox (MOONGIFT)/moongift-team/DevRel/niftycloud_mb/wasm/ncmb/target/wasm32-unknown-unknown/debug/deps/libhmac-5822f0c9a5ffae5c.rlib' \
      --extern 'base64=/Volumes/SD/Dropbox (MOONGIFT)/moongift-team/DevRel/niftycloud_mb/wasm/ncmb/target/wasm32-unknown-unknown/debug/deps/libbase64-6d13b8204a11944e.rlib'
