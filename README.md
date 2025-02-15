# AnimatedButton

A customizable animated button for Flutter that smoothly transitions between a button and a loading indicator.

## 📌 Features

- **Animated transition** from a rectangular button to a circular loading indicator.
- 🎨 **Customizable** properties:
  - `isLoading` to toggle loading state.
  - `onTap` callback for button press events.
  - `buttonName` to set button text.
  - `height` and `width` for button size.
  - `color` for button background.
  - `textStyle` for text customization.
  - `radius` for border customization.
  - `loadingIndicatorColor` to set the spinner color.
- 🛠️ **Smooth animation** using `AnimationController`.
- 🚫 **Disables interaction** when in the loading state.

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  animated_button:
    git:
      url: https://github.com/sabin6969/Animated-Button
