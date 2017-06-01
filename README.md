# Keygen

> A set of functions for url-friendly, random, unique key/token generation

## Getting Started

Install Keygen:

```shell
npm install keygen --save
```

## Overview

Keygen can be used to generate url-friendly or hexadecimal keys.  The url-friendly variety should be favored where possible since they are shorter but represent a significantly larger keyspace.

## Examples

URL Friendly Keys:

```js
var keygen = require('keygen');

// generate a small url-friendly key
keygen.url(keygen.small);  //-> 'u3WZbDyN57J'

// generate a medium url-friendly key
keygen.url(keygen.medium);  //-> '5yQZwZsLCaW9W3kmKxx7Ac'
// or
keygen.url();  //-> '4wUtvcP5izgTRwV7GPZp9f'

// generate a large url-friendly key
keygen.url(keygen.large);  //-> 'zj6BYUikZeDFwrj8yn9xRdFVXQbKPTQWDs8fqq9fRkqj'

// generate a huge url-friendly key via a custom length
keygen.url(13);  //-> 'f3dBLmgNCtK8h'
```

Hexadecimal Keys:

```js
var keygen = require('keygen');

// generate a small hex key
keygen.hex(keygen.small);  //-> 'e9732d18888'

// generate a medium hex key
keygen.hex(keygen.medium);  //-> '910886cd435e93eef7e22e'
// or
keygen.hex();  //-> '8f07d173de8786d5488e3e'

// generate a large hex key
keygen.hex(keygen.large);  //-> '9c90543d255fe6f71a593f807034b5e123f26081ca73'

// generate a huge hex key via a custom length
keygen.hex(31);  //-> 'aa66c729bdf9b119c33653589d2770f'
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

## Release History
_(Nothing yet)_
