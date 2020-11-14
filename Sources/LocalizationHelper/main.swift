import ArgumentParser
import Foundation

class Container {
    
    private lazy var parser = ArgumentParser()
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

func main() {
    let container = Container()
    let arguments = container.argumentsParser.parsing()
    
    if case .search(let key, let language) = arguments {
        container.search.searching(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        container.update.updating(word: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        container.delete.deleting(key: key, language: language)
    } else if case .help(let help) = arguments {
        container.terminal.output(word: help)
    }
    
}

main()


