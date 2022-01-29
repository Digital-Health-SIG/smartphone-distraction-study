%% Florian Sihler, Jan 2022 (based on koma-script)
\NeedsTeXFormat{LaTeX2e}
\def\LayoutName{tutorial}
\ProvidesClass{\LayoutName}[2022/01/22 documentclass for the app tutorial of Anton Vlasjuk]
% First we setup the document options
\LoadClass[numbers=noenddot,fontsize=11pt,twoside=false,footnotes=nomultiple,a4paper,headings=big]{scrartcl}
\KOMAoption{listof}{leveldown,totocnumbered}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage[final,tracking,kerning]{microtype}
\AtEndPreamble{\RequirePackage[osf]{cochineal}
\RequirePackage[sfdefault]{FiraSans}}

\linespread{1.042}

\usepackage[pdfusetitle]{hyperref}
\hypersetup{pdfborder=0 0 0,colorlinks=true,allcolors=@main}
\def\@nolnkc{\hypersetup{allcolors=.}}
\def\@hidelnk#1{\begingroup\@nolnkc#1\endgroup}
\let\hidelink\@hidelnk
\preto\tableofcontents{\begingroup\@nolnkc}
\appto\tableofcontents{\endgroup}

\RequirePackage{uulm-logo}

\newlength\t@top \t@top=\dimexpr1in+\topmargin+\headheight+\headsep\relax
\newlength\t@left \t@left=\dimexpr1in+\oddsidemargin\relax

\RequirePackage{xcolor}
\colorlet{@page}{gray!1}
\pagecolor{@page}

\definecolor{@main}{RGB}{163,38,56}
\newlength\t@tp@height
\def\titleheight#1{\setlength\t@tp@height{\dimexpr#1}}
\titleheight{8cm}

\def\t@raise#1#2{\smash{\raisebox{\dimexpr#1}{#2}}}
\newsavebox\t@titlebox
\renewcommand\maketitle{\begingroup
% \titlepage
\setparsizes\z@\z@{\z@ \@plus 1fil}\par@updaterelative
\vspace*{\dimexpr-\t@top-\baselineskip\relax}%
\def\@left{\hskip\dimexpr-\t@left\relax}\relax
\@left{\@declaredcolor{@page}\rule\paperwidth\t@tp@height}%
\llap{\t@raise{\t@tp@height-\height-2cm}{\uulmlogo\hskip2cm}}%
\begingroup% Title Banner
\Huge%
\savebox\t@titlebox{\parbox\linewidth{\@declaredcolor{@page}\bfseries\@title}}%
\llap{\@declaredcolor{@main}\rule\paperwidth{\dimexpr.4cm+\ht\t@titlebox+\dp\t@titlebox}}%
\hspace*{\dimexpr-\paperwidth+\t@left\relax}\t@raise{.15cm+\dp\t@titlebox}{\usebox\t@titlebox\hskip\marginparsep%
\parbox\marginparwidth{\small\centering\@declaredcolor{@main!50!@page}\textbf{\strut\@author}\\[-2.25\p@]\@date\strut\@par}}%
\endgroup
\relax
\endgroup}


\RequirePackage{scrlayer-scrpage}
\RequirePackage[draft=false,autoclearnotecolumns]{scrlayer-notecolumn}
\AfterCalculatingTypearea{%
   \marginparwidth=2.75cm\relax
   \advance\textwidth-\marginparwidth
   \advance\evensidemargin\marginparwidth
   \marginparsep=1cm\relax
   \advance\marginparwidth\dimexpr2.25cm-\marginparsep\relax
   \advance\textheight2.25cm\relax% because i wanna :c
}
\recalctypearea

\RedeclareNoteColumn[font=\footnotesize\itshape,width=\marginparwidth]{marginpar}

\DeclareNewLayer[topmargin,background,contents={%
\@tempdimb=\dimexpr\marginparwidth+1in/2\relax
\hskip\dimexpr\paperwidth-\@tempdimb\relax
\@declaredcolor{gray!5!white}\rule\@tempdimb\paperheight
}]{t.side.ruler}

\def\sectionmark#1{\def\leftmark{#1}}
\renewpairofpagestyles{scrheadings}{\ofoot{\smash{\rlap{\hskip\marginparsep\raisebox{\dimexpr-\height+\baselineskip}{\parbox\marginparwidth{\centering\strut\thepage\\{\@declaredcolor{gray}\strut\leftmark\strut\@par}}}}}}}
\AddLayersAtBeginOfPageStyle{scrheadings}{t.side.ruler}
\pagestyle{scrheadings}


\RequirePackage{ragged2e}
\def\sidenote{\@ifstar\s@sidenote\@sidenote}
\def\@sidenote#1{\vphantom{A}\makenote{\protect\RaggedRight#1}}
\def\s@sidenote#1{\vphantom{A}\makenote*{\RaggedRight#1}}

\newcommand\mail[2][]{\href{mailto:#2}{\ifx!#1!#2\else#1\fi}}

\newcounter{side@fn}
%
\long\def\footnote#1{\phantomsection\stepcounter{side@fn}\label{t@side@fn@tar:\thesection:\the\c@side@fn}\textsuperscript{\@hidelnk{\hyperref[t@side@fn@side:\thesection:\the\c@side@fn]{\@arabic\c@side@fn}}}\sidenote{\protect\t@fnte{\thesection}{\arabic{side@fn}}{#1}}}
% #1 section; #2 fn; #3 text
\def\t@fnte#1#2#3{\protect\phantomsection\protect\label{t@side@fn@side:#1:#2}\@hangfrom{\protect\@hidelnk{\protect\hyperref[t@side@fn@tar:#1:#2]{#2}}~\protect\hyphenpenalty1000 \exhyphenpenalty1000~$\mid$~}{#3}}

\endinput