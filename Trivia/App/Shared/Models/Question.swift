import Foundation

struct Question: Codable{
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}


//struct Question: Codable {
//    var question: String
//    var answer: Bool
//}
//
//final class Contenido {
//    static let shared = Contenido()
//
//    private init() {}
//
//    func getQuestions() -> [Question] {
//        return [
//            Question(question: "10 * 85 = 850", answer: true),
//            Question(question: "Messi es el mejor del mundo?", answer: true),
//            Question(question: "Ejemplo 1", answer: false),
//            Question(question: "Ejemplo 2", answer: true),
//            Question(question: "Ejemplo 3", answer: false),
//            Question(question: "Ejemplo 4", answer: true),
//            Question(question: "Ejemplo 5", answer: false),
//        ]
//    }
//}


