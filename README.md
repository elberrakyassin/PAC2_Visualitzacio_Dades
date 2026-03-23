PAC 2: Visualització de Dades - Disseny i Tècniques Avançades
Aquest repositori conté els treballs realitzats per a la PAC 2 de l'assignatura de Visualització de Dades. L'objectiu del projecte és aplicar diferents tècniques de representació visual per analitzar la transició energètica i la inversió en recerca a Europa i el món.

Autor: Yassin El Berrak

Enllaç al Repositori: https://github.com/elberrakyassin/PAC2_Visualitzacio_Dades

📂 Estructura del Projecte
El projecte està organitzat en tres carpetes principals, cadascuna dedicada a una tècnica específica segons l'enunciat:

1. 01_Infografia_Renovables
Aquesta carpeta conté la documentació i els actius relatius a la infografia sobre la quota d'energia renovable a la Unió Europea.

Tècnica: Infografia (Dònut + Rànquing de columnes).

Eina: Infogram.

Visualització en línia(Veure Infografia a Infogram): 'https://infogram.com/pac2-infografia-1hxj48m0np9eq2v'

2. 02_BoxPlot_RD
Anàlisi de la distribució de la despesa en Recerca i Desenvolupament (R+D) com a percentatge del PIB, comparant la UE amb la resta del món.

Tècnica: Box Plot (Diagrama de caixes).

Eina: RStudio (ggplot2).

Contingut: * research-spending-gdp.csv: Dataset original.

analisi_boxplot_RD.R: Script de preparació i generació del gràfic.

boxplot_RD_Europa.png: Gràfic exportat.

3. 03_Horizon_Graph
Visualització de l'evolució històrica (2000-2023) de la producció d'energia renovable per a diversos països seleccionats.

Tècnica: Horizon Graph (Gràfic d'horitzó).

Eina: RStudio (ggHoriPlot).

Contingut: * renewable-share-energy.csv: Dataset amb sèrie temporal completa.

analisi_horizon_renovables.R: Script R amb la tècnica de "plegat" d'àrees.

horizon_Graph_renovables.png: Visualització final d'alta densitat.

🛠️ Preparació de dades en R
Tots els gràfics realitzats en aquesta PAC han seguit un procés de Neteja i Transformació de Dades (ETL) utilitzant el llenguatge R. Els scripts inclouen:

Filtratge de dades per països membres de la Unió Europea.

Gestió de valors absents (NA).

Càlcul de mètriques estadístiques per a la representació de distribucions.

Optimització de sèries temporals per a visualitzacions d'alta densitat.

Assignatura: Visualització de Dades

Universitat: UOC (Universitat Oberta de Catalunya)
