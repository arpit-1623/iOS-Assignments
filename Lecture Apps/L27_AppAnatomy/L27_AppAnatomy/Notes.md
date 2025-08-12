#  App Anatomy and Life Cycle

- Often, multiple view controllers together form a Scene.

## App Life Cycle
- Not Running : Not running right now
- Inactive : No action is being performed
- Active : Some action being performed
- Suspended : When the app is in memory, but isn't executing any code
- Background : When app is executing some code, but not visible to the user

## App Delegate v/s Scene Delegate

- Before iOS 13, only the AppDelegate existed and performed all functionality

### App Delegate
- For application specific tasks

- Did Finish Launching
- Configuration for Connecting Scene Session

Question: What is the difference if we return false instead of true in the configuration for connecting scene session?
```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return false // true by default
    }
```
Answer: 

### Scene Delegate
- For UI and screen specific tasks

- Will Connect to Session
- Will Enter Foreground
- Did Become Active
- Will Resign Active
- Did Enter Background
- Did Disconnect
