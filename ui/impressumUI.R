###############################################
#
# UI for about us tab
#
###############################################

impressumTab <- tabPanel("Impressum - Legal Notice",
                     fluidPage(
                       h2("Impressum - Legal Notice"),
                       p("The following information (Impressum) is required under Austrian law."),
                       p("Informationspflicht laut §5 E-Commerce Gesetz, §14 Unternehmensgesetzbuch, §63 Gewerbeordnung und Offenlegungspflicht laut §25 Mediengesetz."),
                       
                       h3("Kontakt"),
                       p("Peter Öhlinger"),
                       p("Michael-Hainisch-Straße 2,"),
                       p("4040 Linz,"),
                       p("Österreich"),
                       p("E-Mail: ", a(href="mailto:peter.oehlinger@jku.at", "peter.oehlinger@jku.at")),
                       
                       h3("EU-Streitschlichtung"),
                       p("Gemäß Verordnung über Online-Streitbeilegung in Verbraucherangelegenheiten (ODR-Verordnung) möchten wir Sie über die Online-Streitbeilegungsplattform (OS-Plattform) informieren."),
                       p("Verbraucher haben die Möglichkeit, Beschwerden an die Online Streitbeilegungsplattform der Europäischen Kommission unter ", 
                         a(href="http://ec.europa.eu/odr?tid=121890394", "http://ec.europa.eu/odr?tid=121890394"), " zu richten. Die dafür notwendigen Kontaktdaten finden Sie oberhalb in unserem Impressum."),
                       p("Wir möchten Sie jedoch darauf hinweisen, dass wir nicht bereit oder verpflichtet sind, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen."),
                       
                       h3("Haftung für Inhalte dieser Website"),
                       p("Wir entwickeln die Inhalte dieser Website ständig weiter und bemühen uns, korrekte und aktuelle Informationen bereitzustellen. Leider können wir keine Haftung für die Korrektheit aller Inhalte auf dieser Website übernehmen, speziell für jene, die seitens Dritter bereitgestellt wurden."),
                       p("Als Diensteanbieter sind wir nicht verpflichtet, die von ihnen übermittelten oder gespeicherten Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen."),
                       p("Unsere Verpflichtungen zur Entfernung von Informationen oder zur Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen aufgrund von gerichtlichen oder behördlichen Anordnungen bleiben auch im Falle unserer Nichtverantwortlichkeit davon unberührt."),
                       p("Sollten Ihnen problematische oder rechtswidrige Inhalte auffallen, bitten wir Sie, uns umgehend zu kontaktieren, damit wir die rechtswidrigen Inhalte entfernen können. Sie finden die Kontaktdaten im Impressum."),
                       
                       h3("Haftung für Links auf dieser Website"),
                       p("Unsere Website enthält Links zu anderen Websites, für deren Inhalt wir nicht verantwortlich sind. Haftung für verlinkte Websites besteht für uns nicht, da wir keine Kenntnis rechtswidriger Tätigkeiten hatten und haben, uns solche Rechtswidrigkeiten auch bisher nicht aufgefallen sind, und wir Links sofort entfernen würden, wenn uns Rechtswidrigkeiten bekannt werden."),
                       p("Wenn Ihnen rechtswidrige Links auf unserer Website auffallen, bitten wir Sie, uns zu kontaktieren. Sie finden die Kontaktdaten im Impressum."),
                       
                       h3("Urheberrechtshinweis"),
                       p("Alle Inhalte dieser Webseite (Bilder, Fotos, Texte, Videos) unterliegen dem Urheberrecht. Bitte fragen Sie uns, bevor Sie die Inhalte dieser Website verbreiten, vervielfältigen oder verwerten, wie zum Beispiel auf anderen Websites erneut veröffentlichen. Falls notwendig, werden wir die unerlaubte Nutzung von Teilen der Inhalte unserer Seite rechtlich verfolgen."),
                       p("Sollten Sie auf dieser Webseite Inhalte finden, die das Urheberrecht verletzen, bitten wir Sie, uns zu kontaktieren."),
                       
                       h3("Bildernachweis"),
                       p("Die Bilder, Fotos und Grafiken auf dieser Webseite sind urheberrechtlich geschützt."),
                       p("Die Bilderrechte liegen bei den folgenden Fotografen und Unternehmen:"),
                       p("Peter Öhlinger"),
                       p("Alle Texte sind urheberrechtlich geschützt."),
                       
                       p("Quelle: Erstellt mit dem Impressum Generator von AdSimple")
                     )
  )#Tab panel

