\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IBB_thesis_2019}[2021/06/17]
\typeout{\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space für eine Abschlussarbeit am IBB mit pdfLaTeX}
\typeout{\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space Stand: 17.06.2021}
\typeout{\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space (C) Institut für Baustatik und Baudynamik}
\typeout{\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space Universität Stuttgart}
\typeout{\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space\space Dr.-Ing. Malte von Scheven}
\typeout{}




%% Class options
\DeclareOption{twoside}{
  \typeout{\space\space\space\space\space\space\space\space Option: zweiseitig}
  \def\coverl{-8}
  \def\coverr{90}
  \def\coverb{5}
}
\DeclareOption{oneside}{
  \typeout{\space\space\space\space\space\space\space\space Option: einseitig}
  \def\coverl{-16}
  \def\coverr{82}
  \def\coverb{-3}
}


\DeclareOption{draft}{
  \typeout{\space\space\space\space\space\space\space\space Option: draft}
  \AtEndOfClass{\RequirePackage{showlabels}}
}
\DeclareOption{final}{
  \typeout{\space\space\space\space\space\space\space\space Option: final}
}


\DeclareOption{print}{
  \typeout{\space\space\space\space\space\space\space\space Option: print}
}
\DeclareOption{web}{
  \typeout{\space\space\space\space\space\space\space\space Option: web}
  \AtEndOfClass{\RequirePackage[pdfpagelabels,plainpages=false]{hyperref}}
}



