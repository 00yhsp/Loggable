# Custom Categories

Customize how your logs are grouped and filtered in the console.

## Overview

By default, the `@Loggable` macro uses the name of the type it's applied to as the logging category. While this is often sufficient, you might want to group logs from different types under a single category or use a more descriptive name.

## Specifying a Category

You can provide a custom category by passing a string literal to the macro:

```swift
import Loggable

@Loggable("NetworkLayer")
class APIClient {
    func fetchUsers() {
        logger.debug("Fetching users from the API.")
    }
}

@Loggable("NetworkLayer")
struct ImageDownloader {
    func downloadImage() {
        logger.debug("Starting image download.")
    }
}
```

In the example above, logs from both `APIClient` and `ImageDownloader` will be grouped under the "NetworkLayer" category in the Console app or Xcode console. This makes it significantly easier to filter and analyze logs related to a specific subsystem or feature of your app, regardless of which specific class generated them.