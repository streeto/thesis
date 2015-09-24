% **************************************************************** %
% ** Natalia@UFSC - 14/Oct/2009
% ** Load memoir.cls with my hacks, plus some
%    other useful tex packages, such as natbib.
\ProvidesClass{nathesis}

% Standard printing
\LoadClass[a5paper, 10pt]{memoir}
% **************************************************************** %


% **************************************************************** %
% ** Simple options for the versions I may need to run:
%    - draft = parsed with latex+dvi,
%              ignore sections inside \ignoreondraft
%    - final (default) = parsed with pdflatex, 
%                        include sections inside \ignoreondraft

% Select options
\newif\iffinaldoc\finaldoctrue
\DeclareOption{final}{\finaldoctrue}
\DeclareOption{dvips}{\finaldocfalse}

%\ExecuteOptions{final}
\ProcessOptions*

% Exclude parts not to be printed in the draft mode
\newcomment{ignoreondraft}
\iffinaldoc
  \commentsoff{ignoreondraft}
\fi

% Load packages for draft (dvi) and final (pdf) modes
\RequirePackage{graphicx}
\iffinaldoc
  % Figure packages
  %\RequirePackage[pdftex]{graphicx}
  % Appendix
  \RequirePackage{pdfpages}
\else
  % Figure packages
  %\RequirePackage[dvips]{graphicx}
  \DeclareGraphicsRule{.eps}{eps}{.eps.bb}{}
\fi
% **************************************************************** %


% **************************************************************** %
% ** Links
% Links
\usepackage[breaklinks=true]{hyperref}
\usepackage{memhfixc} 
\usepackage[all]{hypcap}
\urlstyle{same}

\iffinaldoc
  \hypersetup{
    pdftitle = {Evolucao quimica e historia de formacao estelar no Universo local},  % title
    pdfauthor = {Natalia Vale Asari},                                                % author
    pdfsubject = {Tese de Doutorado},                                                % subject of the document
    pdfcreator={LaTeX with memoir class},                                            % creator of the document
    pdfproducer={pdflatex},                                                          % producer of the document
    pdfkeywords = {stellar populations, star formation, AGN},                        % list of keywords
    unicode=true,                                                                    % non-Latin characters in bookmarks
    bookmarksnumbered=true,                                                          % include section numbers in bookmarks
  }
\fi
% **************************************************************** %


% **************************************************************** %
% ** Load other packages

% UTF-8
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
%\usepackage{mathptmx}
%\DeclareMathAlphabet{\mathptmx}

% Bibtex
\usepackage{natbib}
\citestyle{aa}

% Journal abreviations
\usepackage{aas_macros}

% Portuguese hyphenation and correct comma in float numbers.
\def\magyarOptions{mathhucomma=fix,figurecaptions=unchanged,tablecaptions=unchanged,sectiondot=none}
\usepackage[magyar,brazil]{babel}

% Long tables
\usepackage{longtable}

% For equation arrays and better looking fractions.
\usepackage{amsmath}
\usepackage{xfrac}

% Figs dir
\graphicspath{{figuras/}}
\setfloatlocations{figure}{!tbp}
\renewcommand{\textfraction}{0.1}
\renewcommand{\topfraction}{0.9}
\setlength{\@fptop}{0pt}

%% Figure environment
\let\@oldfigure\figure
\let\@oldendfigure\endfigure
\renewenvironment{figure}{
  \@oldfigure%
  \begin{center}%
}{%
  \end{center}%
  \@oldendfigure%
  \ignorespacesafterend%
}

\usepackage{placeins}

%******* % The packages below seem to make a pretty good pdf using ps2pdf
%******* %\usepackage{ae,aecompl}

% My definitions
\usepackage{nadefinitions}

% Bigger fonts
\usepackage{fix-cm}

%******* % Fancy code listings
\usepackage{fancyvrb}
\usepackage[scaled]{beramono}

\usepackage{setspace}
\usepackage{txfonts}

%%%%% BEGIN Python environment
\usepackage{color}
\usepackage{listings}
\renewcommand*{\lstlistingname}{Código fonte}

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
basicstyle=\ttfamily \small,
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
}

% **************************************************************** %


% **************************************************************** %
% ** Table of contents

% ToC down to subsections
\settocdepth{subsection}
% Numbering down to subsections as well
\setsecnumdepth{subsection}
% **************************************************************** %


% **************************************************************** %
% ** Sizes, sizes

% Margins - new UFSC rules
\setlrmarginsandblock{25mm}{15mm}{*}
\setulmarginsandblock{27mm}{22mm}{*}
\setheadfoot{7mm}{7mm}
\checkandfixthelayout
\parindent 10mm

% Size of epigraphs
\epigraphwidth 0.7\textwidth

% Line spacing in references
\bibsep 0em
% **************************************************************** %


