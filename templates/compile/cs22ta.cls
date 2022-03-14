%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cs22ta.cls
% CSCI 0220 Course Staff, Brown University
% (c) 2022
% 
% TA document class for CS22. 
% Using the base course class, this class adds features for compiling
% course files, such as problem, solution, metadata environments. 
%
% Usage:
% Use \documentclass{cs22ta} in the first line of your document
% Use \documentclass[metadata]{cs22ta} to display metadata, and
% \documentclass[metadata, solutions]{cs22ta} to display metadata & solutions
% (or any combination thereof). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs22ta}[2021/12/03]

% Loads base class
\LoadClass{cs22}

% Options
\newif\ifnumberedsection
\numberedsectiontrue
\newif\iftitledsection
\titledsectionfalse
\DeclareOption{names}{\numberedsectionfalse\titledsectiontrue} % Whether or not to to use problem name as heading

\newif\ifpagebreak
\DeclareOption{pagebreak}{\pagebreaktrue} % Whether or not to show solutions

\newif\ifsolution
\DeclareOption{solution}{\solutiontrue} % Whether or not to show solutions

\newif\ifrubric
\DeclareOption{rubric}{\rubrictrue} % Whether or not to show rubric

\newif\ifmetadata
\DeclareOption{metadata}{\metadatatrue} % whether or not to show metadata
\newcommand{\metaname}{}
\newcommand{\metaversion}{}
\newcommand{\metaauthors}{}
\newcommand{\metayear}{}
\newcommand{\metatopics}{}
\newcommand{\metatypes}{}
\newcommand{\metanotes}{}
\newcommand{\problemname}[1]{\renewcommand{\metaname}{#1}}
\newcommand{\version}[1]{\renewcommand{\metaversion}{#1}}
\newcommand{\authors}[1]{\renewcommand{\metaauthors}{#1}}
\newcommand{\creationyear}[1]{\renewcommand{\metayear}{#1}}
\newcommand{\topics}[1]{\renewcommand{\metatopics}{#1}}
\newcommand{\types}[1]{\renewcommand{\metatypes}{#1}}
\newcommand{\notes}[1]{\renewcommand{\metanotes}{#1}}

% Process options
\ProcessOptions\relax

% Remove numbering from sections (for table of content generation)
\setcounter{secnumdepth}{0}

% Colorful boxes
\RequirePackage[most]{tcolorbox} % To make colorful boxes
\tcbset{textmarker/.style={%
        enhanced,
        breakable,
        parbox=false,boxrule=0mm,boxsep=0mm,arc=0mm,
        outer arc=0mm,left=6mm,right=3mm,top=7pt,bottom=7pt,
        toptitle=1mm,bottomtitle=1mm,oversize}}


% Prints the homework preamble (below title and above problems)
\newcommand{\hwpreamble}{
  All homeworks are due at 11:59 PM on Gradescope.

  \textbf{Please do not include any identifying information about yourself in the handin, including your Banner ID.}

  Be sure to fully explain your reasoning and show all work for full credit.
}

% First page style
\fancypagestyle{firstpagestyle} {
  \renewcommand{\headrulewidth}{0pt}
  \lhead{\textbf{\course}}
  \chead{\textbf{\coursename}}
  \rhead{\prof}
}

% Prints the homework header (title & preamble)
\newcommand{\makehwheader}{
  \thispagestyle{firstpagestyle}
  \begin{center}
    {\huge \textbf{\@title}}

    {\large \textit{Due: \@date}}
  \end{center}
  \hwpreamble
}

% Prints bare header (title only)
\newcommand{\makeheader}{
  \thispagestyle{firstpagestyle}
  \begin{center}
    {\huge \textbf{\@title}}
  \end{center}
}

% Metadata Environment
\newtcolorbox{metaBox}{textmarker,
    borderline west={6pt}{0pt}{yellow},
    colback=yellow!10!white}
\newcommand{\makemetadata}{
  \ifmetadata
  \begin{metaBox}
    \ifnumberedsection
    \textbf{\metaname} \metaversion
    \fi
    
    \textbf{Authors: }\metaauthors\\
    \textbf{Year: }\metayear\\
    \textbf{Topics: }\metatopics\\
    \textbf{Types: }\metatypes\\
    \textbf{Notes: }\metanotes
  \end{metaBox}
  \fi
}

% Problem Environment
\setcounter{22problemcounter}{1}
\NewEnviron{22problem}{
  \ifpagebreak
  \newpage
  \fi
  \makeproblemtitle
  \makemetadata
  \setcounter{enum22i}{0}
  \BODY
  \stepcounter{22problemcounter}
}

\NewEnviron{22challenge}{
  \ifpagebreak
  \newpage
  \fi
  \section{Problem \arabic{22problemcounter} (Mind Bender --- \emph{Extra Credit})}\marginpar{\vspace*{-2.5em}\hspace*{0em}\nocoffee\nocoffee\coffee}
  % \makeproblemtitle
  % \makemetadata
  % \setcounter{enum22i}{0}
  \BODY
  \stepcounter{22problemcounter}
}

\newcommand{\makeproblemtitle}{
  \ifnumberedsection
  \section{Problem \arabic{22problemcounter}}
  \fi
  \iftitledsection
  \section{\metaname\ \metaversion}
  \fi
}

% Solution Environment
\newtcolorbox{solutionBox}{textmarker,
    borderline west={6pt}{0pt}{green},
    colback=green!10!white}

\NewEnviron{22solution}{
  \ifsolution
  \setcounter{enum22i}{0}
  \begin{solutionBox}
  \textbf{Solution: }
  
  \BODY
  \end{solutionBox}
  \fi
}

% Rubric Environment
\newtcolorbox{rubricBox}{textmarker,
    borderline west={6pt}{0pt}{orange},
    colback=orange!10!white}

\NewEnviron{22rubric}{
  \ifrubric
  \setcounter{enum22i}{0}
  \begin{rubricBox}
  \textbf{Rubric: }
  
  \BODY
  \end{rubricBox}
  \fi
}

% Hint Environment
\newtcolorbox{hintBox}{textmarker,
    borderline north={0pt}{0.5pt}{blue},
    borderline south={0pt}{0.5pt}{blue},
    borderline east={0pt}{0.5pt}{blue},
    borderline west={0pt}{0.5pt}{blue},
    colback=yellow!10!white}
\NewEnviron{22hint}{
  \rotatebox[origin=c]{180}{%
    \noindent
    \begin{minipage}[t]{\linewidth}
      \begin{hintBox}
        \BODY
      \end{hintBox}
    \end{minipage}%
  }%
}

% Challenge Problems
\reversemarginpar
\RequirePackage{marvosym}
\newcommand{\precoffee}{\vspace*{0.3em}\hspace*{0em}}
\newcommand{\nocoffee}{\hspace*{1.3em}}
\newcommand{\coffee}{\resizebox{1.3em}{!}{\Coffeecup}}
\newcommand{\tallCoffee}{\marginpar{\precoffee\nocoffee\nocoffee\coffee}}
\newcommand{\grandeCoffee}{\marginpar{\precoffee\nocoffee\coffee\coffee}}
\newcommand{\ventiCoffee}{\marginpar{\precoffee\coffee\coffee\coffee}}

% Examples
\theoremstyle{definition}
\mdfdefinestyle{mdredboxbreakable}{%
    linewidth=0.5pt,
    skipabove=12pt,
    frametitleaboveskip=5pt,
    frametitlebelowskip=0pt,
    skipbelow=2pt,
    frametitlefont=\bfseries,
    innertopmargin=12pt,
    innerbottommargin=8pt,
    nobreak=false,%Page breaking
    backgroundcolor=CarnationPink!5,
    linecolor=Fuchsia,
}
\declaretheoremstyle[
    headfont=\bfseries\color{Fuchsia},
    mdframed={style=mdredboxbreakable},
    headpunct={\\[3pt]},
    postheadspace={0pt},
]{thmredboxexample}
\declaretheorem[style=thmredboxexample,name=Example,numbered=no]{example*}



% 22 styles
\renewcommand{\implies}{\to}
\RequirePackage{fontawesome}