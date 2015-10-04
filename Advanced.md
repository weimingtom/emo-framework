# Advanced Tips #

## Integrating with iAd ##

Integrating with the Apple's iAd requires knowledge of Objective-C and Apples Foundation Framework. For more information about iAd, please refer to the [Apple's documentation](http://developer.apple.com/iad/). emo can be integrated with iAd by using [ADBannerView](http://developer.apple.com/library/ios/#documentation/userexperience/Reference/ADBannerView_Ref/Reference/Reference.html) and ApplicationDelegate. Here's some ideas.

  * First add **iAd.framework** and **CoreGraphics.framework** to your Frameworks.
![http://www.emo-framework.com/images/xcode_iad_framework.png](http://www.emo-framework.com/images/xcode_iad_framework.png)
  * Add ADBannerView member to your applicatoin delegate. Also, your application delegate should implement ADBannerViewDelegate.
```
#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@class EmoViewController;

@interface SuperGameAppDelegate : NSObject <UIApplicationDelegate, ADBannerViewDelegate> {
    UIWindow *window;
    EmoViewController *viewController;
    ADBannerView *adBannerView;
}
// .. snip
```

  * In your application delegate, add your ad banner and implement the delgates.
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
    viewController = [[EmoViewController alloc] init];
    viewController.view = [[EmoView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [viewController awakeFromNib];
	
    [self.window addSubview:self.viewController.view];
    
    [window makeKeyAndVisible];

    [self.viewController onLoad];

   /* 
     iAd banner should be added after viewController.onLoad
     because the view controller returns the current orientation option from main.nut.
    */
    adBannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];

    NSInteger orientation = [self.viewController getOrientationOption];
    if (orientation == OPT_ORIENTATION_PORTRAIT) {
        adBannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    } else if (orientation == OPT_ORIENTATION_LANDSCAPE      ||
               orientation == OPT_ORIENTATION_LANDSCAPE_LEFT ||
               orientation == OPT_ORIENTATION_LANDSCAPE_RIGHT) {
        adBannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }

    [self.viewController.view addSubview:adBannerView];
	
    adBannerView.delegate = self;
	
    adBannerView.requiredContentSizeIdentifiers = [NSSet setWithObjects: 
        ADBannerContentSizeIdentifierPortrait,
        ADBannerContentSizeIdentifierLandscape,
        nil];

    return YES;
}

/*
 * Hide the banner when ad banner fails.
 */
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    CGRect rectForHide = self.viewController.view.frame;
    rectForHide.origin.y = self.viewController.view.frame.size.height;
    adBannerView.frame = rectForHide;
}

- (void)dealloc
{
...snip
    adBannerView.delegate = nil;
    [adBannerView release];
...snip
    [super dealloc];
}

```

  * To tell view controller about the orientation, current orientation option should be set in your main.nut at onLoad.
```
/*
 * Called when this class is loaded
 */
function onLoad() {
    print("onLoad"); 

    // emo.Runtime.setOptions(OPT_ORIENTATION_LANDSCAPE);
    emo.Runtime.setOptions(OPT_ORIENTATION_PORTRAIT);

...snip
}
```

![http://www.emo-framework.com/images/xcode_with_iad.png](http://www.emo-framework.com/images/xcode_with_iad.png)

## Encrypting the source ##

Currently emo provides no special source protection. If you can write C/C++ code by yourself, it can be done by updating reading functions by yourself. It seems that the "Simple XOR Encrypting" is a quite casual solution.

http://www.eggheadcafe.com/tutorials/csharp/8b53894c-a889-4914-8c46-122980cc44ae/simple-xor-encryption.aspx

### Android ###

In jni/emo/Runtime.cpp search following functions:

```
static SQInteger sq_lexer_asset(SQUserPointer asset)
static SQInteger sq_lexer_fp(SQUserPointer fp)
```

You can add encryption logic to these functions like below:

```
static SQInteger sq_lexer_asset(SQUserPointer asset) {
  SQChar c;
  if(AAsset_read((AAsset*)asset, &c, 1) > 0) {
    return c ^ 129; // UPDATED: simple XOR encryption
  }
  return 0;

}

static SQInteger sq_lexer_fp(SQUserPointer fp) {
    int ret;
    SQChar c;
    if((ret = fread(&c, sizeof(c), 1, (FILE *)fp) > 0)) {
        return c ^ 129; // UPDATED: simple XOR encryption
    }
    return 0;

} 
```

Note that entire .nut files should be xor encrypted if you use this
solution.

### iOS ###

emo for iOS uses Apple's standard Foundation Framework that is written in Objective-C. You can update the following part and change them to anything you want.

In libs/emo/EmoEngine.m search following functions:

```
-(int)loadScript:(NSString *)path vm:(HSQUIRRELVM) v;
```

Search nscontent variable in the loadScript function. You can add decryption code here.

```
-(int)loadScript:(NSString *)path vm:(HSQUIRRELVM) v {
// snip..

// TODO_START: Decrypt your script file
  NSString* nscontent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error: nil];
// TODO_END: Decrypt your script file

  if (nscontent == nil) {
    LOGE("Script content is not found:");
    NSLOGE(path);
    return ERR_SCRIPT_OPEN;
  }
	
  const char* script = [nscontent UTF8String];
  const char* sourcename  = [path UTF8String];

  return sqCompileBuffer(v, script, sourcename);
}
```

Note that entire .nut files should be xor encrypted if you use this
solution.