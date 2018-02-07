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

%\RequirePackage[absolute,overlay]{textpos}
%\RequirePackage{multicol}


%---------------------
% Options Declaration
%---------------------
\newcommand{\@lang}{french}
\DeclareOption{french}{\renewcommand{\@lang}{french}}
\DeclareOption{english}{\renewcommand{\@lang}{english}}


\define@key{tf}{title}{\def\tf@title{#1}}
\define@key{tf}{subtitle}{\def\tf@subtitle{#1}}
\define@key{tf}{date}{\def\tf@date{#1}}

\newcommand{\tf@titlealign}{flushright}
\define@key{tf}{titlealign}{\renewcommand{\tf@titlealign}{#1}}


\newcommand{\tf@top}{2.5cm}
\define@key{tf}{top}{\renewcommand{\tf@top}{#1}}

\newcommand{\tf@between}{0cm}
\define@key{tf}{between}{\renewcommand{\tf@between}{#1}}

\newcommand{\tf@bottom}{0cm}
\define@key{tf}{bottom}{\renewcommand{\tf@bottom}{#1}}

\newcommand{\tf@inter}{0.5cm}
\define@key{tf}{inter}{\renewcommand{\tf@inter}{#1}}


\define@key{tf}{industrialpartner}{\def\tf@industrialpartner{#1}}
\define@key{tf}{scientificpartner}{\def\tf@scientificpartner{#1}}
\define@key{tf}{fundingsponsor}{\def\tf@fundingsponsor{#1}}


\define@key{tf}{author}{\def\tf@author{#1}}
\define@key{tf}{authortitle}{\def\tf@authortitle{#1}}
\define@key{tf}{tutor}{\def\tf@tutor{#1}}
\define@key{tf}{tutortitle}{\def\tf@tutortitle{#1}}


\newcommand{\titleframe}[1][]{%
\setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{img/CerisicTitleSlide.png}}
\setkeys{tf}{#1}
\begin{frame}[plain]
	\vspace*{\tf@top}
	\begin{\tf@titlealign}
		\tf@title\\
		\tf@subtitle
	\end{\tf@titlealign}
	
	\vspace*{\tf@inter}
	
	\begin{center}
		\begin{minipage}{0.33\textwidth}
			\begin{flushleft}
				\tf@tutortitle\\
				\tf@tutor\\
			\end{flushleft}
		\end{minipage}
	\hspace{\tf@between}
		\begin{minipage}{0.33\textwidth}
			\begin{flushright}
				\tf@authortitle\\
				\tf@author
			\end{flushright}
		\end{minipage}
	\end{center}
	
	\vspace*{\tf@bottom}
	
	\begin{minipage}{0.32\textwidth}
		\begin{center}
			\ifthenelse{\isundefined{\tf@fundingsponsor}}{
				\ifthenelse{\isundefined{\tf@scienticpartner}}{
				}
				%else
				{
					\tf@scienticpartner
				}
			}
			%else
			{
				\tf@fundingsponsor
			}
		\end{center}
		\vspace*{0.3cm}
	\end{minipage}
	\begin{minipage}{0.32\textwidth}
		\begin{center}
			\ifthenelse{\isundefined{\tf@date}}{}{\tf@date}
		\end{center}
	\end{minipage}
	\begin{minipage}{0.32\textwidth}
		\begin{center}
			%\ifthenelse{\isundefined{}}{}{}
			\tf@scientificpartner
			\tf@industrialpartner
		\end{center}
		\vspace*{0.3cm}
	\end{minipage}
\end{frame}


% Display new background image
\setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{img/CerisicSlide.png}}

% Display slide number
\newlength{\offset}
\setlength{\offset}{0.25cm}
\setbeamertemplate{footline}
{
	\hspace{\offset}
	\begin{minipage}{0.0625\paperwidth}
		\begin{center}
			\large{\textcolor{white}{\textbf{\insertframenumber}}}
		\end{center}
	\end{minipage}
\vspace{0.3cm}
}
}


\newcommand{\finalframe}{%
\setbeamertemplate{background canvas}{\includegraphics[width=\paperwidth,height=\paperheight]{img/CerisicSlide.png}}

\begin{frame}
	\begin{center}
		\ifthenelse{\equal{\@lang}{french}}{Merci de votre attention}{}
		\ifthenelse{\equal{\@lang}{english}}{Thank you for your attention}{}
	\end{center}
\end{frame}
}



%------------------
% Hooks Definition
%------------------

\newcommand{\set@hook}{None}
\define@key{set}{hook}{\renewcommand{\set@hook}{#1}}
\define@key{set}{innertheme}{\def\set@inner{#1}}
\define@key{set}{outtertheme}{\def\set@outter{#1}}
\define@key{set}{colortheme}{\def\set@color{#1}}


\newcommand{\setup}[1][]{%
\setkeys{set}{#1}
\ifthenelse{\equal{\set@hook}{AtBeginPart}}{
\AtBeginPart{
\begin{frame}
	\begin{center}
		\begin{LARGE}
			\ifthenelse{\equal{\@lang}{french}}{\textbf{Partie \insertpartnumber}\\}{}
			\ifthenelse{\equal{\@lang}{english}}{\textbf{Part \insertpartnumber}\\}{}
			\vspace{10pt}
			\textbf{\insertpart}
		\end{LARGE}
	\end{center}
\end{frame}
%\ifthenelse{\isundefined{\set@inner}}{}{\useinnertheme{\set@inner}}
%\ifthenelse{\isundefined{\set@outter}}{}{\useouttertheme{\set@outter}}
%\ifthenelse{\isundefined{\set@color}}{}{\usecolortheme{\set@color}}
}}{}

\ifthenelse{\equal{\set@hook}{AtBeginSection}}{
\AtBeginSection{
	\begin{frame}
		\frametitle{\@tocname}
			\tableofcontents[sectionstyle=show/shaded%
				,subsectionstyle=shaded/shaded/shaded]
	\end{frame}
}}{}

\ifthenelse{\equal{\set@hook}{AtBeginSubSection}}{
\AtBeginSubsection{
	\begin{frame}
		\frametitle{\@tocname}
			\tableofcontents[sectionstyle=show/shaded%
				,subsectionstyle=show/shaded/shaded]
	\end{frame}
}}{}

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
% Color definition
\definecolor{white}{rgb}{1 1 1}
\definecolor{VertBleu}{rgb}{0.055 0.596 0.576}

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





