public extension Action {
    var name: String { fields.Name }
    var icon: Icon { fields.Icon }
    var category: ActionCategory { fields.ActionCategory }
    var description: String? { transient?.Description }
}
