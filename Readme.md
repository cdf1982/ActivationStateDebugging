# Sample project for code-level support request, case ID 5013279

## Issue
watchOS app forced to .active state while attached to Xcode

### Hardware and software configuration during testing:
Watch Series 7 45mm with watchOS 10.1.1 (21S71); Xcode 15.0 (15A240d) running on a MacBook Air M1 with macOS Sonoma 14.1.1 (23B81)

### Description
In the development of a new watchOS app, I need to monitor ScenePhase changes: I must react to the .inactive phase that is triggered a few seconds after the User stops interacting with the app or rotate their wrist, because this corresponds to the screen dimming and, most importantly, to communication with the paired iPhone to be interrupted.

In my tests I noticed that, **whenever the app is launched by Xcode, it's forced into .active** state until the Digital crown is pressed _(at that point, .inactive is briefly invoked on the way to .background)_; this means that the Watch display remains at full brightness and rotating the wrist or avoiding interactions with the app even for long periods of time do not trigger the .inactive state, therefore keeping the connection to the paired phone open.

As soon as I stop execution in Xcode and **launch the app on the Watch, .inactive state is triggered as expected**, which means very often.

My problem is that, during this phase of development, **I really need to be able to monitor (log) the kind of inactivation / reactivation cycle that happens in real life usage** of the Watch (pauses during interaction, wrist rotations) by logging informations to Xcode, so I am in a debugging loop: _if I want logging, I need to run the app from Xcode, but if I do, .inactive never happens_.

**I wonder if there's a Xcode Scheme argument or any other way to "tell Xcode" not to force the .active state for the Watch app it is running**, but I haven't been able to find anything in the Docs or online. So, here I am using my first code-level support request in a decade, asking for your help.

I prepared the simplest Xcode sample project for you to test, as described in "Steps to reproduce.

Thank you for your help and ciao from Italy, Cesare

### Update December 5, 2023
The sample project has been updated to avoid using ScenePhase as conditional in the SwiftUI View body; it now shows the list of phases the app goes through, which can be useful to see the difference between **running it attached to Xcode (where, after launch, the app remains .active until it's sent to background manually by pressing a physical button)** and **_normally_ on device, where any wrist rotation or delay triggers a change from .active, .inactive and viceversa**.
My purpose is to understand if it's possible to have the app run attached to Xcode debugger, but behaving in the way it does when used "in real life".

### Steps to reproduce
1. Clone [sample project](https://github.com/cdf1982/ActivationStateDebugging):
2. Please run it on device from Xcode: the "Active" state will continue indefinetely, no matter how long you wait interacting or if you rotate your wrist;
3. Stop execution from Xcode and launch the app directly from the Watch: the .inactive state will be regularly triggered and displayed when rotating the wrist or pausing interactions.