# ImageFeed

iOS app for browsing Unsplash images with OAuth authentication. Features include infinite image feed with like/favorites functionality, full-screen viewing with zoom and share, and user profile. Built with Swift + UIKit and MVP architecture.

- [Figma mockup](https://www.figma.com/design/MujlanK7BDoQRrGci5G6pi/Image-Feed)
- [Unsplash API](https://unsplash.com/documentation)

## Screenshots

![Image](https://github.com/user-attachments/assets/969f2882-c064-40d8-8055-ecde5378d20c)

## Features

- **OAuth Authentication:** Secure login via Unsplash OAuth
- **Infinite Image Feed:** Endless scrolling through Unsplash Editorial images
- **Like/Favorites:** Add and remove images from favorites
- **Full-Screen Viewing:** Zoom, pan, and rotate images
- **Share Images:** Share image links outside the app
- **User Profile:** View user info, avatar, and favorite images
- **Offline Support:** Basic error handling with retry option

## Tech Stack

- **UIKit** with programmatic layout
- **MVP** architecture
- **URLSession** for networking
- **Unsplash API** integration
- **OAuth 2.0** authentication
- **GCD (Grand Central Dispatch)** for background threading

## Architecture

The project follows MVP (Model-View-Presenter) architecture:

- **View:** UIKit views and ViewControllers. Passes user actions to Presenter
- **Presenter:** Contains business logic, prepares data for View
- **Model:** Data models and API service layer
- **Helpers:** OAuth token storage (Keychain), image caching

## Key Implementation Details

- **OAuth Flow:** WebView-based authentication with token storage in Keychain
- **Image Loading:** Async image loading with caching for smooth scrolling
- **Pagination:** Infinite scrolling with offset-based pagination
- **Like/Unlike:** API requests to add or remove favorites
- **Full-Screen Gestures:** Pinch to zoom and pan support

## Installation

- git clone https://github.com/rfhfv/ImageFeed.git
- cd ImageFeed
- open ImageFeed.xcodeproj
