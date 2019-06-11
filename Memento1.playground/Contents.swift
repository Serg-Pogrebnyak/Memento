import UIKit

class TextEditor {
    private var arrayOfStory = [Memento]()
    private var text = ""
    
    func addText(_ someText: String) {
        self.text += someText
    }
    
    func printText() {
        print("\(text)")
    }
    
    func save() {
        self.arrayOfStory.append(Memento(text: self.text))
    }
    
    func restore() {
        let removeLast = self.arrayOfStory.removeLast()
        self.text = removeLast.text
    }
    
    func getDescOfSave() -> String {
        var returnString = ""
        for history in arrayOfStory {
            returnString = returnString + "text: " +  history.text + " time: " + history.date.description + "\n"
        }
        return returnString
    }
    
    struct Memento {
        var text: String
        
        var date: Date
        
        init(text: String) {
            self.text = text
            self.date = Date()
        }
    }
}

var myText = TextEditor()
myText.addText("Hello")
myText.save()
myText.printText()
myText.addText(" World")
myText.save()
myText.printText()
myText.addText(" :)")
myText.save()
myText.printText()
print("--- in history was save ---")
print(myText.getDescOfSave())
print("---start restore---")
myText.restore()
myText.printText()
myText.restore()
myText.printText()
myText.restore()
myText.printText()
