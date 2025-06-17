# polyline_test

# 🚀 Flutter Polyline Animation App

This Flutter project renders animated polylines between multiple points on a Google Map and fulfills a requirement to render the polyline within **1 second** after loading.

---

## 🧭 How to Run the Project

1. **Clone the repository**:
   ```bash
   git clone https://github.com/bishtmadhuri24/polyline_test

   flutter pub get

   flutter run
   

## Getting Started


The requirement to render the polyline within 1 second was fulfilled using the following strategies:

Optimized decoding and rendering: As soon as the polyline coordinates are received from the API, they are decoded and added to the map using a high-priority Bloc state update.

Asynchronous processing: Network request and polyline rendering were handled asynchronously with precise timing and minimal UI lag.

Debouncing: Avoided unnecessary re-rendering or multiple rebuilds during the process.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
