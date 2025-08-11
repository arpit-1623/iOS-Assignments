import UIKit

// Model View Controller (MVC) Pattern

/*

# Introduction to MVC
    - Architecture Pattern
    - Models: Data structures that represent the data of the application.
    - Views: The user interface elements that display the data.
    - Controllers: The logic that connects the models and views, handling user input and updating the views accordingly.
 
# Types of Controllers
    - View Controllers
    - Model Controllers
    - Helper Controllers
    - Direct Communication between Models and Views cannot happen, Controllers are needed to mediate between them.
 
# Advantages of MVC
    - Separation of Concerns: Each component has a distinct responsibility, making it easier to manage and debug.
    - Reusability: Models and views can be reused across different parts of the application.
    - Scalability: The architecture can easily accommodate new features and changes without affecting the entire application.
    - Testability: Each component can be tested independently, improving the overall quality of the code.
 
# Structure
 - AppDelegate
 - SceneDelegate
 - /View Controllers
 - /Other Controllers
 - /Models
 - /Views
 
# Disadvantages of MVC :  View Controllers can become too large and complex, leading to "Massive View Controller" problem.
 
*/
