import Vue from 'vue'

// https://developer.mozilla.org/ja/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API
try {
  const storage = window['localStorage'],
    x = '__storage_test__';
  storage.setItem(x, x);
  storage.removeItem(x);
  Vue.prototype.$localStorage = localStorage;
}
catch (e) {
  console.log('localStorage is not available');
  const err = e instanceof DOMException && (
    // everything except Firefox
    e.code === 22 ||
    // Firefox
    e.code === 1014 ||
    // test name field too, because code might not be present
    // everything except Firefox
    e.name === 'QuotaExceededError' ||
    // Firefox
    e.name === 'NS_ERROR_DOM_QUOTA_REACHED') &&
  // acknowledge QuotaExceededError only if there's something already stored
  storage.length !== 0;
  console.log(err);
}
