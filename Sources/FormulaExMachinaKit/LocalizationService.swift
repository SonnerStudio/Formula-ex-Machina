import Foundation
import FormulaEngine

public enum LocalizedKey: String, CaseIterable, Sendable {
    case disciplines = "disciplines"
    case searchPlaceholder = "search_placeholder"
    case formulas = "formulas"
    case noFormulaSelected = "no_formula_selected"
    case noFormulaSelectedDesc = "no_formula_selected_desc"
    case rearrangeFor = "rearrange_for"
    case rearrangedFormula = "rearranged_formula"
    case inputValues = "input_values"
    case enterValue = "enter_value"
    case calculatedResult = "calculated_result"
    case copy = "copy"
    case copied = "copied"
    case solutionSteps = "solution_steps"
    case unit = "unit"
    case calculation = "calculation"
    case recalculate = "recalculate"
    case copyResult = "copy_result"
    case update = "update"
    case checkingUpdates = "checking_updates"
    case upToDate = "up_to_date"
    case updateFailed = "update_failed"
    case liveCalculationHelp = "live_calc_help"
    case step = "step"
    case offlineBadge = "offline_badge"
    case liquidGlassBadge = "liquid_glass_badge"
    case footerDevelopedBy = "footer_developed_by"
    case noAdditionalInputsNeeded = "no_additional_inputs_needed"
    case targetVariable = "target_variable"
    case calculationMethod = "calculation_method"
    case missingInputs = "missing_inputs"

    // Einstellungen / Settings
    case settingsGeneral = "settings_general"
    case settingsAppearance = "settings_appearance"
    case settingsLanguageAndFlags = "settings_lang_and_flags"
    case settingsSelectLanguage = "settings_select_language"
    case settingsCalcAndUnits = "settings_calc_and_units"
    case settingsDefaultUnitSystem = "settings_default_unit_system"
    case settingsDecimalPlaces = "settings_decimal_places"
    case settingsAutoRecalculate = "settings_auto_recalculate"
    case settingsAbout = "settings_about"
    case settingsVersion = "settings_version"
    case settingsDeveloper = "settings_developer"
    case settingsAccentColor = "settings_accent_color"

    // Fachgebiete / Kategorien
    case catPhysics = "cat_physics"
    case catMath = "cat_math"
    case catAstronomy = "cat_astronomy"
    case catElectrical = "cat_electrical"
    case catChemistry = "cat_chemistry"
    case catEngineering = "cat_engineering"
    case catFinance = "cat_finance"
    case catComputerScience = "cat_cs"
}

public struct LocalizationService: Sendable {
    public static let shared = LocalizationService()

    private let translations: [String: [LocalizedKey: String]]

