window.onload = async () => {
  window.exports = {};
  const mod = await fetchAndInstantiate('./ncmb.wasm')
  const exports = mod.exports;
  window.wasm_sign = s => {
    let outptr = exports.to_sign(newString(exports, s));
    return copyCStr(exports, outptr);
  };
};

document.addEventListener('DOMContentLoaded', async (e) => {
  const applicationKey = 'e617bee762e6c0799d20bc3ef45ead1ee87c99276c482a3c5b6b90e013d8a669';
  const ncmb = new NCMB(applicationKey, 'dummy');
  
  document.querySelector('#get').onclick = async (e) => {
    const className = document.querySelector('#className').value;
    const DataStore = ncmb.DataStore(className);
    const ary = await DataStore.fetchAll();
    document.querySelector('#result').value = JSON.stringify(ary);
  }
});