public extension NpcYell {
    var Text: String? { fields.Text ?? fields.Text_en }
    var Text_en: String? { fields.Text_en ?? Text }
    var Text_ja: String? { fields.Text_ja }
    var Text_de: String? { fields.Text_de }
    var Text_fr: String? { fields.Text_fr }
    var Text_chs: String? { fields.Text_chs }
    var Text_kr: String? { fields.Text_kr }
}