    public init() {
        var dict: [String: [LocalizedKey: String]] = [:]
        dict["de"] = [
            .disciplines: "Fachgebiete",
            .searchPlaceholder: "Formeln, Symbole, Einheiten suchen...",
            .formulas: "Formeln",
            .noFormulaSelected: "Keine Formel ausgewählt",
            .noFormulaSelectedDesc: "Wähle eine Formel aus der Seitenleiste oder suche nach einem Thema.",
            .rearrangeFor: "Formel umstellen nach:",
            .rearrangedFormula: "Umgestellte Formel:",
            .inputValues: "Eingabewerte",
            .enterValue: "Wert eingeben",
            .calculatedResult: "Berechnetes Ergebnis",
            .copy: "Kopieren",
            .copied: "Kopiert!",
            .solutionSteps: "Lösungsweg & Umformungsschritte",
            .unit: "Einheit:",
            .calculation: "Berechnung",
            .recalculate: "Neu berechnen",
            .copyResult: "Ergebnis kopieren",
            .update: "Update",
            .checkingUpdates: "Prüfe auf Updates...",
            .upToDate: "Bereits auf dem neuesten Stand!",
            .updateFailed: "Update fehlgeschlagen oder keine Verbindung.",
            .liveCalculationHelp: "Zahlenwert eingeben. Berechnung erfolgt live.",
            .step: "Schritt",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Entwickelt von SonnerStudio • Jan Friske • 100% Offline • Lokale symbolische Algebra",
            .noAdditionalInputsNeeded: "Keine weiteren Eingabeparameter erforderlich (Naturkonstante).",
            .targetVariable: "Zielvariable",
            .calculationMethod: "Berechnungsmethode",
            .missingInputs: "Bitte alle erforderlichen Eingabewerte als gültige Zahlen ausfüllen.",
            .settingsGeneral: "Allgemein",
            .settingsAppearance: "Erscheinungsbild",
            .settingsLanguageAndFlags: "Sprachauswahl & Nationalflaggen",
            .settingsSelectLanguage: "Sprache:",
            .settingsCalcAndUnits: "Berechnung & Einheiten",
            .settingsDefaultUnitSystem: "Standard-Einheitensystem:",
            .settingsDecimalPlaces: "Dezimalstellen",
            .settingsAutoRecalculate: "Automatisch bei Tastatureingabe neu berechnen",
            .settingsAbout: "Über Formula ex Machina",
            .settingsVersion: "Version",
            .settingsDeveloper: "Entwickler",
            .settingsAccentColor: "Akzentfarbe",
            .catPhysics: "Physik",
            .catMath: "Mathematik",
            .catAstronomy: "Astronomie & Astrophysik",
            .catElectrical: "Elektrotechnik",
            .catChemistry: "Chemie",
            .catEngineering: "Maschinenbau & Statik",
            .catFinance: "Finanzmathematik",
            .catComputerScience: "Informatik & Information",
        ]

        dict["en"] = [
            .disciplines: "Disciplines",
            .searchPlaceholder: "Search formulas, symbols, units...",
            .formulas: "Formulas",
            .noFormulaSelected: "No formula selected",
            .noFormulaSelectedDesc: "Select a formula from the sidebar or search for a topic.",
            .rearrangeFor: "Solve formula for:",
            .rearrangedFormula: "Rearranged formula:",
            .inputValues: "Input Parameters",
            .enterValue: "Enter value",
            .calculatedResult: "Calculated Result",
            .copy: "Copy",
            .copied: "Copied!",
            .solutionSteps: "Solution steps & transformations",
            .unit: "Unit:",
            .calculation: "Calculation",
            .recalculate: "Recalculate",
            .copyResult: "Copy result",
            .update: "Update",
            .checkingUpdates: "Checking for updates...",
            .upToDate: "Already up to date!",
            .updateFailed: "Update failed or no connection.",
            .liveCalculationHelp: "Enter numeric value. Live calculation.",
            .step: "Step",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Developed by SonnerStudio • Jan Friske • 100% Offline • Local Computer Algebra",
            .noAdditionalInputsNeeded: "No additional parameters needed (constant value).",
            .targetVariable: "Target variable",
            .calculationMethod: "Calculation method",
            .missingInputs: "Please fill in all required inputs with valid numbers.",
            .settingsGeneral: "General",
            .settingsAppearance: "Appearance",
            .settingsLanguageAndFlags: "Language Selection & National Flags",
            .settingsSelectLanguage: "Language:",
            .settingsCalcAndUnits: "Calculation & Units",
            .settingsDefaultUnitSystem: "Default Unit System:",
            .settingsDecimalPlaces: "Decimal Places",
            .settingsAutoRecalculate: "Automatically recalculate during typing",
            .settingsAbout: "About Formula ex Machina",
            .settingsVersion: "Version",
            .settingsDeveloper: "Developer",
            .settingsAccentColor: "Accent Color",
            .catPhysics: "Physics",
            .catMath: "Mathematics",
            .catAstronomy: "Astronomy & Astrophysics",
            .catElectrical: "Electrical Engineering",
            .catChemistry: "Chemistry",
            .catEngineering: "Mechanical Engineering & Statics",
            .catFinance: "Financial Mathematics",
            .catComputerScience: "Computer Science & Information",
        ]

        dict["fr"] = [
            .disciplines: "Disciplines",
            .searchPlaceholder: "Rechercher formules, symboles, unités...",
            .formulas: "Formules",
            .noFormulaSelected: "Aucune formule sélectionnée",
            .noFormulaSelectedDesc: "Sélectionnez une formule dans la barre latérale ou recherchez un sujet.",
            .rearrangeFor: "Résoudre la formule pour :",
            .rearrangedFormula: "Formule réarrangée :",
            .inputValues: "Paramètres d'entrée",
            .enterValue: "Entrez la valeur",
            .calculatedResult: "Résultat calculé",
            .copy: "Copier",
            .copied: "Copié !",
            .solutionSteps: "Étapes de résolution & transformations",
            .unit: "Unité :",
            .calculation: "Calcul",
            .recalculate: "Recalculer",
            .copyResult: "Copier le résultat",
            .update: "Mise à jour",
            .checkingUpdates: "Vérification des mises à jour...",
            .upToDate: "Déjà à jour !",
            .updateFailed: "Échec de la mise à jour ou pas de connexion.",
            .liveCalculationHelp: "Saisissez un nombre. Calcul en direct.",
            .step: "Étape",
            .offlineBadge: "Hors ligne",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Développé par SonnerStudio • Jan Friske • 100% Hors ligne",
            .noAdditionalInputsNeeded: "Aucun paramètre supplémentaire requis.",
            .targetVariable: "Variable cible",
            .calculationMethod: "Méthode de calcul",
            .missingInputs: "Veuillez saisir des nombres valides.",
            .settingsGeneral: "Général",
            .settingsAppearance: "Apparence",
            .settingsLanguageAndFlags: "Sélection de la langue & Drapeaux",
            .settingsSelectLanguage: "Langue :",
            .settingsCalcAndUnits: "Calcul & Unités",
            .settingsDefaultUnitSystem: "Système d'unités par défaut :",
            .settingsDecimalPlaces: "Décimales",
            .settingsAutoRecalculate: "Recalcul automatique lors de la saisie",
            .settingsAbout: "À propos de Formula ex Machina",
            .settingsVersion: "Version",
            .settingsDeveloper: "Développeur",
            .settingsAccentColor: "Couleur d'accentuation",
            .catPhysics: "Physique",
            .catMath: "Mathématiques",
            .catAstronomy: "Astronomie & Astrophysique",
            .catElectrical: "Génie électrique",
            .catChemistry: "Chimie",
            .catEngineering: "Génie mécanique & Statique",
            .catFinance: "Mathématiques financières",
            .catComputerScience: "Informatique & Information",
        ]

        dict["es"] = [
            .disciplines: "Disciplinas",
            .searchPlaceholder: "Buscar fórmulas, símbolos, unidades...",
            .formulas: "Fórmulas",
            .noFormulaSelected: "Ninguna fórmula seleccionada",
            .noFormulaSelectedDesc: "Seleccione una fórmula de la barra lateral o busque un tema.",
            .rearrangeFor: "Despejar fórmula para:",
            .rearrangedFormula: "Fórmula despejada:",
            .inputValues: "Parámetros de entrada",
            .enterValue: "Introducir valor",
            .calculatedResult: "Resultado calculado",
            .copy: "Copiar",
            .copied: "¡Copiado!",
            .solutionSteps: "Pasos de resolución y transformaciones",
            .unit: "Unidad:",
            .calculation: "Cálculo",
            .recalculate: "Recalcular",
            .copyResult: "Copiar resultado",
            .update: "Actualizar",
            .checkingUpdates: "Buscando actualizaciones...",
            .upToDate: "¡Ya está actualizado!",
            .updateFailed: "Error de actualización.",
            .liveCalculationHelp: "Ingrese valor numérico. Cálculo en vivo.",
            .step: "Paso",
            .offlineBadge: "Desconectado",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Desarrollado por SonnerStudio • Jan Friske",
            .noAdditionalInputsNeeded: "No se requieren parámetros adicionales.",
            .targetVariable: "Variable objetivo",
            .calculationMethod: "Método de cálculo",
            .missingInputs: "Por favor ingrese números válidos.",
            .settingsGeneral: "General",
            .settingsAppearance: "Apariencia",
            .settingsLanguageAndFlags: "Selección de idioma y Banderas",
            .settingsSelectLanguage: "Idioma:",
            .settingsCalcAndUnits: "Cálculo y Unidades",
            .settingsDefaultUnitSystem: "Sistema de unidades predeterminado:",
            .settingsDecimalPlaces: "Decimales",
            .settingsAutoRecalculate: "Recalcular automáticamente al escribir",
            .settingsAbout: "Acerca de Formula ex Machina",
            .settingsVersion: "Versión",
            .settingsDeveloper: "Desarrollador",
            .settingsAccentColor: "Color de acento",
            .catPhysics: "Física",
            .catMath: "Matemáticas",
            .catAstronomy: "Astronomía y Astrofísica",
            .catElectrical: "Ingeniería Eléctrica",
            .catChemistry: "Química",
            .catEngineering: "Ingeniería Mecánica y Estática",
            .catFinance: "Matemáticas Financieras",
            .catComputerScience: "Informática e Información",
        ]

        dict["it"] = [
            .disciplines: "Discipline",
            .searchPlaceholder: "Cerca formule, simboli, unità...",
            .formulas: "Formule",
            .noFormulaSelected: "Nessuna formula selezionata",
            .noFormulaSelectedDesc: "Seleziona una formula dalla barra laterale o cerca un argomento.",
            .rearrangeFor: "Risolvi formula per:",
            .rearrangedFormula: "Formula riordinata:",
            .inputValues: "Valori di input",
            .enterValue: "Inserisci valore",
            .calculatedResult: "Risultato calcolato",
            .copy: "Copia",
            .copied: "Copiato!",
            .solutionSteps: "Passaggi di soluzione & trasformazioni",
            .unit: "Unità:",
            .calculation: "Calcolo",
            .recalculate: "Ricalcola",
            .copyResult: "Copia risultato",
            .update: "Aggiorna",
            .checkingUpdates: "Controllo aggiornamenti...",
            .upToDate: "Già aggiornato!",
            .updateFailed: "Aggiornamento non riuscito.",
            .liveCalculationHelp: "Inserisci numero. Calcolo in tempo reale.",
            .step: "Passo",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Sviluppato da SonnerStudio • Jan Friske",
            .noAdditionalInputsNeeded: "Nessun parametro aggiuntivo necessario.",
            .targetVariable: "Variabile target",
            .calculationMethod: "Metodo di calcolo",
            .missingInputs: "Inserisci numeri validi.",
            .settingsGeneral: "Generale",
            .settingsAppearance: "Aspetto",
            .settingsLanguageAndFlags: "Selezione lingua & Bandiere",
            .settingsSelectLanguage: "Lingua:",
            .settingsCalcAndUnits: "Calcolo & Unità",
            .settingsDefaultUnitSystem: "Sistema di unità predefinito:",
            .settingsDecimalPlaces: "Decimali",
            .settingsAutoRecalculate: "Ricalcola automaticamente durante la digitazione",
            .settingsAbout: "Informazioni su Formula ex Machina",
            .settingsVersion: "Versione",
            .settingsDeveloper: "Sviluppatore",
            .settingsAccentColor: "Colore accento",
            .catPhysics: "Fisica",
            .catMath: "Matematica",
            .catAstronomy: "Astronomia & Astrofisica",
            .catElectrical: "Elettrotecnica",
            .catChemistry: "Chimica",
            .catEngineering: "Ingegneria Meccanica & Statica",
            .catFinance: "Matematica Finanziaria",
            .catComputerScience: "Informatica & Informazione",
        ]

        dict["pt"] = [
            .disciplines: "Disciplinas",
            .searchPlaceholder: "Pesquisar fórmulas, símbolos, unidades...",
            .formulas: "Fórmulas",
            .noFormulaSelected: "Nenhuma fórmula selecionada",
            .noFormulaSelectedDesc: "Selecione uma fórmula na barra lateral.",
            .rearrangeFor: "Isolar fórmula para:",
            .rearrangedFormula: "Fórmula rearranjada:",
            .inputValues: "Parâmetros de Entrada",
            .enterValue: "Inserir valor",
            .calculatedResult: "Resultado Calculado",
            .copy: "Copiar",
            .copied: "Copiado!",
            .solutionSteps: "Passos de resolução & transformações",
            .unit: "Unidade:",
            .calculation: "Cálculo",
            .recalculate: "Recalcular",
            .copyResult: "Copiar resultado",
            .update: "Atualizar",
            .checkingUpdates: "Verificando atualizações...",
            .upToDate: "Já atualizado!",
            .updateFailed: "Falha na atualização.",
            .liveCalculationHelp: "Insira o número. Cálculo em tempo real.",
            .step: "Passo",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Desenvolvido por SonnerStudio • Jan Friske",
            .noAdditionalInputsNeeded: "Nenhum parâmetro adicional necessário.",
            .targetVariable: "Variável alvo",
            .calculationMethod: "Método de cálculo",
            .missingInputs: "Insira números válidos.",
            .settingsGeneral: "Geral",
            .settingsAppearance: "Aparência",
            .settingsLanguageAndFlags: "Seleção de Idioma & Bandeiras",
            .settingsSelectLanguage: "Idioma:",
            .settingsCalcAndUnits: "Cálculo & Unidades",
            .settingsDefaultUnitSystem: "Sistema de unidades padrão:",
            .settingsDecimalPlaces: "Casas decimais",
            .settingsAutoRecalculate: "Recalcular automaticamente ao digitar",
            .settingsAbout: "Sobre Formula ex Machina",
            .settingsVersion: "Versão",
            .settingsDeveloper: "Desenvolvedor",
            .settingsAccentColor: "Cor de destaque",
            .catPhysics: "Física",
            .catMath: "Matemática",
            .catAstronomy: "Astronomia & Astrofísica",
            .catElectrical: "Engenharia Elétrica",
            .catChemistry: "Química",
            .catEngineering: "Engenharia Mecânica & Estática",
            .catFinance: "Matemática Financeira",
            .catComputerScience: "Ciência da Computação",
        ]

        dict["ru"] = [
            .disciplines: "Дисциплины",
            .searchPlaceholder: "Поиск формул, символов, единиц...",
            .formulas: "Формулы",
            .noFormulaSelected: "Формула не выбрана",
            .noFormulaSelectedDesc: "Выберите формулу на боковой панели или выполните поиск.",
            .rearrangeFor: "Преобразовать формулу для:",
            .rearrangedFormula: "Преобразованная формула:",
            .inputValues: "Входные параметры",
            .enterValue: "Введите значение",
            .calculatedResult: "Вычисленный результат",
            .copy: "Копировать",
            .copied: "Скопировано!",
            .solutionSteps: "Шаги решения и преобразования",
            .unit: "Единица:",
            .calculation: "Вычисление",
            .recalculate: "Пересчитать",
            .copyResult: "Копировать результат",
            .update: "Обновить",
            .checkingUpdates: "Проверка обновлений...",
            .upToDate: "Уже последняя версия!",
            .updateFailed: "Сбой обновления или нет связи.",
            .liveCalculationHelp: "Введите число. Вычисление в реальном времени.",
            .step: "Шаг",
            .offlineBadge: "Офлайн",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Разработано SonnerStudio • Ян Фриске",
            .noAdditionalInputsNeeded: "Дополнительные параметры не требуются.",
            .targetVariable: "Целевая переменная",
            .calculationMethod: "Метод вычисления",
            .missingInputs: "Пожалуйста, введите корректные числа.",
            .settingsGeneral: "Общие",
            .settingsAppearance: "Оформление",
            .settingsLanguageAndFlags: "Выбор языка и национальные флаги",
            .settingsSelectLanguage: "Язык:",
            .settingsCalcAndUnits: "Вычисления и единицы",
            .settingsDefaultUnitSystem: "Система единиц по умолчанию:",
            .settingsDecimalPlaces: "Знаков после запятой",
            .settingsAutoRecalculate: "Автоматически пересчитывать при вводе",
            .settingsAbout: "О программе Formula ex Machina",
            .settingsVersion: "Версия",
            .settingsDeveloper: "Разработчик",
            .settingsAccentColor: "Цвет акцента",
            .catPhysics: "Физика",
            .catMath: "Математика",
            .catAstronomy: "Астрономия и Астрофизика",
            .catElectrical: "Электротехника",
            .catChemistry: "Химия",
            .catEngineering: "Машиностроение и Статика",
            .catFinance: "Финансовая математика",
            .catComputerScience: "Информатика",
        ]

        dict["zh"] = [
            .disciplines: "学科门类",
            .searchPlaceholder: "搜索公式、符号、单位...",
            .formulas: "公式库",
            .noFormulaSelected: "未选择公式",
            .noFormulaSelectedDesc: "请从侧边栏选择公式或通过关键字搜索。",
            .rearrangeFor: "求解方程目标变量：",
            .rearrangedFormula: "移项变形公式：",
            .inputValues: "已知输入参数",
            .enterValue: "输入数值",
            .calculatedResult: "计算结果",
            .copy: "复制结果",
            .copied: "已复制！",
            .solutionSteps: "代数推导与移项步骤",
            .unit: "量纲单位：",
            .calculation: "计算分析",
            .recalculate: "重新计算",
            .copyResult: "复制计算数值",
            .update: "软件更新",
            .checkingUpdates: "正在检查版本更新...",
            .upToDate: "当前已是最新版本！",
            .updateFailed: "更新失败或网络未连接。",
            .liveCalculationHelp: "输入数值，支持实时后台重算。",
            .step: "步骤",
            .offlineBadge: "全离线支持",
            .liquidGlassBadge: "Liquid Glass 原生设计",
            .footerDevelopedBy: "由 SonnerStudio（Jan Friske）设计与开发 • 本地符号代数",
            .noAdditionalInputsNeeded: "无需额外参数（恒定物理常量）。",
            .targetVariable: "目标待求变量",
            .calculationMethod: "求解方法",
            .missingInputs: "请输入有效的数值参数。",
            .settingsGeneral: "常规设置",
            .settingsAppearance: "外观样式",
            .settingsLanguageAndFlags: "多语言选择与国旗标识",
            .settingsSelectLanguage: "系统语言：",
            .settingsCalcAndUnits: "计算与单位换算",
            .settingsDefaultUnitSystem: "默认量纲单位制：",
            .settingsDecimalPlaces: "数值保留小数位数",
            .settingsAutoRecalculate: "键入时即时自动重算",
            .settingsAbout: "关于 Formula ex Machina",
            .settingsVersion: "软件版本",
            .settingsDeveloper: "核心开发者",
            .settingsAccentColor: "系统高亮色",
            .catPhysics: "物理学",
            .catMath: "数学与几何",
            .catAstronomy: "天文学与天体物理",
            .catElectrical: "电气与电子工程",
            .catChemistry: "化学与热力学",
            .catEngineering: "机械工程与材料力学",
            .catFinance: "金融与经济数学",
            .catComputerScience: "计算机科学与信息论",
        ]

        dict["ja"] = [
            .disciplines: "学術分野",
            .searchPlaceholder: "数式、記号、単位を検索...",
            .formulas: "公式集",
            .noFormulaSelected: "公式が選択されていません",
            .noFormulaSelectedDesc: "サイドバーから公式を選択するか検索してください。",
            .rearrangeFor: "対象変数について解く：",
            .rearrangedFormula: "変形後の数式：",
            .inputValues: "入力パラメータ",
            .enterValue: "数値を入力",
            .calculatedResult: "計算結果",
            .copy: "コピー",
            .copied: "コピー完了！",
            .solutionSteps: "導出・変形プロセス",
            .unit: "単位：",
            .calculation: "計算",
            .recalculate: "再計算",
            .copyResult: "結果をコピー",
            .update: "アップデート",
            .checkingUpdates: "更新を確認中...",
            .upToDate: "最新バージョンです！",
            .updateFailed: "更新に失敗しました。",
            .liveCalculationHelp: "数値を入力するとリアルタイムで計算されます。",
            .step: "ステップ",
            .offlineBadge: "オフライン",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "開発：SonnerStudio • Jan Friske",
            .noAdditionalInputsNeeded: "追加パラメータは不要です。",
            .targetVariable: "目的変数",
            .calculationMethod: "計算手法",
            .missingInputs: "有効な数値を入力してください。",
            .settingsGeneral: "一般",
            .settingsAppearance: "外観",
            .settingsLanguageAndFlags: "言語選択と国旗",
            .settingsSelectLanguage: "言語：",
            .settingsCalcAndUnits: "計算と単位",
            .settingsDefaultUnitSystem: "デフォルト単位系：",
            .settingsDecimalPlaces: "小数点以下の桁数",
            .settingsAutoRecalculate: "入力時に自動的に再計算する",
            .settingsAbout: "Formula ex Machina について",
            .settingsVersion: "バージョン",
            .settingsDeveloper: "開発者",
            .settingsAccentColor: "アクセントカラー",
            .catPhysics: "物理学",
            .catMath: "数学",
            .catAstronomy: "天文学・宇宙物理学",
            .catElectrical: "電気工学",
            .catChemistry: "化学",
            .catEngineering: "機械工学・構造力学",
            .catFinance: "金融工学・数理経済",
            .catComputerScience: "情報科学・計算機工学",
        ]

        dict["hi"] = dict["en"]
        dict["ar"] = dict["en"]
        dict["bn"] = dict["en"]
        dict["pa"] = dict["en"]
        dict["mr"] = dict["en"]
        dict["te"] = dict["en"]
        dict["wuu"] = dict["en"]
        dict["tr"] = dict["en"]
        dict["ko"] = dict["en"]
        dict["ta"] = dict["en"]
        dict["ur"] = dict["en"]
        dict["vi"] = dict["en"]
        dict["yue"] = dict["en"]
        dict["jv"] = dict["en"]
        dict["gu"] = dict["en"]
        dict["fa"] = dict["en"]
        dict["bho"] = dict["en"]
        dict["min"] = dict["en"]
        dict["ha"] = dict["en"]
        dict["pl"] = dict["en"]
        dict["sw"] = dict["en"]
        dict["kn"] = dict["en"]
        dict["id"] = dict["en"]
        dict["tl"] = dict["en"]
        dict["ml"] = dict["en"]
        dict["or"] = dict["en"]
        dict["my"] = dict["en"]
        dict["hsn"] = dict["en"]
        dict["su"] = dict["en"]
        dict["mai"] = dict["en"]
        dict["uk"] = dict["en"]
        dict["uz"] = dict["en"]
        dict["sd"] = dict["en"]
        dict["am"] = dict["en"]
        dict["ff"] = dict["en"]
        dict["ro"] = dict["en"]
        dict["om"] = dict["en"]
        dict["ig"] = dict["en"]
        dict["az"] = dict["en"]
        dict["awd"] = dict["en"]
        dict["gan"] = dict["en"]
        dict["ceb"] = dict["en"]
        dict["nl"] = dict["en"]
        dict["ku"] = dict["en"]
        dict["shn"] = dict["en"]
        dict["mg"] = dict["en"]
        dict["el"] = dict["en"]
        dict["cs"] = dict["en"]
        dict["hu"] = dict["en"]
        dict["sv"] = dict["en"]
        dict["bg"] = dict["en"]
        dict["be"] = dict["en"]
        dict["he"] = dict["en"]
        dict["da"] = dict["en"]
        dict["fi"] = dict["en"]
        dict["sk"] = dict["en"]
        dict["no"] = dict["en"]
        dict["hr"] = dict["en"]
        dict["sr"] = dict["en"]
        dict["ca"] = dict["en"]
        dict["lt"] = dict["en"]
        dict["sl"] = dict["en"]
        dict["lv"] = dict["en"]
        dict["et"] = dict["en"]
        dict["is"] = dict["en"]
        dict["ga"] = dict["en"]
        dict["sq"] = dict["en"]
        dict["mk"] = dict["en"]
        dict["hy"] = dict["en"]
        dict["ka"] = dict["en"]
        dict["ne"] = dict["en"]
        dict["si"] = dict["en"]
        dict["km"] = dict["en"]
        dict["lo"] = dict["en"]
        dict["mn"] = dict["en"]
        dict["kk"] = dict["en"]
        dict["ky"] = dict["en"]
        dict["tg"] = dict["en"]
        dict["tk"] = dict["en"]
        dict["ps"] = dict["en"]
        dict["so"] = dict["en"]
        dict["yo"] = dict["en"]
        dict["zu"] = dict["en"]
        dict["xh"] = dict["en"]
        dict["af"] = dict["en"]
        dict["sn"] = dict["en"]
        dict["rw"] = dict["en"]
        dict["st"] = dict["en"]
        dict["tn"] = dict["en"]
        dict["ln"] = dict["en"]
        dict["wo"] = dict["en"]
        dict["bm"] = dict["en"]
        dict["ti"] = dict["en"]
        dict["ee"] = dict["en"]
        dict["ak"] = dict["en"]
        dict["tw"] = dict["en"]
        dict["lg"] = dict["en"]
        dict["kg"] = dict["en"]
        dict["ts"] = dict["en"]
        dict["ve"] = dict["en"]
        dict["nr"] = dict["en"]
        dict["ss"] = dict["en"]
        dict["ny"] = dict["en"]
        dict["ms"] = dict["en"]
        dict["tet"] = dict["en"]
        dict["sm"] = dict["en"]
        dict["to"] = dict["en"]
        dict["fj"] = dict["en"]
        dict["mi"] = dict["en"]
        dict["haw"] = dict["en"]
        dict["kl"] = dict["en"]
        dict["fo"] = dict["en"]
        dict["eu"] = dict["en"]
        dict["gl"] = dict["en"]
        dict["cy"] = dict["en"]
        dict["gd"] = dict["en"]
        dict["br"] = dict["en"]
        dict["oc"] = dict["en"]
        dict["lb"] = dict["en"]
        dict["mt"] = dict["en"]
        dict["eo"] = dict["en"]

        self.translations = dict
    }

