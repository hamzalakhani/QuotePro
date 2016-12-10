//
//  Quotes.swift
//  QuotePro
//
//  Created by Hamza Lakhani on 2016-12-07.
//  Copyright © 2016 Hamza Lakhani. All rights reserved.
//

import UIKit

class Quotes{
    // MARK: Properties
    let quoteText : String
    let quoteAuthor : String
    var randomImage : UIImage?

    init(quoteText: String, quoteAuthor: String,randomImage : UIImage
 )
{
       self.quoteText = quoteText
       self.quoteAuthor = quoteAuthor
    self.randomImage = randomImage
    }
}
