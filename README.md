# xivapi-swift
a simple swift client to easily work with xivapi

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Fxivapi-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Eisenhuth/xivapi-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEisenhuth%2Fxivapi-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Eisenhuth/xivapi-swift)
[![](https://img.shields.io/badge/DocC-documentation-orange)](https://swiftpackageindex.com/eisenhuth/xivapi-swift/master/documentation/xivapi_swift/xivapiclient)


# Installation
## Swift Package Manager

1. Xcode -> File -> Add Package Dependency
2. paste this repository url: `https://github.com/Eisenhuth/xivapi-swift.git`
3. Add Package

# Usage
```swift
//option 1 - latest schema, latest version - unverified
let client = xivapiClient() 
```
```swift
//option 2 - providing your own schema/version
let schema = "exdschema@9942dd96c70dfbba55bbc4280da144e5cb410737-2024.11.06.0000.0000"
let client = xivapiClient(schema: schema, version: "7.15")
```
```swift
//option 3 - using the schema/version this version of the package was verified against
let client = xivapiClient(automaticallyPin: true)
```
> [!TIP]
> It is _highly recommended_ to specify a version and schema - alternatively use the automatic pin mentioned above to use the schema/version the package was verified against.

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

## Sheets
you can provide your own `Codable` structs for use with `.getSheet`
```swift
struct MyCustomItemStruct: Codable {
    let row_id: Int
}

let myItem = await client.getSheet(.Item, id: 39727) as MyCustomItemStruct?
```
or use the built-in structs
```swift
let ttCard = await client.getSheet(.TripleTriadCard, id: 346) as TripleTriadCard?
print(ttCard?.fields.Name ?? "name") //Zenos Galvus
print(ttCard?.fields.Description ?? "description") //“Did you find...fulfillment?”

```

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
