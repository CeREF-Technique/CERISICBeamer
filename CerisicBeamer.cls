%----------------------
% General Informations
%----------------------
\NeedsTeXFormat{LaTeX2e}[1999/01/01]
\ProvidesClass{CERISICBeamer}[2018/02/06 v0.3]


%-----------------
% Load base class
%-----------------
\LoadClass[10pt]{beamer}


%-------------------
% Required Packages
%-------------------
\RequirePackage{keyval}

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{color}

%-------------------
% Color definition
%-------------------
\definecolor{white}{rgb}{1 1 1}
\definecolor{VertBleu}{rgb}{0.055 0.596 0.576}

%\RequirePackage[absolute,overlay]{textpos}
%\RequirePackage{multicol}


%---------------------
% Options Declaration
%---------------------
\newcommand{\@lang}{french}
\DeclareOption{french}{\renewcommand{\@lang}{french}}
\DeclareOption{english}{\renewcommand{\@lang}{english}}




%------------------
% Hooks Definition
%------------------

\newcommand{\set@hook}{None}
\define@key{set}{hook}{\renewcommand{\set@hook}{#1}}


%\newcommand{\set@tocname}{Sommaire}
\define@key{set}{tocname}{\def\set@tocname{#1}}
%\define@key{set}{tocname}{\renewcommand{\set@tocname}{#1}}

\define@key{set}{timeduration}{\def\set@timeduration{#1}}

\newcommand{\set@timeinterval}{10}
\define@key{set}{timeinterval}{\renewcommand{\set@timeinterval}{#1}}

\newcommand{\set@timewarningfirst}{80}
\define@key{set}{timewarningfirst}{\renewcommand{\set@timewarningfirst}{#1}}

\newcommand{\set@timewarningsecond}{95}
\define@key{set}{timewarningsecond}{\renewcommand{\set@timewarningsecond}{#1}}

\newcommand{\set@resetatpages}{2}
\define@key{set}{resetatpages}{\renewcommand{\set@resetatpages}{#1}}

\newcommand{\set@timedeath}{0}
\define@key{set}{timedeath}{\renewcommand{\set@timedeath}{#1}}

\define@key{set}{innertheme}{\def\set@inner{#1}}
\define@key{set}{outtertheme}{\def\set@outter{#1}}
\define@key{set}{colortheme}{\def\set@color{#1}}




\newcommand{\setup}[1][]{%
\setkeys{set}{#1}

\ifthenelse{\isundefined{\set@timeduration}}{}{\PassOptionsToPackage{font=Times,timeinterval=\set@timeinterval, timeduration=\set@timeduration, timedeath=\set@timedeath, fillcolorwarningsecond=white!60!yellow, timewarningfirst=\set@timewarningfirst,timewarningsecond=\set@timewarningsecond,resetatpages=\set@resetatpages}{tdclock}}
\ifthenelse{\isundefined{\set@timeduration}}{}{\RequirePackage{tdclock}}

\ifthenelse{\isundefined{\set@tocname}}{
	\ifthenelse{\equal{\@lang}{french}}{\newcommand{\set@tocname}{Sommaire}}{}
	\ifthenelse{\equal{\@lang}{english}}{\newcommand{\set@tocname}{Outline}}{}
}{}


%\ifthenelse{\isundefined{\set@inner}}{}{\useinnertheme{\set@inner}}
%\ifthenelse{\isundefined{\set@outter}}{}{\useouttertheme{\set@outter}}
%\ifthenelse{\isundefined{\set@color}}{}{\usecolortheme{\set@color}}

\ifthenelse{\equal{\set@hook}{AtBeginPart}}{
\AtBeginPart{
	\begin{frame}
		\frametitle{\set@tocname}
		\begin{center}
			\begin{LARGE}
				\ifthenelse{\equal{\@lang}{french}}{\textbf{Partie \insertpartnumber}\\}{}
				\ifthenelse{\equal{\@lang}{english}}{\textbf{Part \insertpartnumber}\\}{}
				\vspace{10pt}
				\textbf{\insertpart}
			\end{LARGE}
		\end{center}
	\end{frame}
}}{}
\ifthenelse{\equal{\set@hook}{AtBeginSection}}{
\AtBeginPart{
	\begin{frame}
		\frametitle{\set@tocname}
		\begin{center}
			\begin{LARGE}
				\ifthenelse{\equal{\@lang}{french}}{\textbf{Partie \insertpartnumber}\\}{}
				\ifthenelse{\equal{\@lang}{english}}{\textbf{Part \insertpartnumber}\\}{}
				\vspace{10pt}
				\textbf{\insertpart}
			\end{LARGE}
		\end{center}
	\end{frame}
}
\AtBeginSection{
	\begin{frame}
	\frametitle{\set@tocname}
			\tableofcontents[sectionstyle=show/shaded%
				,subsectionstyle=shaded/shaded/shaded]
	\end{frame}
}}{}
\ifthenelse{\equal{\set@hook}{AtBeginSubSection}}{
\AtBeginPart{
	\begin{frame}
	\frametitle{\set@tocname}
		\begin{center}
			\begin{LARGE}
				\ifthenelse{\equal{\@lang}{french}}{\textbf{Partie \insertpartnumber}\\}{}
				\ifthenelse{\equal{\@lang}{english}}{\textbf{Part \insertpartnumber}\\}{}
				\vspace{10pt}
				\textbf{\insertpart}
			\end{LARGE}
		\end{center}
	\end{frame}
}
\AtBeginSection{
	\begin{frame}
		\frametitle{\set@tocname}
			\tableofcontents[sectionstyle=show/shaded%
				,subsectionstyle=shaded/shaded/shaded]
	\end{frame}
}
\AtBeginSubsection{
	\begin{frame}
		\frametitle{\set@tocname}
			\tableofcontents[sectionstyle=show/shaded%
				,subsectionstyle=show/shaded/shaded]
	\end{frame}
}}{}
}





\define@key{tf}{title}{\def\tf@title{#1}}
\define@key{tf}{subtitle}{\def\tf@subtitle{#1}}
\define@key{tf}{date}{\def\tf@date{#1}}

\newcommand{\tf@titlealign}{flushright}
\define@key{tf}{titlealign}{\renewcommand{\tf@titlealign}{#1}}

\define@key{tf}{industrialpartner}{\def\tf@industrialpartner{#1}}
\define@key{tf}{scientificpartner}{\def\tf@scientificpartner{#1}}
\define@key{tf}{fundingsponsor}{\def\tf@fundingsponsor{#1}}


\define@key{tf}{author}{\def\tf@author{#1}}
\define@key{tf}{authortitle}{\def\tf@authortitle{#1}}
\define@key{tf}{tutor}{\def\tf@tutor{#1}}
\define@key{tf}{tutortitle}{\def\tf@tutortitle{#1}}


\newlength{\tf@top}
\newlength{\tf@bottom}
\newlength{\tf@between}
\newlength{\tf@inter}

\setlength{\tf@top}{2.5cm plus 1cm minus 0.5cm}
\setlength{\tf@bottom}{0.5cm plus 0.5cm minus 0cm}
\setlength{\tf@between}{0.5cm plus 2cm minus 2cm}
\setlength{\tf@inter}{0cm plus 0.5cm minus 0.5cm}




\newcommand{\titleframe}[1][]{%
\setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{img/CerisicTitleSlide.png}}
\setkeys{tf}{#1}
\begin{frame}[plain]
	\ifthenelse{\isundefined{\set@timeduration}}{}{\initclock}
	\vspace*{\tf@top}
	\begin{\tf@titlealign}
		\tf@title\\
		\tf@subtitle
	\end{\tf@titlealign}
	
	\vspace*{\tf@inter}
	
	\begin{center}
		\begin{minipage}{0.33\textwidth}
			\begin{flushleft}
				\ifthenelse{\isundefined{\tf@tutortitle}}{}{\tf@tutortitle\\}
				\ifthenelse{\isundefined{\tf@tutor}}{}{\tf@tutor\\}
			\end{flushleft}
		\end{minipage}
	\hspace{\tf@between}
		\begin{minipage}{0.33\textwidth}
			\begin{flushright}
				\ifthenelse{\isundefined{\tf@authortitle}}{}{\tf@authortitle\\}
				\tf@author
			\end{flushright}
		\end{minipage}
	\end{center}
	
	\vspace*{\tf@bottom}
	
	\begin{minipage}{0.49\textwidth}
		\begin{center}
			\ifthenelse{\isundefined{\tf@fundingsponsor}}{
			%fundingsponsor is undefined
				\ifthenelse{\isundefined{\tf@scientificpartner}}{
				%scientificpartner is undefined
				}
				{
					\tf@scientificpartner
				}
			}
			{
				\tf@fundingsponsor
			}
		\end{center}
	\end{minipage}
	\begin{minipage}{0.49\textwidth}
		\begin{center}
			\ifthenelse{\isundefined{\tf@fundingsponsor}}{
				\ifthenelse{\isundefined{\tf@industrialpartner}}{
				}
				%else
				{
					\tf@industrialpartner
				}
			}
			%else
			{
				\ifthenelse{\isundefined{\tf@scientificpartner}}{\tf@industrialpartner
				}
				%else
				{
					\tf@scientificpartner
					\tf@industrialpartner
				}
			}
		\end{center}
	\end{minipage}
	\vfill
	\begin{center}
		\tf@date
	\end{center}
	\vspace*{0.6cm}
\end{frame}


% Display new background image
\setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{img/CerisicSlide.png}}

% Display slide number and clock
\setbeamertemplate{footline}
{
	\leavevmode%
	\hbox{
	\begin{beamercolorbox}[wd=.15\paperwidth,ht=0ex,dp=5ex,center]{date in head/foot}
		\large{\textcolor{white}{\textbf{\insertframenumber}}}%\insertframenumber{} / \inserttotalframenumber\hspace*{1ex}
	\end{beamercolorbox}
	\begin{beamercolorbox}[wd=.7\paperwidth,ht=0ex,dp=5ex,center]{date in head/foot}
	\end{beamercolorbox}
	\begin{beamercolorbox}[wd=.15\paperwidth,ht=0ex,dp=5ex,center]{date in head/foot}
		\ifthenelse{\isundefined{\set@timeduration}}{}{\tiny\color{white}\bfseries\crono}
	\end{beamercolorbox}
	\vspace*{0.5cm}
	}
}
}




%------------------------
% Final Frame Definition
%------------------------

\newcommand{\ff@text}{None}
\define@key{ff}{text}{\renewcommand{\ff@text}{#1}}


\newcommand{\finalframe}[1][]{%
\setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{img/CerisicSlide.png}}
\setkeys{ff}{#1}
\begin{frame}
	\begin{center}
		\ifthenelse{\equal{\ff@text}{None}}{
			\ifthenelse{\equal{\@lang}{french}}{Merci de votre attention}{}
			\ifthenelse{\equal{\@lang}{english}}{Thank you for your attention}{}
		}{\ff@text}
	\end{center}
\end{frame}
}



\ProcessOptions\relax


%--------------------
% Errors declaration
%--------------------
\def\@title{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\title given}}

\def\@soustitre{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\soustitre given}}

\def\@tutortitle{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\tutortitle given}}

\def\@tutor{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\tutor given}}

\def\@auteurtitle{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\auteurtitle given}}

\def\@auteur{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\auteur given}}

%\def\@date{
%	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\date given}}

\def\@tocname{
	\@latex@warning@no@line{Package `CERISICBeamer': No \noexpand\tocname given}}





%---------------
% General Theme
%---------------
\usefonttheme{professionalfonts}
\usecolortheme{orchid}
\useoutertheme{default}


%Définition des options pour les notes
%\setbeameroption{notes on second screen=top}



% Normal text color definition
\setbeamercolor{normal text}{fg=VertBleu}

%Suppression des symboles de navigation
\setbeamertemplate{navigation symbols}{}


%Définition des "templates", "font" et "color" pour les captions
\renewcommand{\figurename}{Fig}
\renewcommand{\tablename}{Tab}


\setbeamertemplate{caption}[numbered]
\setbeamerfont{caption name}{family=\sffamily}
\setbeamercolor{caption name}{fg=VertBleu}


%Définitions des caractéristiques des blocks
\setbeamertemplate{blocks}[rounded]{}
%Changement des couleur au niveau du titre du block
\setbeamercolor{block title}{use=structure,fg=white,bg=VertBleu}
\setbeamercolor{block title alerted}{use=alerted text,fg=white,bg=alerted text.fg!75!black}
\setbeamercolor{block title example}{use=example text,fg=white,bg=example text.fg!75!black}


%Changement des couleur au niveau du corps du block
\setbeamercolor{block body}{parent=normal text,use=block title,bg=block title.bg!10!bg}
\setbeamercolor{block body alerted}{parent=normal text,use=block title alerted,bg=block title alerted.bg!10!bg}
\setbeamercolor{block body example}{parent=normal text,use=block title example,bg=block title example.bg!10!bg}


%Définition des couleurs pour les Enumerate-Items
\setbeamercolor{enumerate item}{fg=VertBleu}

%Définition des couleurs pour les Description-Items
\setbeamercolor{description item}{fg=VertBleu}

%Définition des "template" et "color" pour les items
\setbeamercolor{itemize item}{fg=VertBleu}
\setbeamertemplate{itemize item}[circle]

%Définition des "template" et "color" pour les subitem
\setbeamercolor{itemize subitem}{fg=VertBleu}
\setbeamertemplate{itemize subitem}[triangle]


%Définition des caractéristiques de titre et soustritre de slides
\setbeamertemplate{frametitle}[default][right]
\setbeamerfont{frametitle}{size=\Large, series=\bfseries,family=\sffamily}
\setbeamercolor{frametitle}{fg=VertBleu}
\setbeamerfont{framesubtitle}{size=\large, series=\bfseries,family=\sffamily}
\setbeamercolor{framesubtitle}{fg=VertBleu}





%Définition des "templates", "font" et "color" pour les sections et subsections
% Numbered sections
\setbeamertemplate{section in toc}[sections numbered]
% Numbered subsections
\setbeamertemplate{subsection in toc}[subsections numbered]


\setbeamercolor{section in toc}{fg=VertBleu}
\setbeamercolor{subsection in toc}{fg=VertBleu}

%\setbeamerfont{section in toc}{family=\rmfamily}
%\setbeamerfont{subsection in toc}{family=\rmfamily}






