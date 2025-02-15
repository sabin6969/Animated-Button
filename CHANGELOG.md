# Changelog

All notable changes to this project will be documented in this file.

## [0.0.1] - 2025-02-15

### Added
- Initial release of `AnimatedButton`.
- Supports animated transitions from a rectangular button to a circular loading indicator.
- Customizable properties:
  - `isLoading` to control loading state.
  - `onTap` callback for button press events.
  - `buttonName` to set the displayed text.
  - `height` and `width` for sizing.
  - `color` for button background customization.
  - `textStyle` for modifying text appearance.
  - `radius` for border customization.
  - `loadingIndicatorColor` to set the loading spinner color.
- Uses `AnimationController` to animate width shrinkage and shape transformation.
- Disables interaction (`IgnorePointer`) when in the loading state.
