moment = require 'moment'

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
    constraints:
      validFrom: [moment Date.UTC.apply {}, [2012, 0, 1]]
      validBefore: [moment Date.UTC.apply {}, [2013, 11, 31, 23, 59, 59]]
  'portrait':
    action: 'download'
    url: 'file://./goethe.jpg'
    fileName: 'Portrait.jpg'
    contentType: 'image/jpeg'
    forceDownload: false

module.exports = mappings