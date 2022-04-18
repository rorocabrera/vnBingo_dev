'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "64c189e3a799d0818e62682f9a6efdb7",
"assets/assets/audio/1.mp3": "dba012436fdf8bb181d0cb5e46de6fa3",
"assets/assets/audio/10.mp3": "d6ff58f8d738b598cc9bd6d7491e40a9",
"assets/assets/audio/11.mp3": "059adef5c329a33b02150ce354acee16",
"assets/assets/audio/12.mp3": "248e0c027c02bd635fe3cbf3400a2737",
"assets/assets/audio/13.mp3": "1c98c5f4fbdc4457c2bc20ab7d463916",
"assets/assets/audio/14.mp3": "8d92064bfcd34fb56e6abd31c7176104",
"assets/assets/audio/15.mp3": "b365b0c08164c467afd88e5271b808e6",
"assets/assets/audio/16.mp3": "ec599f9776fb036d63b65f57fad1cd4b",
"assets/assets/audio/17.mp3": "c0b43af45a1d2fee028f4c4e3d94fdc9",
"assets/assets/audio/18.mp3": "205bc64ac1c6b649b34a6d7725e7f9b2",
"assets/assets/audio/19.mp3": "5af7a24dfbbe3b7842ca8f326ea76579",
"assets/assets/audio/2.mp3": "342af45a4c75c63df8a11fd1ab4c0420",
"assets/assets/audio/20.mp3": "2ac78a1f2f93d4c4f3abfead69429f57",
"assets/assets/audio/21.mp3": "997f54c47d96cbdb27f7c90e104e516b",
"assets/assets/audio/22.mp3": "dd153fb90866ed0fb003e6100b026e93",
"assets/assets/audio/23.mp3": "c68c8d5b66b1bb2b2be851c4303bf931",
"assets/assets/audio/24.mp3": "7d31e531b29ff66cbc8bbf9b74191095",
"assets/assets/audio/25.mp3": "5269e5e892fa0a67de348a8d5dd66643",
"assets/assets/audio/26.mp3": "8293076ca251acbf6fde0e2c7baf278c",
"assets/assets/audio/27.mp3": "933e97383d7de33ee119abbe7fe6b0f7",
"assets/assets/audio/28.mp3": "cfa7a02a4a5bd77956ac0b1f390b77a2",
"assets/assets/audio/29.mp3": "ad9f88237e7e8da33fe4f027bd3ca337",
"assets/assets/audio/3.mp3": "1c891ea6d4f0941ad32ab5f3fb806b60",
"assets/assets/audio/30.mp3": "12112eb5fbf2d66dbb1fc761d8e601a3",
"assets/assets/audio/31.mp3": "42e18692f8560dca67b93f33526cd962",
"assets/assets/audio/32.mp3": "5d5cb8eb6fbe4de07f3552b7a9db2ca1",
"assets/assets/audio/33.mp3": "4ef2d2397b5eeeb4a2f45ac9547e1d74",
"assets/assets/audio/34.mp3": "7535f99dd7ef0053890eb34162e9cb5e",
"assets/assets/audio/35.mp3": "2ff889cb2ce0b709646de7c4bcf584f2",
"assets/assets/audio/36.mp3": "3bc6e1c54034e91745ea974a8df9257d",
"assets/assets/audio/37.mp3": "40cf93a051c678f0bd4d5281d4c9d26a",
"assets/assets/audio/38.mp3": "ab4287455a630a77fe60317c7a5b8718",
"assets/assets/audio/39.mp3": "ae544ed98d12b2ba429c93da92ba9656",
"assets/assets/audio/4.mp3": "30e016c09209b79f0cd82089b09d8421",
"assets/assets/audio/40.mp3": "02ebc60c9961f4cf55b865286a046ed2",
"assets/assets/audio/41.mp3": "aa13cf3b2771211fce4e74f73ce8568a",
"assets/assets/audio/42.mp3": "5cfccd9cbfaf4a12b1088adbe0e9ad6f",
"assets/assets/audio/43.mp3": "140c1e44674fd1cc832a5864dd67087e",
"assets/assets/audio/44.mp3": "5cd875fb958296f0ce39940a8e64da6c",
"assets/assets/audio/45.mp3": "c6334cff394ae6153d7f3e8e811e7317",
"assets/assets/audio/46.mp3": "be4c954c351a04db3b143c76001d5d11",
"assets/assets/audio/47.mp3": "c6ed4017362c76d8baf918a90f7dc5ae",
"assets/assets/audio/48.mp3": "fec367d6373a69fd8e64346f1d86d882",
"assets/assets/audio/49.mp3": "b62d6878784dea93f2a2fa156dfa602a",
"assets/assets/audio/5.mp3": "03cba75ee588602f644527e6664e6a54",
"assets/assets/audio/50.mp3": "dcad944954702d64a1185ad8b44ed425",
"assets/assets/audio/51.mp3": "107e583df015729979c56838f4b40264",
"assets/assets/audio/52.mp3": "16be5596f2ddd5af32bc4d08ce47cf92",
"assets/assets/audio/53.mp3": "db6e7bc8badbe8caeecb3e8926453795",
"assets/assets/audio/54.mp3": "66a471258ac0163a6cce0726ea3c2478",
"assets/assets/audio/55.mp3": "ddd4d710231c0e29585eb0cd8999a301",
"assets/assets/audio/56.mp3": "8de429a65055ecc0b9dd367499f3436e",
"assets/assets/audio/57.mp3": "07970d68dcaeccf0c25ee56cd24f10cd",
"assets/assets/audio/58.mp3": "2dd928d8eed627cd5a6a8fffb03c0c32",
"assets/assets/audio/59.mp3": "92f9cf3422d24b09fa8ab27fdf35b5dc",
"assets/assets/audio/6.mp3": "56e7c188cd6ebd0131fec99f1f1194a0",
"assets/assets/audio/60.mp3": "32054e839a986932b6f8c04bfcb1f2f6",
"assets/assets/audio/61.mp3": "ce17e182724159ba26ed665a98c96392",
"assets/assets/audio/62.mp3": "d9653796a939228c6a46c39036e44587",
"assets/assets/audio/63.mp3": "2ba6240d95daf8da447a615599734d72",
"assets/assets/audio/64.mp3": "e96856cdede9a0bc8de0ecfa08ea9ca2",
"assets/assets/audio/65.mp3": "19ed4da20c2f4eed823e6ff43bd16694",
"assets/assets/audio/66.mp3": "0369235790adce8c53afb917ce7a335d",
"assets/assets/audio/67.mp3": "de1aedb2defd59ad989dac9612d45735",
"assets/assets/audio/68.mp3": "6237ce5f73c6bd93515eaf304f819b6b",
"assets/assets/audio/69.mp3": "a2579860c73537cc33140cbbf9064abc",
"assets/assets/audio/7.mp3": "7c764d6347d5f5bd16bcfa8874a996aa",
"assets/assets/audio/70.mp3": "a4e86c6e77414866bb37e54801ed67f7",
"assets/assets/audio/71.mp3": "5179a0ce0479c87aecb09bdf5997d659",
"assets/assets/audio/72.mp3": "41c342f4db1160e73aa29b3aa0a4ee3a",
"assets/assets/audio/73.mp3": "f0e34b82a6c8454761e5378c10a646da",
"assets/assets/audio/74.mp3": "57b701f1299b66d1913866f4f89412ed",
"assets/assets/audio/75.mp3": "747b83b6e5a3c3fdacbe3e12e11a5a0b",
"assets/assets/audio/8.mp3": "573739cd50dd48e55f0c9b873a1a13e9",
"assets/assets/audio/9.mp3": "18e690d8c67e8e7a0bcafe36ac44e666",
"assets/assets/vnbingo_logo_1.svg": "56f15a284d394bc82c9186de172ed7a9",
"assets/assets/vnbingo_logo_2.svg": "58430b99b9edb0d49ee35355b8d853b7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "61fc65bfa61ff62ade806ce456882857",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1f4ad44ce84bf1c70469db2bd29309e9",
"/": "1f4ad44ce84bf1c70469db2bd29309e9",
"main.dart.js": "59a2852e9974d0aded20b04f132201b3",
"manifest.json": "57874d9867ab92a8178c17fb3930e5ee",
"version.json": "fe0a7682b022fa097b987b0f3587b538"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
