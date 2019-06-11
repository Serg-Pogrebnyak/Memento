import UIKit

class TextEditor {
    private var text = ""
    
    func addText(_ someText: String) {
        self.text += someText
    }
    
    func printText() {
        print("\(text)")
    }
    
    func save() -> Memento {
        return ConcreteMemento(text: self.text)
    }
    
    func restore(memento: Memento) {
        self.text = memento.text
    }
}

protocol Memento {
    var text: String {get}
    var date: Date {get}
}

class ConcreteMemento: Memento {
    private(set) var text: String
    
    private(set) var date: Date
    
    init(text: String) {
        self.text = text
        self.date = Date()
    }
}

var historyEditorText = [Memento]()
var myText = TextEditor()
historyEditorText.append(myText.save())
myText.addText("Hello")
print(myText.printText())
historyEditorText.append(myText.save())
myText.addText(" world")
print(myText.printText())
historyEditorText.append(myText.save())
myText.addText(" :)")
print(myText.printText())
historyEditorText.append(myText.save())
print("saved story")
for history in historyEditorText {
    print(history.text, history.date)
}
print("---start restore text---")
myText.restore(memento: historyEditorText.last!)
historyEditorText.remove(at: historyEditorText.count-1)
print(myText.printText())
myText.restore(memento: historyEditorText.last!)
historyEditorText.remove(at: historyEditorText.count-1)
print(myText.printText())
myText.restore(memento: historyEditorText.last!)
historyEditorText.remove(at: historyEditorText.count-1)
print(myText.printText())
