# [Cordova Volume Control](https://github.com/mgcrea/cordova-plugin-volume-control) [![Release](https://img.shields.io/npm/v/cordova-volume-control.svg?style=flat)](https://github.com/mgcrea/cordova-plugin-volume-control/releases)

This plugin provides a simple way to interact with the volume of your `UIWebView`.

* This plugin uses private `AVSystemController.h` APIs and can't be used for AppStore apps.

* This plugin is built for `cordova@^3.6`.

* This plugin currently supports iOS.


## Plugin setup

Using this plugin requires [Cordova iOS](https://github.com/apache/cordova-ios).

1. `cordova plugin add cordova-volume-control`


## Javascript interface

    // After device ready, create a local alias
    var VolumeControl = cordova.plugins.VolumeControl;

    VolumeControl.getVolume(console.log.bind(console));
    VolumeControl.getCategory(console.log.bind(console));
    VolumeControl.toggleMute();
    VolumeControl.isMuted(console.log.bind(console));
    VolumeControl.setVolume(0.15);

* Check [source](https://github.com/mgcrea/cordova-plugin-volume-control/tree/master/www/VolumeControl.js) for additional configuration.


## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/cordova). (Tag `cordova`)
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/cordova).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Contributing

Patches welcome! Send a pull request. Since this is not a part of Cordova Core (which requires a CLA), this should be easier.

Please submit all pull requests the against master branch. If your pull request contains JavaScript patches or features, you should include relevant unit tests. Thanks!


## Authors

**Olivier Louvignes**

+ http://olouv.com
+ http://github.com/mgcrea


## Copyright and license

    The MIT License (MIT)

    Copyright (c) 2015 Olivier Louvignes

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
