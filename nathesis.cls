% ** Natalia@woodstock - 27/Jan/2006
% ** Load hepthesis.cls with my hacks, plus some
%    other useful tex packages, such as natbib.
\ProvidesClass{nathesis}

%% Standard printing:
\LoadClass[a4paper,twoside]{hepthesis}

%%%% Tips from hepthesis class:
%% For normal draft builds
%\LoadClass[hyperpdf,nobind,draft]{nathesis}
%% For short draft builds (breaks citations by necessity)
%\LoadClass[hyperpdf,nobind,draft,hidefrontback]{hepthesis}
%% For Cambridge soft-bound version
%\LoadClass[hyperpdf,bindnopdf]{hepthesis}
%% For Cambridge hard-bound version (must be one-sided)
%\LoadClass[hyperpdf,oneside]{hepthesis}

% Figure packages
\usepackage{graphicx}
\usepackage{subfigure}
\usepackage[section]{placeins}

% Table package
\usepackage{longtable}

% The packages below seem to make a pretty good pdf using ps2pdf
\usepackage{ae,aecompl}

% Bibtex and Portuguese packages - cannot change this order!
\usepackage{natbib}

% Fix comma spacing in math mode.
\def\magyarOptions{mathhucomma=fix,figurecaptions=unchanged,tablecaptions=unchanged,sectiondot=none}
\usepackage[magyar,brazil]{babel}

\citestyle{aa}

% My definitions
\usepackage{nadefinitions}

%%%% André %%%%
\usepackage{hyperref}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{pdfpages}
\usepackage{xfrac}

% Used for code formatting.
\usepackage{fancyvrb}
\usepackage[scaled]{beramono}

\usepackage{txfonts}

%%%%% BEGIN Python environment
\usepackage{color}
\usepackage{listings}
\usepackage{setspace}

\definecolor{Code}{rgb}{0,0,0}
\definecolor{Decorators}{rgb}{0.5,0.5,0.5}
\definecolor{Numbers}{rgb}{0.5,0,0}
\definecolor{MatchingBrackets}{rgb}{0.25,0.5,0.5}
\definecolor{Keywords}{rgb}{0,0,1}
\definecolor{self}{rgb}{0,0,0}
\definecolor{Strings}{rgb}{0,0.63,0}
\definecolor{Comments}{rgb}{0,0.63,1}
\definecolor{Backquotes}{rgb}{0,0,0}
\definecolor{Classname}{rgb}{0,0,0}
\definecolor{FunctionName}{rgb}{0,0,0}
\definecolor{Operators}{rgb}{0,0,0}
\definecolor{Background}{rgb}{0.98,0.98,0.98}

\lstnewenvironment{python}[1][]{
\lstset{
numbers=left,
numberstyle=\footnotesize,
numbersep=1em,
xleftmargin=1em,
framextopmargin=2em,
framexbottommargin=2em,
showspaces=false,
showtabs=false,
showstringspaces=false,
frame=l,
tabsize=4,
% Basic
basicstyle=\ttfamily\small\setstretch{1},
backgroundcolor=\color{Background},
language=Python,
% Comments
commentstyle=\color{Comments}\slshape,
% Strings
stringstyle=\color{Strings},
morecomment=[s][\color{Strings}]{"""}{"""},
morecomment=[s][\color{Strings}]{'''}{'''},
% keywords
morekeywords={import,from,class,def,for,while,if,is,in,elif,else,not,and,or,print,break,continue,return,True,False,None,access,as,,del,except,exec,finally,global,import,lambda,pass,print,raise,try,assert},
keywordstyle={\color{Keywords}\bfseries},
% additional keywords
morekeywords={[2]@invariant},
keywordstyle={[2]\color{Decorators}\slshape},
emph={self},
emphstyle={\color{self}\slshape},
%
}}{}

%%%%% END Python environment