    public func string(for key: LocalizedKey, languageCode: String) -> String {
        if let langDict = translations[languageCode], let val = langDict[key] {
            return val
        }
        if let enDict = translations["en"], let val = enDict[key] {
            return val
        }
        return translations["de"]?[key] ?? key.rawValue
    }

    public func localizedCategory(_ rawName: String, languageCode: String) -> String {
        switch rawName {
        case "Physik", "Physics":
            return string(for: .catPhysics, languageCode: languageCode)
        case "Mathematik", "Mathematics":
            return string(for: .catMath, languageCode: languageCode)
        case "Astronomie & Astrophysik", "Astronomy & Astrophysics":
            return string(for: .catAstronomy, languageCode: languageCode)
        case "Elektrotechnik", "Electrical Engineering":
            return string(for: .catElectrical, languageCode: languageCode)
        case "Chemie", "Chemistry":
            return string(for: .catChemistry, languageCode: languageCode)
        case "Maschinenbau & Statik", "Mechanical Engineering":
            return string(for: .catEngineering, languageCode: languageCode)
        case "Finanzmathematik", "Financial Mathematics":
            return string(for: .catFinance, languageCode: languageCode)
        case "Informatik & Information", "Computer Science & Information":
            return string(for: .catComputerScience, languageCode: languageCode)
        default:
            return rawName
        }
    }

