'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c2ace73650e10c09185041d0b50b9b35",
"assets/assets/fonts/Pacifico-Regular.ttf": "85bb2d0ec4a0da159de42e89089ccc0b",
"assets/assets/images/background.jpg": "9e77c8e9e2dccba70cd73c8cfb59dca4",
"assets/assets/images/cover/50_sfumature_di_grigio.jpg": "7f67140ff93b8f7a15e35d88073ae05e",
"assets/assets/images/cover/50_sfumature_di_nero.jpg": "ed295d9908a42745dcffe52da0e64ae4",
"assets/assets/images/cover/50_sfumature_di_rosso.jpg": "1e36b2f45f2b62df9132846531dfdedf",
"assets/assets/images/cover/Assassinio_sull'Orient_Express.jpg": "485d03b5ef2c23cf38de68b6943a7034",
"assets/assets/images/cover/Billy_Budd.jpg": "382c70e01640fcaff70347cb00e6aa40",
"assets/assets/images/cover/Fuoco_e_sangue.jpg": "32041d61b4e1dbe8908e6a11332db1de",
"assets/assets/images/cover/Harry_Potter_e_il_Calice_di_Fuoco.jpg": "af1a2c7b8d55bc5d5f503beaa3ba30fd",
"assets/assets/images/cover/Harry_Potter_e_il_prigioniero_di_Azkaban.jpg": "c0900af6dd9a3419d98e770b07c013ec",
"assets/assets/images/cover/Harry_Potter_e_il_principe_Mezzosangue.jpg": "6365cfafb9de57b0e879e575b8e562a3",
"assets/assets/images/cover/Harry_Potter_e_i_Doni_della_Morte.jpg": "1c716d6e3f984a489986783b6087bf57",
"assets/assets/images/cover/Harry_Potter_e_l'Ordine_della_Fenice.jpg": "5d5a17482fea5719bbbfe4afba28a49b",
"assets/assets/images/cover/Harry_Potter_e_la_Camera_dei_Segreti.jpg": "69ddbfee0751824b1741a520ac3889ea",
"assets/assets/images/cover/Harry_Potter_e_la_Pietra_Filosofale.jpg": "e185e8bd3ebb579f1a7afcc70657bbf4",
"assets/assets/images/cover/Il_giro_del_mondo_in_80_giorni.jpg": "13a22cd5f78c62716223f1482617637f",
"assets/assets/images/cover/Il_nome_della_rosa.jpg": "dd54d18aab571fbf530ff7e315ca64e6",
"assets/assets/images/cover/Il_piccolo_Principe.jpg": "f705394e80e10f0a873ad357b57de57a",
"assets/assets/images/cover/Il_ritorno_del_Re.jpg": "25229287a94fa08649e374b7edd734cf",
"assets/assets/images/cover/Io,_Nelson_Mandela.jpg": "9ce97fcf987e1c5e203ca40dffeb5de4",
"assets/assets/images/cover/Io_sono_Malala.jpg": "d34538121b9d0e022b0390e8d88ba588",
"assets/assets/images/cover/IT.jpg": "ad47790cc041af45d7fb097c43accf5b",
"assets/assets/images/cover/L'altra_verita.jpg": "99dfd23a848d7975928db66f5583c3b6",
"assets/assets/images/cover/L'ascesa_del_drago.jpg": "125675d178d28bdbb57abc2bd8e87b43",
"assets/assets/images/cover/L'isola_misteriosa.jpg": "9f49cadf47f32b8cba4e7dc737c94bce",
"assets/assets/images/cover/La_compagnia_dell'anello.jpg": "bb18747d3ae479cc71d43b982e3a0a45",
"assets/assets/images/cover/La_serie_infernale.jpg": "419921cc24427af9140e1a1e7a26887d",
"assets/assets/images/cover/Lettere_dal_carcere.jpg": "c41bc4831c2e5862b59f70709c8e97f7",
"assets/assets/images/cover/Le_due_torri.jpg": "26f19ac4d61f99f60439395063096021",
"assets/assets/images/cover/Lo_Hobbit.jpg": "4964619e8ab0665035a9880dfd56b568",
"assets/assets/images/cover/Lungo_cammino_verso_la_liberta.jpg": "2d8f297c1792eeb94bdedbedd22b8951",
"assets/assets/images/cover/Moby_Dick.jpg": "39bbaa063f7df70bf95dba6528f8ef8d",
"assets/assets/images/cover/Storia_delle_tenebre_e_dei_luoghi_leggendari.jpg": "7fe6f532a184379f0e9817737a59ea7d",
"assets/assets/images/cover/Taipi.jpg": "c802397f678e105783c753704764557c",
"assets/assets/images/cover/Terra_degli_uomini.jpg": "aa06b0907b554301fa8d05d6f62a6bfb",
"assets/assets/images/cover/The_Outsider.jpg": "3752cf64f20a5156db625a27fef05c00",
"assets/assets/images/cover/The_Shining.jpg": "d6ac2c165bdbd27c06c572f0396e87ed",
"assets/assets/images/cover/Una_persona_alla_volta.jpg": "499f9979129c88a98f5667d2e054fa27",
"assets/assets/images/cover/Una_terra_promessa.jpg": "e17aff33905179f1661f15faf7a0db99",
"assets/assets/images/cover/Uno_scontro_di_Re.jpg": "6d55774ba77e889ca53a3d814aef16ae",
"assets/assets/images/cover/Ventimila_leghe_sotto_i_mari.jpg": "6c03fd2d8635f65037c7db0463feff29",
"assets/assets/images/cover/Volo_di_notte.jpg": "4df0a06b12be519d5af564bc29cc4f29",
"assets/assets/images/logo.png": "f26b09ac0e593ad3ca537bc9700762c4",
"assets/assets/images/reviews/2017_02_cinquanta_sfumature_nero_locandina.jpg": "3fb3fcf6b4a8aace80c190b39e3eb6d5",
"assets/assets/images/reviews/50sfumatureNero.jpeg": "b141402539ca698e29c8cb3cc565b903",
"assets/assets/images/reviews/art-books-1.jpg": "f4de91770514301e847fafa60d37fbdd",
"assets/assets/images/reviews/assassinio-sullorient-express-trama.jpg": "da9a58056aa6e282df28fbf52008ce42",
"assets/assets/images/reviews/Assassinio_sull_Orient_Express_IMAGE.jpg": "484ec415de478df4deff09b9177c1eef",
"assets/assets/images/reviews/GenericBook.jpg": "806de369a29583edfbdb81330010cc86",
"assets/assets/images/reviews/la-serie-infernale-libro.jpg": "b341222a4b0555c0da96c6169cbf9a2b",
"assets/assets/images/reviews/OrientExpressMovie.jpg": "f141c70669ced432341fc8668e81ad11",
"assets/assets/images/reviews/ReadingBook.jpeg": "29566e324732d5e7f71171972aaadf56",
"assets/assets/images/reviews/serieInfernaleIMAGE.jpg": "e7c8ad6e95d03666bdf5d0354e0f60f5",
"assets/FontManifest.json": "848dcd580c80116c346cbe0ab9f89c2f",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "1715924bb55eb81dbfa14ec3e2b6d275",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "880d21ed54c51603e17bfbd98f9d21e8",
"/": "880d21ed54c51603e17bfbd98f9d21e8",
"main.dart.js": "c97a0ee87839488150e7eba31a0c9cb9",
"manifest.json": "45435c20212fde7f9867279222bfc3bf",
"version.json": "972a7faa7b69f0c686eb55529131f498"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
