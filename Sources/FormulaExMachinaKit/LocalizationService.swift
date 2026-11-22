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

    // Fachgebiete / Kategorien
    case catPhysics = "cat_physics"
    case catMath = "cat_math"
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

        // 1. DEUTSCH
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
            .catPhysics: "Physik",
            .catMath: "Mathematik",
            .catElectrical: "Elektrotechnik",
            .catChemistry: "Chemie",
            .catEngineering: "Maschinenbau & Statik",
            .catFinance: "Finanzmathematik",
            .catComputerScience: "Informatik & Information"
        ]

        // 2. ENGLISCH (Standard-Fallback)
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
            .solutionSteps: "Step-by-step solution & transformations",
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
            .footerDevelopedBy: "Developed by SonnerStudio • Jan Friske • 100% Offline • Local symbolic algebra",
            .catPhysics: "Physics",
            .catMath: "Mathematics",
            .catElectrical: "Electrical Engineering",
            .catChemistry: "Chemistry",
            .catEngineering: "Mechanical Engineering",
            .catFinance: "Financial Mathematics",
            .catComputerScience: "Computer Science & Information"
        ]

        // 3. SPANISCH
        dict["es"] = [
            .disciplines: "Disciplinas",
            .searchPlaceholder: "Buscar fórmulas, símbolos, unidades...",
            .formulas: "Fórmulas",
            .noFormulaSelected: "Ninguna fórmula seleccionada",
            .noFormulaSelectedDesc: "Seleccione una fórmula de la barra lateral o busque un tema.",
            .rearrangeFor: "Despejar fórmula para:",
            .rearrangedFormula: "Fórmula despejada:",
            .inputValues: "Parámetros de entrada",
            .enterValue: "Ingresar valor",
            .calculatedResult: "Resultado calculado",
            .copy: "Copiar",
            .copied: "¡Copiado!",
            .solutionSteps: "Paso a paso de la resolución",
            .unit: "Unidad:",
            .calculation: "Cálculo",
            .recalculate: "Recalcular",
            .copyResult: "Copiar resultado",
            .update: "Actualizar",
            .checkingUpdates: "Buscando actualizaciones...",
            .upToDate: "¡Ya está actualizado!",
            .updateFailed: "Error al actualizar o sin conexión.",
            .liveCalculationHelp: "Ingrese valor numérico. Cálculo en vivo.",
            .step: "Paso",
            .offlineBadge: "Sin conexión",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Desarrollado por SonnerStudio • Jan Friske • 100% Offline • Álgebra simbólica local",
            .catPhysics: "Física",
            .catMath: "Matemáticas",
            .catElectrical: "Ingeniería Eléctrica",
            .catChemistry: "Química",
            .catEngineering: "Ingeniería Mecánica",
            .catFinance: "Matemáticas Financieras",
            .catComputerScience: "Informática"
        ]

        // 4. FRANZÖSISCH
        dict["fr"] = [
            .disciplines: "Disciplines",
            .searchPlaceholder: "Rechercher des formules, symboles, unités...",
            .formulas: "Formules",
            .noFormulaSelected: "Aucune formule sélectionnée",
            .noFormulaSelectedDesc: "Sélectionnez une formule dans la barre latérale ou recherchez un sujet.",
            .rearrangeFor: "Isoler la variable :",
            .rearrangedFormula: "Formule isolée :",
            .inputValues: "Paramètres d'entrée",
            .enterValue: "Entrer la valeur",
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
            .liveCalculationHelp: "Entrez une valeur numérique. Calcul en direct.",
            .step: "Étape",
            .offlineBadge: "Hors ligne",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Développé par SonnerStudio • Jan Friske • 100% Hors ligne • Algèbre symbolique locale",
            .catPhysics: "Physique",
            .catMath: "Mathématiques",
            .catElectrical: "Génie Électrique",
            .catChemistry: "Chimie",
            .catEngineering: "Génie Mécanique",
            .catFinance: "Mathématiques Financières",
            .catComputerScience: "Informatique"
        ]

        // 5. ITALIENISCH
        dict["it"] = [
            .disciplines: "Discipline",
            .searchPlaceholder: "Cerca formule, simboli, unità...",
            .formulas: "Formule",
            .noFormulaSelected: "Nessuna formula selezionata",
            .noFormulaSelectedDesc: "Seleziona una formula dalla barra laterale o cerca un argomento.",
            .rearrangeFor: "Esplicita formula per:",
            .rearrangedFormula: "Formula esplicitata:",
            .inputValues: "Valori di input",
            .enterValue: "Inserisci valore",
            .calculatedResult: "Risultato calcolato",
            .copy: "Copia",
            .copied: "Copiato!",
            .solutionSteps: "Passaggi risolutivi e trasformazioni",
            .unit: "Unità:",
            .calculation: "Calcolo",
            .recalculate: "Ricalcola",
            .copyResult: "Copia risultato",
            .update: "Aggiorna",
            .checkingUpdates: "Verifica aggiornamenti...",
            .upToDate: "Già aggiornato!",
            .updateFailed: "Aggiornamento non riuscito.",
            .liveCalculationHelp: "Inserisci valore numerico. Calcolo in tempo reale.",
            .step: "Passo",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Sviluppato da SonnerStudio • Jan Friske • 100% Offline • Algebra simbolica locale",
            .catPhysics: "Fisica",
            .catMath: "Matematica",
            .catElectrical: "Elettrotecnica",
            .catChemistry: "Chimica",
            .catEngineering: "Ingegneria Meccanica",
            .catFinance: "Matematica Finanziaria",
            .catComputerScience: "Informatica"
        ]

        // 6. PORTUGIESISCH
        dict["pt"] = [
            .disciplines: "Disciplinas",
            .searchPlaceholder: "Pesquisar fórmulas, símbolos, unidades...",
            .formulas: "Fórmulas",
            .noFormulaSelected: "Nenhuma fórmula selecionada",
            .noFormulaSelectedDesc: "Selecione uma fórmula na barra lateral ou pesquise um tópico.",
            .rearrangeFor: "Isolar fórmula para:",
            .rearrangedFormula: "Fórmula isolada:",
            .inputValues: "Parâmetros de entrada",
            .enterValue: "Inserir valor",
            .calculatedResult: "Resultado calculado",
            .copy: "Copiar",
            .copied: "Copiado!",
            .solutionSteps: "Passo a passo da resolução",
            .unit: "Unidade:",
            .calculation: "Cálculo",
            .recalculate: "Recalcular",
            .copyResult: "Copiar resultado",
            .update: "Atualizar",
            .checkingUpdates: "Verificando atualizações...",
            .upToDate: "Já está atualizado!",
            .updateFailed: "Falha na atualização.",
            .liveCalculationHelp: "Insira valor numérico. Cálculo em tempo real.",
            .step: "Passo",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Desenvolvido por SonnerStudio • Jan Friske • 100% Offline",
            .catPhysics: "Física",
            .catMath: "Matemática",
            .catElectrical: "Engenharia Elétrica",
            .catChemistry: "Química",
            .catEngineering: "Engenharia Mecânica",
            .catFinance: "Matemática Financeira",
            .catComputerScience: "Ciência da Computação"
        ]

        // 7. RUSSISCH
        dict["ru"] = [
            .disciplines: "Дисциплины",
            .searchPlaceholder: "Поиск формул, символов, единиц...",
            .formulas: "Формулы",
            .noFormulaSelected: "Формула не выбрана",
            .noFormulaSelectedDesc: "Выберите формулу на боковой панели или выполните поиск.",
            .rearrangeFor: "Выразить переменную:",
            .rearrangedFormula: "Преобразованная формула:",
            .inputValues: "Входные параметры",
            .enterValue: "Введите значение",
            .calculatedResult: "Вычисленный результат",
            .copy: "Копировать",
            .copied: "Скопировано!",
            .solutionSteps: "Пошаговое решение и преобразования",
            .unit: "Единица:",
            .calculation: "Вычисление",
            .recalculate: "Пересчитать",
            .copyResult: "Копировать результат",
            .update: "Обновление",
            .checkingUpdates: "Проверка обновлений...",
            .upToDate: "Уже установлена последняя версия!",
            .updateFailed: "Ошибка обновления.",
            .liveCalculationHelp: "Введите число. Вычисление в реальном времени.",
            .step: "Шаг",
            .offlineBadge: "Офлайн",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Разработано SonnerStudio • Ян Фриске • 100% Офлайн",
            .catPhysics: "Физика",
            .catMath: "Математика",
            .catElectrical: "Электротехника",
            .catChemistry: "Химия",
            .catEngineering: "Машиностроение",
            .catFinance: "Финансовая математика",
            .catComputerScience: "Информатика"
        ]

        // 8. CHINESISCH (MANDARIN)
        dict["zh"] = [
            .disciplines: "学科门类",
            .searchPlaceholder: "搜索公式、符号、单位...",
            .formulas: "公式库",
            .noFormulaSelected: "未选择公式",
            .noFormulaSelectedDesc: "从侧边栏选择公式或搜索主题。",
            .rearrangeFor: "求解目标变量：",
            .rearrangedFormula: "已推导变形公式：",
            .inputValues: "已知输入参数",
            .enterValue: "输入数值",
            .calculatedResult: "计算结果",
            .copy: "复制",
            .copied: "已复制！",
            .solutionSteps: "代数推导求解步骤",
            .unit: "单位：",
            .calculation: "计算",
            .recalculate: "重新计算",
            .copyResult: "复制计算结果",
            .update: "检查更新",
            .checkingUpdates: "正在检查更新...",
            .upToDate: "已是最新版本！",
            .updateFailed: "更新失败或无网络连接。",
            .liveCalculationHelp: "输入数值，实时进行精确计算。",
            .step: "步骤",
            .offlineBadge: "离线就绪",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "由 SonnerStudio • Jan Friske 开发 • 100% 离线符号代数",
            .catPhysics: "物理学",
            .catMath: "数学",
            .catElectrical: "电气工程",
            .catChemistry: "化学",
            .catEngineering: "机械工程与静力学",
            .catFinance: "金融数学",
            .catComputerScience: "计算机科学与信息论"
        ]

        // 9. JAPANISCH
        dict["ja"] = [
            .disciplines: "専門分野",
            .searchPlaceholder: "公式、記号、単位を検索...",
            .formulas: "公式一覧",
            .noFormulaSelected: "数式が選択されていません",
            .noFormulaSelectedDesc: "サイドバーから公式を選択するか、検索してください。",
            .rearrangeFor: "変形対象の変数：",
            .rearrangedFormula: "変形後の公式：",
            .inputValues: "入力パラメータ",
            .enterValue: "数値を入力",
            .calculatedResult: "計算結果",
            .copy: "コピー",
            .copied: "コピー完了！",
            .solutionSteps: "導出ステップと変形手順",
            .unit: "単位：",
            .calculation: "計算",
            .recalculate: "再計算",
            .copyResult: "結果をコピー",
            .update: "アップデート",
            .checkingUpdates: "更新を確認中...",
            .upToDate: "最新版です！",
            .updateFailed: "アップデートに失敗しました。",
            .liveCalculationHelp: "数値を入力するとリアルタイムで計算されます。",
            .step: "ステップ",
            .offlineBadge: "オフライン",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "SonnerStudio • Jan Friske 開発 • 100% 完全オフライン",
            .catPhysics: "物理学",
            .catMath: "数学",
            .catElectrical: "電気工学",
            .catChemistry: "化学",
            .catEngineering: "機械工学",
            .catFinance: "金融工学・数学",
            .catComputerScience: "情報科学"
        ]

        // 10. HINDI
        dict["hi"] = [
            .disciplines: "विषय क्षेत्र",
            .searchPlaceholder: "सूत्र, प्रतीक, इकाइयां खोजें...",
            .formulas: "सूत्र सूची",
            .noFormulaSelected: "कोई सूत्र चयनित नहीं",
            .noFormulaSelectedDesc: "साइडबार से एक सूत्र चुनें या खोजें।",
            .rearrangeFor: "इस चर के लिए हल करें:",
            .rearrangedFormula: "रूपांतरित सूत्र:",
            .inputValues: "इनपुट मान",
            .enterValue: "मान दर्ज करें",
            .calculatedResult: "गणना परिणाम",
            .copy: "कॉपी करें",
            .copied: "कॉपी किया गया!",
            .solutionSteps: "समाधान के चरण",
            .unit: "इकाई:",
            .calculation: "गणना",
            .recalculate: "पुनः गणना करें",
            .copyResult: "परिणाम कॉपी करें",
            .update: "अपडेट",
            .checkingUpdates: "अपडेट की जाँच हो रही है...",
            .upToDate: "पहले से ही नवीनतम!",
            .updateFailed: "अपडेट विफल।",
            .liveCalculationHelp: "संख्यात्मक मान दर्ज करें। लाइव गणना।",
            .step: "चरण",
            .offlineBadge: "ऑफ़लाइन",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "SonnerStudio • Jan Friske द्वारा विकसित",
            .catPhysics: "भौतिकी",
            .catMath: "गणित",
            .catElectrical: "विद्युत अभियांत्रिकी",
            .catChemistry: "रसायन विज्ञान",
            .catEngineering: "यांत्रिक अभियांत्रिकी",
            .catFinance: "वित्तीय गणित",
            .catComputerScience: "कंप्यूटर विज्ञान"
        ]

        // 11. ARABISCH
        dict["ar"] = [
            .disciplines: "التخصصات العلمية",
            .searchPlaceholder: "بحث عن الصيغ والرموز والوحدات...",
            .formulas: "الصيغ والمعادلات",
            .noFormulaSelected: "لم يتم تحديد أي صيغة",
            .noFormulaSelectedDesc: "اختر صيغة من الشريط الجانبي أو ابحث عن موضوع.",
            .rearrangeFor: "عزل المتغير المطلوب:",
            .rearrangedFormula: "المعادلة المحولة:",
            .inputValues: "قيم المدخلات",
            .enterValue: "أدخل القيمة",
            .calculatedResult: "النتيجة المحسوبة",
            .copy: "نسخ",
            .copied: "تم النسخ!",
            .solutionSteps: "خطوات الحل والتحويل الجبري",
            .unit: "الوحدة:",
            .calculation: "الحساب",
            .recalculate: "إعادة الحساب",
            .copyResult: "نسخ النتيجة",
            .update: "تحديث",
            .checkingUpdates: "جارٍ التحقق من التحديثات...",
            .upToDate: "أحدث إصدار مثبت بالفعل!",
            .updateFailed: "فشل التحديث.",
            .liveCalculationHelp: "أدخل القيمة الرقمية للحساب المباشر.",
            .step: "خطوة",
            .offlineBadge: "يعمل دون اتصال",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "تطوير SonnerStudio • Jan Friske",
            .catPhysics: "الفيزياء",
            .catMath: "الرياضيات",
            .catElectrical: "الهندسة الكهربائية",
            .catChemistry: "الكيمياء",
            .catEngineering: "الهندسة الميكانيكية",
            .catFinance: "الرياضيات المالية",
            .catComputerScience: "علوم الحاسوب"
        ]

        // 12. TÜRKISCH
        dict["tr"] = [
            .disciplines: "Uzmanlık Alanları",
            .searchPlaceholder: "Formüller, semboller, birimler ara...",
            .formulas: "Formüller",
            .noFormulaSelected: "Formül seçilmedi",
            .noFormulaSelectedDesc: "Kenar çubuğundan bir formül seçin veya arama yapın.",
            .rearrangeFor: "Değişkeni yalnız bırak:",
            .rearrangedFormula: "Dönüştürülmüş formül:",
            .inputValues: "Girdi Parametreleri",
            .enterValue: "Değer girin",
            .calculatedResult: "Hesaplanan Sonuç",
            .copy: "Kopyala",
            .copied: "Kopyalandı!",
            .solutionSteps: "Çözüm ve dönüştürme adımları",
            .unit: "Birim:",
            .calculation: "Hesaplama",
            .recalculate: "Yeniden hesapla",
            .copyResult: "Sonucu kopyala",
            .update: "Güncelle",
            .checkingUpdates: "Güncellemeler denetleniyor...",
            .upToDate: "Zaten en güncel sürümdesiniz!",
            .updateFailed: "Güncelleme başarısız.",
            .liveCalculationHelp: "Sayısal değer girin. Canlı hesaplama yapılır.",
            .step: "Adım",
            .offlineBadge: "Çevrimdışı",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "SonnerStudio • Jan Friske tarafından geliştirildi",
            .catPhysics: "Fizik",
            .catMath: "Matematik",
            .catElectrical: "Elektrik Mühendisliği",
            .catChemistry: "Kimya",
            .catEngineering: "Makine Mühendisliği",
            .catFinance: "Finansal Matematik",
            .catComputerScience: "Bilgisayar Bilimi"
        ]

        // 13. NIEDERLÄNDISCH
        dict["nl"] = [
            .disciplines: "Vakgebieden",
            .searchPlaceholder: "Zoek formules, symbolen, eenheden...",
            .formulas: "Formules",
            .noFormulaSelected: "Geen formule geselecteerd",
            .noFormulaSelectedDesc: "Selecteer een formule in de zijbalk of zoek op onderwerp.",
            .rearrangeFor: "Formule omzetten naar:",
            .rearrangedFormula: "Omgezette formule:",
            .inputValues: "Invoerwaarden",
            .enterValue: "Voer waarde in",
            .calculatedResult: "Berekend resultaat",
            .copy: "Kopiëren",
            .copied: "Gekopieerd!",
            .solutionSteps: "Oplossingsstappen & transformaties",
            .unit: "Eenheid:",
            .calculation: "Berekening",
            .recalculate: "Herberekenen",
            .copyResult: "Resultaat kopiëren",
            .update: "Update",
            .checkingUpdates: "Controleren op updates...",
            .upToDate: "Al up-to-date!",
            .updateFailed: "Update mislukt.",
            .liveCalculationHelp: "Voer numerieke waarde in. Live berekening.",
            .step: "Stap",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Ontwikkeld door SonnerStudio • Jan Friske",
            .catPhysics: "Natuurkunde",
            .catMath: "Wiskunde",
            .catElectrical: "Elektrotechniek",
            .catChemistry: "Scheikunde",
            .catEngineering: "Werktuigbouwkunde",
            .catFinance: "Financiële wiskunde",
            .catComputerScience: "Informatica"
        ]

        // 14. POLNISCH
        dict["pl"] = [
            .disciplines: "Dziedziny",
            .searchPlaceholder: "Szukaj wzorów, symboli, jednostek...",
            .formulas: "Wzory",
            .noFormulaSelected: "Nie wybrano wzoru",
            .noFormulaSelectedDesc: "Wybierz wzór z paska bocznego lub wyszukaj temat.",
            .rearrangeFor: "Przekształć wzór dla:",
            .rearrangedFormula: "Przekształcony wzór:",
            .inputValues: "Wartości wejściowe",
            .enterValue: "Wpisz wartość",
            .calculatedResult: "Obliczony wynik",
            .copy: "Kopiuj",
            .copied: "Skopiowano!",
            .solutionSteps: "Kroki rozwiązania i przekształcenia",
            .unit: "Jednostka:",
            .calculation: "Obliczenia",
            .recalculate: "Przelicz",
            .copyResult: "Kopiuj wynik",
            .update: "Aktualizuj",
            .checkingUpdates: "Sprawdzanie aktualizacji...",
            .upToDate: "Wersja jest aktualna!",
            .updateFailed: "Aktualizacja nie powiodła się.",
            .liveCalculationHelp: "Wprowadź liczbę. Obliczenia na żywo.",
            .step: "Krok",
            .offlineBadge: "Offline",
            .liquidGlassBadge: "Liquid Glass",
            .footerDevelopedBy: "Stworzone przez SonnerStudio • Jan Friske",
            .catPhysics: "Fizyka",
            .catMath: "Matematyka",
            .catElectrical: "Elektrotechnika",
            .catChemistry: "Chemia",
            .catEngineering: "Inżynieria mechaniczna",
            .catFinance: "Matematyka finansowa",
            .catComputerScience: "Informatyka"
        ]

        self.translations = dict
    }

    /// Gibt die Übersetzung für einen Schlüssel in der gewählten Sprache zurück
    /// Fallback-Kette: gewählte Sprache -> Englisch (en) -> Deutsch (de)
    public func string(for key: LocalizedKey, languageCode: String) -> String {
        if let langDict = translations[languageCode], let val = langDict[key] {
            return val
        }
        if let enDict = translations["en"], let val = enDict[key] {
            return val
        }
        return translations["de"]?[key] ?? key.rawValue
    }

    /// Übersetzt Kategorienamen dynamisch
    public func localizedCategory(_ rawName: String, languageCode: String) -> String {
        switch rawName {
        case "Physik", "Physics":
            return string(for: .catPhysics, languageCode: languageCode)
        case "Mathematik", "Mathematics":
            return string(for: .catMath, languageCode: languageCode)
        case "Astronomie & Astrophysik", "Astronomy & Astrophysics":
            return languageCode == "de" ? "Astronomie & Astrophysik" : "Astronomy & Astrophysics"
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

    /// Übersetzt Unterkategorienamen
    public func localizedSubcategory(_ rawName: String, languageCode: String) -> String {
        guard languageCode != "de" else { return rawName }
        switch rawName {
        case "Goldener Schnitt & Folgen": return "Golden Ratio & Sequences"
        case "Geometrie 2D (Flächen)": return "2D Geometry (Areas)"
        case "Geometrie 3D (Körper)": return "3D Geometry (Solids)"
        case "Trigonometrie": return "Trigonometry"
        case "Algebra & Analysis": return "Algebra & Calculus"
        case "Statistik & Stochastik": return "Statistics & Probability"
        case "Kinematik": return "Kinematics"
        case "Dynamik": return "Dynamics"
        case "Arbeit & Energie": return "Work & Energy"
        case "Schwingungen & Wellen": return "Oscillations & Waves"
        case "Optik & Strahlung": return "Optics & Radiation"
        case "Relativität & Quantenphysik": return "Relativity & Quantum Physics"
        case "Gravitation & Bahnbewegung": return "Gravitation & Orbital Mechanics"
        case "Kosmologie & Sterne": return "Cosmology & Stars"
        case "Hochenergie-Astrophysik": return "High-Energy Astrophysics"
        case "Gleichstrom & Netzwerke": return "Direct Current & Networks"
        case "Wechselstrom & Blindwiderstände": return "Alternating Current & Reactance"
        case "Elektromagnetische Felder & Wellen": return "Electromagnetic Fields & Waves"
        case "Gase & Thermodynamik": return "Gases & Thermodynamics"
        case "Lösungen & Kinetik": return "Solutions & Kinetics"
        case "Elektrochemie & pH-Gleichgewichte": return "Electrochemistry & pH Equilibria"
        case "Festigkeitslehre & Elastizität": return "Mechanics of Materials"
        case "Strömungsmechanik": return "Fluid Mechanics"
        case "Statik & Antriebe": return "Statics & Drives"
        case "Informationstheorie & Codierung": return "Information Theory & Coding"
        case "Systemleistung & Skalierung": return "System Performance & Scaling"
        case "Zins & Zinseszins": return "Interest & Compounding"
        case "Investitionsrechnung & Barwert": return "Investment & Present Value"
        default: return rawName
        }
    }

    /// Übersetzt physikalische Einheitenkategorien
    public func localizedUnitCategory(_ category: UnitCategory, languageCode: String) -> String {
        guard languageCode != "de" else { return category.rawValue }
        switch category {
        case .length: return "Length"
        case .time: return "Time"
        case .mass: return "Mass"
        case .velocity: return "Velocity"
        case .acceleration: return "Acceleration"
        case .force: return "Force"
        case .energy: return "Energy & Work"
        case .power: return "Power"
        case .pressure: return "Pressure"
        case .electricVoltage: return "Electric Voltage"
        case .electricCurrent: return "Electric Current"
        case .electricResistance: return "Electric Resistance"
        case .temperature: return "Temperature"
        case .dimensionless: return "Dimensionless / Number"
        }
    }

    /// Übersetzt Formelnamen ins Englische / Internationale
    public func localizedFormulaName(id: String, defaultName: String, languageCode: String) -> String {
        guard languageCode != "de" else { return defaultName }
        switch id {
        case "math_golden_ratio": return "Golden Ratio (Definition & Value)"
        case "math_golden_ratio_prop": return "Golden Ratio (Proportion a : b)"
        case "math_fibonacci_binet": return "Fibonacci Sequence (Binet's Formula)"
        case "math_geom_pythagoras": return "Pythagorean Theorem"
        case "math_geom_circle_area": return "Circle Area"
        case "math_geom_circle_perimeter": return "Circle Perimeter"
        case "math_geom_sphere_vol": return "Sphere Volume"
        case "math_geom_sphere_surface": return "Sphere Surface Area"
        case "math_alg_quadratic": return "Quadratic Formula"
        case "math_stat_bayes": return "Bayes' Theorem"
        case "math_alg_stirling": return "Stirling's Approximation (Factorial)"
        case "phys_dyn_newton2": return "Newton's Second Law of Motion"
        case "phys_nrj_kin": return "Kinetic Energy"
        case "phys_nrj_pot": return "Potential Energy (Gravitational)"
        case "phys_mech_density": return "Density"
        case "phys_mech_hydro_pressure": return "Hydrostatic Pressure"
        case "phys_rel_einstein": return "Mass-Energy Equivalence (Einstein)"
        case "phys_rel_gamma": return "Lorentz Factor"
        case "phys_quant_debroglie": return "De Broglie Wavelength"
        case "phys_quant_photon": return "Planck-Einstein Relation (Photon Energy)"
        case "phys_osc_pendulum": return "Simple Pendulum (Period)"
        case "phys_osc_spring": return "Spring Pendulum (Harmonic Oscillator)"
        case "astro_grav_newton": return "Newton's Law of Universal Gravitation"
        case "astro_escape_vel": return "Escape Velocity"
        case "astro_schwarzschild": return "Schwarzschild Radius (Event Horizon)"
        case "astro_hubble": return "Hubble-Lemaître Law (Cosmic Expansion)"
        case "astro_stefan_boltzmann": return "Stefan-Boltzmann Law (Blackbody)"
        case "elec_ohm": return "Ohm's Law"
        case "elec_power_ui": return "Electric Power (DC)"
        case "elec_power_ri": return "Joule Heating / Resistor Power"
        case "elec_ac_xc": return "Capacitive Reactance (Xc)"
        case "elec_ac_xl": return "Inductive Reactance (Xl)"
        case "elec_ac_thomson": return "Thomson's LC Resonance Frequency"
        case "chem_gas_ideal": return "Ideal Gas Law"
        case "chem_stoich_molar_mass": return "Molar Mass"
        case "chem_thermo_gibbs": return "Gibbs Free Energy Equation"
        case "thermo_carnot": return "Carnot Efficiency"
        case "eng_mech_hooke": return "Hooke's Law (Stress-Strain)"
        case "eng_mech_stress": return "Normal Mechanical Stress"
        case "eng_mech_torque": return "Torque (Moment of Force)"
        case "eng_euler_buckling": return "Euler's Critical Buckling Load"
        case "cs_amdahl": return "Amdahl's Law (Parallel Speedup)"
        case "cs_shannon": return "Shannon-Hartley Channel Capacity"
        case "fin_compound_interest": return "Compound Interest"
        case "fin_present_value": return "Present Value (Discounting)"
        default: return defaultName
        }
    }

    /// Übersetzt Formelbeschreibungen
    public func localizedFormulaDesc(id: String, defaultDesc: String, languageCode: String) -> String {
        guard languageCode != "de" else { return defaultDesc }
        switch id {
        case "math_golden_ratio": return "The divine proportion (Phi = (1 + sqrt(5)) / 2). Fundamental constant of harmony."
        case "math_golden_ratio_prop": return "Calculates the major segment 'a' from minor segment 'b' using the Golden Ratio."
        case "math_fibonacci_binet": return "Closed-form formula by J. P. M. Binet to calculate the n-th Fibonacci number directly."
        case "math_geom_pythagoras": return "Calculates the hypotenuse c in a right triangle from legs a and b."
        case "phys_dyn_newton2": return "Force equals mass times acceleration. Core axiom of classical mechanics."
        case "phys_rel_einstein": return "Albert Einstein's mass-energy equivalence equation."
        case "elec_ohm": return "Relationship between electric voltage U, resistance R, and current I."
        case "chem_gas_ideal": return "Thermodynamic equation of state of an ideal gas."
        default: return defaultDesc
        }
    }

    /// Übersetzt Variablennamen
    public func localizedVariableName(symbol: String, defaultName: String, languageCode: String) -> String {
        guard languageCode != "de" else { return defaultName }
        switch symbol {
        case "Phi": return "Golden Ratio Phi"
        case "Fn": return "n-th Fibonacci Number"
        case "n": return "Index / Position n"
        case "a": return "Major segment / Leg a"
        case "b": return "Minor segment / Leg b"
        case "c": return "Hypotenuse / Speed of light"
        case "r": return "Radius"
        case "A": return "Area / Surface area"
        case "U": return "Perimeter / Voltage"
        case "V": return "Volume"
        case "F": return "Force"
        case "m": return "Mass"
        case "m1": return "Mass 1"
        case "m2": return "Mass 2"
        case "E": return "Energy"
        case "v": return "Velocity"
        case "g": return "Gravitational acceleration"
        case "h": return "Height / Planck constant"
        case "p": return "Pressure / Momentum"
        case "P": return "Power / Probability"
        case "T": return "Period / Temperature"
        case "R": return "Resistance / Gas constant"
        case "I": return "Current / Moment of inertia"
        case "f": return "Frequency"
        case "C": return "Capacitance / Channel capacity"
        case "L": return "Inductance / Length"
        case "rho": return "Density"
        case "gamma": return "Lorentz Factor"
        case "lambda": return "Wavelength"
        case "sigma": return "Stress / Stefan-Boltzmann"
        case "eps": return "Strain"
        case "M": return "Torque / Molar mass"
        case "K0": return "Initial Capital"
        case "Kn": return "Final Capital"
        case "PV": return "Present Value"
        case "FV": return "Future Value"
        default: return defaultName
        }
    }
}
