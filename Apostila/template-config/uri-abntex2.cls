%%-----------------------------------------------------------------------------
%% The LaTeX Project Public License
%%-----------------------------------------------------------------------------
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% Further information about abnTeX2 are available on http://www.abntex.net.br/
%%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
% Apostila LaTeX
% Codificação: UTF-8
% LaTeX:  abnTeX2
% -----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{configuracoes/uri-abntex2}[2016/07/07 v1.0]

% Repassa os parâmetros ao abntex2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\PassOptionsToClass{%
% Opções da classe memoir
    12pt,                     % Tamanho da fonte
    a4paper,                  % Tamanho do papel.
    % sumario=tradicional,      % Seleciona o sumário tradicional
% Opções do pacote babel
    brazil,                   % Idioma do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian, hyperpageref]{backref}       % Produzir índice nas referências
\RequirePackage{makeidx}                                % Produzir índice remissivo de palavras
\RequirePackage{chngcntr}

% -----------------------------------------------------------------------------
% Configurações gerais
% Configura margin com o padrão de trabalhos para abnt
\usepackage{geometry}
 \geometry{
 a4paper,
 left=3cm,
 top=3cm,
 right=2cm,
 bottom=2cm
 }

% -----------------------------------------------------------------------------

% Retira o espaço extra desnecessário nas frases
\frenchspacing

% Configurações do pacote backref usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define as listas de item compactas (sem espaçamento entre os itens)
\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]
{%
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
        Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% -----------------------------------------------------------------------------
% Estilo de elementos
% -----------------------------------------------------------------------------

% Elementos pré-textuais
\renewcommand{\pretextual}
{%
    \pagenumbering{gobble}
    \aliaspagestyle{chapter}{empty}
    \pagestyle{empty}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}

% Configura layout para elementos textuais
\renewcommand{\textual}
{%
    \pagenumbering{arabic} % A numeração das páginas é em algarismos arábicos, inciando em 1
    \pagestyle{simple}
    \aliaspagestyle{chapter}{abntchapfirst}
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Configura layout para elementos pós-textuais
\renewcommand{\postextual}
{%
    \chapterstyle{abnt}
    \phantompart
}

% -----------------------------------------------------------------------------
% Objetos flutuantes
% -----------------------------------------------------------------------------

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]
{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \centering\small{Fonte: #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]
{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}

% -----------------------------------------------------------------------------
% Parágrafos
% -----------------------------------------------------------------------------

% Tamanho da indentação do parágrafo
\setlength{\parindent}{1.5cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.0cm}

% -----------------------------------------------------------------------------
% Fontes
% -----------------------------------------------------------------------------

% Redefinição de fontes
% Para aleterar o tipo de fonte coloque \fontfamily{ptm}
% Setado times como fonte para títulos
\renewcommand{\ABNTEXchapterfont}{\normalfont}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize\itshape}
% -----------------------------------------------------------------------------
% Sumário
% -----------------------------------------------------------------------------

% Travessão no sumário para apêndices e anexos
% \renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

% -----------------------------------------------------------------------------
% Listas
% -----------------------------------------------------------------------------

% Define os títulos das listas
\addto\captionsbrazil{%
% Ajusta nomes padrões do babel
    \renewcommand{\listadesiglasname}{LISTA DE ABREVIATURAS E SIGLAS}
    \renewcommand{\listadesimbolosname}{LISTA DE S\'{I}MBOLOS}
    \renewcommand{\listfigurename}{LISTA DE ILUSTRA\c{C}\~OES}
    \renewcommand{\listtablename}{LISTA DE TABELAS}
    \renewcommand{\indexname}{\'{I}NDICE REMISSIVO}
% Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Se\c{c}\~ao}
    \renewcommand{\subsectionautorefname}{Subse\c{c}\~ao}
    \renewcommand{\subsubsectionautorefname}{Subsubse\c{c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse\c{c}\~ao}
% Ajusta nome da Referências para REFERÊNCIAS
    \renewcommand{\bibname}{REFERÊNCIAS}
}


% Cria a lista de quadros
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}


% -----------------------------------------------------------------------------
% Capa
% -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\imprimircapa}{
    \begin{capa}
        \vspace{70pt}
	\begin{center}
		\ABNTEXchapterfont\normalsize\bfseries\MakeUppercase{\imprimirautor}
	\end{center}
	\vspace{140pt}
        \begin{center}
            \ABNTEXchapterfont\normalsize\bfseries\MakeUppercase{\imprimirtitulo}
        \end{center}
	\vspace{120pt}
	\vfill
        \begin{center}
		\begin{OnehalfSpace}
            		\ABNTEXchapterfont\normalsize\bfseries\MakeUppercase{\imprimirlocal}\\
            		\ABNTEXchapterfont\normalsize\bfseries\MakeUppercase{\imprimirdata}
		\end{OnehalfSpace}
    	\end{center}

    \end{capa}

}
\makeatother