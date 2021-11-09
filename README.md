<!-- PROJECT LOGO -->
<br />

![GitHub repo size](https://img.shields.io/github/repo-size/dylandasilva1999/explain-life-ios-app?color=%23FFB494)
![GitHub watchers](https://img.shields.io/github/watchers/dylandasilva1999/explain-life-ios-app?color=%23FFB494)
![GitHub language count](https://img.shields.io/github/languages/count/dylandasilva1999/explain-life-ios-app?color=%23FFB494)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/dylandasilva1999/explain-life-ios-app?color=%23FFB494)
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Instagram][instagram-shield]][instagram-url]
[![Behance][behance-shield]][behance-url]

<h6 align="center">Dylan da Silva IDV 304</h6>
<p align="center">
</br>
   
  <a href="https://github.com/dylandasilva1999/explain-life-ios-app">
    <img src="Images/App Icon.png" alt="Logo" width="140" height="140">
  </a>
  
  <h3 align="center">Explain Life.</h3>

  <p align="center">
    Spectrum Autism Disorder Companion App<br>
      <a href="https://github.com/dylandasilva1999/explain-life-ios-app"><strong>Explore the docs »</strong></a>
   <br />
   <br />
   <a href="https://youtu.be/eIQ_HKjL-sU">View Demo</a>
    ·
    <a href="https://github.com/dylandasilva1999/explain-life-ios-app/issues">Report Bug</a>
    ·
    <a href="https://github.com/dylandasilva1999/explain-life-ios-app/issues">Request Feature</a>
  </p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Project Description](#project-description)
  * [Built with](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Artificial Intelligence Integration](artificial-intelligence-integration)
  * [Apple Speech-To-Text](apple-speech-to-text)
  * [Apple Text-To-Speech](apple-text-to-speech)
  * [IBM Tone Analyzer](ibm-tone-analyzer)
* [Features and Functionality](#features-and-functionality)
   * [Features](#features)
   * [Functionality](#functionality)
* [Concept Process](#concept-process)
   * [Ideation](#ideation)
   * [Wireframes](#wireframes)
* [Development Process](#development-process)
   * [Implementation Process](#implementation-process)
        * [Highlights](#highlights)
        * [Challenges](#challenges)
   * [Reviews and Testing](#feedback-from-reviews)
        * [Feedback from Reviews](#feedback-from-reviews)
   * [Future Implementation](#future-implementation)
* [Final Outcome](#final-outcome)
    * [Mockups](#mockups)
    * [Video Demonstration](#video-demonstration)
    * [Promotional Video](#promotional-video)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!--PROJECT DESCRIPTION-->
## About the Project

![image1][image1]

### Project Description

According to an article by mental health, autism spectrum disorder is “an umbrella term that covers everyone with conditions within the spectrum of autism”. The umbrella is a metaphor for shielding autistic people from over stimulation. Explain life would be a tool/companion mobile application which ASD people can use to communicate, learn, and express themselves.

The reason for choosing the mobile application name “Explain Life” for the duality of it’s meaning. In the one sense it explains life to autistic people such as social context and in the other it explains what autistic people understand to non-autistic people. It emphasises the importance on how autistic people are viewed and how this mobile application can aid the users (ASD people) to learn and improve on conversational, emotion expression, emotion detection etc. in their daily lives. Hence it being a sort of companion to the user.

Explain Life is an interactive AI-driven iOS mobile application for autism spectrum disorder people as a companion.

### Built With

* [Swift](https://swift.org/)
* [SwiftUI](https://developer.apple.com/xcode/swiftui/#:~:text=SwiftUI%20helps%20you%20build%20great,set%20of%20tools%20and%20APIs.)
* [Firebase](https://firebase.google.com/?gclid=Cj0KCQjwse-DBhC7ARIsAI8YcWItyGR2ha-LRzTOOglVa0RTNXSePdd7fMLvbCnR6ERBs4oI4ken-SYaAmsqEALw_wcB&gclsrc=aw.ds)
* [Apple Speech-To-Text](https://developer.apple.com/tutorials/app-dev-training/transcribing-speech-to-text)
* [Apple Text-To-Speech](https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer)
* [IBM Tone Analyzer](https://www.ibm.com/cloud/watson-tone-analyzer)
* [GitHub](https://github.com/)

<img src="https://images.ctfassets.net/yr4qj72ki4ky/legacyBlogPost670Thumbnail/93e6c8af94bd3aef65a7efdaaeb522f3/img.png" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://www.swiftbysundell.com/images/discover/swiftui/icon.png" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://upload.wikimedia.org/wikipedia/commons/4/46/Touchicon-180.png" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://upload.wikimedia.org/wikipedia/commons/9/91/Octicons-mark-github.svg" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<!-- GETTING STARTED -->
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Requires iOS 13 and Xcode 11

### Installation

1. In Xcode go to
  ```sh
  File -> Swift Packages -> Add Package Dependency
  ```
2. and paste in the repo's url:
`https://github.com/dylandasilva1999/explain-life-ios-app`

Open in Xcode 12 or later.

3. Install Cocoapods
```sh
cd your/directory
pod install
```

<!-- FEATURES AND FUNCTIONALITY-->
## Artificial Intelligence Integration

### Apple Speech-To-Text
`Speech-to-text` technology converts spoken words into digital text on a screen. Speech-to-text was implemented and used in Explain Life, to record a sentence in a converstation and input and display the text in the app for analysis.

### Apple Text-To-Speech
`Text-to-speech` is a type of assistive technology that reads digital text aloud. Text-to-speech was used in Explain Life when a user wants to type how they feel, as well as for the emotion expression clicking on an emotion card.

### IBM Tone Analyzer
The  `IBM Watson® Tone Analyzer` uses linguistic analysis to detect emotional and language tones in written text. An API call is made to IBM on the text that is inputted with the `Speech-to-text` and then perform analysis on that text, which then displays the emotion and tone conveyed in the sentence.

<!-- FEATURES AND FUNCTIONALITY-->
## Features and Functionality

### Features

### Speak
![image2][image2]
Using the `text-to-speech` AI the user has the ability to type in the textbox what they want Explain Life to say out loud, expression their emotions in difficult social interaction. The `speak` features is to assist the user with communication, and minimise anxiety and stress in social interaction.

### Record & IBM Tone Analysis
![image3][image3]
Using the `speech-to-text` AI the user can record a sentence while in a social conversation/interaction. Thereafter making an API call to the `IBM Tone Analyzer` services to analyse the text that was inputted through speech, and provide what emotion/tone was conveyed in the user's sentence. The `record & IBM tone analysis` feature is used in Explain Life to assist autism spectrum disorder users to better understand emotions that other people are conveying in their sentences.

### Emotion Expression
![image4][image4]
Using the `text-to-speech` AI the user can click on any of the emotion cards, which Explain Life then reads out loud how the user is feeling.

### Secure Firebase Authentication
![image5][image5]
Secure log in and register with email, password, and fullname with forget password functionality.

### Full Onboarding
![image6][image6]
A full onboarding upon first time launch, which explains the core features of Explain Life.

### Edit Profile Details
![image7][image7]
Edit your username, and authentication email, with which you use to sign in to Explain Life.

### Settings
![image8][image8]
In the settings, there are links to donate to `Autism South Africa`, as well as a link to how to come in contact with `Autism South Africa`. The user also has the ability to `reset settings` which resets that the onboarding shows again and it signs the user out.

### Functionality

* `Firestore Database` for storing the user info, which include the email, and fullname.
* `Firebase Authentication` for secure email & password log in (with forget password functionality).
* `Cocoapods` for dependency management and adding additional frameworks and SDK's.
* `ScrollView`, `HStack, VStack`, `ZStack` were used for creating layouts.
* `IBMWatsonToneAnalyzerV3` was the pod used to be able to make use of the IBM Tone Analyzer.
* `SwiftyJSON` was the pod/library that helps to read and process JSON data from an API/Server.
* `Alamofire` was the pod used as an elegant and composable way to interface to HTTP network requests.
* `@EnviromentObjects`, `@State`, `@StateObject`, `@ObservedObject` for linking functions and files.

<!-- CONCEPT PROCESS -->
## Concept Process

The `Conceptual Process` is the set of actions, activities and research that was done when starting this project.

### Ideation

![image9][image9]
![image10][image10]

### Wireframes

![image11][image11]
![image12][image12]

<!-- DEVELOPMENT PROCESS -->
## Development Process

The `Development Process` is the technical implementations and functionality done in the backend of the application.

### Implementation Process

#### Design Architecture
`MVC` design architecture used for structuring Explain Life.

#### Highlights

* The biggest highlight for Explain Life was all the `research` that went into every single aspect of the application 🤩.
* One major highlight was getting the `Firebase database and authentication` working.
* Adding the ability to `forget and reset` your password 😅.
* The `UI/UX design` that was based of a persona for the specific autism spectrum disorder audience.
* `Custom Validation` on the sign in and register views.
* Another major highlight was integrating all the `AI` functionality, and combine them as well 👏.

#### Challenges

* One major challenge was understanding how to `integrate` three different types of `AI`.
* There being a bug that the user does provide access to the microphone, but at random times it does not record.
* Working the JSON data that came from the `IBM Tone Analysis` service.

### Reviews & Testing
The `Reviews & Testing` was done through a video demonstration, and a [google form](https://docs.google.com/forms/d/e/1FAIpQLSfz-dFn4cGXI4CwV6LxrW7zbguTB1BggnUeVl6zPYn6F8utEQ/viewform?usp=sf_link) with questions related to the application.

#### Feedback from Reviews
`Peer Reviews` were conducted by my fellow students and lecturer. The following feedback I found useful:

* "Yes, the use of light colours and white space makes the application seem very clear and non-distracting".
* "I think the design is made in such a way that its very easy to understand and take in upon entering the app. The largeness of the shapes just works really well with the whole "easy" part of the app".
* "Text-to-speech already works well, perhaps have a small animation play as the text is being read back.".
* "Maybe when the user is recording their speech, the "click to record" could change to "recording.." or something just to indicate even more clearly it is happening".
* "Love the use of emojis, will be relatable to the users. Maybe just use colours as well to display mood".
* "The application could remember your name and previous moods, and ask if you are feeling different from previously. It could also prompt you to explain why you are feeling a certain way".

#### Future Implementation

* One simple but important future functionality would be to host the application on the `iOS Store`.
* Adding the ability to `change the voice accent` to another person in the settings.
* Creating and integrating a web dashboard for parents to view data tracked within the Explain Life mobile application.

<!-- MOCKUPS -->
## Final Outcome

### Mockups

![image13][image13]
![image14][image14]

<!-- VIDEO DEMONSTRATION -->
## Video Demonstration

To see a run through of the application, click below:

[View Demonstration](https://youtu.be/eIQ_HKjL-sU)

<!-- PROMO VIDEO -->
## Promotional Video

To see the promotiomal video, click below:

[View Promotional Video](https://youtu.be/0tQjp039dK4)

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/dylandasilva1999/explain-life-ios-app/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what makes the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- AUTHORS -->
## Authors

* **Dylan da Silva** - [DylandaSilva](https://github.com/dylandasilva1999)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.\

<!-- LICENSE -->
## Contact

* **Dylan da Silva** - [@dylandasilva.designs](https://www.instagram.com/dylandasilva.designs/) - dylandasilva.b@gmail.com
* **Project Link** - https://github.com/dylandasilva1999/explain-life-ios-app

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [My lecturer Armand Pretorius](https://github.com/ArmandPretorius)
* [Sign In & Sign Up](https://www.youtube.com/watch?v=GiCTgsH0dtk&t=715s)
* [Custom Fonts](https://www.simpleswiftguide.com/how-to-use-custom-fonts-in-swift-ios-app-using-swiftui/)
* [Speech-to-Text Assist](https://www.youtube.com/watch?v=5O4Zun7iIHc)
* [Text-to-Speech Assist](https://www.youtube.com/watch?v=NPKH8cfAcLY&t=384s)

<!-- MARKDOWN LINKS & IMAGES -->
<!--[image1]: Images/Image1.png-->

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/dylan-da-silva-72b56a20a/
[instagram-shield]: https://img.shields.io/badge/-Instagram-black.svg?style=flat-square&logo=instagram&colorB=555
[instagram-url]: https://www.instagram.com/dylandasilva.designs/
[behance-shield]: https://img.shields.io/badge/-Behance-black.svg?style=flat-square&logo=behance&colorB=555
[behance-url]: https://www.behance.net/dylandasilva_

<!-- MARKDOWN LINKS & IMAGES -->
[image1]: Images/Image1.png
[image2]: Images/Image2.png
[image3]: Images/Image3.png
[image4]: Images/Image4.png
[image5]: Images/Image5.png
[image6]: Images/Image6.png
[image7]: Images/Image7.png
[image8]: Images/Image8.png
[image9]: Images/Image9.png
[image10]: Images/Image10.png
[image11]: Images/Image11.png
[image12]: Images/Image12.png
[image13]: Images/Image13.jpg
[image14]: Images/Image14.jpg
