%% Florian Sihler, Jan 2022 (based on koma-script)
\NeedsTeXFormat{LaTeX2e}
\def\LayoutName{tutorial}
\ProvidesClass{\LayoutName}[2022/01/22 documentclass for the app tutorial of Anton Vlasjuk]
% First we setup the document options
\LoadClass[numbers=noenddot,fontsize=11pt,twoside=false,footnotes=nomultiple,a4paper,headings=big,mpinclude=true]{scrartcl}
\KOMAoption{listof}{leveldown,totocnumbered}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage[final,tracking,kerning]{microtype}
\RequirePackage[osf]{cochineal}
\RequirePackage[default]{FiraSans}
\linespread{1.042}

\RequirePackage{uulm-logo}

\newlength\t@top \t@top=\dimexpr1in+\topmargin+\headheight+\headsep\relax
\newlength\t@left \t@left=\dimexpr1in+\oddsidemargin\relax

\renewcommand\maketitle{\begingroup
\thispagestyle{empty}% \titlepage
\setparsizes\z@\z@{\z@ \@plus 1fil}\par@updaterelative
\vspace*{\dimexpr-\t@top-\baselineskip\relax}%
\hskip\dimexpr-\t@left\relax
\rule{\paperwidth}{1cm}
\endgroup}


\RequirePackage{scrlayer-scrpage}
\RequirePackage[draft=false,autoclearnotecolumns]{scrlayer-notecolumn}
\AfterCalculatingTypearea{%
   \marginparwidth=2.75cm\relax
   \advance\textwidth-\marginparwidth
   \advance\evensidemargin\marginparwidth
   \marginparsep=1cm\relax
   \advance\marginparwidth\dimexpr2.25cm-\marginparsep\relax
}
\recalctypearea

\RedeclareNoteColumn[font=\footnotesize\itshape,width=\marginparwidth]{marginpar}

\pagestyle{scrheadings}

\RequirePackage{eso-pic}

\AddToShipoutPicture{%
  \AtPageLowerLeft{%
      \@tempdimb=\dimexpr\marginparwidth+1in/2\relax
      \hskip\dimexpr\paperwidth-\@tempdimb\relax
      \color{gray!5!white}\rule\@tempdimb\paperheight
  }%
}

\RequirePackage{ragged2e}
\def\sidenote{\@ifstar\s@sidenote\@sidenote}
\def\@sidenote#1{\vphantom{A}\makenote{\protect\RaggedRight#1}}
\def\s@sidenote#1{\vphantom{A}\makenote*{\RaggedRight#1}}

\endinput