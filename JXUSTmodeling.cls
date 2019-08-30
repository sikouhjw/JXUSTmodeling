%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% github:https://github.com/sikouhjw/JXUSTmodeling
% 开发者:sikouhjw,XAjzh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JXUSTmodeling}[2019/08/23 version 2.0]

% \ProcessOptions\relax
% 设置纸张为A4纸,行距为1.25倍,设置默认字号为小4
\LoadClass[oneside,a4paper,UTF8,linespread=1.25,zihao=-4]{ctexart}

% 定义标题页命令，第一个空填入标题名称，第二个填摘要内容，之后的填关键词(自行修改数量)
\newcommand{\biaoti}[6]{
	\begin{center}\addcontentsline{toc}{chapter}{#1}
		\heiti\zihao{3}#1
	\end{center}%
	\phantom{1}\hfill{\label{zy}\heiti\zihao{4}摘\hspace{1pc}要}\hfill\phantom{1}\pdfbookmark[1]{摘要}{zy}

	#2

	\vphantom{占位}

	\noindent{\heiti 关键词：}#3；#4；#5；#6

	\newpage
}

% 浮动环境设置默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}会将它们分在几个不同页，即使它们可在同一页放得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,我们要求这个环境至少要占据 85% 才能单独放在一页.注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}

