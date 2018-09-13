docker run --rm -v $PWD/:/var/workspace ubuntu-wasm /bin/bash -c 'cargo +nightly build --target wasm32-unknown-unknown --release'
cp target/wasm32-unknown-unknown/release/ncmb.wasm ./
git clone git@github.com:NIFCloud-mbaas/ncmb_js.git
cd ncmb_js
sed -i 's/var sig = crypto/if \(window.wasm_sign\) return window.wasm_sign\(sigStr\);\
  var sig = crypto/' lib/signature.js
npm install
npm run build
cd ..
cp ncmb_js/ncmb.min.js .
