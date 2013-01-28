"use strict";

mappings =
  'chris':
    action: 'redirect'
    url: 'http://www.sp-studios.com'
    type: 'permanent'
  'polarbear':
    action: 'download'
    url: 'http://www.goloroden.de/images/Logo.png'
    filename: 'PolarBear.png'
    contentType: 'image/png'
    forceDownload: false
  'portrait':
    action: 'download'
    url: 'file://../goethe.jpg'
    fileName: 'Portrait.jpg'
    contentType: 'image/jpeg'
    forceDownload: false

module.exports = mappings