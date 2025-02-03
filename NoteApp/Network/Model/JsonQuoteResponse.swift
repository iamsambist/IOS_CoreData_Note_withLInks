import Foundation

struct JsonQuoteResponse : Codable {
	let quotes : [Quotes]?
	let total : Int?
	let skip : Int?
	let limit : Int?

	enum CodingKeys: String, CodingKey {

		case quotes = "quotes"
		case total = "total"
		case skip = "skip"
		case limit = "limit"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		quotes = try values.decodeIfPresent([Quotes].self, forKey: .quotes)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		skip = try values.decodeIfPresent(Int.self, forKey: .skip)
		limit = try values.decodeIfPresent(Int.self, forKey: .limit)
	}

}
