# Service App UI

A clean and modern Flutter UI design for a home service marketplace connecting homeowners with contractors.

## About

This is a **UI-only project** showcasing a complete design system and user interface for a service booking application. The focus is on creating beautiful, reusable components with a consistent design language.

## Design Highlights

- **Modern Gradient Theme** - Blue to purple gradient throughout the app
- **Custom Components** - Reusable widgets built from scratch
- **Smooth Animations** - Slide, fade, and toggle transitions
- **Clean Architecture** - Well-organized code structure
- **SF Pro Rounded** - Premium typography

## Screens

- **Splash Screen** - Animated welcome with role selection
- **Authentication** - Login/Signup with toggle animation
- **Verification** - OTP input screen
- **Home** - Service discovery with search and carousel
- **Service Listing** - Browse available services
- **Create Job** - Multi-step form with progress indicator

## Color Palette

```dart
Primary Blue    #124A9A
Light Blue      #1D61E7
Primary Purple  #3865E0
Dark Blue       #232447
White           #FFFFFF
Grey Shades     #6C7278, #EDF1F3, #F5F7F9
```

## Project Structure

```
lib/
├── core/
│   ├── constants/        # Colors and styles
│   ├── data/            # Static data
│   ├── helpers/         # Utility widgets
│   ├── routes/          # Navigation
│   └── theme/           # App theme
├── features/
│   └── presentation/
│       ├── screens/     # All screens
│       └── widgets/     # Reusable components
└── main.dart

assets/
├── fonts/              # SF Pro Rounded
├── icons/              # SVG icons
└── images/             # UI images
```

## Custom Widgets

**CustomButton** - Gradient button with loading state  
**CustomTextField** - Enhanced input with validation  
**AnimatedToggleButton** - Smooth toggle switch  
**CarouselSlider** - Featured content carousel  
**BottomBar** - Gradient navigation bar  
**StepIndicator** - Multi-step progress  
**OtpInputWidget** - OTP verification input  
**ServiceCard** - Service display card

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Dependencies

```yaml
flutter_svg: ^2.2.3        # SVG support
cupertino_icons: ^1.0.8    # iOS icons
```

## Design System

### Typography
- Font: SF Pro Rounded
- Weights: Regular, Semibold, Bold, Black

### Gradients
- Primary: Linear gradient (Blue → Purple)
- Overlay: Semi-transparent gradient for backgrounds

### Components
All components follow a consistent design pattern with:
- Rounded corners (12-24px radius)
- Subtle shadows
- Gradient accents
- Smooth animations (200-800ms)

## Code Structure

Clean, maintainable code with:
- Separation of concerns
- Reusable components
- Centralized constants
- Type-safe implementations
- Proper widget composition

---

**Note:** This is a UI design project. No backend functionality is implemented.
