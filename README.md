# FreeController
解决多个组件之间通过URL scheme调用弹出控制器

通过Route实现多个无关联模块间控制器的跳转。


造轮子的原因在这里：[多个pod之间的控制器跳转的可行性测试。](http://www.jianshu.com/p/c340ff422579)

主要使用了JLRoutes 和protocol extension。

使用：

AppDelegate

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool 	{
		 SJUpdateScheme("SJJump://jump")
		SJAddPresentRoutes("jump")
		return true
	}

需要跳转的控制器

	@IBAction func doJump2RedVC(sender: UIButton)
	{
		SJPresentViewController(self,moduleName: "podRoutes2/HHRedViewController",parameter: nil)
	}
	var SJType: UIViewController.Type
	{
		return self.dynamicType
	}
暂时实现了modal控制器，后续再继续优化。