% **************************************************************** %
% ** Headers, footers and numbering
\copypagestyle{ruled-nat}{ruled}
\makeevenhead{ruled-nat}{\sffamily\leftmark}{}{}
\makeoddhead{ruled-nat}{}{}{\sffamily\rightmark}
\makeevenfoot{ruled-nat}{\sffamily\thepage}{}{}
\makeoddfoot{ruled-nat}{}{}{\sffamily\thepage}
\makeoddfoot{plain}{}{\sffamily\thepage}{}
\makeevenfoot{plain}{}{\sffamily\thepage}{}

\pagestyle{ruled-nat}
%\pagestyle{ruled}
% **************************************************************** %


% **************************************************************** %
% ** Sections Style
%\setsecheadstyle{\sffamily\large\bfseries\memRTLraggedright}%
%\setsubsecheadstyle{\sffamily\bfseries\memRTLraggedright}%
\setsecheadstyle{\sffamily\large\memRTLraggedright}%
\setsubsecheadstyle{\sffamily\memRTLraggedright}%
\setsubsubsecheadstyle{\sffamily\memRTLraggedright}%
%\headstyles{komalike}
% **************************************************************** %


% **************************************************************** %
% ** Chapter style
\newcommand{\fzapfit}{\fontfamily{pzc}\fontshape{it}\fontseries{m}\selectfont}
\makechapterstyle{bianchi-nat}{%
  \chapterstyle{default}
  \renewcommand*{\chapterheadstart}{}
  \renewcommand*{\chapnamefont}{\normalfont\Large\fzapfit}
  \renewcommand*{\chapnumfont}{\normalfont\huge\itshape}
  \renewcommand*{\printchaptername}{%
    \chapnamefont\centering\@chapapp}
  \renewcommand*{\printchapternum}{\chapnumfont \thechapter}
  \renewcommand*{\chaptitlefont}{\normalfont\Huge\sffamily}%\bfseries}
%  \renewcommand*{\chaptitlefont}{\normalfont\normalsize\bfseries\scshape}
  \renewcommand*{\printchaptertitle}[1]{%
    \hrule\vskip\onelineskip \centering \chaptitlefont{##1}\par}
  \renewcommand*{\afterchaptertitle}{\vskip\onelineskip \hrule\vskip
    \afterchapskip}
  \renewcommand*{\printchapternonum}{%
    \vphantom{\chapnumfont \textit{9}}\afterchapternum}}

\chapterstyle{bianchi-nat}
%\chapterstyle{default}
% **************************************************************** %


% **************************************************************** %
% ** Dedicatoria
\newcommand{\dedication}[1]{%
  \thispagestyle{empty}%
  {\clearpage\mbox{}\vfill\hfill{\Large\fzapfit #1} \par\vspace*{4cm}\clearpage}%
}
% **************************************************************** %


% **************************************************************** %
% ** Folha de rosto
\newcommand{\institution}[1]{\def\institution{#1}}
\newcommand{\institutionSDW}[1]{\def\institutionSDW{#1}}
\newcommand{\thesistitle}[1]{\def\thesistitle{#1}}
\newcommand{\thesisauthor}[1]{\def\thesisauthor{#1}}
\newcommand{\supervisor}[1]{\def\supervisor{#1}}
\newcommand{\cosupervisor}[1]{\def\cosupervisor{#1}}
\newcommand{\comments}[1]{\def\comments{#1}}
\newcommand{\place}[1]{\def\place{#1}}
\newcommand{\thesisdate}[1]{\def\thesisdate{#1}}

\newcommand{\titlepage}{{%
    \newcommand*{\titlefont}{\normalfont\HUGE\sffamily}%\bfseries}
    \thispagestyle{empty}
    \centering
    \sffamily
    \institution \\
    \vspace*{1.5em}
    \institutionSDW \\
    \vspace*{4em}
    \hrule\vskip\onelineskip
    {\titlefont
      \thesistitle \\
    }
    \vskip\onelineskip\hrule
    \vspace*{3em}
    {\Large
      \thesisauthor \\
    }
    \vspace*{6em}
    \supervisor \\
    \cosupervisor \\
    \vspace*{1em}
    \vfill
    \begin{minipage}[t]{0.9\textwidth}
      {\small
        \comments
      }
    \end{minipage}
    \\
    \vspace*{2em}
    \place, \thesisdate
    \normalfont
    \clearpage}}
% **************************************************************** %


% **************************************************************** %
% ** Abstract
\setlength{\absleftindent}{0em}
\setlength{\absrightindent}{0em}
\renewcommand{\abstractnamefont}{\normalfont\sffamily}%\bfseries}
\renewcommand{\abstracttextfont}{\normalfont}
\renewenvironment{abstract}[1][\abstractname]{%
  \setup@bstract
  \if@bsrunin\else
    \ifnumber@bs \num@bs \else
      \begin{\absnamepos}\abstractnamefont#1\end\absnamepos%
      \vspace{\abstitleskip}%
    \fi
  \fi
  \put@bsintoc%
  \begin{@bstr@ctlist}\if@bsrunin\@bsrunintitle\fi\abstracttextfont}%
  {\par\end{@bstr@ctlist}}
% **************************************************************** %


% **************************************************************** %
% ** Styles for drafts
%\chapterstyle{default}
%\pagestyle{ruled}
% **************************************************************** %

% The end