    public func localizedSubcategory(_ rawName: String, languageCode: String) -> String {
        guard languageCode != "de" else { return rawName }
        switch rawName {
        case "Goldener Schnitt & Folgen":
            if languageCode == "zh" { return "黄金分割与数列" }
            if languageCode == "fr" { return "Nombre d'or et suites" }
            if languageCode == "es" { return "Proporción áurea y sucesiones" }
            if languageCode == "ru" { return "Золотое сечение и ряды" }
            if languageCode == "ja" { return "黄金比と数列" }
            return "Golden Ratio & Sequences"
        case "Geometrie 2D (Flächen)":
            if languageCode == "zh" { return "二维几何（平面面积）" }
            return "2D Geometry (Areas)"
        case "Geometrie 3D (Körper)":
            if languageCode == "zh" { return "三维立体几何" }
            return "3D Geometry (Solids)"
        case "Trigonometrie":
            if languageCode == "zh" { return "三角学" }
            return "Trigonometry"
        case "Algebra & Analysis":
            if languageCode == "zh" { return "代数与微积分" }
            return "Algebra & Calculus"
        case "Statistik & Stochastik":
            if languageCode == "zh" { return "概率论与数理统计" }
            return "Statistics & Probability"
        case "Kinematik":
            if languageCode == "zh" { return "运动学" }
            return "Kinematics"
        case "Dynamik":
            if languageCode == "zh" { return "动力学" }
            return "Dynamics"
        case "Arbeit & Energie":
            if languageCode == "zh" { return "功与能量" }
            return "Work & Energy"
        case "Schwingungen & Wellen":
            if languageCode == "zh" { return "振动与波动学" }
            return "Oscillations & Waves"
        case "Optik & Strahlung":
            if languageCode == "zh" { return "光学与电磁辐射" }
            return "Optics & Radiation"
        case "Relativität & Quantenphysik":
            if languageCode == "zh" { return "相对论与量子力学" }
            return "Relativity & Quantum Physics"
        case "Gravitation & Bahnbewegung":
            if languageCode == "zh" { return "万有引力与轨道力学" }
            return "Gravitation & Orbital Mechanics"
        case "Kosmologie & Sterne":
            if languageCode == "zh" { return "宇宙学与恒星演化" }
            return "Cosmology & Stars"
        case "Hochenergie-Astrophysik":
            if languageCode == "zh" { return "高能天体物理（黑洞）" }
            return "High-Energy Astrophysics"
        case "Gleichstrom & Netzwerke":
            if languageCode == "zh" { return "直流电路与基尔霍夫网络" }
            return "Direct Current & Networks"
        case "Wechselstrom & Blindwiderstände":
            if languageCode == "zh" { return "交流电路与阻抗抗性" }
            return "Alternating Current & Reactance"
        case "Elektromagnetische Felder & Wellen":
            if languageCode == "zh" { return "电磁场与电磁波" }
            return "Electromagnetic Fields & Waves"
        case "Gase & Thermodynamik":
            if languageCode == "zh" { return "气体动力学与热力学" }
            return "Gases & Thermodynamics"
        case "Lösungen & Kinetik":
            if languageCode == "zh" { return "溶液化学与反应动力学" }
            return "Solutions & Kinetics"
        case "Elektrochemie & pH-Gleichgewichte":
            if languageCode == "zh" { return "电化学与酸碱平衡" }
            return "Electrochemistry & pH Equilibria"
        case "Festigkeitslehre & Elastizität":
            if languageCode == "zh" { return "材料力学与弹性理论" }
            return "Mechanics of Materials"
        case "Strömungsmechanik":
            if languageCode == "zh" { return "流体力学（流体静/动力学）" }
            return "Fluid Mechanics"
        case "Statik & Antriebe":
            if languageCode == "zh" { return "工程静力学与传动机构" }
            return "Statics & Drives"
        case "Informationstheorie & Codierung":
            if languageCode == "zh" { return "信息论与香农编码" }
            return "Information Theory & Coding"
        case "Systemleistung & Skalierung":
            if languageCode == "zh" { return "系统性能与并发加速比" }
            return "System Performance & Scaling"
        case "Zins & Zinseszins":
            if languageCode == "zh" { return "利息与复利现值" }
            return "Interest & Compounding"
        case "Investitionsrechnung & Barwert":
            if languageCode == "zh" { return "投资决策与贴现模型" }
            return "Investment & Present Value"
        default:
            return rawName
        }
    }

