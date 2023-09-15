import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: HANDLE EVENTS
    @IBAction func btPurchase(_ sender: UIButton) {
        Analytics.logEvent(AnalyticsEventPurchase, parameters: [AnalyticsParameterPrice : 20, AnalyticsParameterCurrency : "INR"])
    }
    
    @IBAction func btSignup(_ sender: UIButton) {
        Analytics.logEvent(AnalyticsEventSignUp, parameters: ["email" : "test@mail.com"])
    }
    
    @IBAction func btCustomEvent(_ sender: UIButton) {
        Analytics.logEvent("button_clicked", parameters: [AnalyticsParameterItemName : "true"])
    }
}

