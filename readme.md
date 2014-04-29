
# 通过这个项目可以学到什么?

1. 基本UI控件的使用
    - Label
    - Button
    - TableView Controller
    - TableViewCells
2. TableView
    - 嵌入式static cells的应用
3. 多Controller之间的跳转
    - StoryBoard
    - Segue的运用
4. 如何利用委托在多个视图之间传递数据
5. MVC框架的基本概念和实践
6. 友盟统计SDK的使用
7. AdMob的使用
    1. 在Podfile里添加依赖

        ```
        pod 'Google-AdMob-Ads-SDK', '~> 6.8.0' # admob广告
        ```
        
		执行 pod install

    2. 在根视图的.h文件中插入下面的引用

        ```
        #import "GADBannerView.h"
        ```
    3. 添加AdMob
    
        * 在implementation下添加以下代码

        ```
        #define MY_BANNER_UNIT_ID @"a1535xxxxxxxxxx"  // 你的AdMob ID
        #define MY_DEVICE_ID_IPHONE5S @"21f3773a9e085798c9d446xxxxxxxxxx"  // 测试设备ID
        ```
        
        ```
        - (void)showAdMobView {
            // 在屏幕底部创建标准尺寸的视图。
            bannerView_ = [[GADBannerView alloc]
                    initWithFrame:CGRectMake(0.0,
                            self.view.frame.size.height - GAD_SIZE_320x50.height,
                            GAD_SIZE_320x50.width,
                            GAD_SIZE_320x50.height)];
            // 在GADAdSize.h中对可用的AdSize常量进行说明。
            // bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];

            // 指定广告单元ID。
            bannerView_.adUnitID = MY_BANNER_UNIT_ID;

            // 告知运行时文件，在将用户转至广告的展示位置之后恢复哪个UIViewController
            // 并将其添加至视图层级结构。
            bannerView_.rootViewController = self;
            [self.view addSubview:bannerView_];

            GADRequest *request = [GADRequest request];
            // 启动一般性请求并在其中加载广告。
            [bannerView_ loadRequest:request];

            // 请求测试广告。填入模拟器
            // 以及接收测试广告的任何设备的标识符。
            request.testDevices = [NSArray arrayWithObjects:GAD_SIMULATOR_ID, MY_DEVICE_ID_IPHONE5S, nil];

            NSLog(@"%@", @"显示AdMob广告");
        }
        ```     
        
        * 在viewDidLoad方法中调用showAdMobView

        ```
        - (void)viewDidLoad
        {
            // 显示AdMob广告
            [self showAdMobView];
        }
        ```

        * 完成


8. 使用CocoaPods来管理依赖库