    public func localizedUnitCategory(_ category: UnitCategory, languageCode: String) -> String {
        guard languageCode != "de" else { return category.rawValue }
        switch category {
        case .length:
            if languageCode == "zh" { return "长度" }
            if languageCode == "fr" { return "Longueur" }
            if languageCode == "es" { return "Longitud" }
            return "Length"
        case .time:
            if languageCode == "zh" { return "时间" }
            if languageCode == "fr" { return "Temps" }
            if languageCode == "es" { return "Tiempo" }
            return "Time"
        case .mass:
            if languageCode == "zh" { return "质量" }
            if languageCode == "fr" { return "Masse" }
            if languageCode == "es" { return "Masa" }
            return "Mass"
        case .velocity:
            if languageCode == "zh" { return "速度" }
            if languageCode == "fr" { return "Vitesse" }
            if languageCode == "es" { return "Velocidad" }
            return "Velocity"
        case .acceleration:
            if languageCode == "zh" { return "加速度" }
            return "Acceleration"
        case .force:
            if languageCode == "zh" { return "力" }
            return "Force"
        case .energy:
            if languageCode == "zh" { return "能量与功" }
            return "Energy & Work"
        case .power:
            if languageCode == "zh" { return "功率" }
            return "Power"
        case .pressure:
            if languageCode == "zh" { return "压强" }
            return "Pressure"
        case .electricVoltage:
            if languageCode == "zh" { return "电压" }
            return "Electric Voltage"
        case .electricCurrent:
            if languageCode == "zh" { return "电流强度" }
            return "Electric Current"
        case .electricResistance:
            if languageCode == "zh" { return "电阻" }
            return "Electric Resistance"
        case .temperature:
            if languageCode == "zh" { return "温度" }
            return "Temperature"
        case .dimensionless:
            if languageCode == "zh" { return "无量纲 / 纯数值" }
            return "Dimensionless / Number"
        }
    }

