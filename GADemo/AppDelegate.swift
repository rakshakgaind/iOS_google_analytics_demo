import UIKit
import FirebaseCore
import FirebaseAnalytics
import AppTrackingTransparency

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //MARK: GOOGLE ANNALYTICS APP KEY
        GAI.sharedInstance().tracker(withTrackingId: "G-BPS9X88EG7")
        
        
        //MARK: PERMISSION FOR TRACKING
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.requestPermission()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func requestPermission() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                print("Authorized")
                DispatchQueue.main.async {
                    //STEPS to FIND GAI
                    ///Install GoogleAnalytics and FirebaseAnalytics via COCOAPODS
                    ///
                    ///Create objective-c Header file
                    ///
                    ///add these imports to header file
                    ///#import <GoogleAnalytics/GAI.h>
                    ///#import <GoogleAnalytics/GAIDictionaryBuilder.h>
                    ///#import <GoogleAnalytics/GAIFields.h>
                    ///
                    ///
                    ///
                    
                    GAI.sharedInstance().defaultTracker.allowIDFACollection = true
                }
            case .denied, .notDetermined, .restricted:
                DispatchQueue.main.async {
                    GAI.sharedInstance().defaultTracker.allowIDFACollection = false
                }
            default:
                print("Unknown")
            }
        }
    }
}

