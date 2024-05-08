A simple and lightweight Flutter package for displaying customizable toast messages.
##**$${\color{blue}Light Toast}$$**##

<img height="300" src="https://raw.githubusercontent.com/Anees7757/light_toast/master/assets/images/img1.png" alt=""/>
<img height="300" src="https://raw.githubusercontent.com/Anees7757/light_toast/master/assets/images/img2.png" alt=""/>
<img height="300" src="https://raw.githubusercontent.com/Anees7757/light_toast/master/assets/images/img3.png" alt=""/>


## Features

- You can use it with or without context
- Display toast messages with customizable colors, icons, and images.
- Supports showing icons or images leading the toast message.
- Supports Assets and Network images
- Configurable duration for toast visibility.
- Hide toast

## Getting started

```yaml
#add this line to your dependencies
light_toast: ^0.0.7
```
Then, import the package where you want to use it:
```
import 'package:light_toast/light_toast.dart';
```

## How to use

_You can use the Toast.show method to display a toast message. Check the code below_


```dart
Toast.show(
  'Hello, Flutter!',
);
```

**Or with `context`**
```dart
Toast.show(
  context: context,
  'Hello, Flutter!',
);
```

To hide toast
```dart
Toast.hide();
```


