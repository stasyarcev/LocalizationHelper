import ArgumentParser
import Foundation

class Container {
    
    private lazy var parser = ArgumentsParser()
    private lazy var decoder = DecodeDictionary()
    private lazy var encoder = EncodeDictionary()
    private lazy var searher = Search(decoding: decoder, output: output)
    private lazy var deleter = Delete(decoding: decoder, encoding: encoder, output: output)
    private lazy var updater = Update(decoding: decoder, encoding: encoder, output: output)
    private lazy var output = Output()
    
    var argumentsParser: ArgumentsParserProtocol {
        parser
    }
    var decode: DecodeProtocol {
        decoder
    }
    var encode: EncodeProtocol {
        encoder
    }
    var update: UpdateProtocol {
        updater
    }
    var delete: DeleteProtocol {
        deleter
    }
    var search: SearchProtocol {
        searher
    }
    var terminal: OutputProtocol {
        output
    }
}

public func main() -> Int {
    let container = Container()
    let arguments = container.argumentsParser.parsing(nil)
    
    switch arguments {
    case .success(let value):
        switch value {
        case .search(let key, let language):
            let result = container.search.searching(key: key, language: language)
            switch result {
            case .success(.searchingSuccess):
                return 0
            case .failure(.notFound):
                return 3
            }
        case .update(let word, let key, let language):
            let result = container.update.updating(word: word, key: key, language: language)
            switch result {
            case .success(.updatingSuccess):
                return 0
            case .failure(.notFound):
                return 3
            }
        case .delete(let key, let language):
            let result = container.delete.deleting(key: key, language: language)
            switch result {
            case .success(.deletingSuccess):
                return 0
            case .failure(.notFound):
                return 3
            }
        case .help(let massage):
            container.terminal.output(word: massage)
            return 4
        }
        
    case .failure(let value):
        switch value {
        case .commandNotFound(let message):
            container.terminal.output(word: message)
            return 1
        case .parseError(let message):
            container.terminal.output(word: message)
            return 2
        }
    }
}


