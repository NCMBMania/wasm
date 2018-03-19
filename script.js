window.onload = function() {
    window.exports = {};

    let a = document.querySelector('#a'),
        b = document.querySelector('#b');

    fetchAndInstantiate('./ncmb.wasm')
    .then(mod => {
        exports = mod.exports;

        let to_sign = s => {
          let outptr = exports.to_sign(newString(exports, s));
          return copyCStr(exports, outptr);
        };

        a.oninput = () =>
            b.value = to_sign(a.value);
    });
};