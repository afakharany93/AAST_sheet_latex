\NeedsTeXFormat{LaTeX2e}

\newcommand\@classname    {AAST Mecha sheet}
\newcommand\@classabout   {A class for wirting sheets in latex for AASt Mechatronics}
\newcommand\@classdate    {01/11/2020}
\newcommand\@classversion {v0.0}
\ProvidesClass{\@classname}[\@classdate\space\@classversion\space\@classabout]

\LoadClass[a4paper,12pt]{article}

\pagenumbering{gobble}

\RequirePackage{mathptmx}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{titling}

\setlength{\droptitle}{-10em}   % This is your set screw

%Preamblevariables
%
%
%

\newcommand{\courseName}[1]{\def\@courseName{#1}}
\newcommand{\courseCode}[1]{\def\@courseCode{#1}}
\newcommand{\lecturerName}[1]{\def\@lecturerName{#1}}
\newcommand{\taName}[1]{\def\@taName{#1}}
\newcommand{\sheetTitle}[1]
{
	\vspace*{3.5cm}
	\begin{center}
	\textbf{\fontsize{16pt}{0}\selectfont Sheet 1}
	\end{center}
}

%Empty initializations
\courseName{}
\courseCode{}
\lecturerName{}
\taName{}
%
% Warn if user does not set the required variables in preamble
\newcommand\checkpreamble{
  \ifx\@courseName\@empty
    \@latex@warning{\@classname: \@backslashchar courseName not defined in preamble}
    \def\@courseName{Course}
  \fi

  \ifx\@courseCode\@empty
    \@latex@warning{\@classname: \@backslashchar courseCode not defined in preamble}
    \def\@courseCode{abc123}
  \fi

  \ifx\@lecturerName\@empty
    \@latex@warning{\@classname: \@backslashchar lecturerName not defined in preamble}
    \def\@lecturerName{ }
  \fi

  \ifx\@taName\@empty
    \@latex@warning{\@classname: \@backslashchar taName not defined in preamble}
    \def\@taName{ }
  \fi
}
% Check preamble variables right after \begin{document}
\AtBeginDocument{
  \checkpreamble
}

\newcounter{question}[section]
\newenvironment{question}[1][]{\refstepcounter{question}\par\medskip
   \textbf{Question~\thequestion. \\ #1 } \rmfamily}{\medskip}

% The boarders for each page
%
%
%

\RequirePackage{pgf}
\RequirePackage{pgfpages}

\pgfpagesdeclarelayout{boxed}
{
  \edef\pgfpageoptionborder{0pt}
}
{
  \pgfpagesphysicalpageoptions
  {
    logical pages=1,%
  }
  \pgfpageslogicalpageoptions{1}
  {
    border code=\pgfsetlinewidth{2pt}\pgfstroke,%
    border shrink=\pgfpageoptionborder,%
    resized width=.95\pgfphysicalwidth,%
    resized height=.95\pgfphysicalheight,%
    center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}%
  }
}
\pgfpagesuselayout{boxed}

% The banner on top of the first page
%
%
%

\RequirePackage{fancyhdr}
\RequirePackage{multirow}
\RequirePackage{array}

\renewcommand{\headrulewidth}{0pt}

\pagestyle{fancy}

\newcommand*{\authorimg}[1]{%
  \raisebox{0\baselineskip}{%
    \includegraphics{#1}%
  }%
}

\fancypagestyle{firstpage}
{
\chead{\smash{\raisebox{-1.0\height}{\parbox{\linewidth}{
	\fontsize{16pt}{0}\selectfont COLLEGE OF ENGINEERING \& TECHNOLOGY \\
	{\setlength{\extrarowheight}{20pt}%
	\begin{tabular}{l l}
	\multirow{5}{*}{\authorimg{template_figures/aast_logo.png}} & Department: Mechanical Engineering Department \\ 
	& Course: \@courseName \\ 
	& Course No.: \@courseCode \\
	& Lecturer: \@lecturerName \\
	& Teaching Assistant: \@taName \\
	\end{tabular}}
	\centerline{\hspace{0.0in}\rule{1.07\textwidth}{1pt}}
}}}}

}
