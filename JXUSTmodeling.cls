%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% github:https://github.com/sikouhjw/JXUSTmodeling
% 开发者:sikouhjw,XAjzh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JXUSTmodeling}[2020/05/19 version 2.2]

% \ProcessOptions\relax
\LoadClass[oneside,a4paper,UTF8,zihao=-4]{ctexart}
\RequirePackage{amsmath,amssymb}
\RequirePackage{newtxtext,newtxmath,esint}
\RequirePackage{sourcecodepro}
\setCJKmainfont[Mapping=fullwidth-stop,AutoFakeBold=true]{SimSun}
\RequirePackage[
UseMSWordMultipleLineSpacing,
MSWordLineSpacingMultiple=1.25
]{zhlineskip}

% 设置章节格式
\ctexset{
	section={
		format={\zihao{4}\heiti\centering},
		name={,、},
		aftername={\hspace{0pt}},
		number=\chinese{section},
	},
	subsection={
		format={\zihao{-4}\bfseries\raggedright},
		name={},
		aftername={\hspace{5bp}},
		number={\arabic{section}.\arabic{subsection}},
	},
	subsubsection={
		format={\zihao{-4}\bfseries\raggedright},
		name={},
		aftername={\hspace{5bp}},
		number={\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
	},
	appendix={
		name={附录,：},
		number=\arabic{section},
	}
}

\def\biaoti#1{\gdef\@biaoti{#1}}
\def\keyword#1{\gdef\@keyword{#1}}
\renewenvironment{abstract}%
{%
	\begingroup\centering\heiti\zihao{3}\@biaoti\par\endgroup%
	\begingroup\centering\heiti\zihao{4}摘　要\par\endgroup%
}{%
	\par\vspace*{\baselineskip}\noindent{\heiti 关键词：}\@keyword\newpage%
}

% 浮动环境设置默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}会将它们分在几个不同页，即使它们可在同一页放得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮动环境的最大比例.
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,我们要求这个环境至少要占据 85% 才能单独放在一页.注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|
\renewcommand*{\floatpagefraction}{0.85}

% 设置页面边距
\RequirePackage[textwidth=444bp,vmargin=2.5cm]{geometry}

% 加载物理、国标宏包
\RequirePackage{physics,siunitx}

\renewcommand{\leq}{\leqslant}
\renewcommand{\geq}{\geqslant}

% 载入表格宏包和插图宏包
\RequirePackage{booktabs,tabularx,multirow,makecell}
\RequirePackage{mwe}
\RequirePackage{caption,subcaption}
\renewcommand\thesubfigure{(\alph{subfigure})}
\captionsetup[sub]{labelformat=simple}
% \captionsetup{skip=0pt}% 将图表标题与图表之间的纵向间距取消掉
\captionsetup{format=hang}% 设置浮动体标题悬挂缩进
\DeclareCaptionLabelSeparator*{sspace}{\ \ }
\captionsetup[figure]{labelsep=sspace}
\captionsetup[table]{labelsep=sspace}
\DeclareCaptionFont{heiti}{\heiti}
\DeclareCaptionFont{5hao}{\zihao{5}}
\captionsetup{labelfont={heiti,5hao},textfont={heiti,5hao}}% 设置图表标题为5号、黑体
\RequirePackage[section]{placeins}

% 定义居中的X列格式
\newcolumntype{Y}{>{\centering\arraybackslash}X}

% 设置图片路径
\graphicspath{{figures/}}

% 载入列表宏包
\RequirePackage{enumitem}
\setlist[enumerate,1]{leftmargin=0pt,labelsep=0pt,itemindent=3\ccwd+0.2cm,parsep=0pt,itemsep=0pt,topsep=0pt,partopsep=0pt,listparindent=2\ccwd}
\def\labelenumi{\theenumi、}
\setlist[itemize,1]{leftmargin=0pt,itemindent=3\ccwd,parsep=0pt,itemsep=0pt,topsep=0pt,partopsep=0pt,listparindent=2\ccwd}


% 载入参考文献宏包，设置引用格式
\RequirePackage{natbib}
\setcitestyle{square,super}

% 载入代码宏包
\RequirePackage{xcolor,listings}
% 设置代码的默认样式
\lstset{
	frame=none,% 取消边框
	breaklines=true,% 允许自动断行
	% breakatwhitespace=true,% 使用此命令仅允许在空格处自动断行
	showstringspaces=false,% 不显示字符串中的空格
	basicstyle=\small\ttfamily,% 设置代码基本样式
	flexiblecolumns=true,% 改善字母间距
	keywordstyle=\color{blue},% 设置关键词样式
	stringstyle=\color[rgb]{0.75,0,0.75},% 设置字符串样式
	commentstyle=\songti\color[rgb]{0,0.5,0},% 设置注释样式
	tabsize=2,% 设置制表符缩进
}

% 设置matlab代码环境
\lstnewenvironment{matlab}[1][]{
	\lstset{
		language=Matlab,
		% deletekeywords={disp},% 可在此行去除特定关键词的语法高亮		
		keywordstyle=\color{blue},% 设置关键词样式
		stringstyle=\color[rgb]{0.75,0,0.75},% 设置字符串样式
		commentstyle=\songti\color[rgb]{0,0.5,0},% 设置注释样式
		#1
	}
}{}

% 设置python代码环境
\lstnewenvironment{python}[1][]{
	\lstset{
		language=Python,
		keywordstyle=\color[RGB]{255,119,0},% 设置Keywords样式
		morekeywords={as},% 将特定单词加入Kewords中
		deletekeywords={print},%从 keywords中去除特定单词
		keywordstyle=[2]\color[RGB]{144,0,144},% 设置Builtins样式
		morekeywords=[2]{print},% 将特定单词加入Builtins中
		stringstyle=\color[RGB]{0,170,0},% 设置字符串样式
		commentstyle=\songti\color[RGB]{221,0,0},% 设置注释样式	
		#1
	}
}{}

\RequirePackage{etoolbox}
\newenvironment{appendixx}{%
	\newpage%
	\appendix%
	\ctexset{section={%
		format={\zihao{-4}\heiti\raggedright}%
	}}%
	\zihao{5}%
	\begingroup\centering\heiti\zihao{4}附　录\par\endgroup%
}{}
\AtBeginEnvironment{thebibliography}{\phantomsection\addcontentsline{toc}{section}{参考文献}}

% 设置页眉页脚格式
\pagestyle{plain}

\labelformat{figure}{图~#1}
\labelformat{table}{表~#1}
\labelformat{equation}{(#1)~式}

% 载入超链接宏包
\RequirePackage{hyperref}
\hypersetup{breaklinks,colorlinks}% 允许超链接断行,取消超链接的边框,使链接文字带颜色
\hypersetup{hidelinks,bookmarksnumbered=true,bookmarksopen=true,pdfstartview=Fit}% 取消超链接的颜色，书签目录增加编号