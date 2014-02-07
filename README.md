# Keygen

> A set of functions for url-friendly, random, unique key/token generation

## Getting Started

Install Keygen:

```shell
npm install keygen --save
```

## Overview

Keygen can be used to generate url-friendly or hexidecimal keys.  The url-friendly variety should be favored where possible since they are shorter but represent a significantly larger keyspace.

## Examples

URL Friendly Keys:

```js
var keygen = require('keygen');

// generate a small url-friendly key
keygen.url(keygen.small);  //-> 'ob2sdNPT6oy'

// generate a medium url-friendly key
keygen.url(keygen.medium);  //-> 'bmGZK8pH7zTCVLJZDZPsYS'
// or
keygen.url();  //-> 'zQSu6JET5kRbViW7Mz8Z7f'

// generate a large url-friendly key
keygen.url(keygen.large);  //-> '8DtZ4nsKJNiGVHTdqtLFHgLsYoktWsUtfazpjzonFUam'

// generate a huge url-friendly key via a custom uniqueness factor
keygen.url(11);  //-> '86ZdCFcM7TLw45rn2Hi2tN5JsKYne6Uk4XAQ76b5YWwfUtZYzfKxnv8t96u9funiTHGHzKco7JN34umyyjUvGZkBLNBQSEtj5VSkaDYXfDwQ2CmtYCmdGn6ke'
```

Hexidecimal Keys:

```js
var keygen = require('keygen');

// generate a small hex key
keygen.hex(keygen.small);  //-> '926e8a8970835c96'

// generate a medium hex key
keygen.hex(keygen.medium);  //-> '871136e6d634815ac8ba57af1761a0bc'
// or
keygen.hex();  //-> '13f8109d204bec06da97c9f93bd7ca5a'

// generate a large hex key
keygen.hex(keygen.large);  //-> '40ec6f83ba22d76239a95451dc59c5ab0a3448feaecc4074365ac01bd871ba08'

// generate a huge hex key via a custom uniqueness factor
keygen.hex(11);  //-> '56beed897c1b34fdd50cad3ddd2f31b7085dca88c9c49cf96a89fee76886823a002a0dc43656848a0562cf73509b9ea98bfe6ca51e042fa59c57b0a98b2ff9e63fc41117b073a6f3cf477acfe922de4f5df3de0c3665b657'
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

## Release History
_(Nothing yet)_
