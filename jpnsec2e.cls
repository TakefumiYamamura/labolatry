%% jpnsec2e.cls は，進化計算学会論文誌のためのスタイルファイルです．
%%
%% Change Log
%% 2010/03/15: 人工知能学会論文誌用のスタイルファイル jsai2e.cls 
%% (ver. 4.0.1) をもとに進化計算学会論文誌用に修正．


\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jpnsec2e}[1999/09/20]
%%
\LoadClass{jpnsec2e}%
\RequirePackage{latexsym} %%% added by T.Kamishima 1999.10.9
\RequirePackage{times} %% 2008.10.10 T.Kamishima
%%
\newcounter{@paper}
\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@stysize \@stysizefalse
\newif\if@enablejfam \@enablejfamtrue
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\if@compatibility
  \renewcommand{\@ptsize}{0}
\else
  \DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\fi
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
%%
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
%%
%% Others Style
\newif\if@jpnsecopt
\@jpnsecoptfalse
\DeclareOption{jpnsecopt}{\@jpnsecopttrue}
%%
%\newif\if@review \@reviewfalse
%\DeclareOption{review}{\@reviewtrue}

\newif\if@blindreview\@blindreviewfalse
\DeclareOption{blindreview}{\@blindreviewtrue}

\newif\if@Commentator \@Commentatorfalse
\newif\if@ShowCommentator \@ShowCommentatorfalse %%% 2002.10.14 by kamisima
%%\DeclareOption{Commentator}{\@Commentatortrue}
%%
\newif\if@english \@englishfalse
\DeclareOption{english}{\@englishtrue}
\newif\if@technicalpaper \@technicalpaperfalse
\DeclareOption{technicalpaper}{\@technicalpapertrue}
\newif\if@researchnote \@researchnotefalse
\DeclareOption{researchnote}{\@researchnotetrue}
\newif\if@technicalreport \@technicalreportfalse
\DeclareOption{technicalreport}{\@technicalreporttrue}
\newif\if@Specialissue \@Specialissuefalse
\DeclareOption{Specialissue}{\@Specialissuetrue}
\newif\if@specialissue \@specialissuefalse
\DeclareOption{specialissue}{\@specialissuetrue}
\newif\if@interimreport \@interimreportfalse
\DeclareOption{interimreport}{\@interimreporttrue}
\newif\if@aimap \@aimapfalse
\DeclareOption{aimap}{\@aimaptrue}
\newif\if@surveypaper \@surveypaperfalse
\DeclareOption{surveypaper}{\@surveypapertrue}
\newif\if@specialpaper \@specialpaperfalse
\DeclareOption{specialpaper}{\@specialpapertrue}

%% 2008.07.29-begin by morita
\newif\if@originalpaper \@originalpaperfalse
\DeclareOption{originalpaper}{\@originalpapertrue}
\newif\if@aifrontierpaper \@aifrontierpaperfalse
\DeclareOption{aifrontierpaper}{\@aifrontierpapertrue}
\newif\if@shortpaper \@shortpaperfalse
\DeclareOption{shortpaper}{\@shortpapertrue}
%% 2008.07.29-end by morita

%% 2008.10.14-begin by morita
\newif\if@exploratorypaper \@exploratorypaperfalse
\DeclareOption{exploratorypaper}{\@exploratorypapertrue}
%% 2008.10.14-end by morita

%% 2008.11.06-begin by morita
\newif\if@invitedpaper \@invitedpaperfalse
\DeclareOption{invitedpaper}{\@invitedpapertrue}
%% 2008.11.06-end by morita

%% 2013.10.31-begin by ono
\newif\if@practicalpaper \@practicalpaperfalse
\DeclareOption{practicalpaper}{\@practicalpapertrue}
%% 2013.10.31-end by ono

%%
\newif\if@Commentator \@Commentatorfalse
\newif\if@commentary \@commentaryfalse
\DeclareOption{commentary}{\@commentarytrue}
\newif\if@foreword \@forewordfalse
\DeclareOption{foreword}{\@forewordtrue}
\newif\if@essay \@essayfalse
\DeclareOption{essay}{\@essaytrue}
\newif\if@mybookmark \@mybookmarkfalse
\DeclareOption{mybookmark}{\@mybookmarktrue}
\newif\if@laboratoryreport \@laboratoryreportfalse
\DeclareOption{laboratoryreport}{\@laboratoryreporttrue}
\newif\if@conferencereport \@conferencereportfalse
\DeclareOption{conferencereport}{\@conferencereporttrue}
\newif\if@eventreport \@eventreportfalse
\DeclareOption{eventreport}{\@eventreporttrue}
\newif\if@glossary \@glossaryfalse
\DeclareOption{glossary}{\@glossarytrue}
\newif\if@bookreview \@bookreviewfalse
\DeclareOption{bookreview}{\@bookreviewtrue}
\newif\if@paperview \@paperviewfalse
\DeclareOption{paperview}{\@paperviewtrue}
\newif\if@studentmail \@studentmailfalse
\DeclareOption{studentmail}{\@studentmailtrue}
\newif\if@calendar \@calendarfalse
\DeclareOption{calendar}{\@calendartrue}
\newif\if@societynews \@societynewsfalse
\DeclareOption{societynews}{\@societynewstrue}
%%
\if@compatibility
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\if@compatibility
\else
  \DeclareOption{disablejfam}{\@enablejfamfalse}
\fi
\ExecuteOptions{a4paper,twocolumn,twoside,openany}
%%
\ProcessOptions\relax
%%
\DeclareErrorKanjiFont{JY1}{mc}{m}{n}{9}
\DeclareErrorKanjiFont{JY1}{gt}{m}{n}{9}
\DeclareKanjiFamily{JY1}{mc}{}
\DeclareRelationFont{JY1}{mc}{m}{}{OT1}{cmr}{m}{}
\DeclareRelationFont{JY1}{mc}{bx}{}{OT1}{cmr}{bx}{}
\DeclareRelationFont{JY1}{mc}{eb}{}{OT1}{cmr}{bx}{}
\DeclareFontShape{JY1}{mc}{m}{n}{%
  <5> sfixed* [5.175] min5
  <6> sfixed* [5.916] min6
  %%<7> sfixed* [7.392] min7
  <8> sfixed* [8.128] min8
  <9> sfixed* [8.872] min8
  <-> s * [0.962216]min10}{}
\DeclareFontShape{JY1}{gt}{m}{n}{%
  <5> sfixed* [5.175] goth5
  <6> sfixed* [5.916] goth6
  %%<7> sfixed* [7.392] goth7
  <8> sfixed* [8.128] goth8
  <9> sfixed* [8.872] goth8
  <-> s * [0.962216]goth10}{}
\DeclareFontShape{JY1}{mc}{eb}{n}{<-> s * [0.962216]mmm10}{}
\DeclareFontShape{JY1}{mc}{m}{it}{<->ssub * mc/m/n}{}
\DeclareFontShape{JY1}{mc}{bx}{it}{<->ssub * mc/bx/n}{}
\DeclareFontShape{JY1}{mc}{eb}{it}{<->ssub * mc/eb/n}{}
\DeclareFontShape{JY1}{mc}{m}{sl}{<->ssub * mc/m/n}{}
\DeclareKanjiFamily{JY1}{gt}{}
\DeclareRelationFont{JY1}{gt}{m}{}{OT1}{cmr}{bx}{}
\DeclareRelationFont{JY1}{gt}{bx}{}{OT1}{cmr}{bx}{}
\DeclareFontShape{JY1}{gt}{bx}{n}{<->ssub * gt/m/n}{}
\DeclareFontShape{JY1}{gt}{m}{it}{<->ssub * gt/m/n}{}
\DeclareFontShape{JY1}{gt}{bx}{it}{<->ssub * gt/bx/n}{}
\DeclareKanjiFamily{JT1}{mc}{}
\DeclareRelationFont{JT1}{mc}{m}{}{OT1}{cmr}{m}{n}
\DeclareRelationFont{JT1}{mc}{bx}{}{OT1}{cmr}{bx}{n}
\DeclareRelationFont{JT1}{mc}{eb}{}{OT1}{cmr}{bx}{n}
\DeclareFontShape{JT1}{mc}{bx}{n}{<->ssub * gt/m/n}{}
\DeclareFontShape{JT1}{mc}{m}{it}{<->ssub * mc/m/n}{}
\DeclareFontShape{JT1}{mc}{bx}{it}{<->ssub * mc/bx/n}{}
\DeclareFontShape{JT1}{mc}{eb}{it}{<->ssub * mc/eb/n}{}
\DeclareFontShape{JT1}{mc}{m}{sl}{<->ssub * mc/m/n}{}
\DeclareKanjiFamily{JT1}{gt}{}
\DeclareRelationFont{JT1}{gt}{m}{}{OT1}{cmr}{bx}{}
\DeclareRelationFont{JT1}{gt}{bx}{}{OT1}{cmr}{bx}{}
\DeclareFontShape{JT1}{gt}{bx}{n}{<->ssub * gt/m/n}{}
\DeclareFontShape{JT1}{gt}{m}{it}{<->ssub * gt/m/n}{}
\DeclareFontShape{JT1}{gt}{bx}{it}{<->ssub * gt/bx/n}{}
\renewcommand{\mcdefault}{mc}
\renewcommand{\gtdefault}{gt}
\normalfont

\renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@xpt{14.25}%
  \abovedisplayskip 9\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
