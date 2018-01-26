# CapsuleView
An easy to use drop-in view to create a beautiful card style effect with a title placeholder and body content.


  - Supports IBDesignable
  - Full controls available in storyboard
  - Can be used programatically 
  - Swift 3.0 + support
  
 
 ![Gif](
https://github.com/umarF/capsuleview/blob/master/screenshots/CapsuleView_Demo.gif)

 
 
## Features
 
 - Set capsule background
 - Set Place holder and content text
 - Set Place holder and content text allignment
 - Set Place holder and content text size
 - Set Shadow and corner radius
 - A handy cross button with toggle option

 
## How to install


- Drag and drop the two files CapsuleView Files namely, CapsuleView.swift & CapsuleView.xib into your project.


## How to use (Storyboard)


- Open storyboard, select the view you want to customize and change it's custom class to CapsuleView as shown:


 ![storyboard](
https://github.com/umarF/capsuleview/blob/master/screenshots/Screen%20Shot%202018-01-25%20at%206.51.54%20PM.png)


- Make changes to the view in storyboard

- Open your viewcontroller, create an outlet to the selected view and call the setupView() method as shown:


 ![storyboard](
https://github.com/umarF/capsuleview/blob/master/screenshots/Screen%20Shot%202018-01-26%20at%2014.54.05.png)


### Result

<img src="https://github.com/umarF/capsuleview/blob/master/screenshots/Simulator%20Screen%20Shot%20-%20iPhone%207%20-%202018-01-25%20at%2018.03.45.png" width="350">



## How to use (Programatically)

- Just use the helper init method to set the view and make the customization.
- Add the capsule view to your view as shown below:

```

//MARK: Use for adding view dynamically
 let capsuleViewFrame = CGRect(x: 50, y: 200, width: 300, height: 300)
 let capsuleView = CapsuleView(placeholderText: "Address", contentText: "31st street,\nPark Avenue,\n 46/6,\n New York,\n USA", cardColor: UIColor(red: 0.075, green: 0.561, blue: 0.325, alpha: 1.00), textColor: UIColor.white, shadowColor: UIColor.darkGray, shadowOpacity: 9, shadowRadius: 9, cardRadius: 9, shadowOffset: CGSize(width: 0, height: 0), textAllignment: 1, showCross: false, viewFrame: capsuleViewFrame,placeHolderSize:4,titleSize: 3)
 self.view.addSubview(capsuleView)
 self.view.bringSubview(toFront: capsuleView)

```
  
### Result


<img src="https://github.com/umarF/capsuleview/blob/master/screenshots/Simulator%20Screen%20Shot%20-%20iPhone%207%20-%202018-01-25%20at%2018.21.02.png" width="350">
  









# Full Demo (YoutTube)

[![YouTube](https://github.com/umarF/capsuleview/blob/master/screenshots/CapsuleView_Demo.gif)](https://youtu.be/Ddb_4WS22Cs)
