class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    splash_controller = SplashController.alloc.initWithNibName(nil, bundle: nil)
    splash_controller.title = 'monkey_do'
    # splash_controller.view.backgroundColor = UIColor.whiteColor

    # navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = splash_controller
    @window.makeKeyAndVisible

    true
  end
end
