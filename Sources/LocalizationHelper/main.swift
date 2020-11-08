import ArgumentParser
import Foundation

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentParser()
    }
    var runArguments: RunArgumentsProtocol {
        return RunArguments()
    }
}

func main() {
    let container = Container()
    let parser = container.argumentsParser
    let runner = container.runArguments
    
    guard let arguments = parser.parsing() else {
        return
    }
    
    runner.run(arguments)
}

main()