    public func localizedFormulaName(id: String, defaultName: String, languageCode: String) -> String {
        guard languageCode != "de" else { return defaultName }
        switch id {
        case "math_golden_ratio":
            if languageCode == "zh" { return "黄金分割常数（定义与精确值）" }
            if languageCode == "fr" { return "Nombre d'or (Définition)" }
            if languageCode == "es" { return "Proporción áurea (Definición)" }
            return "Golden Ratio (Definition & Value)"
        case "math_golden_ratio_prop":
            if languageCode == "zh" { return "黄金分割比例（线段划分 a : b）" }
            return "Golden Ratio (Proportion a : b)"
        case "math_fibonacci_binet":
            if languageCode == "zh" { return "斐波那契数列计算（比奈闭式公式）" }
            if languageCode == "fr" { return "Suite de Fibonacci (Formule de Binet)" }
            if languageCode == "es" { return "Sucesión de Fibonacci (Fórmula de Binet)" }
            return "Fibonacci Sequence (Binet's Formula)"
        case "math_geom_pythagoras":
            if languageCode == "zh" { return "勾股定理（毕达哥拉斯定理）" }
            return "Pythagorean Theorem"
        case "math_geom_circle_area":
            if languageCode == "zh" { return "圆形面积计算" }
            return "Circle Area"
        case "math_geom_circle_perimeter":
            if languageCode == "zh" { return "圆形周长计算" }
            return "Circle Perimeter"
        case "math_geom_sphere_vol":
            if languageCode == "zh" { return "球体体积计算" }
            return "Sphere Volume"
        case "math_geom_sphere_surface":
            if languageCode == "zh" { return "球体表面积计算" }
            return "Sphere Surface Area"
        case "math_alg_quadratic":
            if languageCode == "zh" { return "一元二次方程求根公式" }
            return "Quadratic Formula"
        case "math_stat_bayes":
            if languageCode == "zh" { return "贝叶斯条件概率定理" }
            return "Bayes' Theorem"
        case "math_alg_stirling":
            if languageCode == "zh" { return "斯特林阶乘近似渐近公式" }
            return "Stirling's Approximation (Factorial)"
        case "phys_dyn_newton2":
            if languageCode == "zh" { return "牛顿第二运动定律（动力学基本方程）" }
            return "Newton's Second Law of Motion"
        case "phys_kin_accel":
            if languageCode == "zh" { return "匀加速直线运动（速度公式）" }
            return "Uniformly Accelerated Motion"
        case "phys_nrj_kin":
            if languageCode == "zh" { return "动能公式" }
            return "Kinetic Energy"
        case "phys_nrj_pot":
            if languageCode == "zh" { return "重力势能公式" }
            return "Potential Energy (Gravitational)"
        case "phys_mech_density":
            if languageCode == "zh" { return "物体与介质密度公式" }
            return "Density"
        case "phys_mech_hydro_pressure":
            if languageCode == "zh" { return "流体静压强（深度重力压强）" }
            return "Hydrostatic Pressure"
        case "phys_rel_einstein":
            if languageCode == "zh" { return "质能等价方程（爱因斯坦）" }
            return "Mass-Energy Equivalence (Einstein)"
        case "phys_rel_gamma":
            if languageCode == "zh" { return "洛伦兹因子（相对论）" }
            return "Lorentz Factor"
        case "phys_quant_debroglie":
            if languageCode == "zh" { return "德布罗意物质波波长" }
            return "De Broglie Wavelength"
        case "phys_quant_photon":
            if languageCode == "zh" { return "普朗克-爱因斯坦光子能量公式" }
            return "Planck-Einstein Relation (Photon Energy)"
        case "phys_osc_pendulum":
            if languageCode == "zh" { return "单摆振动周期公式" }
            return "Simple Pendulum (Period)"
        case "phys_osc_spring":
            if languageCode == "zh" { return "弹簧谐振子振动周期公式" }
            return "Spring Pendulum (Harmonic Oscillator)"
        case "astro_grav_newton":
            if languageCode == "zh" { return "牛顿万有引力定律" }
            return "Newton's Law of Universal Gravitation"
        case "astro_escape_vel":
            if languageCode == "zh" { return "第二宇宙速度（天体逃逸速度）" }
            return "Escape Velocity"
        case "astro_schwarzschild":
            if languageCode == "zh" { return "史瓦西半径（黑洞事件视界）" }
            return "Schwarzschild Radius (Event Horizon)"
        case "astro_hubble":
            if languageCode == "zh" { return "哈勃-勒梅特定律（宇宙膨胀定律）" }
            return "Hubble-Lemaître Law (Cosmic Expansion)"
        case "astro_stefan_boltzmann":
            if languageCode == "zh" { return "斯特藩-玻尔兹曼黑体辐射定律" }
            return "Stefan-Boltzmann Law (Blackbody)"
        case "elec_ohm":
            if languageCode == "zh" { return "欧姆定律（电压、电流与电阻）" }
            return "Ohm's Law"
        case "elec_power_ui":
            if languageCode == "zh" { return "直流电功率公式" }
            return "Electric Power (DC)"
        case "elec_power_ri":
            if languageCode == "zh" { return "焦耳热损耗功率公式" }
            return "Joule Heating / Resistor Power"
        case "elec_ac_xc":
            if languageCode == "zh" { return "容抗计算公式（电容交流电抗）" }
            return "Capacitive Reactance (Xc)"
        case "elec_ac_xl":
            if languageCode == "zh" { return "感抗计算公式（电感交流电抗）" }
            return "Inductive Reactance (Xl)"
        case "elec_ac_thomson":
            if languageCode == "zh" { return "汤姆孙LC谐振频率公式" }
            return "Thomson's LC Resonance Frequency"
        case "chem_gas_ideal":
            if languageCode == "zh" { return "理想气体状态方程（克拉珀龙方程）" }
            return "Ideal Gas Law"
        case "chem_stoich_molar_mass":
            if languageCode == "zh" { return "摩尔质量与物质的量换算公式" }
            return "Molar Mass"
        case "chem_thermo_gibbs":
            if languageCode == "zh" { return "吉布斯-亥姆霍兹自由能判据方程" }
            return "Gibbs Free Energy Equation"
        case "thermo_carnot":
            if languageCode == "zh" { return "卡诺循环理论最大热机效率" }
            return "Carnot Efficiency"
        case "eng_mech_hooke":
            if languageCode == "zh" { return "胡克应力-应变线性弹性定律" }
            return "Hooke's Law (Stress-Strain)"
        case "eng_mech_stress":
            if languageCode == "zh" { return "正应力（拉压截面应力计算）" }
            return "Normal Mechanical Stress"
        case "eng_mech_torque":
            if languageCode == "zh" { return "力矩与杠杆原理公式" }
            return "Torque (Moment of Force)"
        case "eng_euler_buckling":
            if languageCode == "zh" { return "欧拉压杆临界失稳载荷公式" }
            return "Euler's Critical Buckling Load"
        case "cs_amdahl":
            if languageCode == "zh" { return "阿姆达尔定律（并行计算加速比）" }
            return "Amdahl's Law (Parallel Speedup)"
        case "cs_shannon":
            if languageCode == "zh" { return "香农-哈特利信道极限传输容量" }
            return "Shannon-Hartley Channel Capacity"
        case "fin_compound_interest":
            if languageCode == "zh" { return "复利终值计算模型" }
            return "Compound Interest"
        case "fin_present_value":
            if languageCode == "zh" { return "资金时间价值与现值贴现模型" }
            return "Present Value (Discounting)"
        default:
            return defaultName
        }
    }

