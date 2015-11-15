%% jpnsecart.cls は，進化計算学会論文誌のためのスタイルファイルです．
%% 
%% Change Log
%% 2010/03/15: 人工知能学会論文誌用のスタイルファイル jsaiart.cls 
%% (ver. 4.0.1) をもとに進化計算学会論文誌用に修正．
%%


\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jpnsecart}[1999/09/20]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jpnsec2e}}

%% Article Style
\newif\if@jpnsecart
\@jpnsecartfalse
\DeclareOption{jpnsecart}{\@jpnsecarttrue}
\newif\if@final
\@finalfalse
\DeclareOption{final}{\@finaltrue}

\ProcessOptions

\LoadClass{jpnsec2e}
%% 
%%HEADER STYLE
\def\AFbox#1{\setlength{\unitlength}{1mm}
    \begin{picture}(20,5)%
    \put(10,2.5){\oval(20,5)}%
    \put(2,0.5){\makebox(16,4.0){\hss{\bf #1}\hss}}%
    \end{picture}%
}

\def\BFbox#1{\setlength{\unitlength}{1mm}
    \begin{picture}(24,5)%
    \put(0,0){\line(1,0){22}}%
    \put(1,0.5){\makebox(20,4.0)[s]{\hss{\bf #1}\hss}}%
    \put(22,0){\line(1,2){2.5}}%
    \end{picture}%
}

\def\Fbox#1{\setlength{\unitlength}{1mm}
    \begin{picture}(16,4)%
    \put(8,2){\oval(16,3.5)}%
    \put(0,0){\makebox(16,4){\hss{\bf #1}\hss}}%
    \end{picture}%
}
\def\DFbox#1{\setlength{\unitlength}{1mm}
    \begin{picture}(20,4)%
    \put(10,2){\oval(20,3.5)}%
    \put(0,0){\makebox(20,4){\hss{\bf #1}\hss}}%
    \end{picture}%
}
\def\WDFbox#1{\setlength{\unitlength}{1mm}
    \begin{picture}(32,4)%
    \put(16,2){\oval(32,3.5)}%
    \put(0,0){\makebox(32,4){\hss{\bf #1}\hss}}%
    \end{picture}%
}
%% 2008.08.13-begin by morita
\def\WWDFbox#1{\setlength{\unitlength}{1mm}
    \begin{picture}(36,4)%
    \put(18,2){\oval(36,3.5)}%
    \put(0,0){\makebox(36,4){\hss{\bf #1}\hss}}%
    \end{picture}%
}
%% 2008.08.13-end by morita
%%
\def\GIbox#1{\fbox{\rule[-.5mm]{0mm}{5mm}{\hbox to 5mm{%
\kern.4ex
\hss {\reset@font\LARGE\bfseries #1}\hss }}}}
%%
%\def\type@technicalpaper{%
%  \fboxsep=.5mm
%  \vbox to 12mm{%
%  \Fbox{論\hskip1zw 文}
%  \hfill
%  \vtop{\hbox to 33.5mm{\hss\smash{%
%   \reset@font\slarge\sffamily\slshape Technical Papers}\hss}%
%   \nointerlineskip\vskip1mm
%   \hbox to 33.5mm{\leaders\hrule height.1mm\hfil}}%
%  \unitlength=.3mm
%  \begin{picture}(5.5,12.5)
%   \put(0,-3){\line(2,5){6}}%
%  \end{picture}\par
%  \vss}
%\nointerlineskip%%\vskip3mm
%}

\def\type@surveypaper{%
  \fboxsep=.5mm
  \vbox to 12mm{%
  \BFbox{解\hskip1zw 説}
%  \hfill
%  \vtop{\hbox to 33.5mm{\hss\smash{%
%   \reset@font\slarge\sffamily\slshape Survey Paper}\hss}%
%   \nointerlineskip\vskip1mm
%   \hbox to 33.5mm{\leaders\hrule height.1mm\hfil}}%
%  \unitlength=.3mm
%  \begin{picture}(5.5,12.5)
%   \put(0,-3){\line(2,5){6}}%
%  \end{picture}\par
  \vss}
\nointerlineskip%%\vskip3mm
}

\def\type@originalpaper{%
  \fboxsep=.5mm
  \vbox to 12mm{%
  \BFbox{論\hskip1zw 文}
  \vss}
\nointerlineskip%%\vskip3mm
}

\def\type@invitedpaper{%
  \fboxsep=.5mm
  \vbox to 12mm{%
  \BFbox{招待論文}
  \vss}
\nointerlineskip%%\vskip3mm
}

\def\type@practicalpaper{%
  \fboxsep=.5mm
  \vbox to 12mm{%
  \BFbox{事例紹介論文}
  \vss}
\nointerlineskip%%\vskip3mm
}
%% 2008.10.06-end by morita

%%% 2002.10.14-begin by kamisima
%\if@interimreport
% \@ShowCommentatorfalse
%\else
 \if@surveypaper 
  \@ShowCommentatorfalse
% \else
%  \if@aimap
%   \@ShowCommentatorfalse
  \else
   \@ShowCommentatortrue
  \fi
% \fi
%\fi
%%% 2002.10.14-end by kamisima
\if@english
 \let\@english\@technicalpaper
\fi
%%
%% 2008.10.15-begin by morita
%% 2008.11.06 modified by morita
%% 2010.03.15 modified by akimoto
%% 2013.10.31 modified by ono
\def\@maketitle{%
  \if@originalpaper          {\reset@font\large\bfseries \type@originalpaper}
  \else \if@surveypaper      {\reset@font\large\bfseries \type@surveypaper}
  \else \if@invitedpaper     {\reset@font\large\bfseries \type@invitedpaper}
  \else \if@practicalpaper     {\reset@font\large\bfseries \type@practicalpaper}
  \else {\reset@font\large\bfseries \type@originalpaper}
  \fi
  \fi
  \fi
  \fi
%% 2008.10.15-end by morita
  
\if@english
%% NEW ADD 2000.11.20
  {\Huge\bfseries \@etitle \par} %% 2008.10.10 T.Kamishima
  \vskip1mm
  {\Eslarge \@esubtitle\par}
\else
\font\TMPfont=min10 at 33Q
\let\TMPfont\HUGE
  {\TMPfont\kanjiskip=-1H plus 1H minus 1H \@jtitle\par}
 \ifx\@jsubtitle\empty\else
 \nointerlineskip
 \vskip2mm
 {\LARGE \@jsubtitle\par}
 \fi
  \vskip2mm
  {\LARGE\bfseries \@etitle \par}
 \ifx\@esubtitle\empty
 \else
 \nointerlineskip
 \vskip2mm
 {\Eslarge \@esubtitle\par}
 \fi
\fi
\vskip20H
\@ifundefined{@author}{}{%
      \noindent
      \begin{tabular}[t]{l}%
      \@author
      \end{tabular}\par}
\vskip20H
%%
 \ifvoid\@keywordbox
 \else
  \nointerlineskip
  \leavevmode\box\@keywordbox\par
 \fi
%%\vskip\baselineskip
 \ifvoid\@summarybox
 \else
  \vskip\baselineskip
  \leavevmode\box\@summarybox\par
 \fi
  \nointerlineskip
  \vskip12mm
  \vspace*{0mm}
}

\endinput

