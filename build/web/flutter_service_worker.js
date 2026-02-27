'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5d5df475ce8f00c91ee3fdcdc1dfa49f",
"assets/AssetManifest.bin.json": "631ef57d52160a6c09e3077f502e1d42",
"assets/AssetManifest.json": "5223dbf6fcb1fdcb062266d5df5ea179",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c681bd5cedd2bf5a3514e8a2ecb7d337",
"assets/images/9mobile.png": "875ce2e297c90a1649d64098fb4e2f60",
"assets/images/airtel.png": "5797f6ec9017920eb08f81ebf002a9d7",
"assets/images/bank.png": "4d3dfec069c7ac1f4d03179bac44d092",
"assets/images/bet.png": "e0211800cc6c24978c627e0195f03d8a",
"assets/images/call.png": "5f0ab9890678fc1ec52a23fdbabfa756",
"assets/images/certi.svg": "527943af020e0fe5be921c5ba8930e41",
"assets/images/chat.jpg": "49fdb0f8c6be40b6c737c385ac194522",
"assets/images/coin.png": "9df1c83fb3bc1adad87a531f0a4caff2",
"assets/images/con1.jpg": "308501c2709c0592885bc274bfb7263b",
"assets/images/con2.jpg": "87d3619cc149c2787cb5bd2b933906cf",
"assets/images/data.png": "3cc764d07b057356953e651e185bb19a",
"assets/images/download.png": "6c972e33015f078e0d67d82c54f2d62d",
"assets/images/email.png": "dca334bc4fcc56ccd8a25d611c118482",
"assets/images/flag.png": "d32448ad93e1ea981723b710c1583e95",
"assets/images/glo.png": "f80e44c764d91aa2b5944f0bb7fe0b43",
"assets/images/happy.jpg": "86fe5d95eaed88c7bd29363577452d80",
"assets/images/key.png": "18221cf13def0bea3f2ebde1eda56bd2",
"assets/images/light.png": "c8920b05420a12e09a2760bd03b973e0",
"assets/images/logo.png": "e05239a1118e192ae3527e434902f0d4",
"assets/images/monify.png": "ccfe6859dbe21635ee44ffdd9398e3cc",
"assets/images/niyu.jpg": "14d4a75312eae5dea5e323418dbe30fc",
"assets/images/pass.png": "0c08149f7227de43ece7dd8e96bdda9f",
"assets/images/paystack.png": "f707196184fdb04c8f6c37e7a8d5512f",
"assets/images/phone.png": "ceb3a62f351458b77982c740e9f6db7b",
"assets/images/pin.png": "71e9683bcc46f756fbe06995548fe2ba",
"assets/images/print.png": "2ede8dcb864fcc0bfdc597dc63941a68",
"assets/images/shoe.svg": "52a249c26c7393541ca320ce43b4a537",
"assets/images/sum.png": "b297a0f10e367b65e80b10a07cdf94e0",
"assets/images/transac.png": "32328a64dbb883718ff87812d71fd03e",
"assets/images/tv.png": "c7777dbeb371da54b71785fa8b4bc93b",
"assets/images/user.png": "6bc5b0990fe41dadf4b79e802c9c0420",
"assets/images/util.png": "caf7d916f53bb4e02da0af5b4192d470",
"assets/images/wallet.png": "bac050a97766e4bf1b838e1aa23912b7",
"assets/images/wifi.png": "653691c640a97e03ebb501bbbb185914",
"assets/NOTICES": "1b4f586e0ab1028d08ff99715503fcc2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "b7b81a50b249654e1a3366ba000c9a51",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a6154007362ade84e684df902d98ef4e",
"/": "a6154007362ade84e684df902d98ef4e",
"main.dart.js": "d8180377ba029bdb95a771093d0a8390",
"manifest.json": "08a5e01c0e247dcea4ea6b3d552b8545",
"version.json": "1e89c58673ec7568c5bdca951c6abf9c"};
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