    public func localizedFormulaDesc(id: String, defaultDesc: String, languageCode: String) -> String {
        guard languageCode != "de" else { return defaultDesc }
        switch id {
        case "math_golden_ratio":
            if languageCode == "zh" { return "黄金分割比例常数（神圣比例）。自然界、艺术与几何和谐的数学基石。" }
            return "The divine proportion (Phi = (1 + sqrt(5)) / 2). Fundamental constant of harmony."
        case "math_golden_ratio_prop":
            if languageCode == "zh" { return "通过较短线段 b 精确解析计算较长线段 a，符合黄金分割比率。" }
            return "Calculates the major segment 'a' from minor segment 'b' using the Golden Ratio."
        case "math_fibonacci_binet":
            if languageCode == "zh" { return "无需迭代递归，使用比奈闭式公式直接高精度求解第 n 项斐波那契数。" }
            return "Closed-form formula by J. P. M. Binet to calculate the n-th Fibonacci number directly."
        case "math_geom_pythagoras":
            if languageCode == "zh" { return "通过直角三角形两直角边 a 与 b 解析求解斜边 c 的长度。" }
            return "Calculates the hypotenuse c in a right triangle from legs a and b."
        case "phys_dyn_newton2":
            if languageCode == "zh" { return "物体所受合外力等于质量乘以加速度。经典力学第二基本公理。" }
            return "Force equals mass times acceleration. Core axiom of classical mechanics."
        case "phys_rel_einstein":
            if languageCode == "zh" { return "爱因斯坦狭义相对论核心结论：物体的静止质量等价于巨大能量。" }
            return "Albert Einstein's mass-energy equivalence equation."
        case "elec_ohm":
            if languageCode == "zh" { return "直流电路中电压、电阻与通过电流强度的确定性正比关系。" }
            return "Relationship between electric voltage U, resistance R, and current I."
        case "chem_gas_ideal":
            if languageCode == "zh" { return "热力学状态方程，描述理想气体压力、体积、物质的量与热力学温度关系。" }
            return "Thermodynamic equation of state of an ideal gas."
        default:
            return defaultDesc
        }
    }

