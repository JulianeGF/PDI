import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setCookie(name: "app-id", value: "elo7")
        setCookie(name: "app-version", value: "3.0.0")
        setCookie(name: "app-platform", value: "ios")
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func setCookie(name: String, value: String) {
        let cookieProps = [
            HTTPCookiePropertyKey.domain: "www.elo7.com.br",
            HTTPCookiePropertyKey.path: "/",
            HTTPCookiePropertyKey.name: name,
            HTTPCookiePropertyKey.value: value
        ]
        if let cookie = HTTPCookie(properties: cookieProps) {
            AF.session.configuration.httpCookieStorage?.setCookie(cookie)
        }
    }
}
