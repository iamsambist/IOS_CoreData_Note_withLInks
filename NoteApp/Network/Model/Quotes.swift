
import Foundation
struct Quotes : Codable {
	let id : Int?
	let quote : String?
	let author : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case quote = "quote"
		case author = "author"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		quote = try values.decodeIfPresent(String.self, forKey: .quote)
		author = try values.decodeIfPresent(String.self, forKey: .author)
	}

}
