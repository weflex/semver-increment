SemVer-Increment
====

Handly library to bump Semantic Version numbers.

    var bumpVersion = require('semver-increment');
    var MAJOR = 0;                                 // don't bump MAJOR
    var MINOR = 1;                                 // bump MINOR
    var PATCH = 0;                                 // don't bump PATCH
    var masks = [MAJOR, MINOR, PATCH];
    var nextVersion = bumpVersion(masks, '1.2.3'); // -> 1.3.0

Features
----

- [ ] Bump SemVer number according to MASKS (for bits are non-zero)
- [ ] Bump PATCH number if no MASKS are provided, or MASKS is `[0, 0, 0]`
- [ ] Bump the biggest number (e.g. If MAJOR and MINOR are both non-zero, bump MAJOR)


Run Tests
----

    npm test


LICENSE
----

To be discussed.
