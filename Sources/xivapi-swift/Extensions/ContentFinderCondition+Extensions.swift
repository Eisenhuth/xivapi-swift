public extension ContentFinderCondition {
    var image: Icon { fields.Image }
    var name: String { fields.Name }
    var contentType: ContentType { fields.ContentType }
    var description: String { transient.Description }
}
