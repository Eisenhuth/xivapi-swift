# xivapi-swift
a simple swift client to easily work with xivapi

# Installation
## Swift Package Manager

1. Xcode -> File -> Add Package Dependency
2. paste this repository url: `https://github.com/Eisenhuth/xivapi-swift.git`
3. Add Package

# Usage
```swift
import Foundation
import xivapi_swift

//create the client, either with or without a key
let xivapi = xivapiClient()
let xivapiWithKey = xivapiClient(private_key: "my-api-key")

let tincture = await xivapi.getItem(itemId: 39727)
let tinctureRecipe = tincture?.Recipes?.first
let recipe = await xivapi.getRecipe(id: tinctureRecipe!.ID!)

let ingredients = recipe?.ingredients
let ingredientIds = recipe?.ingredientIds

for id in ingredientIds! {
    let response = await xivapi.getItemName(itemId: id)
    let name = response?.Name
    print(name!)
}

```
