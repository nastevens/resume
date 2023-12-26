% Modified version of [Developer CV](https://www.latextemplates.com/template/developer-cv)
%
% Authors:
%   Jan Vorisek (jan@vorisek.me)
%   Based on a template by Jan Küster (info@jankuester.com)
%   Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%   Modified by Nick Stevens (nick@bitcurry.com)
%
% License:
%   Copyright (c) <2018> <Jan Vorisek>
%
%   Permission is hereby granted, free of charge, to any person
%   obtaining a copy of this software and associated documentation
%   files (the "Software"), to deal in the Software without
%   restriction, including without limitation the rights to use,
%   copy, modify, merge, publish, distribute, sublicense, and/or sell
%   copies of the Software, and to permit persons to whom the
%   Software is furnished to do so, subject to the following
%   conditions:
%
%   The above copyright notice and this permission notice shall be
%   included in all copies or substantial portions of the Software.
%
%   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
%   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
%   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
%   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
%   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
%   OTHER DEALINGS IN THE SOFTWARE.


%----------------------------------------------------------------------------------------
% Class Configuration
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{developercv}[Developer CV]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options
\LoadClass{extarticle} % Load the base class


%----------------------------------------------------------------------------------------
% Document Configuration and Layout
%----------------------------------------------------------------------------------------

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links
\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)
\usepackage{geometry} % Required for adjusting page dimensions and margins

\setlength{\parindent}{0mm} % Suppress paragraph indentation
\pagestyle{empty} % No headers or footers
\geometry{
    paper=letterpaper, % Paper size, change to letterpaper for US letter size
    top=1.75cm, % Top margin
    bottom=1.75cm, % Bottom margin
    left=2cm, % Left margin
    right=2cm, % Right margin
    headheight=0.75cm, % Header height
    footskip=1cm, % Space from the bottom margin to the baseline of the footer
    headsep=0.5cm, % Space from the top margin to the baseline of the header
    % showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
% Graphics Definitions
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
    \begingroup%
        \setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
    \endgroup%
}

%----------------------------------------------------------------------------------------
% Fonts
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage[default]{raleway}
\usepackage{fontawesome} % Required for FontAwesome icons
\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%----------------------------------------------------------------------------------------
% Custom commands and environments
%----------------------------------------------------------------------------------------

% Output an icon in a black square box with text to the right.
% Arguments:
%   [1] FontAwesome icon name
%   [2] Box size
%   [3] Text
\newcommand{\icon}[3]{
    \vcenteredhbox{%
        \colorbox{black}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}
    }
    \hspace{0.25em}
    \vcenteredhbox{\textcolor{black}{#3}}
}

% Output section title headings
\newcommand{\cvsect}[1]{
    \vspace{0.5\baselineskip}
    \colorbox{black}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\% Section title
    \vspace{0.5\baselineskip}
}

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable
\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{ \begin{longtable}[H]{l l} }{ \end{longtable} }

% Add an entry to an entrylist.
% Arguments:
%   [1] Leftmost date(s) text
%   [2] Left-aligned heading
%   [3] Right-aligned heading
%   [4] Entry description
\newcommand{\entry}[4]{
    \parbox[t]{0.175\textwidth}{#1}%
    &\parbox[t]{0.825\textwidth}{
        \textbf{#2}
        \hfill
        {\footnotesize \textbf{\textcolor{black}{#3}}}\\
        \raggedright
        #4
    }\\\\}

% Output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{1em}/\hspace{1em}}

% Make a minipage environment pre-configured to align at the top and scale off
% of \textwidth.
% Arguments:
%   [1] Scale factor for \textwidth
\newenvironment{cvminipage}[1]
    {\begin{minipage}[t]{#1\textwidth}\raggedright}
    {\end{minipage}}

% Pretty format I2C (i.e. superscript the 2)
\newcommand{\iic}{{I\textsuperscript{2}C}}
