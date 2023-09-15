# GOOGLE ANALYTICS DEMO

Demo to create Google Analytics

## Getting Started

Follow these instructions to build and run the project

- Install GoogleAnalytics and FirebaseAnalytics via COCOAPODS
- Add GoogleService-Info fiel to project
- Create objective-c Header file
- add these imports to header file
```
    #import <GoogleAnalytics/GAI.h>
    #import <GoogleAnalytics/GAIDictionaryBuilder.h>
    #import <GoogleAnalytics/GAIFields.h>                    
```

# APP DELEGATE FILE
ADD this to didfinishlaunchingwithoption
```
        FirebaseApp.configure()
        
        GAI.sharedInstance().tracker(withTrackingId: "G-BPS9X88EG7")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.requestPermission()
        }
        
        
     func requestPermission() {
         ATTrackingManager.requestTrackingAuthorization { status in
         switch status {
            case .authorized:
            print("Authorized")
            DispatchQueue.main.async {
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
```



### USE

```
        Analytics.logEvent(AnalyticsEventPurchase, parameters: [AnalyticsParameterPrice : 20, AnalyticsParameterCurrency : "INR"])
```
