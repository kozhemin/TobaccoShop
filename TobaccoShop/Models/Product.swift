//
//  Prodict.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 07.03.2022.
//

import Foundation

struct Product {
    var id = UUID()
    var imageName: String
    var description: String
    var price: Double
}

let demoProductList = [
    Product(imageName: "product_1", description: "Add some flavor to your life with these wonderful hand-rolled cigars from the Carolina Cigar Company.  Only the most porous leaf of the tobacco plant is used to ensure these cigars have maximum flavor after spending 45 days under press with flavored rum.  This 25 count pack of Carolina Cigars is 5.5 inches long with a 43 ring and has a Coconut top-note.", price: 19.99),
    Product(imageName: "product_2", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 13.99),
    Product(imageName: "product_3", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 13.22),
    Product(imageName: "product_4", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 12.22),
    Product(imageName: "product_5", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 12.22),
    Product(imageName: "product_1", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 18.22),
    Product(imageName: "product_2", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 11.44),
    Product(imageName: "product_3", description: "Carolina Cigar 25ct Cabinet Selection - Connecticut Torpedo", price: 19.22),
]
