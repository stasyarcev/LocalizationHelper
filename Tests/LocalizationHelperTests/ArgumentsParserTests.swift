@testable import LocalizationHelper

import XCTest

final class ArgumentsParserTests: XCTestCase {
    private var argumentsParser: ArgumentsParser!

    override func setUp() {
        super.setUp()
        argumentsParser = ArgumentsParser()
    }
    
    override func tearDown() {
        argumentsParser = nil
        super.tearDown()
    }

    func testSearchWithKey() throws {
        let result = argumentsParser.parsing(["search", "-k", "day"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .search(let key, let language):
                    XCTAssertEqual(key, "day")
                    XCTAssertEqual(language, nil)

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testSearchWithLanguage() throws {
        let result = argumentsParser.parsing(["search", "-l", "en"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .search(let key, let language):
                    XCTAssertEqual(key, nil)
                    XCTAssertEqual(language, "en")

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testSearchWithKeyLanguage() throws {
        let result = argumentsParser.parsing(["search", "-k", "hello", "-l", "en"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .search(let key, let language):
                    XCTAssertEqual(key, "hello")
                    XCTAssertEqual(language, "en")

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testSearchWithoutKeyLanguage() throws {
        let result = argumentsParser.parsing(["search"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .search(let key, let language):
                    XCTAssertEqual(key, nil)
                    XCTAssertEqual(language, nil)

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testDeleteWithKey() throws {
        let result = argumentsParser.parsing(["delete", "-k", "day"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .delete(let key, let language):
                    XCTAssertEqual(key, "day")
                    XCTAssertEqual(language, nil)

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testDeleteWithLanguage() throws {
        let result = argumentsParser.parsing(["delete", "-l", "en"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .delete(let key, let language):
                    XCTAssertEqual(key, nil)
                    XCTAssertEqual(language, "en")

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testDeleteWithKeyLanguage() throws {
        let result = argumentsParser.parsing(["delete", "-k", "day", "-l", "en"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .delete(let key, let language):
                    XCTAssertEqual(key, "day")
                    XCTAssertEqual(language, "en")

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testDeleteWithoutKeyLanguage() throws {
        let result = argumentsParser.parsing(["delete"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .delete(let key, let language):
                    XCTAssertEqual(key, nil)
                    XCTAssertEqual(language, nil)

                default:
                    XCTFail()
                }
            case .failure(_):
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testUpdate() throws {
        let result = argumentsParser.parsing(["update", "день", "-k", "day", "-l", "ru"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .update(let word, let key, let language):
                    XCTAssertEqual(word, "день")
                    XCTAssertEqual(key, "day")
                    XCTAssertEqual(language, "ru")

                default:
                    XCTFail()
                }
                case .failure(_):
                    XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testUpdateWithoutWordKeyLanguage() throws {
        let result = argumentsParser.parsing(["update"])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .update(let word, let key, let language):
                    XCTAssertEqual(word, nil)
                    XCTAssertEqual(key, nil)
                    XCTAssertEqual(language, nil)

                default:
                    XCTFail()
                }
                case .failure(_):
                    XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testHelp() throws {
        let result = argumentsParser.parsing([])

        switch result {
            case .success(let arguments):
                switch arguments {
                case .help(let message):
                    XCTAssertEqual(message, "-h")

                default:
                    XCTFail()
                }
                case .failure(_):
                    XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }
    
    func testWithoutArguments() throws {
            
            let arguments = argumentsParser.parsing([])

            switch arguments {
                case .failure(.commandNotFound(let text)):
                    XCTAssertEqual(text, ArgumentsParserError.commandNotFound(text: "error").errorDescription)
                default:
                    XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
            }
        }
    
    static var allTests = [
        ("testSearchWithKey", testSearchWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithKeyLanguage", testSearchWithKeyLanguage),
        ("testSearchWithoutKeyLanguage", testSearchWithoutKeyLanguage),
        ("testDeleteWithKey", testDeleteWithKey),
        ("testDeleteWithLanguage", testDeleteWithLanguage),
        ("testDeleteWithKeyLanguage", testDeleteWithKeyLanguage),
        ("testDeleteWithoutKeyLanguage", testDeleteWithoutKeyLanguage),
        ("testUpdate", testUpdate),
        ("testUpdateWithoutWordKeyLanguage", testUpdateWithoutWordKeyLanguage),
        ("testHelp", testHelp),
        ("testWithoutArguments", testWithoutArguments)
    ]
}
