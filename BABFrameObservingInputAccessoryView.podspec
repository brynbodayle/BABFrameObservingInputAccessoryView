Pod::Spec.new do |s|
  s.name             = "BABFrameObservingInputAccessoryView"
  s.version          = "0.2.4"
  s.summary          = "A simple view which allows for an iOS Messages style keyboard input view and panning behavior. "
  s.description      = <<-DESC
BABFrameObservingInputAccessoryView
===================================

A simple view which allows for an iOS Messages style keyboard input view and panning behavior.

Supports iOS 7.0+

* Free of method swizzling
* No associated objects or other runtime hacks
* Works easily with or without Auto Layout
* Tested on iOS 7, iOS 8, iPhone & iPad

This is a UIView subclass which allows for observing the frame of a UITextView or UITextField's inputAcessoryView. This allows your to keep the text field above the keyboard as it moves. Also this allows for interactive keyboard dismissal using UIScrollView's keyboardDismissMode property.

### More Info

I wrote a [blog post](http://www.brynbodayle.com/messages-style-input-view-in-ios-8/) about the history and my decisions in handling this problem.

###Feedback

I'd love to here any questions, suggestions, or issues you might have. I've been using this in several of my apps, so it will remain in active development. Feel free to reach out on [Twitter](http://twitter.com/brynbodayle) or via issues if you have any feedback.


                       DESC
  s.homepage         = "https://github.com/brynbodayle/BABFrameObservingInputAccessoryView"
  s.screenshots     = "http://brynbodayle.com/Files/BABCropperView.gif"
  s.license          = 'MIT'
  s.author           = { "Bryn Bodayle" => "bryn.bodayle@gmail.com" }
  s.source           = { :git => "https://github.com/brynbodayle/BABFrameObservingInputAccessoryView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/brynbodayle'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
