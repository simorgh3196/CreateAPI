// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct Order: Decodable {
    public var isComplete: Bool?
    public var id: Int?
    public var petID: Int?
    public var quantity: Int?
    public var shipDate: Date?
    /// Order Status
    public var status: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isComplete = try values.decodeIfPresent(Bool.self, forKey: "complete")
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.petID = try values.decodeIfPresent(Int.self, forKey: "petId")
        self.quantity = try values.decodeIfPresent(Int.self, forKey: "quantity")
        self.shipDate = try values.decodeIfPresent(Date.self, forKey: "shipDate")
        self.status = try values.decodeIfPresent(String.self, forKey: "status")
    }
}

public struct Category: Decodable {
    public var id: Int?
    public var name: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
    }
}

public struct User: Decodable {
    public var email: String?
    public var firstName: String?
    public var id: Int?
    public var lastName: String?
    public var password: String?
    public var phone: String?
    /// User Status
    public var userStatus: Int?
    public var username: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.email = try values.decodeIfPresent(String.self, forKey: "email")
        self.firstName = try values.decodeIfPresent(String.self, forKey: "firstName")
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.lastName = try values.decodeIfPresent(String.self, forKey: "lastName")
        self.password = try values.decodeIfPresent(String.self, forKey: "password")
        self.phone = try values.decodeIfPresent(String.self, forKey: "phone")
        self.userStatus = try values.decodeIfPresent(Int.self, forKey: "userStatus")
        self.username = try values.decodeIfPresent(String.self, forKey: "username")
    }
}

public struct Tag: Decodable {
    public var id: Int?
    public var name: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
    }
}

public struct Pet: Decodable {
    public var category: Category?
    public var id: Int?
    /// Example: doggie
    public var name: String
    public var photoURLs: [String]
    /// Pet status in the store
    public var status: String?
    public var tags: [Tag]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.category = try values.decodeIfPresent(Category.self, forKey: "category")
        self.id = try values.decodeIfPresent(Int.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.photoURLs = try values.decode([String].self, forKey: "photoUrls")
        self.status = try values.decodeIfPresent(String.self, forKey: "status")
        self.tags = try values.decodeIfPresent([Tag].self, forKey: "tags")
    }
}

public struct APIResponse: Decodable {
    public var code: Int?
    public var message: String?
    public var type: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.code = try values.decodeIfPresent(Int.self, forKey: "code")
        self.message = try values.decodeIfPresent(String.self, forKey: "message")
        self.type = try values.decodeIfPresent(String.self, forKey: "type")
    }
}

/// Model for testing reserved words
public struct Return: Decodable {
    public var `return`: Int?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.return = try values.decodeIfPresent(Int.self, forKey: "return")
    }
}

/// Model for testing model name same as property name
public struct Name: Decodable {
    public var _123Number: Int?
    public var name: Int
    public var property: String?
    public var snakeCase: Int?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self._123Number = try values.decodeIfPresent(Int.self, forKey: "123Number")
        self.name = try values.decode(Int.self, forKey: "name")
        self.property = try values.decodeIfPresent(String.self, forKey: "property")
        self.snakeCase = try values.decodeIfPresent(Int.self, forKey: "snake_case")
    }
}

/// Model for testing model name starting with number
public struct _200Response: Decodable {
    public var `class`: String?
    public var name: Int?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.class = try values.decodeIfPresent(String.self, forKey: "class")
        self.name = try values.decodeIfPresent(Int.self, forKey: "name")
    }
}

/// Model for testing model with "_class" property
public struct ClassModel: Decodable {
    public var `class`: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.class = try values.decodeIfPresent(String.self, forKey: "_class")
    }
}

public struct Dog: Decodable {
    public var animal: Animal
    public var breed: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.animal = try Animal(from: decoder)
        self.breed = try values.decodeIfPresent(String.self, forKey: "breed")
    }
}

public struct Cat: Decodable {
    public var animal: Animal
    public var isDeclawed: Bool?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.animal = try Animal(from: decoder)
        self.isDeclawed = try values.decodeIfPresent(Bool.self, forKey: "declawed")
    }
}

public struct Animal: Decodable {
    public var className: String
    public var color: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.className = try values.decode(String.self, forKey: "className")
        self.color = try values.decodeIfPresent(String.self, forKey: "color")
    }
}