%
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}
%
\newcommand{\small}{%
  \@setfontsize\small\@ixpt{17H}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep \p@ \@plus2\p@ \@minus2\p@%topsep 4\p@
              \parsep \p@ \@plus\p@ \@minus\p@%topsep 2\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
%%
\newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viiipt{14H}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep \p@ \@plus\p@ \@minus\p@
              \parsep \p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
%%
%%Appendix only
\newcommand{\appendixsize}{%
  \@setfontsize\appendixsize\@viiipt{15H}%
  \abovedisplayskip 5\p@ \@plus2\p@ \@minus3\p@
  \abovedisplayshortskip \z@ \@plus1\p@
  \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 2\p@ \@plus1\p@ \@minus1\p@
              \parsep 2\p@ \@plus1\p@ \@minus1\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
%%
\newcommand{\scriptsize}{\@setfontsize\scriptsize\@vipt\@vipt}
%%
%%Profile only
\newcommand{\profilefontsize}{\@setfontsize\profilefontsize\@viipt{12H}}
%%
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vpt}%
\newcommand{\large}{\@setfontsize\large\@xpt{17}}%
\newcommand{\SEClarge}{\@setfontsize\large\@xpt{15}}%
\newcommand{\slarge}{\@setfontsize\large\@xiipt{17}}%
%% NEW ADD 2000.11.20
\newcommand{\Eslarge}{\@setfontsize\large\@xiipt{15}}%
%% NEW ADD 2000.11.20
\newcommand{\Large}{\@setfontsize\Large\@xiipt{21}}%
\newcommand{\SECLarge}{\@setfontsize\Large\@xiipt{15}}%
\newcommand{\LARGE}{\@setfontsize\LARGE\@xivpt{17}}%
\newcommand{\huge}{\@setfontsize\huge\@xviipt{28}}%
\newcommand{\Huge}{\@setfontsize\Huge\@xxpt{30}}%
\newcommand{\HUGE}{\@setfontsize\HUGE\@xxvpt{30}}%

%%%とりあえず外しておく
%\DeclareFontFamily{U}{msa}{}
%\DeclareFontShape{U}{msa}{m}{n}{ <5> <6> <7> <8> <9> gen * msam
% <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> msam10}{}
%\DeclareFontFamily{U}{msb}{}
%\DeclareFontShape{U}{msb}{m}{n}{ <5> <6> <7> <8> <9> gen * msbm
% <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> msbm10}{}
%\DeclareFontFamily{U}{euf}{}{\skewchar\font'60}
%\DeclareFontShape{U}{euf}{m}{n}{ <5> <6> <7> <8> <9> gen * eufm
% <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> eufm10}{}
%\DeclareFontShape{U}{euf}{b}{n}{ <5> <6> <7> <8> <9> gen * eufb
% <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> eufb10}{}
%\DeclareFontFamily{U}{pzd}{}
%\DeclareFontShape{U}{pzd}{m}{n}{ <5> <6> <7> <8> <9> 
%<10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> pzdr}{}
%\DeclareFontShape{U}{pzd}{m}{n}{<-> s * [1.03927]pzdr}{}
%%%使用しない
%%\renewcommand{\rmdefault}{ptm}%
%%\renewcommand{\sfdefault}{pag}%
%%\renewcommand{\ttdefault}{pcr}%
%%
\SetMathAlphabet{\mathtt}{normal}{\encodingdefault}{\ttdefault}{m}{n}
%%
\setlength\columnseprule{0\p@}
%% NEW ADD 2000.11.20
%%\setlength\lineskip{1\p@}
%%\setlength\normallineskip{1\p@}
%%\renewcommand{\baselinestretch}{}
\setlength\lineskip{2\p@}
\setlength\lineskiplimit{2\p@}
\setlength\normallineskip{2\p@}
\setlength\normallineskiplimit{2\p@}
\renewcommand{\baselinestretch}{1}
%% NEW ADD 2000.11.20
\setlength\parskip{0\p@ \@plus \p@}
\setlength\parindent{1zw}
\setlength{\columnsep}{8mm}
\setlength{\textwidth}{170.5mm}
\setlength\textheight{50\baselineskip}
\setlength{\oddsidemargin}{-7.4mm}
\setlength{\evensidemargin}{-3.9mm}
\setlength{\headheight}{3mm}
\setlength{\headsep}{8mm}
\setlength{\footskip}{9mm}
%%\setlength{\marginparsep}{1mm}
\setlength{\footnotesep}{0mm}
\setlength{\topmargin}{-9.4mm}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.6}
\renewcommand{\textfraction}{0}
\renewcommand{\floatpagefraction}{.5}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}
%%
\setlength{\textfloatsep}{14pt plus 2pt minus 2pt}
%%
\if@english
\newlength\AuthItemHsizeSmall  \AuthItemHsizeSmall=12pt
\newlength\AuthItemHsizeLarge  \AuthItemHsizeLarge=24pt
\else
\newlength\AuthItemHsizeSmall  \AuthItemHsizeSmall=18pt
\newlength\AuthItemHsizeLarge  \AuthItemHsizeLarge=30pt
\fi
\def\manyauthor{
\if@english
\AuthItemHsizeSmall=10pt \AuthItemHsizeLarge=16pt
\else
\AuthItemHsizeSmall=16pt \AuthItemHsizeLarge=22pt
\fi}
%%% comment out by T.Kamishima 1999.10.10
%\newif\if@Affiliate %%\@Affiliatefalse \@Affiliatetrue
%%%
%\if@Affiliate
%\def\Hsize{18pt}
%\else
%\def\Hsize{30pt}
%\fi

