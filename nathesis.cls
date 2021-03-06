% **************************************************************** %
% ** Natalia@UFSC - 14/Oct/2009
% ** Load memoir.cls with my hacks, plus some
%    other useful tex packages, such as natbib.
\ProvidesClass{nathesis}

% Standard printing
\LoadClass[a4paper, 12pt]{memoir}
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
  %\DeclareGraphicsRule{.eps}{eps}{.eps.bb}{}
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
%\usepackage{mathptmx}
%\DeclareMathAlphabet{\mathptmx}

% Bibtex
\usepackage{natbib}
\citestyle{aa}
% count number of references:
%\usepackage[super]{natbib}
%%\citestyle{aa} (comment this line)

% Journal abreviations
\usepackage{aas_macros}

% Portuguese hyphenation
\usepackage[brazil]{babel}

% Figs dir
\graphicspath{{figuras/}}
\setfloatlocations{figure}{!tbp}
\renewcommand{\textfraction}{0.1}
\renewcommand{\topfraction}{0.9}
\setlength{\@fptop}{0pt}

%******* % The packages below seem to make a pretty good pdf using ps2pdf
%******* %\usepackage{ae,aecompl}

% My definitions
\usepackage{nadefinitions}

% Bigger fonts
\usepackage{fix-cm}

% Used for code formatting.
\usepackage{fancyvrb}
\usepackage[scaled]{beramono}
\usepackage{listings}
\usepackage{longtable}

\usepackage{amsmath}
\usepackage{xfrac}

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
\setlrmarginsandblock{36mm}{21mm}{*}
\setulmarginsandblock{39mm}{31mm}{*}
\setheadfoot{10mm}{10mm}
\checkandfixthelayout
\parindent 14mm

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
  \renewcommand*{\chaptitlefont}{\normalfont\Huge\sffamily}
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
  {\clearpage\mbox{}\vfill\hfill{\Large\fzapfit #1} \par\vspace*{4em}\clearpage}%
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
\newcommand{\jury}[1]{\def\jury{#1}}

\newcommand{\titlepage}{{%
    \fontfamily{pnc}\selectfont
%    \newcommand*{\titlefont}{\HUGE\sffamily}
    \newcommand*{\titlefont}{\fontsize{35}{42}\selectfont\sffamily}
    \thispagestyle{empty}
    \centering
    %\sffamily
    %\vspace{-5em}
    \institution \\
    \vspace*{1.5em}
    \institutionSDW \\
    \vspace*{6em}
    %\vfill
    \hrule\vskip\onelineskip
    {\titlefont
      \thesistitle \\
    }
    \vskip\onelineskip\hrule
    \vspace*{3em}
    {%\Large
      \thesisauthor \\
    }
    \vspace*{1em}
    \vfill
    \supervisor \\
    \vspace*{1em}
    \vfill
    \cosupervisor \\
    \vspace*{9em}
    \begin{minipage}[t]{0.9\textwidth}
      {%\small
        \comments
      }
    \end{minipage}
    \\
    \vspace*{2em}
    \place, \thesisdate
    \normalfont
    \clearpage}}

% ** Page de titre - ObsPM
\newcommand{\pagedetitre}{{%
    \fontfamily{pnc}\selectfont
    \newcommand*{\titlefont}{\fontsize{35}{42}\selectfont\sffamily}
    \thispagestyle{empty}
    \centering
    \institution \\
    \vspace*{1.5em}
    \institutionSDW \\
    \vspace*{5em}
    %\vfill
    {%\Large
      \thesisauthor \\
    }
    \vspace*{2em}
    \hrule\vskip\onelineskip
    {\titlefont
      \thesistitle \\
    }
    \vskip\onelineskip\hrule
    \vspace*{2em}
    \supervisor \\
    \vspace*{2em}
    \thesisdate \\
    \vfill
    \vspace*{1em}
    \flushleft
    {\bfseries Jury :}
    \jury
    \normalfont
    \clearpage}}

% List environment for jury in French version
\newenvironment{xlist}[1][\rule{0.75cm}{0cm}]{%
  \begin{list}{}{%
    \settowidth{\labelwidth}{#1:}
    \setlength{\labelsep}{0.5cm}
    \setlength{\leftmargin}{\labelwidth}
    \addtolength{\leftmargin}{\labelsep}
    \setlength{\rightmargin}{0pt}
    \setlength{\parsep}{0.5ex plus 0.2ex minus 0.1ex}
    \setlength{\itemsep}{0 ex plus 0.2ex}
    \renewcommand{\makelabel}[1]{##1\hfil}
    }
  }
{\end{list}}
% **************************************************************** %


% **************************************************************** %
% ** Abstract
\setlength{\absleftindent}{0em}
\setlength{\absrightindent}{0em}
\renewcommand{\abstractnamefont}{\normalfont\sffamily}%\bfseries}
%\renewcommand{\abstracttextfont}{\normalfont}
\renewenvironment{abstract}[1][\abstractname]{%
  \setup@bstract
  \if@bsrunin\else
    \ifnumber@bs \num@bs \else
      \begin{\absnamepos}
      \abstractnamefont#1
      \end{\absnamepos}
      \vspace{\abstitleskip}
    \fi
  \fi
  \put@bsintoc%
  \begin{@bstr@ctlist}\if@bsrunin\@bsrunintitle\fi}%\abstracttextfont}%
  {\par\end{@bstr@ctlist}}
% **************************************************************** %


% **************************************************************** %
% ** Styles for drafts
%\chapterstyle{default}
%\pagestyle{ruled}
% **************************************************************** %

% The end
