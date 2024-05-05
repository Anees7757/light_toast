# light_toast

A simple and lightweight Flutter package for displaying customizable toast messages.

<img src="https://github.com/Anees7757/light_toast/blob/master/assets/images/img1.png" height="300">
<img src="https://github.com/Anees7757/light_toast/blob/master/assets/images/img2.png" height="300">
<img src="https://github.com/Anees7757/light_toast/blob/master/assets/images/img3.png" height="300">


## Features

- Display toast messages with customizable colours, icons, and images.
- Supports showing icons or images leading the toast message.
- Supports Assets and Network images
- Configurable duration for toast visibility.
- Hide toast

## Getting started

```yaml
#add this line to your dependencies
toast: ^0.0.2
```
Then, import the package where you want to use it:
```
import 'package:toast/toast.dart';
```

## How to use

You can use the Toast.show method to display a toast message. Here's an example:
```dart
Toast.show(
  context,
  'Hello, Flutter!',
);
```

To hide toast
```dart
Toast.hide();
```
