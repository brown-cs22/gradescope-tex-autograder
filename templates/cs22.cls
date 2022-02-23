%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cs22.cls
% CSCI 0220 Course Staff, Brown University
% (c) 2022
% 
% Document class for CS22. Ensure that this is in the same directory as your
% tex file. On Overleaf, upload this file. 
%
% Usage Example: 
% \documentclass{cs22} 
% \title{Homework 1}
% \date{Jan 20, 2022} % If you do not include a date, it will be today's date
% \begin{document}
%   \begin{problem}
%     This is the solution to problem 1. 
%   \end{problem}
%   \begin{problem}
%     This is the solution to problem 2. 
%   \end{problem}
% \end{document}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Provides class 'cs22', version should be in YYYY/MM/DD format
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs22}[2021/12/03]

% Loads base class
\LoadClass[12pt,letterpaper]{article}

%%%%%%%%%% Variables %%%%%%%%%%
\newcommand{\course}{CSCI 0220}
\newcommand{\coursename}{Discrete Structures and Probability}
\newcommand{\prof}{R. Lewis}

%%%%%%%%%% Packages %%%%%%%%%%
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amscd}
\RequirePackage{enumerate}
\RequirePackage{fancyhdr}
\RequirePackage{mathrsfs}
\RequirePackage{bbm}
\RequirePackage{framed}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{cancel}
\RequirePackage{mathtools}
\RequirePackage{verbatim}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage[letterpaper,voffset=-.5in,bmargin=3cm,footskip=1cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{environ} % For better environment macros
\RequirePackage[
    colorlinks = true,
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = blue,
    anchorcolor = blue]{hyperref}
\RequirePackage{booktabs}

%%%%%%%%%% Definitions %%%%%%%%%%
\setlength{\parindent}{0.0in}
\setlength{\parskip}{0.1in}
\allowdisplaybreaks
\headheight 15pt
\headsep 10pt
\newcommand\N{\mathbb N}
\newcommand\Z{\mathbb Z}
\newcommand\R{\mathbb R}
\newcommand\Q{\mathbb Q}
\newcommand\lcm{\operatorname{lcm}}
\newcommand\setbuilder[2]{\ensuremath{\left\{#1\;\middle|\;#2\right\}}}
\newcommand\E{\operatorname{E}}
\newcommand\V{\operatorname{V}}
\newcommand\Pow{\ensuremath{\operatorname{\mathcal{P}}}}

\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\newcommand\hint[1]{\textbf{Hint}: #1}
\newcommand\note[1]{\textbf{Note}: #1}
\newcounter{enum22i}
\newenvironment{22enumerate}{\begin{enumerate}[a.]\itemsep0em\setcounter{enumi}{\value{enum22i}}}{\setcounter{enum22i}{\value{enumi}}\end{enumerate}}
\newenvironment{22itemize}{\begin{itemize}\itemsep0em}{\end{itemize}}

% Pagestyle
\title{Untitled}
\date{\today}
\fancypagestyle{fancyplain} {
  \renewcommand{\headrulewidth}{0pt}
  \lhead{\textbf{CSCI 0220}}
  \chead{\@title}
  \rhead{\textit{\@date}}
  \setlength{\headsep}{20pt}
}

% Sets the default pagestyle
\pagestyle{fancyplain}

\newcounter{22problemcounter}
\setcounter{22problemcounter}{1}
\NewEnviron{problem}{
  \subsection*{Problem \arabic{22problemcounter}}
  \BODY
  \stepcounter{22problemcounter}
  \newpage % New page after each problem for Gradescope tagging
}

\renewcommand{\implies}{\to}
\author{}
