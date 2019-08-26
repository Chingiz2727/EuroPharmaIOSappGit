//
//  SearchModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/13/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
// MARK: - SearchModule
class SearchModule: Codable {
    let hits: [Hit]?
    let nbPages: Int?
    let exhaustiveNbHits: Bool?
    let query: String?
    let processingTimeMS, hitsPerPage, page, nbHits: Int?
    let params: String?
    
    init(hits: [Hit]?, nbPages: Int?, exhaustiveNbHits: Bool?, query: String?, processingTimeMS: Int?, hitsPerPage: Int?, page: Int?, nbHits: Int?, params: String?) {
        self.hits = hits
        self.nbPages = nbPages
        self.exhaustiveNbHits = exhaustiveNbHits
        self.query = query
        self.processingTimeMS = processingTimeMS
        self.hitsPerPage = hitsPerPage
        self.page = page
        self.nbHits = nbHits
        self.params = params
    }
}

// MARK: - Hit
class Hit: Codable {
    let slug: String?
    let highlightResult: HighlightResult?
    let objectID, category, barcode, name: String?
    let tags: [String]?
    let manufacturer: String?
    
    enum CodingKeys: String, CodingKey {
        case slug
        case highlightResult = "_highlightResult"
        case objectID, category, barcode, name, tags, manufacturer
    }
    
    init(slug: String?, highlightResult: HighlightResult?, objectID: String?, category: String?, barcode: String?, name: String?, tags: [String]?, manufacturer: String?) {
        self.slug = slug
        self.highlightResult = highlightResult
        self.objectID = objectID
        self.category = category
        self.barcode = barcode
        self.name = name
        self.tags = tags
        self.manufacturer = manufacturer
    }
}

// MARK: - HighlightResult
class HighlightResult: Codable {
    let barcode, category, name, manufacturer: Barcode?
    
    init(barcode: Barcode?, category: Barcode?, name: Barcode?, manufacturer: Barcode?) {
        self.barcode = barcode
        self.category = category
        self.name = name
        self.manufacturer = manufacturer
    }
}

// MARK: - Barcode
class Barcode: Codable {
    let matchLevel: MatchLevel?
    let value: String?
    let matchedWords: [String]?
    let fullyHighlighted: Bool?
    
    init(matchLevel: MatchLevel?, value: String?, matchedWords: [String]?, fullyHighlighted: Bool?) {
        self.matchLevel = matchLevel
        self.value = value
        self.matchedWords = matchedWords
        self.fullyHighlighted = fullyHighlighted
    }
}
enum MatchLevel: String, Codable {
    case full = "full"
    case none = "none"
}
