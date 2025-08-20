'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1ea148f3ce77b646c76aade809cce718",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "5d3cc523a7e5c7aa05b1803a933bfa52",
"/": "5d3cc523a7e5c7aa05b1803a933bfa52",
"main.dart.js": "aeacbc2dec0f2f59b253b95f695ba49f",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "2f0f003e0014749e1ad3b19df1da2342",
"assets/NOTICES": "3ad8398eddd34f08f897063c66516643",
"assets/FontManifest.json": "7a357fba6955e48ac2ce57889fbdfd4f",
"assets/AssetManifest.bin.json": "509feb0ffbd54d585da1879f2c620c66",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "05c56f53bcd98fce65e87191e177f611",
"assets/fonts/MaterialIcons-Regular.otf": "2d4ca35b9032701c4170ff449d41d902",
"assets/assets/cyber/cyber8.png": "3b8ed7c17e4019be98be39ec14186891",
"assets/assets/cyber/cyber9.png": "57520d294c6cc0f6ed3d5fe84ad66bb3",
"assets/assets/cyber/cyber4.png": "7f346ff28340862bdb3e1f2c30cb3b3d",
"assets/assets/cyber/cyber5.png": "3c2a86840295ea77554ccf0d5fb121b0",
"assets/assets/cyber/cyber7.png": "f27f3cb4891b76295769e2cfac95b406",
"assets/assets/cyber/cyber6.png": "e938e8d4ca5103c0bd536c2409877932",
"assets/assets/cyber/cyber2.png": "50c663780c0db84b6baa88dc3c190c79",
"assets/assets/cyber/cyber3.png": "fc4ac907cf93b7fa5b4290eb892455a1",
"assets/assets/cyber/cyber1.png": "fd25ef0f617113ef05259a34ea81d782",
"assets/assets/start/hokkaido2.png": "4c6b4e6689abfc1ef0d0d33d34abdc2a",
"assets/assets/start/hokkaido1.png": "e9252db20d7114f1a6930b5d563ea431",
"assets/assets/start/okinawa2.png": "a9fa99d7a1e081ded8486ef061b66dc5",
"assets/assets/start/okinawa1.png": "bb75564cb12931070dfacc9f199e4f18",
"assets/assets/about_me/pet.png": "8c780e53e814b2fc22c6131a3155779d",
"assets/assets/videos/it_passport_app.mp4": "d561585b2bbb5920bdc342033fcc2bc3",
"assets/assets/videos/cyber.mp4": "219c8350da7ff576e70f37e4379a3d0c",
"assets/assets/au_portfolio/au_portfolio8.png": "74bd809205510d7cafa23d81339099b7",
"assets/assets/au_portfolio/au_portfolio9.png": "36080b59346e3c0e742a7da60e5f3055",
"assets/assets/au_portfolio/au_portfolio1.png": "03139b8add23719843cf3946c70d694c",
"assets/assets/au_portfolio/au_portfolio2.png": "cd1195b341fcfa5d56e548c81a8a73e6",
"assets/assets/au_portfolio/au_portfolio3.png": "6ce9cd362e9cf8e5744e252f428200a3",
"assets/assets/au_portfolio/au_portfolio7.png": "00eba6a424d5ad54d42ec2439e31a9dd",
"assets/assets/au_portfolio/au_portfolio6.png": "6f6a5ebfb426752aa46e13a8772dc343",
"assets/assets/au_portfolio/au_portfolio4.png": "ab094cd939ef1d7b11cb0403e562e781",
"assets/assets/au_portfolio/au_portfolio5.png": "02cf783f84a30259c221a6bffce8be72",
"assets/assets/au_portfolio/au_portfolio10.png": "f194d597b7853791d7e61fbaa267c752",
"assets/assets/au_portfolio/au_portfolio11.png": "490f8faa87d2500000fa69c29363a3e8",
"assets/assets/it_passport_app/it_passport_app4.png": "d3115069afba6d68a0662ba22ff041b2",
"assets/assets/it_passport_app/it_passport_app5.png": "4fe2bdec69549537a5c235ecfe183b53",
"assets/assets/it_passport_app/it_passport_app6.png": "c31c2550a62325bfad0abd9925c1f504",
"assets/assets/it_passport_app/it_passport_app2.png": "21a7401c5507fc57c98e8151329f834c",
"assets/assets/it_passport_app/it_passport_app3.png": "f06061d035ab1b286034487fad5cac10",
"assets/assets/it_passport_app/it_passport_app1.png": "c44560185df2e570d55e22fecd09a13d",
"assets/assets/fonts/static/NotoSansJP-Bold.ttf": "485e5ded4ecbe334b90b239f662c968b",
"assets/assets/fonts/static/NotoSansJP-Regular.ttf": "d7b3c0ac56050de4c152bd8394a16c9a",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
