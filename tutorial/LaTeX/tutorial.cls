%% Florian Sihler, Jan 2022 (based on koma-script)
\NeedsTeXFormat{LaTeX2e}
\def\LayoutName{tutorial}
\ProvidesClass{\LayoutName}[2022/01/22 documentclass for the app tutorial of Anton Vlasjuk]
% First we setup the document options
\LoadClass[numbers=noenddot,fontsize=11pt,twoside=false,footnotes=nomultiple,a4paper,headings=big]{scrartcl}
\KOMAoption{listof}{leveldown,totocnumbered}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage[final,tracking,kerning,spacing=nonfrench]{microtype}
\RequirePackage[osf]{cochineal}
\RequirePackage[default]{FiraSans}


\endinput