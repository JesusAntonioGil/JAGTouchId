![alt tag](http://www.mobiles.co.uk/blog/wp-content/uploads/2013/09/iphone-touch-id-logo.png)
# JAGTouchId

## Overview

JAGTouchId provides supportive methods to check biometric authentication.

## Usage

  - Import
```
 #import "JAGTouchId.h"
```

  - ViewController Delegate
```
@interface ViewController () <JAGTouchIdDelegate>
```

  - Initialize
```
JAGTouchId *touchId = [[JAGTouchId alloc] init];
touchId.delegate = self;
[touchId startTouchIdAuthetication];
```

  - JAGTouchId Delegate Method
```
- (void)touchIdAuthetication:(BOOL)success error:(NSError *)error
{
}
```

## License

JAGTouchId is available under the MIT license. See the LICENSE file for more info.
