# light_toast

A simple and lightweight Flutter package for displaying customizable toast messages.


<img height="300" src="https://raw.githubusercontent.com/Anees7757/light_toast/master/assets/images/img1.png" alt=""/>
<img height="300" src="https://raw.githubusercontent.com/Anees7757/light_toast/master/assets/images/img2.png" alt=""/>
<img height="300" src="https://raw.githubusercontent.com/Anees7757/light_toast/master/assets/images/img3.png" alt=""/>


## Features

- Display toast messages with customizable colors, icons, and images.
- Supports showing icons or images leading the toast message.
- Supports Assets and Network images
- Configurable duration for toast visibility.
- Hide toast

## Getting started

```yaml
#add this line to your dependencies
light_toast: ^0.0.5
```
Then, import the package where you want to use it:
```
import 'package:light_toast/light_toast.dart';
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