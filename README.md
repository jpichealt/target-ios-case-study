# Joseph Piché’s Response for Target iOS Case Study

### Setup

This project now includes Alamofire And AlamofireImage dependencies via cocoapods. The `Pods` directory is committed to the repo, so the project should build and run without running any cocoapods commands after pulling it down.

# Target iOS Case Study


You have been given an proof-of-concept iOS project that displays, simply, a list of things. Your goal is to expand on the app to display a list of deals currently offered by Target, and to provide additional detailed information on those deals. 

##### Instructions

1. Fix up the deals list to (as best as you can) match the mockups shown in DealsList.png.
2. Instead of displaying an alert when a deal is selected, instead present a new view that displays details on the view. Use the mockups shown in DealsDetails.png.
3. The deals are currently hardcoded. Use the API at https://api.target.com/mobile_case_study_deals/v1 to grab the real deals to display in the app.
4. Do something interesting! Add something to the app you think can really make it fun to use.

##### Some guidelines

- This project uses a light but powerful presentation framework called "Tempo". 
> **Do your best to read, understand, and adapt the pattern. If you find it too involved or time consuming, continue the example utilizing whichever pattern you are comfortable with.**

- Feel free to use any open source software you feel helps development. Treat this app as something you control technically.
- Do your best to follow modern iOS conventions and write clean, performant, and extensible code. Imagine that this app will continue to grow.
- Be sure the app looks great on all iPhone sizes!
