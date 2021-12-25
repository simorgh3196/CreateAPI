// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get

extension Paths {
    public static var testPrimitive: TestPrimitive {
        TestPrimitive(path: "/form/test-primitive")
    }

    public struct TestPrimitive {
        /// Path: `/form/test-primitive`
        public let path: String

        /// Test passing primitive query parameters
        public func get(parameters: GetParameters) -> Request<Void> {
            .get(path, query: parameters.asQuery)
        }

        public struct GetParameters {
            public var id: Int?
            public var id2: Int
            public var id3: Int

            public init(id: Int? = nil, id2: Int, id3: Int) {
                self.id = id
                self.id2 = id2
                self.id3 = id3
            }

            public var asQuery: [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("id", id)
                query.addQueryItem("id2", id2)
                query.addQueryItem("id3", id3)
                return query
            }
        }

        /// Inlining simple queries
        public func post(name: String) -> Request<Void> {
            .post(path, query: makePostQuery(name))
        }

        private func makePostQuery(_ name: String) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("name", name)
            return query
        }

        /// Inlining more complex queries (with an enum)
        public func patch(type: `Type`) -> Request<Void> {
            .patch(path, query: makePatchQuery(type))
        }

        private func makePatchQuery(_ type: `Type`) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("type", type)
            return query
        }

        public enum `Type`: String, Codable, CaseIterable {
            case cat
            case dog
        }
    }
}

extension Paths {
    public static var testArray: TestArray {
        TestArray(path: "/form/test-array")
    }

    public struct TestArray {
        /// Path: `/form/test-array`
        public let path: String

        /// Form Array Explode True
        public func get(type: [String]) -> Request<Void> {
            .get(path, query: makeGetQuery(type))
        }

        private func makeGetQuery(_ type: [String]) -> [(String, String?)] {
            var query: [(String, String?)] = []
            type.forEach { query.addQueryItem("type", $0) }
            return query
        }

        /// Form Array Explode False
        public func post(type: [String]) -> Request<Void> {
            .post(path, query: makePostQuery(type))
        }

        private func makePostQuery(_ type: [String]) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("type", type.map(\.asQueryValue).joined(separator: ","))
            return query
        }
    }
}

extension Paths {
    public static var testObject: TestObject {
        TestObject(path: "/form/test-object")
    }

    public struct TestObject {
        /// Path: `/form/test-object`
        public let path: String

        /// Form Object Explode True
        public func get(type: `Type`) -> Request<Void> {
            .get(path, query: makeGetQuery(type))
        }

        private func makeGetQuery(_ type: `Type`) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query += type.asQuery
            return query
        }

        public struct `Type`: Codable {
            public var id: String
            public var name: String?

            public init(id: String, name: String? = nil) {
                self.id = id
                self.name = name
            }

            public var asQuery: [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("id", id)
                query.addQueryItem("name", name)
                return query
            }
        }

        /// Form Object Explode False
        public func post(type: `Type`) -> Request<Void> {
            .post(path, query: makePostQuery(type))
        }

        private func makePostQuery(_ type: `Type`) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("type", type.asQuery.asCompactQuery)
            return query
        }
    }
}

public enum Paths {}

protocol QueryEncodable {
    var asQueryValue: String { get }
}

extension Bool: QueryEncodable {
    var asQueryValue: String {
        self ? "true" : "false"
    }
}

extension Date: QueryEncodable {
    var asQueryValue: String {
        ISO8601DateFormatter().string(from: self)
    }
}

extension Double: QueryEncodable {
    var asQueryValue: String {
        String(self)
    }
}

extension Int: QueryEncodable {
    var asQueryValue: String {
        String(self)
    }
}

extension Int32: QueryEncodable {
    var asQueryValue: String {
        String(self)
    }
}

extension Int64: QueryEncodable {
    var asQueryValue: String {
        String(self)
    }
}

extension String: QueryEncodable {
    var asQueryValue: String {
        self
    }
}

extension URL: QueryEncodable {
    var asQueryValue: String {
        absoluteString
    }
}

extension RawRepresentable where RawValue == String {
    var asQueryValue: String {
        rawValue
    }
}

extension Array where Element == (String, String?) {
    mutating func addQueryItem<T: RawRepresentable>(_ name: String, _ value: T?) where T.RawValue == String {
        addQueryItem(name, value?.rawValue)
    }
    
    mutating func addQueryItem(_ name: String, _ value: QueryEncodable?) {
        guard let value = value?.asQueryValue, !value.isEmpty else { return }
        append((name, value))
    }
    
    mutating func addDeepObject(_ name: String, _ query: [(String, String?)]) {
        for (key, value) in query {
            addQueryItem("\(name)[\(key)]", value)
        }
    }

    var asPercentEncodedQuery: String {
        var components = URLComponents()
        components.queryItems = self.map(URLQueryItem.init)
        return components.percentEncodedQuery ?? ""
    }
    
    // [("role", "admin"), ("name": "kean)] -> "role,admin,name,kean"
    var asCompactQuery: String {
        flatMap { [$0, $1] }.compactMap { $0 }.joined(separator: ",")
    }
}