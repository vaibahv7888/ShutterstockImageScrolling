# Problem Statement #
Create an Infinite Scrollable Pictures app, using Shutterstock API (http://api.shutterstock.com/).

## Description: ##
1. Create and iOS App with Infinite scrollable view i.e. Collection View.
2. Use Shutterstock public API (http://api.shutterstock.com/).
3. Fetch and show new picture every time the user scrolls to the end of the list.
4. High performance app with smooth scrolling & lag-free UI.
5. Implement Unit Tests and UITests.
6. One view controller without storyboard/nib/xib.

# Solution:
The solution mainly focuses on Mobile App. Following are the steps that were included in the solution.
1. Fetch Images from Shutterstock public API (http://api.shutterstock.com/).
2. Fetch 20 images on app launch then as the user scroll up and reaches the end of Collection View fetch next 20 images and 3. update to the current Collection.
4. Make this fetching process infinite.
5. Initialize every cell with respective images information Height, Width and Image URL.
6. Fetch image for every cell within that cell.
7. Implemented Image Caching using AlamofireImage for making the app highly performant, smooth scrolling & lag-free UI.
8. Implemented Sutterstock Picture view showing individual image programmatically without using storyboard/nib/xib.
9. Implemented Unit Tests and UITests.

# Architecture
* The architecture for this app is a mixture of VIPER and MVVM architecture patterns.
* A protocol oriented programming approach is followed avoiding inheritance and references semantics.
* Value type semantics Structs are used for implementing most of the apps functionalities except for ViewModels and Views.
* Every Struct and ViewModel Class has its protocols.
* Protocol names are postfixed with Contract for identification purpose.
* Clean coding principals and solid principals are followed one Struct and one protocol implements only one task except for the ViewModel Protocols.
* The ViewModel’s Protocols can also be separated depending on their functionalities but considering the one ViewModel class is only used by one view class all the functionalities are declared in one protocol.

## Project Structure ##
* The project is structured on the basis of Features.
* Every feature has its main folder and subfolders for DI (Dependency Injection), Presentation layer containing View and ViewModel Folders and Model layer containing Services and Interactors.

## Dependancy Injection ##
* Dependency Injection is handled using Swinject and SwinjectAutoregistration.
* Swinject has option for common dependancies and separate dependancies so for this project Networking and ImageCache are common dependancies and they are defined in AppDelegate.

## Execution flow of the app ##
* ViewController class interacts with ViewModel class.
* ViewModel class interacts with Interactors if the data needs to be fetched from multiple services or if there is any business logic needs to be executed for getting the data.
* If there is no business logic or multiple services then ViewModel directly interacts with respective service no need for Interactor.
* Interactors interact with services for getting the data and updating the data.
* Interactors contain the business logic.
* Services contain logic for fetch data from Network or Repositories or any other place.

## Networking and Abstraction ##
* Networking is handled using Alamofire library.
* An Abstraction ApiServiceContract is written for Alamofire that executes all the Alamofire API calls and rest of the app interacts with ApiService using ApiServiceContract protocol.
* This separation enables the app to change its inline Alamofire library with any other Networking library or with native NSURLSession class etc.. without needing a change in other parts of the code.
* Similar abstraction is implemented with Image Caching.
* Image caching is implemented using AlamofireImage this ensures one image is downloaded only ones and increasing the app performance and reducing the data usage of the app.

# Trade offs
Authentication Part is under development as this was not part of problem statement, so for now hardcoded access token is used for authentication of image search api.
This will fetch authentication token from Shutterstock on the first launch of the app using the ConsumerKey and ConsumerSecrete.

# Limitations
This is a test account of Shutterstock for this they only provide 1000 free images and the application has 20 images per fetch request so only 50 fetches are possible after that the Shutterstock stops providing images.

# Unit Tests covers
* Tests for Structs.
* Network Tests with a dummy API json response.

# UITests covers
* Test for first Fetch of the images on app launch.
* Test for scrolling to the end of the Collection View and fetching new Pictures and appending to the Collection View.
* Test for Picture View opening one picture watching it full screen and going back to the main Collection View.

# Pods used
* Alamofire (for Networking purpose).
* AlamofireImage (for Image Caching).
* Swinject (for Dependancy Injection).
* SwinjectAutoregistration (for Dependancy Injection and AutoRegistration).