%%% begin: modified by T.Kamishima 1999.10.10
\if@english
\def\name#1#2{%
 \kern-.5zw%
 \leavevmode
 \raise1zh\hbox to 128pt{%
 \lower\AuthItemHsizeSmall\vbox to \AuthItemHsizeSmall{%
 \hbox{{\slarge \if@blindreview xxxx\else #1\fi
 \hskip.5em \if@blindreview xxxx \else #2\fi}\hfil}
 \vss}\hss}
}
\def\longname#1#2{%
 \kern-.5zw%
 \leavevmode
 \raise1zh\hbox to 128pt{%
 \lower\AuthItemHsizeSmall\vbox to \AuthItemHsizeSmall{%
 \hbox{{\normalsize \if@blindreview xxxxxxxx\else #1\fi}\hfil}
 \nointerlineskip
 \hbox{{\normalsize\quad\if@blindreview xxxxxxxx\else #2\fi}\hfil}
 \vss}\hss}
}
\else
\def\name#1#2#3{\kern-.5zw%
 \leavevmode
 \raise1zh\hbox to 78pt{\lower\AuthItemHsizeSmall\vbox to \AuthItemHsizeSmall{%
 \hbox{{\slarge \if@blindreview □□\else #1\fi
 \hskip.5zw \if@blindreview □□ \else #2\fi}\hfil}
 \nointerlineskip
 \vskip1pt
 \hbox{\scriptsize \if@blindreview XXXXX XXXXX\else #3\fi\hfil}%
 \vss}\hss}
}
\def\longname#1#2#3{\kern-.5zw%
 \leavevmode
 \raise1zh\hbox to 78pt{\lower\AuthItemHsizeLarge\vbox to \AuthItemHsizeLarge{%
 \hbox{{\small \if@blindreview □□□□□□\else #1\fi}\hfil}
 \nointerlineskip
 \hbox{{\small\hspace{0.5zw}\if@blindreview □□□□□□\else #2\fi}\hfil}
 \nointerlineskip
 \vskip1pt
 \hbox{\scriptsize \if@blindreview XXXXX XXXXX\else #3\fi\hfil}%
 \vss}\hss}
}
\fi
%%% end: modified by T.Kamishima 1999.10.10
%%
\newcount\@authorcnt
\newcount\@totalnumber
\newcount\@alcnt
%%
%%% begin: modified by T.Kamishima 1999.10.10
\if@english
\def\affiliation#1#2{%
 \leavevmode
 \raise1zh\hbox{\lower\AuthItemHsizeLarge\vbox to \AuthItemHsizeLarge{%
   \hbox{{\small \if@blindreview XXXXXXXXXXXXXXXX\else 
   \parbox[t]{339pt}{\small\baselineskip11pt #1}\fi}\hfil}
   \nointerlineskip
   \vskip2pt
   \hbox{{\footnotesize\tt \if@blindreview XXXXXXXXXX \else
    {\catcode`~=\active\def~{\~{}}#2}\fi}\hfil}
 \vss}\hss}
}
\def\sameaffiliation#1{%
 \leavevmode
 \raise1zh\hbox{\lower\AuthItemHsizeLarge\vbox to \AuthItemHsizeLarge{%
   \hbox{{\small(affiliation as previous author)}\hfil}
   \nointerlineskip
   \vskip2pt
   \hbox{{\footnotesize\tt \if@blindreview XXXXXXXXXX \else
    {\catcode`~=\active\def~{\~{}}#1}\fi}\hfil}
 \vss}\hss}
}
\else
\def\affiliation#1#2#3{%
 \leavevmode
 \raise1zh\hbox{\lower\AuthItemHsizeLarge\vbox to \AuthItemHsizeLarge{%
    \hbox{{\normalsize \if@blindreview □□□□□\else #1\fi}\hfill}
 \nointerlineskip
 \vskip3pt
 \hbox{\scriptsize \if@blindreview XXXXXXXXXXXXXXXX\else 
   \parbox[t]{389pt}{\scriptsize #2}\fi\hfil}%%%395pt
 \nointerlineskip
 \vskip2pt
 \hbox{{\footnotesize\tt \if@blindreview XXXXXXXXXX \else
     {\catcode`~=\active\def~{\~{}}#3}\fi}\hfil}
 \vss}\hss}
}
\def\sameaffiliation#1{%
 \leavevmode
 \raise1zh\hbox{\lower\AuthItemHsizeSmall\vbox to \AuthItemHsizeSmall{%
    \hbox{{\normalsize（同\qquad 上）}\hfill}
 \nointerlineskip
 \vskip2pt

 \hbox{{\footnotesize\tt \if@blindreview XXXXXXXXXX \else
     {\catcode`~=\active\def~{\~{}}#1}\fi}\hfil}
 \vss}\hss}
}
\fi
%%% end: modified by T.Kamishima 1999.10.10
%%
\if@Commentator
\def\commentator#1#2{%
\hfill
%% NEW ADD 2000.11.20
%%\hbox to 5zw{〔\normalsize \kanjiskip\z@ \spaceskip1zw plus 1fill
%%minus 1fill #1}{\normalsize （#2）}\kern-.5zw〕
%%\par
%%}
\hbox{\hss 〔\normalsize #1\hss}{\normalsize （#2）}\kern-.5zw〕
%% NEW ADD 2000.11.20
\par
}
\else
\def\commentator#1#2{%
\begin{tabular}{c}
%% NEW ADD 2000.11.20
%%\hbox to 9zw{\LARGE \kanjiskip.5zw\spaceskip1zw plus 1fill minus 1fill #1}\\
%%{\normalsize （#2）}\\
\hbox{\LARGE #1}\\
{\normalsize （#2）}%\\
%% NEW ADD 2000.11.20
\end{tabular}
}
\fi
%%
\newif\if@samehead\@sameheadfalse
\newbox\@tempboxa
\newbox\@tempboxb
\newdimen\@tempdima
\def\jtitle{\@ifnextchar[{\d@jtitle}{\s@jtitle}}
\def\d@jtitle[#1]#2{%
 \setbox\@tempboxb\hbox{#1}%
 \ifdim\wd\@tempboxb < 9zw
  \gdef\@titlemark{\hbox to 9zw{\kanjiskip\z@ plus 1fill minus 1fill
   \xkanjiskip\kanjiskip #1}}\else
  \gdef\@titlemark{#1}\fi
 \gdef\@jtitle{\@titlejiwari{#2}}}
\def\s@jtitle#1{%
 \if@samehead
  \gdef\@jtitle{\@titlejiwari{#1}}%
 \else
  \setbox\@tempboxb\hbox{\def\\{\unskip\ignorespaces}#1}%
  \ifdim\wd\@tempboxb < 9zw
   \gdef\@titlemark{%
    \hbox to 9zw{\kanjiskip\z@ plus 1fill minus 1fill
     \xkanjiskip\kanjiskip #1}}\else
   \gdef\@titlemark{\def\\{\unskip\ignorespaces}#1}\fi
  \gdef\@jtitle{\@titlejiwari{#1}}%
 \fi
}
\def\@jtitle{}

\def\jsubtitle#1{\gdef\@jsubtitle{#1}}
\def\@jsubtitle{}

\def\@titlejiwari#1{%
 \setbox\@tempboxa\hbox{\def\\{\unskip\ignorespaces}#1}%
 \ifdim \wd\@tempboxa>6.5zw 
  #1%
 \else
  \kanjiskip\z@ plus 1fill minus 1fill \xkanjiskip\kanjiskip
  \ifdim \wd\@tempboxa>2.5zw
   \leavevmode\hbox to 7zw{#1\hfil}%
  \else
   \leavevmode\hbox to 5zw{#1\hfil}%
  \fi
 \fi
}

\def\etitle{\@ifnextchar[{\d@etitle}{\s@etitle}}
\def\d@etitle[#1]#2{%
 \if@english\gdef\@titlemark{#1}\fi
 \gdef\@etitle{#2\if@english\fi}}
\def\s@etitle#1{%
 \if@english\gdef\@titlemark{\def\\{\ \ignorespaces}#1}\fi
 \gdef\@etitle{#1\if@english\fi}}
\def\@etitle{}


%% NEW ADD 2000.11.20
%% \def\esubtitle#1{\gdef\@esubtitle{#1}}
\def\esubtitle#1{\gdef\@esubtitle{\Eslarge #1}}
%% NEW ADD 2000.11.20
\def\@esubtitle{}

\font\EFfootnomble=cmssi9
\font\EFfoot=cmti9
\def\@titlemarklength{%
 \setbox\@tempboxa\hbox{\EFfootnomble\hskip3mm \@Month\ \@Year}%
 \setbox\@tempboxb\hbox{\if@english\EFfoot\fi\@titlemark}%
   \@tempdima .5\textwidth
   \advance \@tempdima -\wd\@tempboxa
   \advance \@tempdima -.5\wd\@tempboxb
    \ifdim \@tempdima < 1.5mm % tolerance
     \typeout{Style jpnsec Warning: Title for footer is too wide. 
              make it shorter.}
    \fi
}

\def\@titlemark{}

\def\author#1{\gdef\@author{#1}}
\def\@author{\@latex@warning@no@line{No \noexpand\author given}}
%%
\def\and{%                  % \begin{tabular}
  \end{tabular}%
  \vskip.5\baselineskip%\par%
  \noindent
  \begin{tabular}[t]{l}}%   % \end{tabular}
%%
\def\thanks#1{%
\footnotemark
  \begingroup
    \def\protect{\noexpand\protect\noexpand}%
    \xdef\@thanks{%
      \@thanks
      \protect\specialfootnotetext[\the\c@footnote]{\noindent #1}}%
  \endgroup}
\let\@thanks\@empty

\def\specialfootnotetext{%
  \@ifnextchar[%]
    {\@specialxfootnotenext}%
    {\xdef\@thefnmark{\thempfn}\@specialfootnotetext}}

\def\@specialxfootnotenext[#1]{%
  \begingroup 
    \csname c@\@mpfn\endcsname #1\relax
    \xdef\@thefnmark{\thempfn}%
  \endgroup 
  \@specialfootnotetext}

\def\@mpfn{footnote}
\def\thempfn{\thefootnote}

\long\def\@specialfootnotetext#1{%
  \insert\footins{\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox 
    \floatingpenalty \@MM
    \hsize\columnwidth 
    \@parboxrestore
    \leftskip=2zw
    \hangindent=0zw 
    \hangafter\@ne
    \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
    \@specialmakefntext{%
      \rule{\z@}{\footnotesep}%
      \ignorespaces#1\strut}}}
 \long\def\@specialmakefntext#1{\parindent1zw\leftskip2zw
   \noindent\hbox to \z@{\hss{\dag}\@thefnmark}\hskip1zw #1}%

\newbox\@keywordbox
\long\def\keyword{%
  \global\setbox\@keywordbox\hbox\bgroup%
   \begin{minipage}[t]{\textwidth}%
    \baselineskip15H
    \@hangfrom{\bfseries \keywordsname\ }\ignorespaces}
\def\endkeyword{\end{minipage}\egroup\ignorespaces}

\newbox\@summarybox
\long\def\summary{%
  \global\setbox\@summarybox\hbox\bgroup%
   \begin{minipage}[t]{\textwidth}%
   \noindent
   \hbox to \hsize{{\bfseries \summaryname\,}%
    \leaders\hrule height 1.3mm depth -0.9mm\hfil}\par
   \nointerlineskip
   \vskip10H
   \parindent3zw
   \leftskip1zw
   \rightskip1zw
   \baselineskip15H
   \ignorespaces}
\def\endsummary{\par
 \hbox to \hsize{\leaders\hrule height .6mm depth -.5mm\hfil}%
 \end{minipage}\egroup\ignorespaces}
%%
\def\issueon#1{\gdef\@issueon{#1}}
\def\@issueon{}
%%
%% NEW ADD 2000.11.20
\def\e-issueon#1{\gdef\@e-issueon{``#1''}}
\def\@e-issueon{}
%% NEW ADD 2000.11.20
%%
\def\maketitle{\par
 \begingroup
 \def\thefootnote{\arabic{footnote}}%
%%% 2002.10.15-begin by kamsiima
% \def\@makefnmark{{\scriptsize \hbox to\z@{$\m@th^{\dagger\@thefnmark}$\hss}}}
\def\@makefnmark{{\scriptsize \hbox to\z@{$\m@th^{\ast\@thefnmark}$\hss}}}
%%% 2002.10.15-end by kamsiima
   \if@twocolumn
     \twocolumn[\@maketitle]%
     \else \newpage
     \global\@topnum\z@
     \@maketitle \fi
 \thispagestyle{TOPheadings}\@thanks
 \endgroup
 \setcounter{footnote}{0}%
 \setcounter{mpfootnote}{0}%
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@thanks{}
 \gdef\@author{}
  \let\jtitle\relax\let\jsubtitle\relax
  \let\etitle\relax\let\esubtitle\relax
 \let\thanks\relax}
%%
%%\def\Hrulefill{\leavevmode\leaders\hrule height 1.25pt depth 0pt\hfill\kern\z@}
%%
%%
\def\@maketitle{%
\vbox to 9mm{{\null\vss}\nointerlineskip}
\if@english
%% NEW ADD 2000.11.20
%%  {\LARGE\bfseries \@etitle \par}
  {\HUGE\bfseries \@etitle \par}
%% NEW ADD 2000.11.20
\else
  {\HUGE \@jtitle\par}
  \vskip2mm
  {\LARGE\bfseries \@etitle \par}
\fi
\vskip20H
%% \@ifundefined{@author}{}{\@author}
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

\def\@makefnmark{\hbox{$\m@th^{\ast\@thefnmark}$\hss}}%
\def\thefootnote{\arabic{footnote}}
\newcommand\@makefntext[1]{\parindent1zw\leftskip2zw
   \noindent\hbox to \z@{\hss{$\ast$}\@thefnmark}\hskip1zw #1}%
%%
\def\received#1#2#3{%
 \if@english
  \xdef\@received{Received 
   \ifcase#2 MM\or January\or February\or March\or April\or 
    May\or June\or July\or August\or September\or October\or 
    November\or December\fi\ #3, #1.}%
 \else
 \gdef\@received{\noindent{\reset@font\normalsize #1年#2月#3日\hskip1zw 受理}}%
 \fi
}
\def\@received{}

\if@english
 \received{19YY}{0}{DD}
\else
 \received{19YY}{MM}{DD}
\fi

%%\received{Year}{Month 0=MONTH}{Date}
%%For example \received{2000}{1}{31}
%%
\def\stuffincharge#1{%
 \ifx\@stuffincharge\empty
  \setbox\z@\hbox{#1}%
  \ifdim\wd\z@>4zw
   \gdef\@stuffincharge{\hbox{\spaceskip\z@ plus 0.4pt minus 0.5pt #1}}%
  \else
   \gdef\@stuffincharge{\hbox to 4zw{\spaceskip\z@ plus 1fill #1}}%
  \fi   
 \else
  \setbox\z@\hbox{#1}%
  \ifdim\wd\z@>4zw
   \xdef\@stuffincharge{\@stuffincharge ，\penalty100
    \hbox{\spaceskip\z@ plus 0.4pt minus 0.5pt #1}}%
  \else
   \xdef\@stuffincharge{\@stuffincharge ，\penalty100
    \hbox to 4zw{\spaceskip\z@ plus 1fill #1}}%
  \fi   
 \fi
}
\def\@stuffincharge{}
%%
\def\reviewer#1{%
 \ifx\@reviewer\empty
  \setbox\z@\hbox{#1}%
  \ifdim\wd\z@>4zw
   \gdef\@reviewer{\hbox{\spaceskip\z@ plus 0.4pt minus 0.5pt #1}}%
  \else
   \gdef\@reviewer{\hbox to 4zw{\spaceskip\z@ plus 1fill #1}}%
  \fi   
 \else
  \setbox\z@\hbox{#1}%
  \ifdim\wd\z@>4zw
   \xdef\@reviewer{\@reviewer ，
    \hbox{\spaceskip\z@ plus 0.4pt minus 0.5pt #1}}%
  \else
   \xdef\@reviewer{\@reviewer ，
    \hbox to 4zw{\spaceskip\z@ plus 1fill #1}}%
  \fi   
 \fi
}
\def\@reviewer{}
%%
\def\@review{%
 \noindent
 \ifx\@reviewer\empty
  \ifx\@stuffincharge\empty
  \else
   〔担当委員：{\@stuffincharge}〕\hskip.5zw\mbox{}%
  \fi
 \else
  \ifx\@stuffincharge\empty
   〔査読者：{\@reviewer}〕\hskip.5zw\mbox{}%
  \else
   \ifx \@stuffincharge\@reviewer
    〔担当委員・査読者：%
     {\@reviewer}〕\hskip.5zw\mbox{}%
   \else
    〔担当委員：{\@stuffincharge}，\penalty\z@
     \hbox{査読者\hbox to 1zw{\hss ：\hss}}{\@reviewer}〕\hskip.5zw\mbox{}%
   \fi
  \fi
 \fi
}
%%
%%\newdimen\bibindent
%%\setlength\bibindent{1zw}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\def\thebibliography#1{%
\section*{\centering\bibname}
 \footnotesize
 \global\raggedbottom
  \list{}
  {%
   \leftmargin 1.5zw
   \labelsep 1zw
   \itemindent 0zw
   \listparindent 1zw
   \topsep\z@\parsep\z@\itemsep\z@\partopsep\z@
   \usecounter{enumi}
  }
  \sloppy\clubpenalty-100\widowpenalty-100
  \sfcode`\.=1000\relax}

\def\endthebibliography{\endlist\par
  \if@ShowCommentator  %%% 2002.10.14 by kamisima
   \ifx\@reviewer\empty
    \ifx\@stuffincharge\empty
     \stuffincharge{×× ○○}%\reviewer{○○ ××}%
    \fi
   \fi
 \vskip\baselineskip
   {\noindent\normalsize \@review\par}
 \vskip\baselineskip
   {\noindent\normalsize \@received}
 \vskip2\baselineskip
 \fi  %%% 2002.10.14 by kamisima
}
\let\@openbib@code\@empty

\newbox\@tempboxc
\long\def\acknowledgment{%
 \if@english
  \subsection*{Acknowledgments}
 \else
  \subsection*{謝辞}
 \fi
 \if@blindreview
  \setbox\@tempboxc\hbox\bgroup
   \begin{minipage}{\hsize}
   \parindent1zw
 \fi
}
\def\endacknowledgment{%
 \if@blindreview
   \end{minipage}\egroup
  \@tempdimb\ht\@tempboxc \advance \@tempdimc \dp\@tempboxc
  \divide \@tempdimb \baselineskip
  \@tempcnta\@tempdimb
  \advance \@tempcnta \@ne
  \@tempcntb\z@
  \loop\ifnum\@tempcntb<\@tempcnta
   \advance \@tempcntb \@ne
   \mbox{}\endgraf
  \repeat
 \else
  \par
 \fi 
}
%%
\def\@checkword#1{\@tempcnta\z@\@getword #1\end}
\def\@getword#1{\ifx#1\end \let\next\relax \else
 \global\advance\@tempcnta \@ne
 \ifnum\@tempcnta=\@ne \gdef\@Getword{#1}\else \fi
 \let\next\@getword\fi \next}
\def\@Getword{}

\newif\if@appendix
\def\biography{%
 \raggedbottom
%
\if@appendix
\vskip3\baselineskip
\else
\vskip\baselineskip
\fi
 \parindent\z@
 \leavevmode
 \hbox to\hsize{\hbox to 12mm{\leaders\hrule height 1.2mm depth -.9mm\hfil}\,%
  \if@english
%%{\normalsize\bfseries Author\ifnum\@totalnumber>\@ne s'\else 's\fi\ Profile}%
  {\normalsize\bfseries Author's Profile}%
  \else
   {\normalsize\bfseries 著\hskip1zw 者\hskip1zw 紹\hskip1zw 介}%
  \fi
   \,\leaders\hrule height 1.4mm depth-1.1mm\hfil}\par
 \nopagebreak\vskip\baselineskip\nopagebreak
 \profilefontsize\ignorespaces}%%\scriptsize
\def\endbiography{\par}

\def\profile{\@ifstar{\n@profile}{\@profile}}

\long\def\@profilecheck#1#2{%
 \def\@tempx{#1}%
 \if@english
  \if #1m \def\p@membership{ (Member)}\else
   \if #1s \def\p@membership{ (Student Member)}\else
    \if #1n \def\p@membership{}\else
     \ifx \@tempx\empty
      \def\p@membership{ (??)}%
      \typeout{Style jpnsec Warning: Check the 1st argument 
               of \string\profile.}\else
       \def\p@membership{ (#1)}%
  \fi\fi\fi\fi
 \else
  \if #1m \def\p@membership{\kern-.5zw （一般会員）\kern-.5zw}\else
   \if #1s \def\p@membership{\kern-.5zw （学生会員）\kern-.5zw}\else
    \if #1n \def\p@membership{}\else
     \ifx \@tempx\empty
      \def\p@membership{\kern-.5zw （??）\kern-.5zw}%
      \typeout{Style jpnsec Warning: Check the 1st argument 
               of \string\profile.}\else
       \def\p@membership{\kern-.5zw （#1）\kern-.5zw}%
  \fi\fi\fi\fi
 \fi
 \def\@checkname{#2}%
 \@checkword{#2}%
 \setbox\@tempboxa\hbox{\@Getword}%
  \ifdim \wd\@tempboxa<1zw
   \let\@tempname\@checkname
  \else
   \setbox\@tempboxa\hbox{\spaceskip=100mm #2}%
   \ifdim \wd\@tempboxa < 100mm
    \typeout{Style jpnsec Warning: Profile's name "#2" doesn't have a space.}%
    \let\@tempname\@checkname
   \else
    \setbox\@tempboxa\hbox{#2}%
    \ifdim \wd\@tempboxa > 4.5zw
     \def\@tempname{{\spaceskip=1zw #2}}%
    \else
     \def\@tempname{\hbox to 5zw{\spaceskip\z@ plus 1fill minus 1fill #2}}%
    \fi
   \fi
  \fi
}

\def\m@address#1{%
 \def\@tempx{#1}%
 \ifx\@tempx\empty\else
 {\unskip\nobreak\hfil\penalty50
  \hskip1zw\hbox{}\nobreak\hfil \inhibitglue 〈#1〉\inhibitglue
   \parfillskip\z@ \finalhyphendemerits\z@\par}\fi
}

\long\def\@profile#1#2#3{%
 \@profilecheck{#1}{#2}%
 \setbox\@tempboxa\hbox{\parbox[t]{\hsize}{\hangindent=22.5mm\hangafter=-9
  {\reset@font\footnotesize{\bfseries \leavevmode\@tempname}\p@membership}\rule[-2mm]{0mm}{2mm}%
   \hfil\break #3}}
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
  \ifdim \@tempdima < 24mm
   \vbox to 24mm{%
    \leavevmode\smash{\rlap{%
     \lower22mm
     \vbox to 24mm{\hrule height .1mm
      \hbox to 20mm{%
       \vrule width .1mm height 23.8mm
        \hss
       \vrule width .1mm height 23.8mm}%
     \hrule height .1mm}%
     }}%
    \if@blindreview
     \mbox{　}
    \else
     \box\@tempboxa
    \fi
   \vss}\par
  \else
   \leavevmode\smash{\rlap{\hskip-22.5mm
    \lower22mm
    \vbox to 24mm{\hrule height .1mm
     \hbox to 20mm{%
      \vrule width .1mm height 23.8mm
       \hss
      \vrule width .1mm height 23.8mm}%
    \hrule height .1mm}%
    }}%
    \if@blindreview
     \divide \@tempdima \baselineskip
     \@tempcnta\@tempdima
     \@tempcntb\z@
     \hangindent=22.5mm\hangafter=-9\relax
     \loop\ifnum\@tempcntb<\@tempcnta
      \advance \@tempcntb \@ne
      \mbox{　}\hfil\break
     \repeat
      \mbox{　}\par
    \else
     \hangindent=22.5mm\hangafter=-9\relax
      {\reset@font\footnotesize{\bfseries \leavevmode\@tempname}\p@membership}%
    \rule[-2mm]{0mm}{2mm}\hfil\break #3\par
    \fi
  \fi
 \nointerlineskip
 \vskip5mm
}

\long\def\n@profile#1#2#3{%
 \@profilecheck{#1}{#2}%
 \if@blindreview
  \setbox\@tempboxa\hbox{%
   \begin{minipage}{\hsize}
    {\reset@font\footnotesize{\bfseries \leavevmode\@tempname}\p@membership}%
     \if@english\else は，\fi#3
   \end{minipage}}%
  \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
  \divide \@tempdima \baselineskip
  \@tempcnta\@tempdima
  \advance \@tempcnta \@ne
  \@tempcntb\z@
  \loop\ifnum\@tempcntb<\@tempcnta
   \advance \@tempcntb \@ne
   \mbox{　}\endgraf
  \repeat
 \else
  {\reset@font\footnotesize{\bfseries \leavevmode\@tempname}\p@membership}%
   \if@english\else は，\fi#3\par
 \fi
 \nointerlineskip
 \vskip3mm
}
%%ADD
%%均等割処理
%%数字(7バイト)及び拗促音の均等割処理
\def\onbinskip{\hskip\kanjiskip}
\def\onbin#1{\setbox0=\hbox{　}\dimen0=\wd0%
\hbox to\dimen0{\hss\hbox{\kern-.1116\dimen0#1\unskip}\hss}}
\def\yous@kuon#1#2#3#4\relax{#1\onbinskip\onbin{#2}%
\onbinskip\onbin{#3}\onbinskip#4}
\def\yousokuon#1{\leavevmode\expandafter\yous@kuon#1\relax}
%%
\def\@KINTO#1#2{%
 \setbox0\hbox{#2}\dimen0=#1
 \ifdim\wd0>\dimen0 \box0\else
 \hbox to\dimen0{\kanjiskip 0pt plus 1fil minus 1fill 
 \protect\yousokuon{#2}}
 \fi
}
\def\KINTO#1{\protect\@KINTO{7zw}{#1}}
%%\@KINTO{7zw}{テキスト}
%%
\def\kinto#1#2{\hbox to#1{%
\kanjiskip 0pt plus 1fil minus 1fill 
\xkanjiskip=\kanjiskip #2}
}
\let\kintou\kinto
%%
\newskip\@tempskip
\newbox\@jiwaribox
\def\@secjiwari#1#2{%
 \if@english #2\else
  \@tempskipb #1\relax
  \bgroup
   \global\setbox\@jiwaribox\hbox{#2}%
  \egroup
  \ifdim \@tempskipb>\z@
   \ifdim \wd\@jiwaribox>6.5zw 
    \inhibitglue #2%
   \else
    \kanjiskip\z@ plus 1fill minus 1fill \xkanjiskip\kanjiskip
    \ifdim \wd\@jiwaribox>2.5zw
     \hbox to 7zw{\inhibitglue #2\hfil}%
    \else
     \hbox to 5zw{\inhibitglue #2\hfil}%
    \fi
     \xkanjiskip.25zw plus .15zw minus .1zw
     \kanjiskip0pt plus .4pt minus .5pt
   \fi
  \else
   \ifdim \wd\@jiwaribox>2.5zw
    \inhibitglue #2%
   \else
    \kanjiskip\z@ plus 1fill minus 1fill \xkanjiskip\kanjiskip
    \hbox to 3zw{\inhibitglue #2\hfil}%
     \xkanjiskip.25zw plus .15zw minus .1zw
     \kanjiskip0pt plus .4pt minus .5pt
   \fi
  \fi
 \fi
}
\def\dotafter@section{.}
%%\newdimen\@kdotwd
%% \@kdotwd .5zw

\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
%%%add
\ifnum#2=2\relax
    \vspace{-\Tosubsection}
  \else
  \ifnum#2=3\relax
    \vspace{-\Tosubsubsection}
  \fi
\fi
%%%add
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
%%    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
      \protected@edef\@svsec{\@seccntformat{#1}\hskip1zw}%
     \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
  \@hangfrom{\hskip #3\relax\@svsec}%
%%    \interlinepenalty \@M #8\@@par}%
    \interlinepenalty \@M \@secjiwari{#4}{#8}\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
 \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
%%      \@svsec #8}%
      \@svsec \@secjiwari{#3}{#8}}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
 \ifnum #2>\c@secnumdepth \else
   \protect\numberline{\csname the#1\endcsname}%
 \fi
 #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
 \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
 \clubpenalty\@M
 \begingroup \@svsechd \endgroup
 \unskip
 \@tempskipa #1\relax
 \hskip -\@tempskipa
      \else
 \clubpenalty \@clubpenalty
 \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
%%\def\@seccntformat#1{\csname the#1\endcsname\hskip1zw}
%%\def\@seccntformat#1{\csname the#1\endcsname}
\def\@seccntformat#1{\csname the#1\endcsname\csname dotafter@#1\endcsname}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
  \@hangfrom{\hskip #1}%
%%   \interlinepenalty \@M #5\@@par}
   \interlinepenalty \@M \@secjiwari{#2}{#5}\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}
  \fi
  \@xsect{#3}}
%%
%%\newcommand*{\chaptermark}[1]{}
\setcounter{secnumdepth}{5}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
%%
\renewcommand{\thepart}{\@Roman\c@part}
\renewcommand{\thechapter}{\@arabic\c@chapter}
\renewcommand{\thesection}{\@arabic\c@section}

\renewcommand{\thesubsection}{\@arabic\c@section\@DOT\@arabic\c@subsection} %% 2008.10.10 T.Kamishima
\renewcommand{\thesubsubsection}{\S\,\@arabic\c@subsubsection}
\newcommand{\thelblsubsubsection}{\thesubsection\@DOT\@arabic\c@subsubsection} %% 2008.10.10 T.Kamishima
%% NEW ADD 2000.11.20
%%\renewcommand{\theparagraph}{\@arabic\c@paragraph}
%%\renewcommand{\thesubparagraph}{\@arabic\c@subparagraph}
\renewcommand{\theparagraph}{\@roman\c@paragraph.}
\renewcommand{\thesubparagraph}{\@arabic\c@subparagraph)}
%% NEW ADD 2000.11.20
%%%
\newcommand{\@chapapp}{\prechaptername}
\newcommand{\@chappos}{\postchaptername}
\newcommand\frontmatter{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmatterfalse\pagenumbering{roman}}
\newcommand{\mainmatter}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmattertrue\pagenumbering{arabic}}
\newcommand{\backmatter}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmatterfalse}
\newcommand{\part}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \thispagestyle{empty}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \secdef\@part\@spart}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{%
       \prepartname\thepart\postpartname\hspace{1em}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\centering
   \interlinepenalty\@M\reset@font
   \ifnum \c@secnumdepth >-2\relax
     \huge\bfseries\prepartname\thepart\postpartname
     \par\vskip20\p@
   \fi
   \Huge\bfseries#2\par}%
   \@endpart}
\def\@spart#1{{%
  \centering
  \interlinepenalty\M@\reset@font
  \Huge\bfseries#1\par}%
  \@endpart}
\def\@endpart{\vfil\newpage
   \if@twoside\null\thispagestyle{empty}\newpage\fi
   \if@tempswa\twocolumn\fi}
\newcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{jpl@in}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
\def\@makechapterhead#1{\hbox{}%
  \vskip2\Cvs
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    \if@mainmatter
     \setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw}%
     \addtolength\@tempdima{-\wd\z@}%
     \unhbox\z@\nobreak
    \fi
     \vtop{\hsize\@tempdima#1}%
   \fi}\vskip3\Cvs}
\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{\hbox{}%
  \vskip2\Cvs
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \setlength\@tempdima{\linewidth}%
   \vtop{\hsize\@tempdima#1}}\vskip3\Cvs}
\def\Tosubsection{1.25mm}%
\newcommand{\section}{\@startsection{section}{1}{0zw}%
   {15pt \@plus 1pt \@minus 1pt}{13pt \@plus 1pt \@minus 1pt}%
   {\reset@font\SECLarge\bfseries}}%
\def\Tosubsubsection{0mm}%
\newcommand{\subsection}{\@startsection{subsection}{2}{0zw}%
   {15pt \@plus 1pt \@minus 1pt}{.5pt \@plus .5pt \@minus .5pt}%
%% NEW ADD 2000.11.20
   %%{\reset@font\SEClarge\bfseries}}%
   {\reset@font\SEClarge\if@english\bfseries\itshape\else\bfseries\fi}}%
%% NEW ADD 2000.11.20
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{0zw}
   {\z@}{.0001pt plus 1pt minus 1pt}{\normalsize\bfseries}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {\z@}{.0001pt plus 1pt minus 1pt}{\reset@font\normalsize\rmfamily}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {\z@}{.0001pt plus 1pt minus 1pt}{\reset@font\normalsize\rmfamily}}
%%
\def\@DOT{\hbox to .5zw{\hss {\reset@font\rmfamily $\cdot$}\hss}}%% 2008.10.10 T.Kamihsima
%%
\def\Diamondsuit{\raisebox{.25ex}{$\diamondsuit$}}%
\newcommand{\appendix}{\par
\appendixsize
%% NEW ADD 2000.11.20
%%\section*{\centering\reset@font\normalsize\bfseries \appendixname}
\section*{\hbox to\columnwidth{\hss \reset@font\normalsize\bfseries\appendixname\hss}}
%% NEW ADD 2000.11.20
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{equation}{0}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \parindent1zw
  \renewcommand{\section}{\@startsection{section}{1}{0zw}
   {.5\baselineskip}{.5\baselineskip}{\reset@font\small\bfseries}}
  \renewcommand{\subsection}{\@startsection{subsection}{2}{0zw}
%% NEW ADD 2000.11.20
%%   {0.001pt}{\z@}{\reset@font\footnotesize\bfseries}}
   {\z@}{0.001pt plus 1pt minus 1pt}{\reset@font\footnotesize\bfseries}}
%% NEW ADD 2000.11.20
  \def\thesection{\Alph{section}}
\def\thesubsection{\thesection\@DOT\arabic{subsection}} %% 2008.10.10 T.Kamishima
%%% 2002.10.16-begin by kamisima
%\def\theequation{(\ifnum\c@section=\z@ A\else\thesection\fi.\arabic{equation})}
\def\theequation{\@ifundefined{@amsmath@err}%
{(\ifnum\c@section=\z@ A\else\thesection\fi.\arabic{equation})}
{\ifnum\c@section=\z@ A\else\thesection\fi.\arabic{equation}}}
%%% 2002.10.16-end by kamisima
\def\thefigure{\ifnum\c@section=\z@ A\else\thesection\fi.\@arabic\c@figure}
\def\thetable{\ifnum\c@section=\z@ A\else\thesection\fi.\@arabic\c@table}
\@appendixtrue
}
%%
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
%%
%%\begin{center}...\end{center}
\def\center{\topsep0pt\trivlist \centering\item\relax}
\def\endcenter{\endtrivlist}
%%
\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{(\theenumi)}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\renewcommand{\labelenumi}{\hbox to 1zw{\hss(\makebox[.7zw]{\theenumi})\hss}}
\renewcommand{\labelenumii}{\hbox to 1zw{\hss\makebox[.7zw]{\theenumii}\hss}}

\renewenvironment{enumerate}
  {\ifnum \@enumdepth >3\relax\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
%%  \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
  \ifnum \@listdepth=\@ne \topsep0\normalbaselineskip
    \else\topsep\z@\fi
  \parskip\z@ \itemsep\z@ \parsep\z@
  \itemindent1zw \labelwidth2zw \listparindent1zw \labelsep1zw%.3zw
  \ifnum \@enumdepth=\@ne \leftmargin2zw\relax
%% NEW ADD 2000.11.20
%%    \else\leftmargin\leftskip\fi
    \else\advance\leftmargin0zw\fi
%% NEW ADD 2000.11.20
  \usecounter{\@enumctr}%
  \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
%%
\newcommand{\labelitemi}{\textbullet}
\newcommand{\labelitemii}{\textendash}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}
\renewcommand{\labelitemi}{\hbox to 1zw{\hss\textbullet\hss}}
\renewcommand{\labelitemii}{\hbox to 1zw{\hss$\circ$\hss}}
\renewenvironment{itemize}
  {\ifnum \@itemdepth >3\relax\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{item\romannumeral\the\@itemdepth}%
   \list{\csname label\@itemitem\endcsname}{%
   \ifnum \@listdepth=\@ne \topsep0\normalbaselineskip
   %\ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
     \else\topsep\z@\fi
     \parskip\z@ \itemsep\z@ \parsep\z@
     \labelwidth1zw \labelsep0zw \listparindent1zw%\labelwidth1zw \labelsep.3zw
   \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
     \else\leftmargin\leftskip\fi
     \advance\leftmargin 1zw
     \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%% NEW ADD 2000.11.20
%%\newenvironment{description}
%%  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
%%   \iftdir
%%     \leftmargin\leftskip \advance\leftmargin3\Cwd
%%     \rightmargin\rightskip
%%     \labelsep=1zw \itemsep\z@
%%     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
%%   \fi
%%    \let\makelabel\descriptionlabel}}{\endlist}
\newenvironment{description}
  {\list{}{\topsep0\normalbaselineskip
  \labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
  \labelwidth\leftmargin
  \labelsep 1zw
  \listparindent 1zw
  \leftmargin 2zw
  \itemindent-3zw
  \advance \labelwidth by -\labelsep
    \let\makelabel\descriptionlabel}}{\endlist}
%% NEW ADD 2000.11.20
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -1.5em%
    \listparindent\itemindent
    \rightmargin\leftmargin \advance\leftmargin 1.5em}%
    \item\relax}{\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1.5em%
    \itemindent\listparindent
    \rightmargin\leftmargin
    \parsep\z@ \@plus\p@}%
    \item\relax}{\endlist}
%% NEW ADD 2000.11.20
%%\newenvironment{quote}
%%  {\list{}{\rightmargin\leftmargin}%
%%    \item\relax}{\endlist}
\newenvironment{quote}
  {\list{}{%
 \topsep.5\baselineskip
 \parsep\z@\itemsep\z@\partopsep\z@ \itemindent 0zw%
   \leftmargin 2zw
   \rightmargin\leftmargin}%
\item\relax}{\endlist}
%% NEW ADD 2000.11.20

\gdef\tabbing{\lineskip \z@skip\let\>\@rtab\let\<\@ltab\let\=\@settab
     \let\+\@tabplus\let\-\@tabminus\let\`\@tabrj\let\'\@tablab
     \let\\=\@tabcr
     \@hightab\@firsttab
     \global\@nxttabmar\@firsttab
     \dimen\@firsttab\@totalleftmargin
     \global\@tabpush\z@ \global\@rjfieldfalse
     \trivlist \item\relax
     \if@minipage\else\vskip\parskip\fi
     \setbox\@tabfbox\hbox{%
       \rlap{\hskip\@totalleftmargin\indent\the\everypar}}%
     \def\@itemfudge{\box\@tabfbox}%
     \@startline\ignorespaces}
\gdef\endtabbing{%
  \@stopline\ifnum\@tabpush >\z@ \@badpoptabs \fi\endtrivlist}
%%
\newdimen\capwidth
\newlength\abovecaptionskip
\newlength\belowcaptionskip
%%
\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof} %%% 2002.10.14 by kamisima
\def\fnum@figure{\figurename\thefigure}
\def\figure{%
\setlength\abovecaptionskip{10\p@}
%% NEW ADD 2000.11.20
%%\setlength\belowcaptionskip{0\p@}
\setlength\belowcaptionskip{10\p@}
%% NEW ADD 2000.11.20
\bgroup\@floatenv\capwidth\hsize
 \abovecaptionskip\belowcaptionskip\@float{figure}}
\def\endfigure{\end@float\egroup}
\@namedef{figure*}{\bgroup\@floatenv\capwidth.8\textwidth
 \abovecaptionskip\belowcaptionskip\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat\egroup}

\newcounter{table}
\def\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lof} %%% 2002.10.14 by kamisima
\def\fnum@table{\tablename\thetable}
\def\table{%
\setlength\abovecaptionskip{0\p@}
\setlength\belowcaptionskip{3\p@}
\bgroup\@floatenv\capwidth\hsize
 \abovecaptionskip\belowcaptionskip\@float{table}}
\def\endtable{\end@float\egroup}
\@namedef{table*}{\bgroup\@floatenv\capwidth.8\textwidth
 \abovecaptionskip\belowcaptionskip\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat\egroup}

\long\def\@caption#1[#2]#3{\par
\begingroup
 \@parboxrestore
 \footnotesize
 \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
\endgroup}

\newbox\@Tempboxa
\newbox\@Tempboxb
\newdimen\@Tempdima
\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@Tempboxa\hbox{{\bfseries #1}\hskip1zw\shortstack[l]{#2}}%
 \@Tempdima=\ht\@Tempboxa\advance \@Tempdima \dp\@Tempboxa
 \setbox\@Tempboxb\hbox{\bfseries #1\hskip1zw}%
 \ifdim \@Tempdima > \baselineskip
  \hfil\parbox[t]{\wd\@Tempboxa}{\hangindent\wd\@Tempboxb 
   {\bfseries #1}\hskip1zw #2}%
 \else
  \ifdim \wd\@Tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@Tempboxb 
    {\bfseries #1}\hskip1zw #2}%
  \else
   \hbox to\hsize{\hss\box\@Tempboxa\hss}
  \fi
 \fi
\vspace{\belowcaptionskip}
}

\def\@floatenv{\def\@setstrut{\setbox\strutbox=%
 \hbox{\vrule \@height .75\baselineskip \@depth .25\baselineskip \@width\z@}}%
 \protect\footnotesize
 }

\newdimen\verbatimleftmargin
  \verbatimleftmargin\z@
\newdimen\verbatimbaselineskip
 \verbatimbaselineskip\baselineskip
\def\verbatimsize{\normalsize}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{%
  \ifnum\c@chapter>\z@\thechapter.\fi \@arabic\c@equation}
\if@enablejfam
  \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
  \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}
\setcounter{tocdepth}{2}
\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength\toclineskip{\z@}
\newdimen\@lnumwidth
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}}
\def\@dottedtocline#1#2#3#4#5{\ifnum #1>\c@tocdepth \else
  \vskip\toclineskip \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode
   \@lnumwidth #3\relax
   \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
    {#4}\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep
       mu$}\hfill \nobreak\hbox to\@pnumwidth{%
  \hss\reset@font\rmfamily \normalcolor #5}\par}\fi}
\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
\@temptokena{\thepage}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}
\newcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }\@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\large\bfseries
     \setlength\@lnumwidth{4zw}%
     #1\hfil\nobreak
     \hbox to\@pnumwidth{\hss#2}}\par
    \nobreak
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
     \endgroup
  \fi}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\bfseries
      \setlength\@lnumwidth{4zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*{\l@section}{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*{\l@subsection}   {\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*{\l@subsubsection}{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{10em}{5em}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{12em}{6em}}
%%
\newenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
   \thispagestyle{jpl@in}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand{\@idxitem}{\par\hangindent 40\p@}
\newcommand{\subitem}{\@idxitem \hspace*{20\p@}}
\newcommand{\subsubitem}{\@idxitem \hspace*{30\p@}}
\newcommand{\indexspace}{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand{\footnoterule}{%
  \kern-3\p@
%%  \hrule width .4\columnwidth
 \hrule width 39mm
  \kern 2.6\p@}
%%
\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else \@tempcnta\year
      \advance\@tempcnta-1988 平成
      \ifnum \@tempcnta =1 元\else\kansuji\number\@tempcnta\fi 年
      \kansuji\number\month 月\kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year\, 年\hspace{.5em}\nobreak
      \number\month\, 月\hspace{.5em}\nobreak
      \number\day\, 日
    \else \@tempcnta\year
      \advance\@tempcnta-1988 平成
      \ifnum \@tempcnta =1 元\else\number\@tempcnta\fi
 \, 年\hspace{.5em}\nobreak
      \number\month\, 月\hspace{.5em}\nobreak\number\day\, 日
    \fi
  \fi}}
%%
%%禁則処理
\prebreakpenalty`）=10000
\postbreakpenalty`（=10000
\prebreakpenalty`｝=10000
\postbreakpenalty`｛=10000
\prebreakpenalty`］=10000
\postbreakpenalty`［=10000
\prebreakpenalty`〉=10000
\postbreakpenalty`〈=10000
\prebreakpenalty`．=10000
\prebreakpenalty`，=10000
\prebreakpenalty`・=10000
\prebreakpenalty`〜=10000
%\postbreakpenalty`〜=10000
%%
\newdimen\evennodoshift \evennodoshift\z@
\newdimen\oddnodoshift \oddnodoshift\z@
\newdimen\evenkoguchishift \evenkoguchishift\z@
\newdimen\oddkoguchishift \oddkoguchishift\z@
%\def\shiftright{\marginparwidth\advance\marginparsep}

%% marginpar style
\def\marginpar{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\ifinner
      \@parmoderr\@floatpenalty\z@
    \else\@next\@currbox\@freelist{}{}\@next\@marbox\@freelist{\global
      \count\@marbox\m@ne}{\@floatpenalty\z@ \@fltovf
  \def\@currbox{\@tempboxa}\def\@marbox{\@tempboxa}}\fi
     \@ifnextchar [\@xmpar\@ympar}
\long\def\@xmpar[#1]#2{\@savemarbox\@marbox{#1}\@savemarbox\@currbox
   {#2}\@xympar}
\long\def\@ympar#1{\@savemarbox\@marbox{#1}\global\setbox\@currbox
     \copy\@marbox\@xympar}
\long\def \@savemarbox #1#2{%
  \global\setbox #1%
    \color@vbox
      \vtop{%
 \hsize\marginparwidth
 \@parboxrestore
 \@marginparreset
    \setlength{\baselineskip}{11pt}{\reset@font\egtjq #2}%#2%
 \global\@minipagefalse
 \outer@nobreak
 }%
    \color@endbox
}
\def \@marginparreset {%
 \reset@font
 \normalsize
 \@setnobreak
 \@setminipage
}
\def \@xympar{%
  \ifnum\@floatpenalty <\z@\@cons\@currlist\@marbox\fi
  \setbox\@tempboxa
    \color@vbox
      \vbox \bgroup
  \end@float
  \global \@ignorefalse \@esphack
}
\def\reversemarginpar{\global\@mparbottom\z@ \@reversemargintrue}
\def\normalmarginpar{\global\@mparbottom\z@ \@reversemarginfalse}
%
\def\@addmarginpar{\@next\@marbox\@currlist{\@cons\@freelist\@marbox
    \@cons\@freelist\@currbox}\@latexbug\@tempcnta\@ne
    \if@twocolumn
 \if@firstcolumn \@tempcnta\m@ne \fi
    \else
      \if@mparswitch
  \ifodd\c@page \else\@tempcnta\m@ne \fi
      \fi
      \if@reversemargin \@tempcnta -\@tempcnta \fi
    \fi
    \ifnum\@tempcnta <\z@  \global\setbox\@marbox\box\@currbox \fi
    \@tempdima\@mparbottom
    \advance\@tempdima -\@pageht
    \advance\@tempdima\ht\@marbox
    \ifdim\@tempdima >\z@
      \@latex@warning@no@line {Marginpar on page \thepage\space moved}%
    \else
      \@tempdima\z@
    \fi
    \global\@mparbottom\@pageht
    \global\advance\@mparbottom\@tempdima
    \global\advance\@mparbottom\dp\@marbox
    \global\advance\@mparbottom\marginparpush
    \advance\@tempdima -\ht\@marbox
    \global\setbox \@marbox
     \vbox {\vskip \@tempdima
     \box \@marbox}%
    \global \ht\@marbox \z@
    \global \dp\@marbox \z@
    \kern -\@pagedp
    \nointerlineskip
    \hb@xt@\columnwidth
      {\ifnum \@tempcnta >\z@
   \hskip\columnwidth \hskip\marginparsep
       \else
   \hskip -\marginparsep \hskip -\marginparwidth
       \fi
       \box\@marbox \hss}%
    \nointerlineskip
    \hbox{\vrule \@height\z@ \@width\z@ \@depth\@pagedp}}
%
\if@twoside
%  \@mparswitchtrue
  \@reversemargintrue
  \@mparswitchfalse
\else
%  \@mparswitchfalse
  \@reversemargintrue
  \@mparswitchtrue
\fi

%% marginal notes poistion
\newif\if@marginleft \@marginleftfalse
\def\rightmarginalnotes{\ifodd\c@page\@reversemarginfalse\else
   \@reversemargintrue\fi\@marginleftfalse}
\def\leftmarginalnotes{\ifodd\c@page\@reversemargintrue\else
   \@reversemarginfalse\fi\@marginlefttrue}
\def\centermarginalnotes{\ifodd\c@page\@reversemargintrue
   \@marginlefttrue\else\@reversemargintrue\@marginleftfalse\fi}
\def\sidemarginalnotes{\ifodd\c@page\@reversemarginfalse
   \@marginleftfalse\else\@reversemarginfalse\@marginlefttrue\fi}
% defalut position
%\def\marginalnotes{\sidemarginalnotes}
%\def\marginalnotes{\centermarginalnotes}
\def\marginalnotes{\leftmarginalnotes}
%
\def\ruby#1#2{\leavevmode \setbox0=\hbox{#1}\setbox1=\hbox{\tiny#2}%
 \ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
 \hbox{\kanjiskip=\fill
  \vbox{\hbox to \dimen0{\tiny \hfil#2\hfil}%
   \nointerlineskip \hbox to \dimen0{\hfil#1\hfil}}}}
\def\MARU#1{\raisebox{0.1zh}%
 {{\rm\ooalign{\hfil\lower.168ex\hbox{#1}\hfil\crcr\mathhexbox20D}}}}
\def\QED{{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil \hbox{$\Box$}
 \parfillskip\z@ \finalhyphendemerits\z@\par}}
%%
\if@english
\def\quad{\hskip1em\relax}
\def\qquad{\hskip2em\relax}
\else
\def\dash{\protect\@dash}
\def\@dash{\raisebox{.3zw}[0pt]{\hbox to1zw{\hss\hskip.05zw
  \rule{.9zw}{.04zw}\hskip.05zw\hss}}}
\def\ddash{\protect\@ddash}
\def\@ddash{\raisebox{.3zw}[0pt]{\hbox to2zw{\hss\hskip.1zw
  \rule{1.8zw}{.04zw}\hskip.1zw\hss}}}
\def\sdash{\protect\@sdash}
\def\@sdash{\raisebox{.3zw}[0pt]{\hbox to.5zw{\hss\hskip.05zw
  \rule{.4zw}{.04zw}\hskip.05zw\hss}}}
\def\quad{\hskip1zw\relax}
\def\qquad{\hskip2zw\relax}
\fi
\def\smallskip{\par\vspace{.25\baselineskip}\par}
\def\medskip{\par\vspace{.5\baselineskip}\par}
\def\bigskip{\par\vspace{\baselineskip}\par}
%%
%% newtheorem environment %%
\def\newtheorem#1{%
  \@ifnextchar[{\@othm{#1}}{\@nthm{#1}}}
\def\@nthm#1#2{%
  \@ifnextchar[{\@xnthm{#1}{#2}}{\@ynthm{#1}{#2}}}
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \expandafter\xdef\csname the#1\endcsname{%
%%       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
%% NEW ADD 2000.11.20
%%     \expandafter\@arabic\csname c@#3\endcsname \@thmcountersep 
     \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
%% NEW ADD 2000.11.20
          \@thmcounter{#1}}%
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}
\def\@ynthm#1#2{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}%
     \expandafter\xdef\csname the#1\endcsname{\@thmcounter{#1}}%
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}
\def\@othm#1[#2]#3{%
  \@ifundefined{c@#2}{\@nocounterr{#2}}%
    {\expandafter\@ifdefinable\csname #1\endcsname
    {\global\@namedef{the#1}{\@nameuse{the#2}}%
  \global\@namedef{#1}{\@thm{#2}{#3}}%
  \global\@namedef{end#1}{\@endtheorem}}}}
\def\@thm#1#2{%
  \refstepcounter{#1}%
  \@ifnextchar[{\@ythm{#1}{#2}}{\@xthm{#1}{#2}}}
\def\@xthm#1#2{%
  \@begintheorem{#2}{\csname the#1\endcsname}\ignorespaces}
\def\@ythm#1#2[#3]{%
  \@opargbegintheorem{#2}{\csname the#1\endcsname}{#3}\ignorespaces}
\def\@thmcounter#1{\noexpand\arabic{#1}}
\def\CTRPRD{$\vbox{\baselineskip2.5\p@ \lineskiplimit\z@
    \kern0\p@\hbox{}\hbox{.}\hbox{}}$}
\def\@thmcountersep{\CTRPRD}
\def\@begintheorem#1#2{%
 \topsep\z@\parsep\z@\itemsep\z@\partopsep\z@
 \trivlist
 \def\@tempthm{#1}%
   \ifx 
     \@tempthm\thmnocnt\let\@thmthmcntsep\@gobble
   \else
     \def\@thmthmcntsep{\ }
   \fi
 \item[%
  \hskip 1zw
  {\bfseries \csname LP#1\endcsname #1\@thmthmcntsep{#2}\csname RP#1\endcsname}
  \if@english \hskip.5em \else\hskip.5zw\fi%
  ]}
\def\@opargbegintheorem#1#2#3{%
 \topsep\z@\parsep\z@\itemsep\z@\partopsep\z@
 \trivlist
 \def\@tempthm{#1}%
   \ifx 
    \@tempthm\thmnocnt\let\@thmthmcntsep\@gobble
   \else
    \def\@thmthmcntsep{\ }
   \fi
 \item[%
  \hskip 1zw
  {\bfseries \csname LP#1\endcsname #1\@thmthmcntsep{#2}\csname RP#1\endcsname
   \if@english (\else （\fi #3\if@english )\else ）\kern-.5zw\fi}
   \if@english \hskip.5em \else\hskip.5zw\fi
   ]}
\def\@endtheorem{\endtrivlist}
%%
\if@english
 \def\thmnocnt{Proof}%
\else
 \def\thmnocnt{証明}%
% \def\thmnocnt{定義}%
\fi

\def\Joinrel{\mathrel{\mkern-9mu}}
\def\LL{\langle\Joinrel\langle}
\def\GG{\rangle\Joinrel\rangle}

\if@english
 \def\LPDefinition{[}%
 \def\RPDefinition{]}%
 \def\LPTheorem{[}%
 \def\RPTheorem{]}%
 \def\LPProof{\hbox{$\LL$}}%
 \def\RPProof{\kern.25ex \hbox{$\GG$}}%
 \def\LPLemma{[}%
 \def\RPLemma{]}%
 \def\LPCorollary{(}%
 \def\RPCorollary{)}%
 \def\LPExample{[}%
 \def\RPExample{]}%
 \def\LPProposition{\hbox{$\langle$}}%
 \def\RPProposition{\hbox{$\rangle$}}%
 \def\LPAssumption{[}%
 \def\RPAssumption{]}%
\else
 \def\LP定義{\hbox{【}}%
 \def\RP定義{\hbox{】}}%
 \def\LP定理{\hbox{［}}%
 \def\RP定理{\hbox{］}}%
 \def\LP証明{\hbox{《}}%
 \def\RP証明{\hbox{》}}%
 \def\LP補題{\hbox{［}}%
 \def\RP補題{\hbox{］}}%
 \def\LP系{\hbox{（}}%
 \def\RP系{\hbox{）}}%
 \def\LP例{\hbox{〔}}%
 \def\RP例{\hbox{〕}}%
 \def\LP命題{\hbox{〈}}%
 \def\RP命題{\hbox{〉}}%
 \def\LP仮定{\hbox{［}}%
 \def\RP仮定{\hbox{］}}%
\fi
%%
%%数式の処理
%% The original source files were: `fleqn.clo',
%% Copyright 1993 1994 1995 1996 1997
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%% 
%% For further copyright information, and conditions for modification
%% and distribution, see the file legal.txt, and any other copyright
%% notices in this file.
%% 
%% This file is part of the LaTeX2e system.
%% ----------------------------------------
%%   This system is distributed in the hope that it will be useful,
%%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%% 
%%   For error reports concerning UNCHANGED versions of this file no
%%   more than one year old, see bugs.txt.
%% 
%%   Please do not request updates from us directly.  Primary
%%   distribution is through the CTAN archives.
%% 
%% 
%% IMPORTANT COPYRIGHT NOTICE:
%% 
%% You are NOT ALLOWED to distribute this file alone.
%% 
%% You are allowed to distribute this file under the condition that it
%% is distributed together with all the files listed in manifest.txt.
%% 
%% If you receive only some of these files from someone, complain!
%% 
%% 
%% Permission is granted to copy this file to another file with a
%% clearly different name and to customize the declarations in that
%% copy to serve the needs of your installation, provided that you
%% comply with the conditions in the file legal.txt.
%% 
%% However, NO PERMISSION is granted to generate or to distribute a
%% modified version of this file under its original name.
%% 
%% You are NOT ALLOWED to change this file.
%% 
%% 
%% MODIFICATION ADVICE:
%% 
%% If you want to customize this file, it is best to make a copy of
%% the source file(s) from which it was produced.  Use a different
%% name for your copy(ies) and modify the copy(ies); this will ensure
%% that your modifications do not get overwritten when you install a
%% new release of the standard system.  You should also ensure that
%% your modified source file does not generate any modified file with
%% the same name as a standard file.
%% 
%% You can then easily distribute your modifications by distributing
%% the modified and renamed copy of the source file, taking care to
%% observe the conditions in legal.txt; this will ensure that other
%% users can safely use your modifications.
%% 
%% You will also need to produce your own, suitably named, .ins file to
%% control the generation of files from your source file; this file
%% should contain your own preambles for the files it generates, not
%% those in the standard .ins files.
%% 
%% The names of the source files used are shown above.
%% 
%% 
%% 
%%% From File: ltmath.dtx
\newdimen\mathindent
%%\AtEndOfClass{\mathindent\leftmargini}
\renewcommand\[{\relax
%% NEW ADD 2000.11.20
  \topsep=6pt \@plus3pt \@minus4pt
%% NEW ADD 2000.11.20
                \ifmmode\@badmath
                \else
                  \begin{trivlist}%
                    \@beginparpenalty\predisplaypenalty
                    \@endparpenalty\postdisplaypenalty
                    \item[]\leavevmode
                    \hb@xt@\linewidth\bgroup $\m@th\displaystyle %$
                      \hskip\mathindent\bgroup
                \fi}
\renewcommand\]{\relax
                \ifmmode
                      \egroup $\hfil% $
                    \egroup
                  \end{trivlist}%
                \else \@badmath
                \fi}
\renewenvironment{equation}%
    {%
%% NEW ADD 2000.11.20
  \topsep=6pt \@plus3pt \@minus4pt
%% NEW ADD 2000.11.20
\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}%
     \trivlist \item[]\leavevmode
       \hb@xt@\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}
\renewenvironment{eqnarray}{%
  \topsep=6pt \@plus3pt \@minus4pt
    \stepcounter{equation}%
    \def\@currentlabel{\p@equation\theequation}%
    \global\@eqnswtrue\m@th
    \global\@eqcnt\z@
    \tabskip\mathindent
    \let\\=\@eqncr
    \setlength\abovedisplayskip{\topsep}%
    \ifvmode
      \addtolength\abovedisplayskip{\partopsep}%
    \fi
    \addtolength\abovedisplayskip{\parskip}%
    \setlength\belowdisplayskip{\abovedisplayskip}%
    \setlength\belowdisplayshortskip{\abovedisplayskip}%
    \setlength\abovedisplayshortskip{\abovedisplayskip}%
    $$\everycr{}\halign to\linewidth% $$
    \bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip{##}$\@eqnsel&%
%%      \global\@eqcnt\@ne \hskip \tw@\arraycolsep \hfil${##}$\hfil&%
%%      \global\@eqcnt\tw@ \hskip \tw@\arraycolsep
      \global\@eqcnt\@ne \hskip .7\arraycolsep \hfil${##}$\hfil&%
      \global\@eqcnt\tw@ \hskip .7\arraycolsep
        $\displaystyle{##}$\hfil \tabskip\@centering&%
      \global\@eqcnt\thr@@
        \hb@xt@\z@\bgroup\hss##\egroup\tabskip\z@skip\cr}%
      {\@@eqncr
    \egroup
    \global\advance\c@equation\m@ne$$% $$
    \@ignoretrue
    }
%%
\if@english
\def\thinspace{\kern .16667em }
\def\negthinspace{\kern-.16667em }
\def\enspace{\kern.5em }
\mathindent=3em
\else
\def\thinspace{\kern .25zw }
\def\negthinspace{\kern-.25zw }
\def\enspace{\kern.5zw }
\mathindent=3zw
\fi
\thickmuskip=4.3mu%
\medmuskip=3.15mu%
\thinmuskip=2.15mu%
\def\>{\mskip\medmuskip}
%\def\;{\mskip\thickmuskip}
%\def\!{\mskip-\thinmuskip}
\def\,{\relax\ifmmode\mskip\thinmuskip\else\thinspace\fi}
\def\;{\relax\ifmmode\mskip\thickmuskip\else\enspace\fi}
\def\!{\relax\ifmmode\mskip-\thinmuskip\else\negthinspace\fi}
%%% 2002.10.16-begin by kamisima
% \def\theequation{(\arabic{equation})}
\def\theequation{\@ifundefined{@amsmath@err}%
 {(\arabic{equation})}{\arabic{equation}}}
%%% 2002.10.16-end by kamisima
\def\@eqnnum{{\normalfont \normalcolor \theequation}\hspace*{1zw}}
%%\def\@eqnnum{{\normalfont \normalcolor (\theequation)}\hspace*{1zw}}
\def\@everymath{\everymath{\textstyle}}
\def\reseteverymath{\everymath{\protect\@everymath}}
\def\m@th{\mathsurround=\z@\@ifundefined{mathskip}{}{\mathskip\z@}}
%%
\if@english
\def\refstepcounter#1{\stepcounter{#1}\let\@tempa\protect
  \def\protect{\noexpand\protect\noexpand}%
  \def\@tempref{#1}%
  \def\@tempsec{section}%
  \def\@tempsubsec{subsection}%
%% NEW ADD 2000.11.20 §1 §2 ... 表示のためのコメントアウト
%% 2002.10.16復活
  \def\@tempsubsubsec{subsubsection}%
%% NEW ADD 2000.11.20 
   \ifx\@tempref\@tempsec
     \if@appendix
     \edef\@currentlabel{\csname p@appendix\endcsname \csname the#1\endcsname}
     \else
     \edef\@currentlabel{\csname p@#1\endcsname \csname the#1\endcsname}
     \fi
   \else
   \ifx\@tempref\@tempsubsec
     \if@appendix
     \edef\@currentlabel{\csname p@appendix\endcsname \csname the#1\endcsname}
     \else
     \edef\@currentlabel{\csname p@#1\endcsname \csname the#1\endcsname}
     \fi
   \else
   \ifx\@tempref\@tempsubsubsec
     \if@appendix
   \edef\@currentlabel{\csname p@appendix\endcsname \csname thelbl#1\endcsname}
     \else
   \edef\@currentlabel{\csname p@#1\endcsname \csname thelbl#1\endcsname}
     \fi
   \else
   \edef\@currentlabel{\csname p@#1\endcsname\csname the#1\endcsname}%
   \fi
   \fi
   \fi 
 \let\protect\@tempa}
\else
  \def\refstepcounter#1{\stepcounter{#1}\let\@tempa\protect
  \def\protect{\noexpand\protect\noexpand}%
  \def\@tempref{#1}%
  \def\@tempsec{section}%
  \def\@tempsubsec{subsection}%
%% NEW ADD 2000.11.20 §1 §2 ... 表示のためのコメントアウト
%% 2002.10.16復活
  \def\@tempsubsubsec{subsubsection}%
%% NEW ADD 2000.11.20
   \ifx\@tempref\@tempsec
     \if@appendix
     \edef\@currentlabel{\csname p@appendix\endcsname \csname the#1\endcsname}
     \else
     \edef\@currentlabel{\csname the#1\endcsname \csname p@#1\endcsname}
     \fi
   \else
    \ifx\@tempref\@tempsubsec
     \if@appendix
     \edef\@currentlabel{\csname p@appendix\endcsname \csname the#1\endcsname}
     \else
     \edef\@currentlabel{\csname the#1\endcsname \csname p@#1\endcsname}
     \fi
   \else
    \ifx\@tempref\@tempsubsubsec
     \if@appendix
   \edef\@currentlabel{\csname p@appendix\endcsname \csname thelbl#1\endcsname}
     \else
   \edef\@currentlabel{\csname thelbl#1\endcsname \csname p@#1\endcsname}
     \fi
    \else
   \edef\@currentlabel{\csname p@#1\endcsname\csname the#1\endcsname}%
   \fi
   \fi
   \fi
 \let\protect\@tempa}
\fi
%%
\if@english
 \def\p@section{Chapter~}
 \def\p@subsection{Section~}
%% NEW ADD 2000.11.20 §1 §2 ... 表示のためコメントアウト
%% 2002.10.16復活
 \def\p@subsubsection{Section~}
%% NEW ADD 2000.11.20
 \def\p@appendix{Appendix~}
 \def\p@figure{Figure~}
 \def\p@table{Table~}
\else
 \def\p@section{章}
 \def\p@subsection{節}
%% NEW ADD 2000.11.20 §1 §2 ... 表示のためコメントアウト
%% 2002.10.16復活
 \def\p@subsubsection{節}
%% NEW ADD 2000.11.20
 \def\p@appendix{付録}
 \def\p@figure{図}
 \def\p@table{表}
\fi
%%
%%
\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
 \def\@citea{}%
 \@cite{\@for\@citeb:=#2\do
  {\@citea\def\@citea{,\penalty\@m\ }%
   \@ifundefined{b@\@citeb}{{\bfseries ?}\@warning
    {Citation `\@citeb' on page \thepage \space undefined}}%
    {\csname b@\@citeb\endcsname}}}%
 {#1}}
%%
\def\Vol#1{\gdef\@Vol{#1}%
 \ifx\@Vol\empty
   \gdef\@Year{\number\year}%
 \else
  \@tempcnta=#1\advance\@tempcnta 2009\relax%% XXX
   \xdef\@Year{\the\@tempcnta}%
 \fi
}
\def\@Vol{xx}
\def\@Year{\number\year}

\def\No#1{\gdef\@No{#1}%
 \ifx\@No\empty
  \xdef\@Month{xxx}\gdef\@No{x}%
 \else
%%  \xdef\@Month{\ifcase#1\or
%%   Jan.\or March\or May\or July\or Sept.\or Nov.\else\fi}%
  \xdef\@Month{\ifcase#1\or
   1\or 3\or 5\or 7\or 9\or 11\else\fi}%
 \fi
}
\def\@No{x}
\def\@Month{xxx}

\newif\if@articlemode
\@articlemodetrue
%\@articlemodefalse
%%
\def\SubNo#1{\gdef\@SubNo{#1}%
 \ifx\@SubNo\empty
  \gdef\@SubNo{a}%
 \else
 \fi
}
\def\@SubNo{a}
%%
\if@articlemode
\def\Volume{{\rmfamily Vol.~\@Vol \hskip1zw No.~\@No（\@Year）}}
\else
\def\Volume{{\rmfamily Vol.~\@Vol \hskip1zw No.~\@No（\@Year）Warning!}}
\fi
%% NEW ADD 2000.11.20
%%
\font\MONBRE=cmsl10 at 9pt
%%\font\MONBRE=cmr10 at 8pt
%%%%page style define (myheadings)%%%%
\mark{{}{}}
\def\ps@myheadings{%
\let\@mkboth=\markboth%\gobbletwo
\def\@oddhead{{\small \@titlemark \hfill {\slshape \thepage}}}%%\leftmark
\def\@oddfoot{}
\def\@evenhead{{\small {\slshape \thepage} \hfill 
%% NEW ADD 2000.11.20
{\rmfamily \journalname}\hskip1zw \Volume}}
%% NEW ADD 2000.11.20
\def\@evenfoot{}
\def\chaptermark##1{\markboth{##1}{}}
\def\sectionmark##1{\markright{##1}{}}
}

\pagestyle{myheadings}
\pagenumbering{arabic}

\mark{{}{}}
\def\ps@TOPheadings{%
\let\@mkboth=\markboth%\gobbletwo
\def\@oddhead{{\small \hfill {\slshape \thepage}}}%%\leftmark
\def\@oddfoot{}
\def\@evenhead{{\small {\slshape \thepage} \hfill 
%% NEW ADD 2000.11.20
{\rmfamily \journalname}\hskip1zw \Volume}}
%% NEW ADD 2000.11.20
\def\@evenfoot{}
\def\chaptermark##1{\markboth{##1}{}}
\def\sectionmark##1{\markright{##1}{}}
}
%%
\mark{{}{}}
\def\ps@BOTHheadings{%
\let\@mkboth=\markboth%\gobbletwo
\def\@oddhead{{\small %
%% NEW ADD 2000.11.20
%%{\rmfamily \@KINTO{9zw}{\protect 人工知能学会誌}}\hskip1zw \Volume
{\rmfamily \journalname}\hskip1zw \Volume
%% NEW ADD 2000.11.20
 \hfill {\slshape \thepage}}}%%\leftmark
\def\@oddfoot{}
\def\@evenhead{{\small {\slshape \thepage} \hfill 
%% NEW ADD 2000.11.20
{\rmfamily \journalname}\hskip1zw \Volume}}
%% NEW ADD 2000.11.20
\def\@evenfoot{}
\def\chaptermark##1{\markboth{##1}{}}
\def\sectionmark##1{\markright{##1}{}}
}
%%
\newcommand{\prepartname}{第}
\newcommand{\postpartname}{部}
\newcommand{\prechaptername}{第}
\newcommand{\postchaptername}{章}
\newcommand{\contentsname}{目 次}
\def\Diamondsuit{\raisebox{.25ex}{$\diamondsuit$}}
\newcommand{\bibname}{%
\if@english 
  \Diamondsuit\kern.5zw References\kern.5zw \Diamondsuit 
  \else 
%% NEW ADD 2000.11.20
%%  \Diamondsuit\kern.5zw 
%%  参\hskip1zw 考\hskip1zw 文\hskip1zw 献\kern.25zw \Diamondsuit
    \Diamondsuit\hbox to 8zw{\hss%
    参\hskip1zw 考\hskip1zw 文\hskip1zw 献\hss}\Diamondsuit
%% NEW ADD 2000.11.20
\fi}%%{参考文献}
\newcommand{\indexname}{索 引}
\newcommand{\figurename}{\if@english Fig. \else 図 \fi}
\newcommand{\tablename}{\if@english Table \else 表 \fi}
\newcommand{\appendixname}{%
\if@english 
%% NEW ADD 2000.11.20
%%  \Diamondsuit\kern.5zw Appendix\kern.25zw \Diamondsuit
  \Diamondsuit\kern.5zw Appendix\kern.5zw \Diamondsuit
%% NEW ADD 2000.11.20
  \else 
%% NEW ADD 2000.11.20
%%  \Diamondsuit\kern.5zw 付\hskip3zw 録\kern.25zw \Diamondsuit  
  \Diamondsuit\hbox to 6zw{\hss 付\hskip3zw 録\hss}\Diamondsuit  
%% NEW ADD 2000.11.20
\fi}%%{付 録}
\newcommand{\keywordsname}{keywords:}
\newcommand{\summaryname}{Summary}

%% NEW ADD 2000.11.20
\newcommand{\journalname}{進化計算学会論文誌}
%% NEW ADD 2000.11.20
%%
%%
\endinput



