'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "3b87efbef95234194a2fbf9662bee323",
"index.html": "904ea9b053e41df051c060f7aa05b6bf",
"/": "904ea9b053e41df051c060f7aa05b6bf",
"main.dart.js": "6fa3c11eb37fcbf833982e1fad24ea3e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "739e6b292190a6c5908ec874c7d27620",
"assets/AssetManifest.json": "e07399e95cf2ec138295b82b0d5c1f3d",
"assets/NOTICES": "7b3a57a5b75ddbc118150149799f62bb",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/digital_project_manager/assets/images/smoke_explosin.png": "555a8a42b72e662af232dc2092103c2a",
"assets/packages/digital_project_manager/assets/images/tiled/mapa2.json": "5c02d815bdf167ec434020c6f9086fad",
"assets/packages/digital_project_manager/assets/images/tiled/0x72_DungeonTilesetII_v1.json": "a1cd7db6274a5d4642dba0953b030c0a",
"assets/packages/digital_project_manager/assets/images/tiled/mapa1.json": "427f3e5bb814426d25bf400778476ed7",
"assets/packages/digital_project_manager/assets/images/tiled/0x72_DungeonTilesetII_v1.3.png": "e569500a4e5ee213c821388a51c08765",
"assets/packages/digital_project_manager/assets/images/joystick_background.png": "8c9aa78348b48e03f06bb97f74b819c9",
"assets/packages/digital_project_manager/assets/images/joystick_atack.png": "0f5325cb2ddcba703e4c9d7d2dd266df",
"assets/packages/digital_project_manager/assets/images/health_ui.png": "219e39516312f2f6bc264357497b99cb",
"assets/packages/digital_project_manager/assets/images/tile/floor_2.png": "10968e74b671f14aab19e13a76da334d",
"assets/packages/digital_project_manager/assets/images/tile/floor_3.png": "3fa52d5af2a38dede0142f5c3dcaab55",
"assets/packages/digital_project_manager/assets/images/tile/floor_1.png": "00c3bd0c3d76a954f3f0a648cb13c3b3",
"assets/packages/digital_project_manager/assets/images/tile/wall_top.png": "845ed35ef1482e21857c8bd70061c810",
"assets/packages/digital_project_manager/assets/images/tile/wall_left_and_top.png": "5e7c81163a737dad7ed4a626d76a0b73",
"assets/packages/digital_project_manager/assets/images/tile/floor_4.png": "2685b25c2471a762ff6f900b496c9e29",
"assets/packages/digital_project_manager/assets/images/tile/floor_5.png": "6d63b1d77dcc35d4f7beb91125851e29",
"assets/packages/digital_project_manager/assets/images/tile/floor_7.png": "7ba4503a62a1b242f05b5244e7b0dae4",
"assets/packages/digital_project_manager/assets/images/tile/floor_6.png": "d464c18724611d109498d4c4e57316c4",
"assets/packages/digital_project_manager/assets/images/tile/wall_left_and_bottom.png": "6583c02205abb0c84aef143379eb9bed",
"assets/packages/digital_project_manager/assets/images/tile/wall_bottom.png": "31d2b04aca916c16bd31574d7134a853",
"assets/packages/digital_project_manager/assets/images/tile/floor_10.png": "baf86a2272c83bd904bc25b4af03aa29",
"assets/packages/digital_project_manager/assets/images/tile/wall_turn_left_top.png": "c9d8c9116dd5570fb87b6e1328cb0ee3",
"assets/packages/digital_project_manager/assets/images/tile/wall_right.png": "aca869be30facbfd420754e870a78f58",
"assets/packages/digital_project_manager/assets/images/tile/wall_right_and_bottom.png": "533d830adf7d86b810481118ed7aa2f9",
"assets/packages/digital_project_manager/assets/images/tile/wall.png": "7a6ce85ad0ebd6694dd57e9fdca7535b",
"assets/packages/digital_project_manager/assets/images/tile/wall_bottom_left.png": "7e83621a422ddd0e7b4425abe8ac3ec8",
"assets/packages/digital_project_manager/assets/images/tile/wall_top_inner_right.png": "b26bd1cad50d0201d41ab18200976cfc",
"assets/packages/digital_project_manager/assets/images/tile/wall_top_inner_left.png": "484e3c33e8559ff61f560e5f32791c5a",
"assets/packages/digital_project_manager/assets/images/tile/wall_left.png": "b4ee6ba9d296a18fa532119ef8cb6157",
"assets/packages/digital_project_manager/assets/images/tile/floor_8.png": "28692ad0c494efc5bc0f9669579006fe",
"assets/packages/digital_project_manager/assets/images/tile/floor_9.png": "2b4e26d91d8f632bf4eaa5400cb7d748",
"assets/packages/digital_project_manager/assets/images/tile/wall_bottom_right.png": "dd6772364441f0f2ea76c532fb4031dc",
"assets/packages/digital_project_manager/assets/images/enemy/goblin_run_right.png": "565c2f9a0bb01a9c56975664f8cd375c",
"assets/packages/digital_project_manager/assets/images/enemy/atack_effect_top.png": "df3eeb246450bf06de6dfc325d0bdbd0",
"assets/packages/digital_project_manager/assets/images/enemy/atack_effect_left.png": "9c99ad913fcc75ce253f8db53faa846f",
"assets/packages/digital_project_manager/assets/images/enemy/goblin_run_left.png": "05863189b562610b17a062114c7849a9",
"assets/packages/digital_project_manager/assets/images/enemy/atack_effect_bottom.png": "aaeb1a8e791a0f15ba911e1d2540ab32",
"assets/packages/digital_project_manager/assets/images/enemy/atack_effect_right.png": "15831f9ccee22a845e854ccb3d18f6e5",
"assets/packages/digital_project_manager/assets/images/enemy/goblin_idle.png": "8c97e935786b994c3cff4008212381b9",
"assets/packages/digital_project_manager/assets/images/enemy/goblin_idle_left.png": "a7563675f85ed259b2d0aae50ded196b",
"assets/packages/digital_project_manager/assets/images/itens/potion_life.png": "825b71a3532854e849d512683dba06b0",
"assets/packages/digital_project_manager/assets/images/itens/flag_red.png": "6aca7b9e01f86f1b1a45e262e65821b8",
"assets/packages/digital_project_manager/assets/images/itens/torch_spritesheet.png": "858f57abd642f0303de50d719532f198",
"assets/packages/digital_project_manager/assets/images/itens/spikes.png": "8ee92dd121da5fc50964a6a68e3e262c",
"assets/packages/digital_project_manager/assets/images/itens/chest_spritesheet.png": "bcc8785d27d816e23eca114dd4e708ed",
"assets/packages/digital_project_manager/assets/images/itens/prisoner.png": "45dcdd9a419bcd1f39cfd78024865578",
"assets/packages/digital_project_manager/assets/images/itens/column.png": "2ccdc666f36fef12bb99345d4c6c9d66",
"assets/packages/digital_project_manager/assets/images/itens/table.png": "5e22fb237c60943f46ba18d5e176c10c",
"assets/packages/digital_project_manager/assets/images/itens/barrel.png": "dc4d5a9e456b6f1c6ec6fdcc66af7727",
"assets/packages/digital_project_manager/assets/images/itens/bookshelf.png": "ce2fc17cb8251da9966a3e91bb0b2272",
"assets/packages/digital_project_manager/assets/images/itens/flag_green.png": "1a5a7df4b10a84b0a722b3b6600198dd",
"assets/packages/digital_project_manager/assets/images/blue_button2.png": "b2ac54312d3b566d324f461aa50b8f5b",
"assets/packages/digital_project_manager/assets/images/blue_button1.png": "c5ac9ffc08055cdbb731e6bfb0d2593a",
"assets/packages/digital_project_manager/assets/images/joystick_atack_range.png": "8994f23fc67442c8361432f0cc9a2fa1",
"assets/packages/digital_project_manager/assets/images/joystick_knob.png": "bb0811554c35e7d74df6d80fb5ff5cd5",
"assets/packages/digital_project_manager/assets/images/direction_attack.png": "04fa54924d587beff5005965f2caa4b8",
"assets/packages/digital_project_manager/assets/images/player/knight_idle_left.png": "e4ddca181210b0cf9555331aaf2af512",
"assets/packages/digital_project_manager/assets/images/player/fireball_top.png": "e9a76f3ea950d6bc22f8f4cd3a22d7e3",
"assets/packages/digital_project_manager/assets/images/player/knight_run_left.png": "ce9f3ad71135b459f6b66c892b5b9e30",
"assets/packages/digital_project_manager/assets/images/player/explosion_fire.png": "81a3691935a18a30572870b759ad1683",
"assets/packages/digital_project_manager/assets/images/player/atack_effect_top.png": "7b01845d595c3803a07567ee87710658",
"assets/packages/digital_project_manager/assets/images/player/atack_effect_left.png": "5b5475da758d76f79c34429f70f7f6af",
"assets/packages/digital_project_manager/assets/images/player/atack_effect_bottom.png": "e2406062be291971a034123fdd1757f9",
"assets/packages/digital_project_manager/assets/images/player/fireball_right.png": "aaa2c18fe241c16e95be131619693b80",
"assets/packages/digital_project_manager/assets/images/player/fireball_left.png": "cb3370c9039ec112af7bee6edf3e342d",
"assets/packages/digital_project_manager/assets/images/player/atack_effect_right.png": "39b3d8583205c90284cd60f0e018f29d",
"assets/packages/digital_project_manager/assets/images/player/knight_run.png": "9cac5c91f943ba81915573bd93060d4d",
"assets/packages/digital_project_manager/assets/images/player/crypt.png": "8e55febc1e2563a9d7ba4b48625ba88d",
"assets/packages/digital_project_manager/assets/images/player/knight_idle.png": "191737282656dd3c8851a2dd3dfc1c0c",
"assets/packages/digital_project_manager/assets/images/player/emote_exclamacao.png": "8b1897ae92f3a077e0aadaef2626d65a",
"assets/packages/digital_project_manager/assets/images/player/fireball_bottom.png": "05522f950d8d60e15615ee9705ff2ef0",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/back_control.jpg": "af0ddc1f3ff2f41e1a2c00e0d155c89e",
"assets/assets/images/smoke_explosin.png": "555a8a42b72e662af232dc2092103c2a",
"assets/assets/images/tiled/mapa2.json": "5c02d815bdf167ec434020c6f9086fad",
"assets/assets/images/tiled/0x72_DungeonTilesetII_v1.json": "a1cd7db6274a5d4642dba0953b030c0a",
"assets/assets/images/tiled/mapa1.json": "427f3e5bb814426d25bf400778476ed7",
"assets/assets/images/tiled/0x72_DungeonTilesetII_v1.3.png": "e569500a4e5ee213c821388a51c08765",
"assets/assets/images/controller.png": "785d11a95e6a2bd9d06e6bfa643816f2",
"assets/assets/images/joystick_background.png": "8c9aa78348b48e03f06bb97f74b819c9",
"assets/assets/images/esport.jpg": "14e825b575ff7e314a23c35d82693825",
"assets/assets/images/control.jpg": "3b15663752b2cfd768a7ef62204f560e",
"assets/assets/images/control.png": "634611fc92d72e9015de46b8ddd3a446",
"assets/assets/images/joystick_atack.png": "0f5325cb2ddcba703e4c9d7d2dd266df",
"assets/assets/images/geralt.jpg": "0e9e401ac190532caf55d6d679f28c5f",
"assets/assets/images/jesse.jpg": "4b09887f9d69e734f18838cd18d380b9",
"assets/assets/images/jesse.png": "78d9e16db7fe5972e02f58fd01775fd8",
"assets/assets/images/health_ui.png": "219e39516312f2f6bc264357497b99cb",
"assets/assets/images/tile/floor_2.png": "10968e74b671f14aab19e13a76da334d",
"assets/assets/images/tile/floor_3.png": "3fa52d5af2a38dede0142f5c3dcaab55",
"assets/assets/images/tile/floor_1.png": "00c3bd0c3d76a954f3f0a648cb13c3b3",
"assets/assets/images/tile/wall_top.png": "845ed35ef1482e21857c8bd70061c810",
"assets/assets/images/tile/wall_left_and_top.png": "5e7c81163a737dad7ed4a626d76a0b73",
"assets/assets/images/tile/floor_4.png": "2685b25c2471a762ff6f900b496c9e29",
"assets/assets/images/tile/floor_5.png": "6d63b1d77dcc35d4f7beb91125851e29",
"assets/assets/images/tile/floor_7.png": "7ba4503a62a1b242f05b5244e7b0dae4",
"assets/assets/images/tile/floor_6.png": "d464c18724611d109498d4c4e57316c4",
"assets/assets/images/tile/wall_left_and_bottom.png": "6583c02205abb0c84aef143379eb9bed",
"assets/assets/images/tile/wall_bottom.png": "31d2b04aca916c16bd31574d7134a853",
"assets/assets/images/tile/floor_10.png": "baf86a2272c83bd904bc25b4af03aa29",
"assets/assets/images/tile/wall_turn_left_top.png": "c9d8c9116dd5570fb87b6e1328cb0ee3",
"assets/assets/images/tile/wall_right.png": "aca869be30facbfd420754e870a78f58",
"assets/assets/images/tile/wall_right_and_bottom.png": "533d830adf7d86b810481118ed7aa2f9",
"assets/assets/images/tile/wall.png": "7a6ce85ad0ebd6694dd57e9fdca7535b",
"assets/assets/images/tile/wall_bottom_left.png": "7e83621a422ddd0e7b4425abe8ac3ec8",
"assets/assets/images/tile/wall_top_inner_right.png": "b26bd1cad50d0201d41ab18200976cfc",
"assets/assets/images/tile/wall_top_inner_left.png": "484e3c33e8559ff61f560e5f32791c5a",
"assets/assets/images/tile/wall_left.png": "b4ee6ba9d296a18fa532119ef8cb6157",
"assets/assets/images/tile/floor_8.png": "28692ad0c494efc5bc0f9669579006fe",
"assets/assets/images/tile/floor_9.png": "2b4e26d91d8f632bf4eaa5400cb7d748",
"assets/assets/images/tile/wall_bottom_right.png": "dd6772364441f0f2ea76c532fb4031dc",
"assets/assets/images/enemy/goblin_run_right.png": "565c2f9a0bb01a9c56975664f8cd375c",
"assets/assets/images/enemy/atack_effect_top.png": "df3eeb246450bf06de6dfc325d0bdbd0",
"assets/assets/images/enemy/atack_effect_left.png": "9c99ad913fcc75ce253f8db53faa846f",
"assets/assets/images/enemy/goblin_run_left.png": "05863189b562610b17a062114c7849a9",
"assets/assets/images/enemy/atack_effect_bottom.png": "aaeb1a8e791a0f15ba911e1d2540ab32",
"assets/assets/images/enemy/atack_effect_right.png": "15831f9ccee22a845e854ccb3d18f6e5",
"assets/assets/images/enemy/goblin_idle.png": "8c97e935786b994c3cff4008212381b9",
"assets/assets/images/enemy/goblin_idle_left.png": "a7563675f85ed259b2d0aae50ded196b",
"assets/assets/images/itens/potion_life.png": "825b71a3532854e849d512683dba06b0",
"assets/assets/images/itens/flag_red.png": "6aca7b9e01f86f1b1a45e262e65821b8",
"assets/assets/images/itens/torch_spritesheet.png": "858f57abd642f0303de50d719532f198",
"assets/assets/images/itens/spikes.png": "8ee92dd121da5fc50964a6a68e3e262c",
"assets/assets/images/itens/chest_spritesheet.png": "bcc8785d27d816e23eca114dd4e708ed",
"assets/assets/images/itens/prisoner.png": "45dcdd9a419bcd1f39cfd78024865578",
"assets/assets/images/itens/column.png": "2ccdc666f36fef12bb99345d4c6c9d66",
"assets/assets/images/itens/table.png": "5e22fb237c60943f46ba18d5e176c10c",
"assets/assets/images/itens/barrel.png": "dc4d5a9e456b6f1c6ec6fdcc66af7727",
"assets/assets/images/itens/bookshelf.png": "ce2fc17cb8251da9966a3e91bb0b2272",
"assets/assets/images/itens/flag_green.png": "1a5a7df4b10a84b0a722b3b6600198dd",
"assets/assets/images/blue_button2.png": "b2ac54312d3b566d324f461aa50b8f5b",
"assets/assets/images/control_body.png": "933d5042ee9abf869e93cdaf9e3960f1",
"assets/assets/images/blue_button1.png": "c5ac9ffc08055cdbb731e6bfb0d2593a",
"assets/assets/images/joystick_atack_range.png": "8994f23fc67442c8361432f0cc9a2fa1",
"assets/assets/images/games/fortnite.jpg": "7dcd24a4830dab8081844d9109cb0052",
"assets/assets/images/games/developer.jpeg": "477cde982ad005727cecf128615bf7c5",
"assets/assets/images/games/pubg.png": "7d4ba336346de6fa26164ec5a62b1044",
"assets/assets/images/games/digital_project_manager.jpeg": "6a090427639d7ebb4decd6e7d7bf5267",
"assets/assets/images/joystick_knob.png": "bb0811554c35e7d74df6d80fb5ff5cd5",
"assets/assets/images/direction_attack.png": "04fa54924d587beff5005965f2caa4b8",
"assets/assets/images/player/knight_idle_left.png": "e4ddca181210b0cf9555331aaf2af512",
"assets/assets/images/player/fireball_top.png": "e9a76f3ea950d6bc22f8f4cd3a22d7e3",
"assets/assets/images/player/knight_run_left.png": "ce9f3ad71135b459f6b66c892b5b9e30",
"assets/assets/images/player/explosion_fire.png": "81a3691935a18a30572870b759ad1683",
"assets/assets/images/player/atack_effect_top.png": "7b01845d595c3803a07567ee87710658",
"assets/assets/images/player/atack_effect_left.png": "5b5475da758d76f79c34429f70f7f6af",
"assets/assets/images/player/atack_effect_bottom.png": "e2406062be291971a034123fdd1757f9",
"assets/assets/images/player/fireball_right.png": "aaa2c18fe241c16e95be131619693b80",
"assets/assets/images/player/fireball_left.png": "cb3370c9039ec112af7bee6edf3e342d",
"assets/assets/images/player/atack_effect_right.png": "39b3d8583205c90284cd60f0e018f29d",
"assets/assets/images/player/knight_run.png": "9cac5c91f943ba81915573bd93060d4d",
"assets/assets/images/player/crypt.png": "8e55febc1e2563a9d7ba4b48625ba88d",
"assets/assets/images/player/knight_idle.png": "191737282656dd3c8851a2dd3dfc1c0c",
"assets/assets/images/player/emote_exclamacao.png": "8b1897ae92f3a077e0aadaef2626d65a",
"assets/assets/images/player/fireball_bottom.png": "05522f950d8d60e15615ee9705ff2ef0"
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
