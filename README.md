# APP-E-TIZER

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
App-e-tizer is a one click solution to help out in finding a place to eat. Using Google maps api, this app will scan the nearby area, choosing a random restaurant to display to the user. 

Milestone 2 - Configure Maps api and generate location search
<img src="https://i.imgur.com/8CqoAPV.gif" width=200><br>

Milestone 1 - Create a projcet and bootable app
<img src="https://i.imgur.com/8CqoAPV.gif" width=200><br>


### App Evaluation
- **Category:** Restaurant and Dining
- **Mobile:** This app is primarily a mobile app, and would possible see an extention to Apple Watch and Android platforms or other mobile platforms. 
- **Story:** Displays a button for the user to click, and will display a resturant in the near by area to go to. 
- **Market:** Anyone can use this app. Preferebly a person old enough to navigate to and from a public restaurant found on google maps. 
- **Habit:** This app can be used any time and any day. Can make for a perfect ice breaker, or if someone doesnt know where to eat, app-e-tizer will help you fine dine.
- **Scope:** First, the app will consist of a single button to pick a place to eat, and display it on the screen. Later we would like to add in parameters such as price range, type of food, delivery options, and place distance. 

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* [x] Created icon and logo in start up page
* [x] Configure Google Places API
* [x] User sees a "Search" button
* [ ] After searching, user sees a restaurant.
* [ ] Restaurant will show details
* [ ] User can always see the search button to generate another search request

**Optional Nice-to-have Stories**

* [ ] Extra search parameters
* [ ] A user account page for personalized results and a history log
* [ ] Ability to share newly discovered place

### 2. Screen Archetypes

* Main Page - User sees a search button and the result above, the restaurant generated by the search

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Search Page
Optional:
* User Profile


**Flow Navigation** (Screen to Screen)
* Home Sreen (with generate search) -> Restaurant Details (navigates to main page)
* Optional:
* Main Search Page -> User Profile

## Wireframes
<img src="https://github.com/COP4655-Devs/GroupAppAssignment/blob/main/Wireframe.png" width=600><br>

## Schema 
### Models
Property | Type | Description
--- | --- | ---
photo | File | image from google maps
formatted_addresss | String | address of business
name | String | name of business
formatted_phone_number | String | phone # of business
website | String | website of business
opening_hours | DateTime | time business opens
opening_now | DateTime | if business open now
price_level | String | how expensive the business is
rating | String | what is the rating of business
reviews | String | the reviews of business
user_ratings_total | Number | how many reviews of business

### Networking
- Current Place
```
    locationManager.requestAlwaysAuthorization()
```
- Place Autocomplete
```
import UIKit
import GooglePlaces

class ViewController: UIViewController {

  override func viewDidLoad() {
    makeButton()
  }

  // Present the Autocomplete view controller when the button is pressed.
  @objc func autocompleteClicked(_ sender: UIButton) {
    let autocompleteController = GMSAutocompleteViewController()
    autocompleteController.delegate = self

    // Specify the place data types to return.
    let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
      UInt(GMSPlaceField.placeID.rawValue))!
    autocompleteController.placeFields = fields

    // Specify a filter.
    let filter = GMSAutocompleteFilter()
    filter.types = [.address]
    autocompleteController.autocompleteFilter = filter

    // Display the autocomplete view controller.
    present(autocompleteController, animated: true, completion: nil)
  }

  // Add a button to the view.
  func makeButton() {
    let btnLaunchAc = UIButton(frame: CGRect(x: 5, y: 150, width: 300, height: 35))
    btnLaunchAc.backgroundColor = .blue
    btnLaunchAc.setTitle("Launch autocomplete", for: .normal)
    btnLaunchAc.addTarget(self, action: #selector(autocompleteClicked), for: .touchUpInside)
    self.view.addSubview(btnLaunchAc)
  }

}
```
- Place Photos
```
// Specify the place data types to return (in this case, just photos).
let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.photos.rawValue))!

placesClient?.fetchPlace(fromPlaceID: "INSERT_PLACE_ID_HERE",
                         placeFields: fields,
                         sessionToken: nil, callback: {
  (place: GMSPlace?, error: Error?) in
  if let error = error {
    print("An error occurred: \(error.localizedDescription)")
    return
  }
  if let place = place {
    // Get the metadata for the first photo in the place photo metadata list.
    let photoMetadata: GMSPlacePhotoMetadata = place.photos![0]

    // Call loadPlacePhoto to display the bitmap and attribution.
    self.placesClient?.loadPlacePhoto(photoMetadata, callback: { (photo, error) -> Void in
      if let error = error {
        // TODO: Handle the error.
        print("Error loading photo metadata: \(error.localizedDescription)")
        return
      } else {
        // Display the first image and its attributions.
        self.imageView?.image = photo;
        self.lblText?.attributedText = photoMetadata.attributions;
      }
    })
  }
})
```
- Place Details
```
GMSPlaceFieldName
GMSPlaceFieldPlaceID
GMSPlaceFieldPlusCode
GMSPlaceFieldBusinessStatus
GMSPlaceFieldCoordinate
GMSPlaceFieldOpeningHours
GMSPlaceFieldPhoneNumber
GMSPlaceFieldFormattedAddress
GMSPlaceFieldRating
GMSPlaceFieldPriceLevel
GMSPlaceFieldTypes
GMSPlaceFieldWebsite
GMSPlaceFieldViewport
GMSPlaceFieldAddressComponents
GMSPlaceFieldPhotos
GMSPlaceFieldUserRatingsTotal
GMSPlaceFieldIconImageURL
GMSPlaceFieldIconBackgroundColor
GMSPlaceFieldUTCOffsetMinutes
GMSPlaceFieldAll
```
- Place IDs
```
// A hotel in Saigon with an attribution.
let placeID = "ChIJV4k8_9UodTERU5KXbkYpSYs"

// Specify the place data types to return.
let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
  UInt(GMSPlaceField.placeID.rawValue))!

placesClient?.fetchPlace(fromPlaceID: placeId, placeFields: fields, sessionToken: nil, callback: {
  (place: GMSPlace?, error: Error?) in
  if let error = error {
    print("An error occurred: \(error.localizedDescription)")
    return
  }
  if let place = place {
    self.lblName?.text = place.name
    print("The selected place is: \(place.name)")
  }
})
```

