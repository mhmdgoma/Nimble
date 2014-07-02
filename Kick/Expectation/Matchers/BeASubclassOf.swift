import Foundation

func beASubclassOf(expectedClass: AnyClass) -> MatcherFunc<NSObject?> {
    return MatcherFunc { actualExpression, failureMessage in
        let instance = actualExpression.evaluate()
        if let validInstance = instance {
            failureMessage.actualValue = "<\(NSStringFromClass(validInstance.dynamicType)) instance>"
        } else {
            failureMessage.actualValue = "<nil>"
        }
        failureMessage.postfixMessage = "be a subclass of \(NSStringFromClass(expectedClass))"
        return instance && instance!.isKindOfClass(expectedClass)
    }
}
