# ms.dart: miliseconds conversion utility

[![Build Status](https://drone.io/github.com/karan/ms.dart/status.png)](https://drone.io/github.com/karan/ms.dart/latest)

Port of [guille/ms.js](https://github.com/guille/ms.js).

## Install

In your `pubspec.yaml` add:

    dependencies:
      ms: ">=0.0.1"

Then run

    $ pub get

## Usage

In your dart code,

```dart
import 'package:typeof/typeof.dart';
```

```dart
ms('2 days')  // 172800000
ms('1d')      // 86400000
ms('10h')     // 36000000
ms('2.5 hrs') // 9000000
ms('2h')      // 7200000
ms('1m')      // 60000
ms('5s')      // 5000
ms('100')     // 100
```

```dart
ms(60000)             // "1m"
ms(2 * 60000)         // "2m"
ms(ms('10 hours'))    // "10h"
```

```dart
ms(60000, { 'long': true })             // "1 minute"
ms(2 * 60000, { 'long': true })         // "2 minutes"
ms(ms('10 hours'), { 'long': true })    // "10 hours"
```
