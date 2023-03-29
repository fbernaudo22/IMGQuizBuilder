# IMGQuizBuilder

IMGQuizBuilder is a package wich contains a custom UIViewController built to 
create a simple Image quiz game with your own questions.

## How it works

The package, as I previous said, consists of a custom *UIViewController* called 
*QuizViewController*. You can use it to create your own Image quiz.
*QuizViewController* has the following properties and methods:
- **quizElements** : this is an array of *String* where you can put the answers related to the images.
They must have the same name of the related images you will put in the assets.
- **quizTitle** : the quiz title. It's optional.
- **answer1**, **answer2**, **answer3** : these are the possible answers, of type *UIButton*.
- **quizImage**: This is the image that will be displayed as question. it is an *UIImageView*.
- **askQuestion()** : This method built the question. Please see the comments on the code for details about how it works specifically.
- **setButtonTags()** : This method sets the correct tags for the buttons.
- **answerSelection(sender: UIButton)** : This function checks if the answer is correct or not, and displays the result with an alert.

## Best Practicies

When you ovverride the *ViewDidLoad()* ,please initialize the buttons/answers first, and then call the *askQuestion()* function, as displayed in this example:

![example](/example.png)




