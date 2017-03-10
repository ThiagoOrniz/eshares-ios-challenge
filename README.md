# eShares iOS Challenge


## How?

Create a file called Config.swift and add two strings

```sh
struct Config {
static let clientID = "#################"
static let clientSecret = "###############"
}
```

## Description & Goal:
Create an App that lists the new releases on Spotify using the public API
Provide a working solution of the test via Pull Request


## Screens:

![iosLayout.png](http://i.imgur.com/Uce24Q4.png)

1. A list with the USA new releases. Each item should display:

  * image
  * track name
  * artists names

2. When a track is selected from the list, a detailed view should be presented. The view should display:

  * image using full width
  * track name
  * artists names
  * "Open in Spotify" button (via app/web)

## API:

### Spotify Reference:

* https://developer.spotify.com/web-api/get-list-new-releases/
* https://developer.spotify.com/web-api/authorization-guide/


## We Suggest:

* Swift
* iOS 9+
* Feel free to use libraries of your choice


## Submission Process:

1. FORK this repository (DO NOT CLONE OR WORK IN THIS REPO)
2. Commit and Push in YOUR fork
3. Create a Pull Request with your solution
