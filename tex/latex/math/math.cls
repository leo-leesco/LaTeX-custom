\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math}[2025/01/25 Mathematical and scientific documents, see source for options]
% Available options :
% - short || long, with long, you get a formatted first page
% - rare mathematical symbols can be imported : proba (other options might come in the future)


\newif\iflong
\newif\ifproba

\DeclareOption{long}{\longtrue}
\DeclareOption{short}{\longfalse}
\iflong
	\PassOptionsToClass{11pt,a4paper,oneside}{report}
	\DeclareOption*{
		\PassOptionsToClass{\CurrentOption}{report}
	}
	\ProcessOptions\relax
	\LoadClass{report}
	\newcounter{exo}[chapter]


	\renewcommand{\title}[1]{%
		\def\@title{\begin{minipage}{\linewidth}\centering\bfseries\Huge #1\vskip3pt\Large\end{minipage}}%
	}
\else
	\PassOptionsToClass{11pt,a4paper,oneside}{article}
	\DeclareOption*{
		\PassOptionsToClass{\CurrentOption}{article}
	}
	\ProcessOptions\relax
	\LoadClass{article}
	\newcounter{exo}
\fi

\RequirePackage{etoolbox}
% Redefine \author
\let\@author\relax % Initialize \@author to be undefined
\renewcommand{\author}[1]{%
	\def\@author{Léo \textsc{Leesco} -- #1}%
}

% Check if \author has been called and set default if not
\AtBeginDocument{%
	\ifx\@author\relax
		\author{Léo \textsc{Leesco}}%
	\fi
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage[colorlinks=true,linkcolor=blue]{hyperref}%à caution
\RequirePackage{minted}

\makeatletter

%Création de la commande \reDeclareMathOperator pour utiliser des noms d'opérateurs mathématiques déjà utilisés
\newcommand\reDeclareMathOperator{%
	\@ifstar{\def\rmo@s{m}\rmo@redeclare}{\def\rmo@s{o}\rmo@redeclare}%
}
% this is taken from \renew@command
\newcommand\rmo@redeclare[2]{
	\begingroup \escapechar\m@ne\xdef\@gtempa{{\string#1}}\endgroup
	\expandafter\@ifundefined\@gtempa
	{\@latex@error{\noexpand#1undefined}\@ehc}%
	\relax
	\expandafter\rmo@declmathop\rmo@s{#1}{#2}
}

% This is just \@declmathop without \@ifdefinable
\newcommand\rmo@declmathop[3]{
	\DeclareRobustCommand{#2}{\qopname\newmcodes@#1{#3}}
}

\@onlypreamble\reDeclareMathOperator

\makeatother

%Pour les figures
\RequirePackage{graphicx}

%Pour faire des tableaux flexibles
\RequirePackage{tabularray}

%Packages mathématiques
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{esint}
\RequirePackage{stmaryrd}%permet \llbracket et \rrbracket
\RequirePackage{dsfont}%permet le style de l'indicatrice
\RequirePackage{mathtools}%permet l'utilisation de \x[flèche] et \mathclap (pour réduire les espaces dans les commentaires)

%Définition des exercices


%%%%%% ATTENTION : il faut enlever [chapter] dans le cas d'un article %%%%%

\newcommand{\exo}{\stepcounter{exo}\vskip 0.5cm\pagebreak[3]\noindent\textbf{Question \arabic{exo}}}%exercice


%Définition des questions d'un exercice

\newcounter{enuma}[exo]%compteur
\newcommand{\q}{\stepcounter{enuma}\vskip 0.3cm\noindent\textbf{\arabic{enuma}}.\ }%question d'un exercice

\newcounter{enumaa}[enuma]%compteur
\newcommand{\qq}{\stepcounter{enumaa}\vskip 0.3cm\noindent\textbf{\alph{enumaa}}.\ }%sous-question d'un exercice

%Raccourcis de fonction

\newcommand{\donc}{\implies}
\newcommand{\vers}{\longrightarrow}
\newcommand{\tend}{\rightarrow}
\newcommand{\deriv}[1]{~\mathrm{d}#1}
\newcommand{\diff}[1]{\mathrm{d}#1}
\newcommand{\f}[4]{\ensuremath{\begin{array}{rcl}#1&\vers&#2\\#3&\longmapsto&#4\end{array}}}

\newcommand{\vecteur}[1]{\overrightarrow{#1}}
\newcommand{\norme}[1]{\left\Vert \vecteur{#1}\right\Vert}
\newcommand{\scal}[2]{\vecteur{#1}.\vecteur{#2}}

\newcommand{\ps}[2]{\left\langle#1,#2\right\rangle}%produit scalaire général
\newcommand{\n}[1]{\left\Vert#1\right\Vert}%norme générale

\newcommand{\abs}[1]{\left\lvert #1\right\rvert}
\newcommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\newcommand{\ceil}[1]{\left\lceil#1\right\rceil}
\newcommand{\avg}[1]{\ensuremath{\left\langle#1\right\rangle}}

\renewcommand{\d}{\displaystyle}

\newcommand{\init}{\textbf{Initialisation :}\\ \\}
\newcommand{\here}{\pagebreak[3]\textbf{Hérédité :}\\ \\}
\newcommand{\ssi}{\ensuremath{ssi}}

\newcommand{\qqquad}{\qquad\quad}

\newcommand{\entour}[1]{\tikz\node[circle,draw,inner sep=1pt,outer sep=1pt]{#1};}%permet d'entourer par un cercle un ensemble de caractères

\newcommand{\comment}[2]{\ensuremath{\underbrace{#2}_{\mathclap{#1}}}}

%Notations

\newcommand{\naturn}{n\in\mathbb{N}}
\newcommand{\snaturn}{n\in\mathbb{N}^*}

\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\K}{\mathbb{K}}
\newcommand{\U}{\mathbb{U}}

\newcommand{\E}{\mathbb{E}}
\newcommand{\B}{\mathcal{B}}
\newcommand{\T}{\mathcal{T}}
\newcommand{\A}{\mathcal{A}}

\newcommand{\1}{\mathds1}

\renewcommand{\P}{\mathcal{P}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\D}{\mathcal{D}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\V}{\mathcal{V}}

%Nombres complexes

\renewcommand{\Re}{\mathfrak{Re}}
\renewcommand{\Im}{\mathfrak{Im}}

%Algèbre linéaire

\newcommand{\vect}{\mathrm{Vect}}
\newcommand{\Vect}{\mathrm{Vect}}
\renewcommand{\L}{\mathcal L}
\DeclareMathOperator{\im}{Im}
\reDeclareMathOperator{\ker}{Ker}
\DeclareMathOperator{\mat}{mat}
\DeclareMathOperator{\rg}{rg}
\newcommand{\M}{\mathcal M}
\DeclareMathOperator{\Tr}{Tr}
\DeclareMathOperator{\tr}{Tr}
\DeclareMathOperator{\Com}{Com}

\ifproba
	%Probabilités
	\newcommand{\ep}{$(U,V)$ un espace probabilisable}
	\newcommand{\EP}{$(\Omega,\T,\P)$ un espace probabilisé}
	\DeclareMathOperator{\ind}{\vert\!\!\!\!\raisebox{-.1ex}{\string_}\!\!\!\!\vert}%symbole d'indépendance
\fi

\DeclareMathOperator{\e}{e}
\DeclareMathOperator{\argsinh}{argsinh}
\DeclareMathOperator{\cotan}{cotan}
\DeclareMathOperator{\id}{id}

\renewcommand{\epsilon}{\varepsilon}%changement du style normal de epsilon
\renewcommand{\phi}{\varphi}%changement du style normal de phi

\endinput