public struct FormatTest: Decodable {
    public var binary: String?
    public var byte: String
    public var date: String
    public var dateTime: Date?
    public var double: Double?
    public var float: Double?
    public var int32: Int?
    public var int64: Int?
    public var integer: Int?
    public var number: Double
    public var password: String
    public var string: String?
    public var uuid: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.binary = try values.decodeIfPresent(String.self, forKey: "binary")
        self.byte = try values.decode(String.self, forKey: "byte")
        self.date = try values.decode(String.self, forKey: "date")
        self.dateTime = try values.decodeIfPresent(Date.self, forKey: "dateTime")
        self.double = try values.decodeIfPresent(Double.self, forKey: "double")
        self.float = try values.decodeIfPresent(Double.self, forKey: "float")
        self.int32 = try values.decodeIfPresent(Int.self, forKey: "int32")
        self.int64 = try values.decodeIfPresent(Int.self, forKey: "int64")
        self.integer = try values.decodeIfPresent(Int.self, forKey: "integer")
        self.number = try values.decode(Double.self, forKey: "number")
        self.password = try values.decode(String.self, forKey: "password")
        self.string = try values.decodeIfPresent(String.self, forKey: "string")
        self.uuid = try values.decodeIfPresent(String.self, forKey: "uuid")
    }
}

public struct EnumTest: Decodable {
    public var enumInteger: Int?
    public var enumNumber: Double?
    public var enumString: String?
    public var outerEnum: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enumInteger = try values.decodeIfPresent(Int.self, forKey: "enum_integer")
        self.enumNumber = try values.decodeIfPresent(Double.self, forKey: "enum_number")
        self.enumString = try values.decodeIfPresent(String.self, forKey: "enum_string")
        self.outerEnum = try values.decodeIfPresent(String.self, forKey: "outerEnum")
    }
}

public struct AdditionalPropertiesClass: Decodable {
    public var mapOfMapProperty: [String: [String: String]]?
    public var mapProperty: [String: String]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.mapOfMapProperty = try values.decodeIfPresent([String: [String: String]].self, forKey: "map_of_map_property")
        self.mapProperty = try values.decodeIfPresent([String: String].self, forKey: "map_property")
    }
}

public struct MixedPropertiesAndAdditionalPropertiesClass: Decodable {
    public var dateTime: Date?
    public var map: [String: Animal]?
    public var uuid: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.dateTime = try values.decodeIfPresent(Date.self, forKey: "dateTime")
        self.map = try values.decodeIfPresent([String: Animal].self, forKey: "map")
        self.uuid = try values.decodeIfPresent(String.self, forKey: "uuid")
    }
}

public struct List: Decodable {
    public var _123List: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self._123List = try values.decodeIfPresent(String.self, forKey: "123-list")
    }
}

public struct Client: Decodable {
    public var client: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.client = try values.decodeIfPresent(String.self, forKey: "client")
    }
}

public struct ReadOnlyFirst: Decodable {
    public var bar: String?
    public var baz: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.bar = try values.decodeIfPresent(String.self, forKey: "bar")
        self.baz = try values.decodeIfPresent(String.self, forKey: "baz")
    }
}

public struct HasOnlyReadOnly: Decodable {
    public var bar: String?
    public var foo: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.bar = try values.decodeIfPresent(String.self, forKey: "bar")
        self.foo = try values.decodeIfPresent(String.self, forKey: "foo")
    }
}

public struct Capitalization: Decodable {
    /// Name of the pet
    public var attName: String?
    public var capitalCamel: String?
    public var capitalSnake: String?
    public var sCAETHFlowPoints: String?
    public var smallCamel: String?
    public var smallSnake: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.attName = try values.decodeIfPresent(String.self, forKey: "ATT_NAME")
        self.capitalCamel = try values.decodeIfPresent(String.self, forKey: "CapitalCamel")
        self.capitalSnake = try values.decodeIfPresent(String.self, forKey: "Capital_Snake")
        self.sCAETHFlowPoints = try values.decodeIfPresent(String.self, forKey: "SCA_ETH_Flow_Points")
        self.smallCamel = try values.decodeIfPresent(String.self, forKey: "smallCamel")
        self.smallSnake = try values.decodeIfPresent(String.self, forKey: "small_Snake")
    }
}

public struct MapTest: Decodable {
    public var mapMapOfString: [String: [String: String]]?
    public var mapOfEnumString: [String: String]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.mapMapOfString = try values.decodeIfPresent([String: [String: String]].self, forKey: "map_map_of_string")
        self.mapOfEnumString = try values.decodeIfPresent([String: String].self, forKey: "map_of_enum_string")
    }
}

public struct ArrayTest: Decodable {
    public var arrayArrayOfInteger: [[Int]]?
    public var arrayArrayOfModel: [[ReadOnlyFirst]]?
    public var arrayOfString: [String]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.arrayArrayOfInteger = try values.decodeIfPresent([[Int]].self, forKey: "array_array_of_integer")
        self.arrayArrayOfModel = try values.decodeIfPresent([[ReadOnlyFirst]].self, forKey: "array_array_of_model")
        self.arrayOfString = try values.decodeIfPresent([String].self, forKey: "array_of_string")
    }
}