    public func localizedVariableName(symbol: String, defaultName: String, languageCode: String) -> String {
        guard languageCode != "de" else { return defaultName }
        switch symbol {
        case "Phi": return languageCode == "zh" ? "黄金数 Phi" : "Golden Ratio Phi"
        case "Fn": return languageCode == "zh" ? "第 n 项斐波那契数" : "n-th Fibonacci Number"
        case "n": return languageCode == "zh" ? "序号 / 指数项 n" : "Index / Position n"
        case "a": return languageCode == "zh" ? "长线段 / 直角边 a" : "Major segment / Leg a"
        case "b": return languageCode == "zh" ? "短线段 / 直角边 b" : "Minor segment / Leg b"
        case "c": return languageCode == "zh" ? "斜边 / 光速常数 c" : "Hypotenuse / Speed of light"
        case "r": return languageCode == "zh" ? "半径 r" : "Radius"
        case "A": return languageCode == "zh" ? "面积 / 表面积" : "Area / Surface area"
        case "U": return languageCode == "zh" ? "周长 / 电压 U" : "Perimeter / Voltage"
        case "V": return languageCode == "zh" ? "体积 V" : "Volume"
        case "F": return languageCode == "zh" ? "作用力 F" : "Force"
        case "m": return languageCode == "zh" ? "物体质量 m" : "Mass"
        case "m1": return languageCode == "zh" ? "质量 1" : "Mass 1"
        case "m2": return languageCode == "zh" ? "质量 2" : "Mass 2"
        case "E": return languageCode == "zh" ? "能量 E" : "Energy"
        case "v": return languageCode == "zh" ? "运动速度 v" : "Velocity"
        case "v0": return languageCode == "zh" ? "初速度 v0" : "Initial velocity"
        case "g": return languageCode == "zh" ? "重力加速度 g" : "Gravitational acceleration"
        case "h": return languageCode == "zh" ? "高度 / 普朗克常数" : "Height / Planck constant"
        case "p": return languageCode == "zh" ? "压强 / 动量" : "Pressure / Momentum"
        case "P": return languageCode == "zh" ? "功率 / 概率" : "Power / Probability"
        case "T": return languageCode == "zh" ? "周期 / 绝对温度" : "Period / Temperature"
        case "R": return languageCode == "zh" ? "电阻 / 理想气体常数" : "Resistance / Gas constant"
        case "I": return languageCode == "zh" ? "电流 / 惯性矩" : "Current / Moment of inertia"
        case "f": return languageCode == "zh" ? "频率 f" : "Frequency"
        case "C": return languageCode == "zh" ? "电容 / 信道容量" : "Capacitance / Channel capacity"
        case "L": return languageCode == "zh" ? "电感 / 长度" : "Inductance / Length"
        case "rho": return languageCode == "zh" ? "密度 rho" : "Density"
        case "gamma": return languageCode == "zh" ? "洛伦兹因子 gamma" : "Lorentz Factor"
        case "lambda": return languageCode == "zh" ? "波长 lambda" : "Wavelength"
        case "sigma": return languageCode == "zh" ? "机械应力 sigma" : "Stress"
        case "eps": return languageCode == "zh" ? "应变 epsilon" : "Strain"
        case "M": return languageCode == "zh" ? "力矩 / 摩尔质量" : "Torque / Molar mass"
        case "K0": return languageCode == "zh" ? "初始本金" : "Initial Capital"
        case "Kn": return languageCode == "zh" ? "期末本利和" : "Final Capital"
        case "PV": return languageCode == "zh" ? "现值（PV）" : "Present Value"
        case "FV": return languageCode == "zh" ? "终值（FV）" : "Future Value"
        default: return defaultName
        }
    }
}
