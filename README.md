## Tappable Callouts in Swift 

This is an demonstration of a tappable map annotation view annotation callouts in Swift.

The easiest way to customize callouts is to implement the `leftAccessoryView` and `rightAccessoryView`. If you want more considerable changes for what appears below the title in the callout (e.g. add some custom imagery or whatever), you can also implement the `detailAccessoryView`.

But sometimes, even that is insufficient. You may want to make the whole callout tappable. You can do this by:

- Add tap gesture to the annotation view;
- Have that gesture recognizer confirm that the tap didn't take place on the annotation view itself (at which point we can conclude it was a tap on the callout, made possible because when callouts are presented, the system annotation views automatically recognize them in their `hitTest` implementations);
- Give the custom annotation view a delegate method to inform the view controller (or whomever its `delegate` is) that the callout was tapped.

FYI, this is not intended as an end-user library, but just a simple example of how one might create tappable callouts. This is for illustration purposes only.

See https://stackoverflow.com/questions/55441679/how-to-add-click-listener-to-selected-mkannotationview/55443533#55443533.

Developed in Swift on Xcode 10.2 and Swift 5. But the basic ideas are equally applicable for different versions of Swift and Objective-C. 

By the way, this illustrates a minimalistic way of recognizing taps on system generated callouts. If you want to go nuts in the customization of the callout, see https://github.com/robertmryan/CustomMapViewAnnotationCalloutSwift which illustrates how you can implement your own callouts.

## License

Copyright &copy; 2019 Robert Ryan. All rights reserved.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

--

31 March 2019
