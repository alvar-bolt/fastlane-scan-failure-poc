import UIKit

// MARK: - App Delegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// If using scenes (iOS 13+ with a SceneDelegate) this window setup can move there.
		if #available(iOS 13.0, *) {
			// Defer to SceneDelegate if present (do nothing here). Some templates still create a window here for older iOS.
		} else {
			let window = UIWindow(frame: UIScreen.main.bounds)
			window.rootViewController = UIViewController()
			window.makeKeyAndVisible()
			self.window = window
		}
		return true
	}
}

// We conditionally compile SceneDelegate for iOS 13+ deployments.
#if canImport(UIKit) && swift(>=5.1)
// MARK: - Scene Delegate (optional for iOS 13+)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return }
		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = UIViewController()
		window.makeKeyAndVisible()
		self.window = window
	}
}
#endif