% 设置页面边距
\RequirePackage[top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
% \RequirePackage[top=2.54cm,bottom=2.54cm,left=3.18cm,right=3.18cm]{geometry}

% 载入基本的数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{newtxmath}
\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
\let\int\relax\let\sum\relax\let\oint\relax\let\prod\relax% 重定义求和、积分、连乘符号
\DeclareMathSymbol{\sum}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\int}{\mathop}{CMlargesymbols}{"52}
\DeclareMathSymbol{\oint}{\mathop}{CMlargesymbols}{"48}
\DeclareMathSymbol{\prod}{\mathop}{CMlargesymbols}{"51}

% 扩展的数学宏包, 可根据自己的需求载入
% \RequirePackage{bm} %用\bm{}命令生成伪粗体
% \RequirePackage{upgreek}%用\uppi 调用正体的圆周率
% \RequirePackage{mathrsfs}%\mathscr{}调用傅里叶变换,拉普拉斯变换的符号

% 加载物理、国标宏包
\RequirePackage{physics,siunitx}

% 设置虚数,自然底数,微分符号
% \newcommand*{\dd}{\,\mathrm{d}}% 请不要同时使用physics宏包和该命令
\newcommand*{\ee}{\mathrm{e}}
\newcommand*{\ii}{\mathrm{i}}
\renewcommand{\leq}{\leqslant}
\renewcommand{\geq}{\geqslant}

% 载入表格宏包和插图宏包
\RequirePackage{booktabs,tabularx,multirow,longtable,makecell}
\RequirePackage{array}
\RequirePackage{graphicx}
\RequirePackage{caption}
% \captionsetup{skip=0pt}% 将图表标题与图表之间的间距取消掉

% 定义插图、表快捷命令
\newcommand{\fig}[4]{
	\begin{figure}[htbp]
		\centering
		\includegraphics[width=#1\textwidth]{#2}
		\caption{#3}\label{#4}
	\end{figure}
}
\newcommand{\tab}[3]{
	\begin{table}[htbp]
		\centering
		\caption{#1}\label{#2}
		#3
	\end{table}
}
\newcommand{\figtwo}[6]{
	\begin{figure}[htbp]
		\centering
		\parbox[b]{.49\textwidth}{\centering
			\includegraphics[width=.49\textwidth]{#1}
			\caption{#2}\label{#3}
		}%
		\parbox[b]{.49\textwidth}{\centering
			\includegraphics[width=.49\textwidth]{#4}
			\caption{#5}\label{#6}
		}
	\end{figure}
}
\newcommand{\tabtwo}[8]{
	\begin{table}[htbp]
		\centering
		\parbox[b]{0.50\textwidth}{\centering
			\caption{#1}\label{#2}
			\begin{tabularx}{0.48\textwidth}{#3}
				#4
			\end{tabularx}
		}%
		\parbox[b]{0.50\textwidth}{\centering
			\caption{#5}\label{#6}
			\begin{tabularx}{0.48\textwidth}{#7}
				#8
			\end{tabularx}
		}%
	\end{table}
}

\captionsetup{format=hang}% 设置浮动体标题悬挂缩进
\DeclareCaptionLabelSeparator*{sspace}{\ \ }
\captionsetup[figure]{labelsep=sspace}% 设置图表标题中图表后面接两个空格
\captionsetup[table]{labelsep=sspace}
% \captionsetup[figure]{labelsep=quad}% 设置图表标题中图表后面接\quad
% \captionsetup[table]{labelsep=quad}
\DeclareCaptionFont{heiti}{\heiti}
\DeclareCaptionFont{5hao}{\zihao{5}}
\captionsetup{labelfont={heiti,5hao},textfont={heiti,5hao}}% 设置图表标题为5号字体，黑体

% 定义居中的X列格式
\newcolumntype{Y}{>{\centering\arraybackslash}X}

% 扩展的表格宏包和插图宏包
% \RequirePackage{subfig}
% \RequirePackage{longtable}

% 设置图片路径
\graphicspath{{figures/}}

% 载入列表宏包
\RequirePackage{enumitem}%enumerate,
\setlist[enumerate,1]{itemsep=0pt,parsep=0pt,leftmargin=0pt,itemindent=3.25\ccwd}%缩小垂直间距，产生两个字宽的缩进，多行靠左

% 载入ulem宏包,提供可断行下划线的命令\uline
\RequirePackage{ulem}

% 载入颜色宏包
\RequirePackage{color,xcolor}

% 载入参考文献宏包，设置引用格式
\RequirePackage{natbib}
\setcitestyle{square,super}

% 载入代码宏包
\RequirePackage{listings}
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
	tabsize=4,% 设置制表符缩进
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


% 设置章节格式
\ctexset{
	section={% 设置 section 格式
		format={\zihao{4}\heiti\centering},% 4号黑体字居中
		name={,、},% 序号后跟顿号
		aftername={\hspace{0pt}},% 修改序号和标题直接的间距
		number=\chinese{section},% 设置序号为中文
		% beforeskip=30pt,%设置章节标题前的垂直间距
		% fixskip=true,% 默认情况下，article、book 和report 类的标题与正文的距离除了由beforeskip和afterskip选项设置的垂直间距外，还会有一些多余的间距。fixskip 选项用于抑制这些多余间距
	},
	subsection={% 设置 subsection 格式
		format={\zihao{-4}\heiti\raggedright},% 小4号宋体居左
		name={},
        aftername={\hspace{5bp}},% 修改序号和标题直接的间距
		number={\arabic{section}.\arabic{subsection}},% 设置序号格式
	},
	subsubsection={% 设置 subsubsection 格式
		format={\zihao{-4}\heiti\raggedright},% 小4号宋体居左
		name={},
        aftername={\hspace{5bp}},% 修改序号和标题直接的间距
		number={\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},% 设置序号格式
	},
	paragraph={% 设置 subsubsection 格式
		format={\zihao{-4}\raggedright},% 小4号宋体居左
		name={},
        %aftername={\hspace{5bp}},% 修改序号和标题直接的间距
		%number={\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},% 设置序号格式
	},
	appendix={
        name={附录,：},% 在附录序号前添加 "附录"
        number=\arabic{section},
    }
}

\setmainfont{Times New Roman}% 设置英文字体为Times New Roman


% 设置页眉页脚格式
\pagestyle{plain}

% 重定义了浮动体与正文的垂直间距
% \renewcommand\intextsep{0pt}% 文本页三，使用 h 位置选项排在页面中间的浮动体与上下正文之间的垂直间距
% \renewcommand\textfloatsep{0pt}% 文本页上，处于页顶或页底的浮动体与正文之间的垂直间距
% \renewcommand\floatsep{0pt}% 文本页上，处于页顶或页底的多个浮动体之间的垂直间距

% 载入超链接宏包
\RequirePackage{hyperref}
\hypersetup{breaklinks,colorlinks}% 允许超链接断行,取消超链接的边框,使链接文字带颜色
\hypersetup{hidelinks,bookmarksnumbered=true,bookmarksopen=true,pdfstartview=Fit}% 取消超链接的颜色，书签目录增加编号

\RequirePackage{cleveref}% 载入自动引用宏包
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\renewcommand{\eqref}[1]{\labelcref{#1}~\namecref{#1}}