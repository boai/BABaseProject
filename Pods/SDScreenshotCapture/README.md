# SDScreenshotCapture

![MIT Licensed](https://go-shields.herokuapp.com/license-MIT-blue.png)&nbsp;
![Platform](https://cocoapod-badges.herokuapp.com/p/SDScreenshotCapture/badge.png)&nbsp;
![Version](https://cocoapod-badges.herokuapp.com/v/SDScreenshotCapture/badge.png)&nbsp;

SDScreenshotCapture is a class which can be used to capture a screenshot of the app window which excludes the iOS status bar. It includes methods to grab the screenshot directly as a `UIImage`, share it via a `UIActivityViewController`, save it to the camera roll or write it directly to the app sandbox in the Documents directory.

This class is most useful on iOS 7 for capturing Launch Images or for preparing your screenshots for the App Store. We wrote it to prepare images for a tool we wrote, [Status Magic](http://shinydevelopment.com/status-magic/) which puts perfect status bars on screenshots ready for use in an App Store listing.

# Usage

Import the SDScreenshotCapture class and use **one** of the following methods to capture a screenshot:

```objective-c
// Screenshot and show share sheet
[SDScreenshotCapture takeScreenshotToActivityViewController];
```
```objective-c
// Screenshot and store to camera roll
[SDScreenshotCapture takeScreenshotToCameraRoll];
```
```objective-c
// Screenshot and store to documents directory
[SDScreenshotCapture takeScreenshotToDocumentsDirectory];
```

These methods can be called from anywhere but there are a couple of suggestions on how to trigger a screenshot in a generic way below:

### Triggering with a four finger tap gesture on the window

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
  tapGesture.numberOfTouchesRequired = 4;
  [self.window addGestureRecognizer:tapGesture];

  return YES;
}

- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGesture
{
  [SDScreenshotCapture takeScreenshotToActivityViewController];
}
```

### Triggering with a screenshot taken notification (iOS 7 only)

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidTakeScreenshot:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];

  return YES;
}

- (void)userDidTakeScreenshot:(NSNotification *)notification
{
  [SDScreenshotCapture takeScreenshotToActivityViewController];
}
```

**Note:** Unfortunately there is no way to stop the original screenshot being taken if using this method to trigger the SDScreenshotCapture screenshot.

# Installation

Just import the SDScreenshotCapture class. Alternatively the class is also available as a CocoaPod:

```ruby
pod 'SDScreenshotCapture'
```

# Demo

Run the `SDScreenshotCapture.xcodeproj` project in the `Example` folder.

# Authors

SDScreenshotCapture was written by [Dave Verwer](http://twitter.com/daveverwer) and [Greg Spiers](http://twitter.com/gspiers) of [Shiny Development](http://shinydevelopment.com).

# License

SDScreenshotCapture is available under the MIT license. See the LICENSE file for details.
