# xivapi-swift

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Fxivapi-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Eisenhuth/xivapi-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Fxivapi-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Eisenhuth/xivapi-swift)
[![](https://img.shields.io/badge/DocC-documentation-orange)](https://swiftpackageindex.com/eisenhuth/xivapi-swift/master/documentation/xivapi_swift/xivapiclient)

a simple swift client to easily work with xivapi

# Installation
## Swift Package Manager

1. Xcode -> File -> Add Package Dependency
2. paste this repository url: `https://github.com/Eisenhuth/xivapi-swift.git`
3. Add Package

# Usage
```swift
import xivapi_swift

let client = xivapiClient()
```

## commonly used endpoints
```swift
let item = await client.getItem(39727) //Grade 8 Tincture of Strength
let itemMinimal = await client.getItemMinimal(39727) //only contains Name, Description, Icon
let recipe = await client.getRecipe(35585) //Recipe: Grade 8 Tincture of Strength
let map = await client.getMap(696) //Thavnair
let trait = await client.getTrait(422) //Enhanced Unmend
let action = await client.getAction(7393) //The Blackest Night
```
there are extensions for a lot of the data, e.g. `Map` has `.mapUrl` to get the texture, or `TripleTriadCard`'s `.imageUrl` to get the card's artwork. I recommend not looking too closely at how specifically these URLs are constructed, that way lies madness.

## Item:Recipe lookup
```swift
if let recipeId = await client.getItemRecipes(itemId: 39727)?.first {
    let recipe = await client.getRecipe(recipeId)
    
    recipe?.ingredients.forEach {
        print("\($0.itemId) x\($0.amount)")
    }
}

let entireLookup = await client.getItemRecipeDict() //[ItemId : [RecipeId]]
```


## NpcYell, in different languages? mostly a proof of concept
```swift
let quote = await client.getNpcYell(6492, languages: [.en, .ja, .de, .fr]) //also technically supports Chinese and Korean
print(quote?.Text_en ?? "[Text_en]") //O hallowed moon, shine you the iron path!
print(quote?.Text_ja ?? "[Text_ja]") //月よ！鉄の覇道を照らせ！
```

## Sheets
for anything more custom there is `.getSheet`, where you can provide your own struct and custom queries, for any sheet.
```swift
struct MyCustomItemStruct: Codable {
    let row_id: Int
}

let myItem:MyCustomItemStruct? = await client.getSheet(.Item, id: 39727)

let ttCard:TripleTriadCard? = await client.getSheet(.TripleTriadCard, id: 346)
print(ttCard?.fields.Name ?? "name") //Zenos Galvus
print(ttCard?.fields.Description ?? "description") //“Did you find...fulfillment?”

```
