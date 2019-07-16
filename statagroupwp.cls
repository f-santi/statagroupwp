

% ====================================================================
%
%                         StaTA Research Group
%                Department of Economics and Management
%                         University of Trento
%
%                 ..: statagroup.economia.unitn.it :..
%
%
%
%  Version:     1.0.2                        Date:        16.07.2019
%
%  Repository:  https://github.com/f-santi/statagroupwp 
% ====================================================================


% Opening declarations
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{statagroupwp}[2019/02/27 v. 1.0.0 - StaTA Research Group, University of Trento]

% Global variables
\newif\ifdraft
\newif\ifblind

% Class options
\DeclareOption{draft}{\drafttrue}
\DeclareOption{blind}{\blindtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Class loading
\ifdraft
  \LoadClass[a4paper, 12pt, twoside, openright]{article}
  \RequirePackage[a4paper]{geometry}
  \renewcommand{\baselinestretch}{1.5}
\else
  \LoadClass[a4paper, 11pt, twoside, openright]{article}
  \RequirePackage[a4paper, top = 5cm, bottom = 6cm,
    outer = 5cm, inner = 3cm, bindingoffset = 0.3cm]{geometry}
  %\renewcommand{\baselinestretch}{1.1}
\fi

% Packages
\RequirePackage[T1]{fontenc}     %
\RequirePackage[utf8]{inputenc}  %
\RequirePackage{lmodern}         %
\RequirePackage[british]{babel}  %
\RequirePackage{microtype}       %
\RequirePackage{siunitx}         %
\RequirePackage{booktabs}
\RequirePackage[final]{graphicx} %
\RequirePackage[labelfont={bf},font=small]{caption}
\RequirePackage{hyperref}        %
\RequirePackage{enumitem}        %
\RequirePackage{emptypage}       %
\RequirePackage{lineno}          % line numbering
\RequirePackage{fancyhdr}        % headers and footers
\RequirePackage{slantsc}         % italic small caps
\RequirePackage{dcolumn}
\newcolumntype{d}[1]{D..{#1}}


% Bibliography
\RequirePackage[babel]{csquotes}
%\RequirePackage[bibstyle = authoryear, citestyle = authoryear,
%  backend = bibtex, maxbibnames = 99]{biblatex}
\usepackage{natbib}
\bibliographystyle{apalike}

% ====================================================================




% ====================================================================
%  LAYOUT
% ====================================================================

% Structure
\newcommand\@journal{\@title}
\newcommand{\journal}[1]{\renewcommand\@journal{#1}}
\newcommand{\testatinaautori}{}
\newcommand{\bloccoautori}{}
\newcommand{\@corrauthor}{0}
\newcommand{\corrauthor}[1]{\renewcommand\@corrauthor{#1}}

% Annotazione
%\usepackage[symbol]{footmisc}
%\renewcommand{\thefootnote}{\fnsymbol{footnote}}
%\footnote[num]{text}
%
%\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
%\renewcommand*{\thefootnote}{\arabic{footnote}}
%\setcounter{footnote}{0}

% Author info
\renewcommand{\author}[4][0]{
  \ifthenelse{\equal{\testatinaautori}{}}{
    \expandafter\def\expandafter\testatinaautori
      \expandafter{\testatinaautori{}#3}
    
    \expandafter\def\expandafter\bloccoautori
      \expandafter{\bloccoautori{}\textsc{\small #2 #3,\ifthenelse{\equal{#1}{*}}{\footnotemark}{}} \textit{\footnotesize #4}}
  }{
    \expandafter\def\expandafter\testatinaautori
      \expandafter{\testatinaautori{}, #3}
      
    \expandafter\def\expandafter\bloccoautori
      \expandafter{\bloccoautori{}\\ \textsc{\small #2 #3,\ifthenelse{\equal{#1}{*}}{\footnotemark}{}} \textit{\footnotesize #4}}
  }
}

% Make title
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \noindent
  \begin{minipage}{\textwidth}
  \renewcommand{\baselinestretch}{1}
  \let\footnote\thanks 
  {\bfseries \LARGE \@title \par }
  \vskip 1.5em
  \ifblind\else{\small \bloccoautori \par}\fi
  \end{minipage}
  \ifblind\else\ifthenelse{\equal{\@corrauthor}{0}}{}{\footnotetext{\@corrauthor}}\fi
  \vskip 1em \par
\ifdraft  
  \linenumbers
\fi
}

% Keywords command
\newcommand{\keywords}[1]{\vskip1em\noindent\textbf{Keywords:} #1}

% Abstract environment
\renewenvironment{abstract}
  {\footnotesize
    \begin{nolinenumbers}
    \noindent\rule{\textwidth}{0.5pt}
    \end{nolinenumbers}
    
    \noindent\textbf{Abstract.}
  }
  {
   \begin{nolinenumbers}
    
    \ifdraft
      \vskip-1em
    \else
      \vskip-0.4em
    \fi
    \noindent\rule{\textwidth}{0.5pt}
    
    \begin{flushright}
    \ifdraft
      \vskip-1.65em
    \else
      \vskip-1.4em
    \fi
    \scriptsize
    Version: \@date
    \end{flushright}
    \vspace{2em}
  \end{nolinenumbers}
 \endlist}

% Heaters and footers
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\itshape\@journal}
\fancyhead[LO]{
  \ifblind
    \textit{Blinded manuscript}
  \else
    \textsl{\textsc{\testatinaautori}}
  \fi}

% Sectioning
\RequirePackage[explicit]{titlesec}
\titleformat{\section}{\bf}{\thesection}{1em}{\MakeUppercase{#1}}
\titleformat{\subsection}{\bf\scshape}{\thesubsection}{1em}{#1}
\titleformat{\subsubsection}{\bf}{\thesubsubsection}{1em}{#1}

% ====================================================================




% ====================================================================
%  MATH DECLARATIONS
% ====================================================================

% Packages
\RequirePackage{amssymb}	
\RequirePackage{amsmath}	
\RequirePackage{amsthm}
\RequirePackage{bbm}
\RequirePackage{bm}
\RequirePackage{mathrsfs}
\RequirePackage{mathtools}
\RequirePackage{braket}
\RequirePackage{dsfont}

% Operators
\DeclareMathOperator{\bigO}{\mathcal{O}}
\DeclareMathOperator{\Binom}{\mathcal{B}}
\DeclareMathOperator{\Complex}{\mathbb{C}}
\DeclareMathOperator{\cor}{cor}
\DeclareMathOperator{\cov}{cov}
\DeclareMathOperator{\define}{\equiv}
\DeclareMathOperator{\E}{\mathbb{E}}
\DeclareMathOperator{\Integer}{\mathbb{Z}}
\DeclareMathOperator{\Lik}{\mathcal{L}}
\DeclareMathOperator{\logLik}{\ln{\mathcal{L}}}
\DeclareMathOperator{\Natural}{\mathbb{N}}
\DeclareMathOperator{\norm}{\mathcal{N}}
\DeclareMathOperator{\Poi}{Poi}
\DeclareMathOperator{\Rational}{\mathbb{Q}}
\DeclareMathOperator{\Real}{\mathbb{R}}
\DeclareMathOperator{\smallo}{\textit{o}}
\DeclareMathOperator{\trace}{tr}
\DeclareMathOperator{\Var}{Var}

% Delimiters
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norma}{\lVert}{\rVert}

% Commands
\newcommand{\eu}{\mathrm{e}}
\newcommand{\diff}{\text{d}}
\newcommand{\ind}{\mathds{1}}
\newcommand{\inv}{^{-1}}
\newcommand{\iu}{\mathrm{i}}
\renewcommand{\Pr}{\mathbb{P}}
\newcommand{\T}{^\mathrm{\scriptscriptstyle T}}
\newcommand{\HH}{^\mathrm{\scriptscriptstyle H}}

% Environments
\newenvironment{sistema}{\left\lbrace\begin{array}{@{}l@{}}}{\end{array}\right.}



% ====================================================================
%  BUGS AND FURTHER SETTINGS
% ====================================================================

% Fixing bug in "lineno" package when math is around
% (solution from http://diana.parno.net/thoughts/?p=145)
\newcommand*\patchAmsMathEnvironmentForLineno[1]{
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}
     {\linenomath\csname old#1\endcsname}
     {\csname oldend#1\endcsname\endlinenomath}}
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{
  \patchAmsMathEnvironmentForLineno{#1}
  \patchAmsMathEnvironmentForLineno{#1*}}
\AtBeginDocument{
\patchBothAmsMathEnvironmentsForLineno{equation}
\patchBothAmsMathEnvironmentsForLineno{align}
\patchBothAmsMathEnvironmentsForLineno{flalign}
\patchBothAmsMathEnvironmentsForLineno{alignat}
\patchBothAmsMathEnvironmentsForLineno{gather}
\patchBothAmsMathEnvironmentsForLineno{multline}
}
% ====================================================================



