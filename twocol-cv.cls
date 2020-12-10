%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{twocol-cv}[CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\def\bodysize{11pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import Dependencies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{fontspec}
\usepackage{enumitem}

\providecommand{\tightlist}
	{
		\setlength{\itemsep}{0pt}
		\setlength{\parskip}{0pt}
	}

\setlist[itemize]{leftmargin=15pt, topsep=0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Colours
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[usenames,dvipsnames]{xcolor} 
\definecolor{date}{HTML}{666666} 
\definecolor{font_dark}{HTML}{151515}
\definecolor{font_medium}{HTML}{333333}
\definecolor{font_light}{HTML}{6A6A6A}
\definecolor{font_accent}{HTML}{C04000} % Burnt Orange
\definecolor{font_accent}{HTML}{2F6CA5} % Teal
% {9B3000} % Red
% {007d95} % Blue
% \definecolor{font_accent}{HTML}{003B6F} % Blue

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{fontspec}
\renewcommand{\familydefault}{\sfdefault}

\setsansfont[
		Color = font_medium, 
		Path = ../fonts/avenir-next/,
		BoldItalicFont = AvenirNext-MediumItalic,
		BoldFont = AvenirNext-Medium,
		ItalicFont = AvenirNext-Italic
	]
	{AvenirNext-Regular}

% \setsansfont[
% 		Color = font_medium, 
% 		Path = ../fonts/open-sans/,
% 		BoldItalicFont = OpenSans-BoldItalic,
% 		BoldFont = OpenSans-Bold,
% 		ItalicFont = OpenSans-Italic
% 	]
% 	{OpenSans-Regular}

\setromanfont[
		Path = ../fonts/georgia/,
		BoldItalicFont = Georgia Bold Italic,
		BoldFont = Georgia Bold,
		ItalicFont = Georgia Italic
	]
	{Georgia}

% \setromanfont[
% 		Path = ../fonts/merriweather/,
% 		BoldItalicFont = Merriweather-BoldItalic,
% 		BoldFont = Merriweather-Bold,
% 		ItalicFont = Merriweather-Italic
% 	]
% 	{Merriweather-Regular}

% \newfontfamily{\FAFR}[Path = ../fonts/fontawesome/]{Font Awesome 5 Free-Regular-400}
\newfontfamily{\FAS}[Path = ../fonts/fontawesome/]{Font Awesome 5 Free-Solid-900}
\newfontfamily{\FAB}[Path = ../fonts/fontawesome/]{Font Awesome 5 Brands-Regular-400}

\def\faLinkedinSquare{{\FAB \symbol{"F08C}\enspace}} % Linkedin
\def\faEnvelope{{\FAS \symbol{"F0E0}\enspace}} % Linkedin
\def\faPhoneSquare{{\FAS \symbol{"F87B}\enspace}} % Linkedin
\def\faGithub{{\FAB \symbol{"F09B}\enspace}} % Linkedin
\def\faHome{{\FAS \symbol{"F015}\enspace}} % Linkedin
\def\faWebsite{{\FAS \symbol{"F0AC}\enspace}} % Linkedin

%%%
\usepackage{titlesec}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Styling for the name (title)
\newcommand{\namesection}[1]{
    {
		\color{font_medium}
		\fontsize{32pt}{32pt}
		\fontspec[Path = ../fonts/avenir-next/]{AvenirNext-Regular}\selectfont
		% \fontspec[Path = ../fonts/open-sans/]{OpenSans-Light}\selectfont
		\addfontfeature{LetterSpace=10.0}
		{#1}
    }
    \vspace{5pt}
}

%%% Styling for the info section
\newcommand{\infosection}[1]
	{
		\raggedright
		\fontsize{\bodysize}{15pt}
		% \sffamily
		\color{font_light} % Colours the fontawesome icons
		\addfontfeature{Color=font_light} % Colours the text
		{#1} 
	}

%%
\newcommand{\langs}[1]{
	\hfill
    \color{font_light}
    \fontsize{\bodysize}{14pt}
	\fontspec[Path = ../fonts/avenir-next/]{AvenirNext-Regular}\selectfont
    % \bfseries
	% \uppercase
	% \scshape
	{#1} 
	\normalfont}
	
%%% Re-style the Header-1
\titleformat{\section}
	{
		\color{font_medium}
		% \scshape
		\fontsize{14pt}{14pt}
		\fontspec[Path = ../fonts/avenir-next/]{AvenirNext-Regular}\selectfont
		% \fontspec[Path = ../fonts/open-sans/]{OpenSans-Light}\selectfont
		\addfontfeature{LetterSpace=40.0} 
		\raggedright\uppercase
    }
    {}{0em}{}
    
%%% Re-style the Header-2
\titleformat{\subsection}
	{
		\color{font_accent}
		\fontsize{14pt}{14pt}
		\bfseries
		\rmfamily
    }
	{}{0em}{}
    
%%% Re-style the Header-3
\titleformat{\subsubsection}
	{
		\color{font_light}
		\raggedright
		\fontsize{\bodysize}{\bodysize}
		\rmfamily
    }
    {}{0em}{}

%%% Date function
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}
    {\begin{textblock}{50}(155,5)
    \raggedleft
	\fontsize{8pt}{8pt}\selectfont
	% \fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\selectfont
    \addfontfeature{Color=date}{\today}
    \end{textblock}}
	
% Takes the format of titlespacing*{command}{left}{before-sep}{after-sep}[right-sep]
% If I'm right, the before-sep applies relative to body text, but not to other heading/subheadings etc
\titlespacing{\section}{0pt}{8pt}{4pt} 
\titlespacing{\subsection}{0pt}{4pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{2pt}
