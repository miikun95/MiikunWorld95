"use strict";
importScripts("/workbox/workbox-v7.4.1/workbox-sw.js");
var CACHE = "pwabuilder-page";
var offlineFallbackPage = "/offline.html";
if (workbox) {
  workbox.setConfig({
    modulePathPrefix: "/workbox/workbox-v7.4.1/"
  });
  if (workbox.navigationPreload.isSupported()) {
    workbox.navigationPreload.enable();
  }
}
self.addEventListener("message", function(e) {
  if (e.data && e.data.type === "SKIP_WAITING") {
    self.skipWaiting();
  }
});
self.addEventListener("install", async function(e) {
  e.waitUntil(
    caches.open(CACHE).then(function(cache) {
      return cache.add(offlineFallbackPage);
    })
  );
});
self.addEventListener("fetch", function(e) {
  if (e.request.mode === "navigate") {
    e.respondWith((async function() {
      try {
        var preloadResp = await e.preloadResponse;
        if (preloadResp) {
          return preloadResp;
        }
        var networkResp = await fetch(e.request);
        return networkResp;
      } catch (e) {
        var cache = await caches.open(CACHE);
        var cachedResp = await cache.match(offlineFallbackPage);
        return cachedResp;
      }
    })());
  }
});