%% Custom package options
\DeclareOption{ngerman}{
  \typeout{\space\space\space\space\space\space\space\space Option: Deutsch}
  \PassOptionsToPackage{\CurrentOption}{babel}
  \def\langvorwort{Vorwort}
  \def\langkurz{Kurzfassung}
  \def\langerklaerung{Erkl\"arung}
  \def\langliteratur{Literaturverzeichnis}
  \def\langvorgelegt{vorgelegt von}
  \def\langim{im}
  \def\langvon{von}
  \def\langbearbeitet{bearbeitet im Zeitraum}
  \def\langbis{bis}
  \def\langbetreuung{unter der Betreuung von}
  \def\imStudiengang{im Studiengang}
  \def\titelseite{cover_2019_DE}
  \def\bst{dinat}
  \AtEndOfClass{\RequirePackage{icomma}}
}
\DeclareOption{english}{
  \typeout{\space\space\space\space\space\space\space\space Option: Englisch}
  \PassOptionsToPackage{\CurrentOption}{babel}
  \def\langvorwort{Preface}
  \def\langkurz{Abstract}
  \def\langerklaerung{Declaration}
  \def\langliteratur{Bibliography}
  \def\langvorgelegt{submitted by}
  \def\langim{in}
  \def\langvon{by}
  \def\langbearbeitet{edited from}
  \def\langbis{to}
  \def\langbetreuung{under the supervision of}
  \def\imStudiengang{in the study program}
  \def\titelseite{cover_2019_EN}
  \def\bst{dinat.en}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{IBB_thesis}{Unknown option '\CurrentOption'}
}


%% Process given options
\ProcessOptions\relax
  \typeout{}


\LoadClassWithOptions{scrbook}
\KOMAoptions{fontsize=11pt,listof=totoc,headsepline,chapterprefix,parskip=half,numbers=noenddot,paper=a4,BCOR=10mm,DIV=14}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zentraler IBB style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{IBB_style}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kapitelüberschriften
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% neue Schriftgroesse definieren
\newfont{\gross}{cmssdc10 scaled 9000}

% Kapitelformat neu definieren
\renewcommand*{\chapterformat}{\thechapter\autodot\enskip}
\renewcommand*{\chaptermarkformat}{\thechapter\autodot\enskip}

% neu definierte Schriftgroesse an Koma-script uebergeben
\addtokomafont{chapter}{\gross}

% Darstellung der Kapitelueberschrift neu definieren
\renewcommand{\chapterlineswithprefixformat}[3]{{
\raggedleft\gross{\rule[0mm]{0mm}{22mm}#2}\vspace{-2mm}\hrule\vspace{2mm}
\raggedchapter\Huge{#3}}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   farbiges Cover
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\cover{
\pagestyle{empty}
\TileWallPaper{\paperwidth}{\paperheight}{\titelseite}


\setlength{\unitlength}{1mm}
\begin{picture}(160,220)

\put(\coverr,230){%
\begin{minipage}[t]{6cm}%
\begin{center}%
\textcolor{white}{\Huge\bfseries\textsf{\ArtderArbeit}}%
\end{center}%
\end{minipage}}

\put(\coverl,175){%
\begin{minipage}[t]{17cm}%
\raggedright
\Huge \bfseries \textsf{\TitelderArbeit}%
\end{minipage}}


\put(\coverl,135){%
\begin{minipage}[t]{10cm}%
\Large \textsf{\Autor}%
\end{minipage}}

\put(\coverb,0){
\begin{minipage}[b][12cm][c]{15cm}%
\includegraphics[width = 15cm]{\Titelbild}
\end{minipage}}

\end{picture}


\clearpage
\ClearWallPaper
\cleardoublepage
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   innere Titelseite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\titel{
\begin{center}

\vspace*{1.7cm}

\renewcommand{\baselinestretch}{2.0}
\small\normalsize

{\LARGE \bfseries \TitelderArbeit}

\renewcommand{\baselinestretch}{1.1}
\small\normalsize

\vfill

\langvon

\vfill

{\large\bfseries \Autor}

  \vfill
  \vfill
  \vfill
  \vfill
  \quad

{\langbearbeitet \linebreak[4]} \\
{\large\bfseries{\BearbeitungAnfang~\langbis~\BearbeitungEnde} \linebreak[4]}\\
{\imStudiengang \linebreak[4]} \\
{\large\bfseries{\Studiengang} \linebreak[4]}\\
{\langbetreuung \linebreak[4]}\\
{\large\bfseries{\Betreuer}}

\end{center}

\cleardoublepage

}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Erklaerung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\erklaerung{
\section*{\langerklaerung}

\begin{itemize}
  \item Hiermit erkläre ich, dass ich die hier vorliegende \ArtderArbeit\
  selbstständig verfasst habe.
  \item Es wurden nur die in der Arbeit ausdrücklich benannten Quellen und Hilfsmittel verwendet.
Wörtlich oder sinngemäß übernommenes Gedankengut habe ich als solches gekennzeichnet.
  \item Die eingereichte Arbeit war und ist weder vollständig noch in
  wesentlichen Teilen Gegenstand eines anderen Prüfungsverfahrens.
  \item Ebenso habe ich die Arbeit weder vollständig noch in Teilen bereits
  veröffentlicht.
  \item Ich versichere, dass das elektronische Exemplar mit den anderen
  Exemplaren übereinstimmt.
\end{itemize}

\vspace{2cm}

Stuttgart, \today \hfill \hrulefill\hrulefill

\vspace{-0.3cm}
\hspace{9.2cm}(\textit{Unterschrift Studierende/r})

\cleardoublepage
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Vorwort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\vorwort{
\markboth{\langvorwort}{\langvorwort}
\section*{\langvorwort}

\textVorwort

\vspace{2cm}

Stuttgart, \langim~\BearbeitungEnde \hfill \Autor

\cleardoublepage
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Kurzfassung DE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstract{
\markboth{\langkurz}{\langkurz}
\section*{\langkurz}

\textAbstract

\cleardoublepage
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Abstract EN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractEN{
\markboth{Abstract}{Abstract}
\section*{Abstract}

\textAbstractEN

\cleardoublepage
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Aufgabenstellung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\aufgabe{
\includepdf[pages=1, scale=1.0, frame=false]{\Dateiname}
\cleardoublepage
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   kompletter Vorspann
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\vorspann{
\setcounter{page}{-7}
\cover
\titel

\begin{spacing}{1.1}
\erklaerung

% Aufgabenstellung, wenn vorhanden
\setbox0=\hbox{\Dateiname\unskip}\ifdim\wd0=0pt
  %
\else
  \aufgabe
\fi


\setcounter{page}{1}
\pagestyle{scrheadings}
\frontmatter


% Kurzfassung DE optional
\setbox0=\hbox{\textAbstract\unskip}\ifdim\wd0=0pt
  %
\else
  \abstract
\fi

% Abstract EN optional
\setbox0=\hbox{\textAbstractEN\unskip}\ifdim\wd0=0pt
  %
\else
  \abstractEN
\fi


% Vorwort optional
\setbox0=\hbox{\textVorwort\unskip}\ifdim\wd0=0pt
  %
\else
  \vorwort
\fi



\tableofcontents

\mainmatter
\automark[section]{chapter}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   kompletter Nachspann
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\nachspann{
\cleardoublepage
\backmatter
\addcontentsline{toc}{chapter}{\langliteratur}
\end{spacing}
}



\endinput


