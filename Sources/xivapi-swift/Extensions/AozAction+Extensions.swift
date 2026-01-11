public extension AozAction {
    var name: String { fields.Action.name }
    var number: Int { transient.Number }
    var category: ActionCategory { fields.Action.category }
    var actionIcon: Icon { fields.Action.icon }
    var transientIcon: Icon { transient.Icon }
    var description: String { transient.Description }
}