public struct NumberOnly: Decodable {
    public var justNumber: Double?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.justNumber = try values.decodeIfPresent(Double.self, forKey: "JustNumber")
    }
}

public struct ArrayOfNumberOnly: Decodable {
    public var arrayNumber: [Double]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.arrayNumber = try values.decodeIfPresent([Double].self, forKey: "ArrayNumber")
    }
}

public struct ArrayOfArrayOfNumberOnly: Decodable {
    public var arrayArrayNumber: [[Double]]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.arrayArrayNumber = try values.decodeIfPresent([[Double]].self, forKey: "ArrayArrayNumber")
    }
}

public struct EnumArrays: Decodable {
    public var arrayEnum: [String]?
    public var justSymbol: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.arrayEnum = try values.decodeIfPresent([String].self, forKey: "array_enum")
        self.justSymbol = try values.decodeIfPresent(String.self, forKey: "just_symbol")
    }
}

public struct ContainerA: Decodable {
    public var child: Child?
    public var refChild: AnyJSON

    public struct Child: Decodable {
        public var child: Child
        public var `enum`: String
        public var renameMe: String

        public struct Child: Decodable {
            public var `enum`: String
            public var renameMe: String

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.enum = try values.decode(String.self, forKey: "enum")
                self.renameMe = try values.decode(String.self, forKey: "rename-me")
            }
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.child = try values.decode(Child.self, forKey: "child")
            self.enum = try values.decode(String.self, forKey: "enum")
            self.renameMe = try values.decode(String.self, forKey: "rename-me")
        }
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.child = try values.decodeIfPresent(Child.self, forKey: "child")
        self.refChild = try values.decode(AnyJSON.self, forKey: "refChild")
    }
}

public struct ContainerB: Decodable {
    public var child: Child

    public struct Child: Decodable {
        public var child: Child
        public var `enum`: String
        public var renameMe: String

        public struct Child: Decodable {
            public var `enum`: String
            public var renameMe: String

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.enum = try values.decode(String.self, forKey: "enum")
                self.renameMe = try values.decode(String.self, forKey: "rename-me")
            }
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.child = try values.decode(Child.self, forKey: "child")
            self.enum = try values.decode(String.self, forKey: "enum")
            self.renameMe = try values.decode(String.self, forKey: "rename-me")
        }
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.child = try values.decode(Child.self, forKey: "child")
    }
}

public struct ContainerC: Decodable {
    public var child: Child

    public struct Child: Decodable {
        public var `enum`: String
        public var renameMe: String

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.enum = try values.decode(String.self, forKey: "enum")
            self.renameMe = try values.decode(String.self, forKey: "rename-me")
        }
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.child = try values.decode(Child.self, forKey: "child")
    }
}


public enum AnyJSON: Equatable {
    case string(String)
    case number(Double)
    case object([String: AnyJSON])
    case array([AnyJSON])
    case bool(Bool)

    var value: Any {
        switch self {
        case .string(let string): return string
        case .number(let double): return double
        case .object(let dictionary): return dictionary
        case .array(let array): return array
        case .bool(let bool): return bool
        }
    }
}

extension AnyJSON: Codable {
    public func encode(to encoder: Encoder) throws {

        var container = encoder.singleValueContainer()

        switch self {
        case let .array(array):
            try container.encode(array)
        case let .object(object):
            try container.encode(object)
        case let .string(string):
            try container.encode(string)
        case let .number(number):
            try container.encode(number)
        case let .bool(bool):
            try container.encode(bool)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let object = try? container.decode([String: AnyJSON].self) {
            self = .object(object)
        } else if let array = try? container.decode([AnyJSON].self) {
            self = .array(array)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let number = try? container.decode(Double.self) {
            self = .number(number)
        } else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: decoder.codingPath, debugDescription: "Invalid JSON value.")
            )
        }
    }
}

extension AnyJSON: CustomDebugStringConvertible {

    public var debugDescription: String {
        switch self {
        case .string(let str):
            return str.debugDescription
        case .number(let num):
            return num.debugDescription
        case .bool(let bool):
            return bool.description
        default:
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted]
            return try! String(data: encoder.encode(self), encoding: .utf8)!
        }
    }
}
struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
    private let string: String
    private var int: Int?

    var stringValue: String { return string }

    init(string: String) {
        self.string = string
    }

    init?(stringValue: String) {
        self.string = stringValue
    }

    var intValue: Int? { return int }

    init?(intValue: Int) {
        self.string = String(describing: intValue)
        self.int = intValue
    }

    init(stringLiteral value: String) {
        self.string = value
    }
}
