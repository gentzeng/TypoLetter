%-------------------------------------------------------------------------------
%<TypoLetter> (c) by <Georg Gentzen (g@georg-gentzen.de)>
%
%<TypoLetter> is licensed under a
%Creative Commons Attribution-ShareAlike 4.0 International License.
%
%You should have received a copy of the license along with this
%work. If not, see <http://creativecommons.org/licenses/by-sa/4.0/>.
%-------------------------------------------------------------------------------
%	Require remaining packages
%-------------------------------------------------------------------------------
%
\ProvidesClass{tletter}[2020/01/28 v1.0 TypoLetter]%
%
\LoadClass[fontsize=12pt]{scrlttr2}%
%-------------------------------------------------------------------------------
%	Declaration of meta data variables
%-------------------------------------------------------------------------------
\newkomavar{from_name}%
\newkomavar{from_street}%
\newkomavar{from_street_number}%
\newkomavar{from_zip}%
\newkomavar{from_city}%
\newkomavar{from_phone}%
\newkomavar{from_fax}%
\newkomavar{from_mobilephone}%
\newkomavar{from_email}%
\newkomavar{from_url}%
\newkomavar{from_street_complete}%
\newkomavar{from_bank}%
\newkomavar{from_id}%
\newkomavar{from_mail_date}%
\newkomavar{recipient}%
\newkomavar{rec_id}%
\newkomavar{rec_mail_date}%
\newkomavar{rec_addressee}%
\newkomavar{rec_addressee_opt_a}%
\newkomavar{rec_addressee_opt_b}%
\newkomavar{rec_street}%
\newkomavar{rec_street_number}%
\newkomavar{rec_building}%
\newkomavar{rec_zip}%
\newkomavar{rec_city}%
\newkomavar{fin_name}%
\newkomavar{fin_iban_cc}%
\newkomavar{fin_iban_remainder}%
\newkomavar{fin_bic}%
\newkomavar{write_date}%
\newkomavar{opening}%
\newkomavar{closing}%
\newkomavar{l_f_id}%
\newkomavar{l_r_id}%
\newkomavar{l_f_mail_date}%
\newkomavar{l_r_mail_date}%
\newkomavar{l_f_phone}%
\newkomavar{l_f_fax}%
\newkomavar{l_f_phone_m}%
\newkomavar{l_f_email}%
\newkomavar{l_f_url}%
\newkomavar{l_date}%
\newkomavar{add_a}%
\newkomavar{add_b}%
%-------------------------------------------------------------------------------
%	Default meta data entries
%-------------------------------------------------------------------------------
\setkomavar{from_street_number}  {42}%
\setkomavar{from_zip}            {00000}%
\setkomavar{rec_addressee_opt_b} {}%
\setkomavar{rec_street_number}   {11}%
\setkomavar{rec_zip}             {00000}%
\setkomavar{fin_iban_remainder}  {00 1111 2222 3333 4444 55}%
\setkomavar{fin_bic}             {AAAAAAAA}%
\setkomavar{write_date}          {\today}%
%-------------------------------------------------------------------------------
%	Declaration package options
%-------------------------------------------------------------------------------
\RequirePackage{ifthen}%
\RequirePackage{xkeyval}%
\newif\if@serialletter%
\newif\if@usetletterdata%
\newif\if@enlargefirstpage\@enlargefirstpagefalse%
\newif\if@ncc%
\newif\if@english%
\newif\if@bill%
\newif\if@bank%
\newif\if@fromid\@fromidtrue%
\newif\if@frommaildate\@frommaildatetrue%
\newif\if@recid\@recidtrue%
\newif\if@recmaildate\@recmaildatetrue%
\newif\if@phone%
\newif\if@fax%
\newif\if@mobilephone%
\newif\if@email%
\newif\if@url%
\newif\if@date\@datetrue%
\DeclareOption{serialletter}     {\@seriallettertrue}%
\DeclareOption{usetletterdata}   {\@usetletterdatatrue}%
\DeclareOption{enlargefirstpage} {\@enlargefirstpagefalse}
\DeclareOption{ncc}              {\@nccfalse}%
\DeclareOption{english}          {\@englishtrue}%
\DeclareOption{bill}             {\@billtrue}%
\DeclareOption{bank}             {\@banktrue}%
\ProcessOptions\relax%
%-------------------------------------------------------------------------------
%	Define package option actions
%-------------------------------------------------------------------------------
\define@key{tletter.cls}{enlargefirstpage}[]{%
	\if\relax\detokenize{#1}\relax%
		\@enlargefirstpagefalse%
	\else%
		\ifthenelse{%
			\equal{#1}{off}%
		}{%
			\@enlargefirstpagefalse%
		}{%
			\@enlargefirstpagetrue%
			\setlength{\footskip}{0pt}%
		}%
	\fi%
}%
\newcommand{\contccinfo}{\mbox{}}%
\if@ncc%
\else
	\RequirePackage[scale=0.95]{ccicons}%
	\renewcommand*{\contccinfo}{%
		\marginnote{%
			\rotatebox{90}{%
				\color[gray]{0.85}\ccbysa{}~\footnotesize{}Georg Gentzen\selectfont%
			}%
		}[-3.455cm]%
}%
\fi%
%
\if@english%
	\RequirePackage[english]{babel}%
	\IfFileExists{invoice.sty}{%
		\usepackage[german]{invoice}%
	}{%
		\PackageWarning{tletter}{*** WARNING! It is recommended to use the invoice package as an alternativ for the included billing funtionality.***}
	}%
	\setkomavar{subject}             {This is the subject}%
	\setkomavar{from_name}           {Jane Doe}%
	\setkomavar{from_street}         {Mainstreet}%
	\setkomavar{from_city}           {Anytown}%
	\setkomavar{from_phone}          {+1 555-0100}%
	\setkomavar{from_fax}            {+1 555-0149}%
	\setkomavar{from_mobilephone}    {+1 555-0199}%
	\setkomavar{from_email}          {jane.doe@example.de}%
	\setkomavar{from_url}            {www.exapmle.com}
	\setkomavar{rec_addressee}       {\textsc{Advent Corporation}}%
	\setkomavar{rec_addressee_opt_a} {\\Advent Branch}%
	\setkomavar{rec_street}          {Highstreet}%
	\setkomavar{rec_building}        {\\Building 99}%
	\setkomavar{rec_city}            {Anyvillage}%
	\setkomavar{fin_name}            {XYZ Widget Bank}%
	\setkomavar{fin_iban_cc}         {US}%
	\setkomavar{l_f_id}              {My Ref}%
	\setkomavar{l_f_mail_date}       {My Mail}%
	\setkomavar{l_r_id}              {Your Ref}%
	\setkomavar{l_r_mail_date}       {Your Mail}%
	\setkomavar{l_f_phone}           {Phone}%
	\setkomavar{l_f_fax}             {Fax}%
	\setkomavar{l_f_phone_m}         {Mobilephone}%
	\setkomavar{l_f_email}           {E-Mail}%
	\setkomavar{l_date}              {Date}%
	\setkomavar{opening}             {Dear Sir or Madam,}%
	\setkomavar{closing}             {Yours faithfuly,}%	
	\def        \assetSum            {Total}%	
	\def        \assetSumSub         {Subtotal}%	
	\def        \assetTableLabel     {Table}%
	\def        \assetCategorie      {Category}%
	\def        \assetTableColLabels {\textbf{Item} & Sort & Brand & Quantity & Count & VAT & Price & Subtotal\expandafter\\}%
\else%
	\RequirePackage[english, ngerman]{babel}%
	\IfFileExists{invoice.sty}{%
		\usepackage[english]{invoice}%
	}{%
		\PackageWarning{tletter}{*** WARNING! It is recommended to use the invoice package as an alternativ for the included billing funtionality.***}
	}%
	\setkomavar{subject}             {Das ist die Betreffszeile}%
	\setkomavar{from_name}           {Maria Musterfrau}%
	\setkomavar{from_street}         {Musterstra{\ss}e}%
	\setkomavar{from_city}           {Musterstadt}%
	\setkomavar{from_phone}          {+49 30 45678901}%
	\setkomavar{from_fax}            {+49 30 45678956}%
	\setkomavar{from_mobilephone}    {+49 15 456789}%
	\setkomavar{from_email}          {maria.muster@muster.de}%
	\setkomavar{from_url}            {www.musterseite.com}%
	\setkomavar{rec_addressee}       {\textsc{Muster-Amt zu Musterhausen}}%
	\setkomavar{rec_addressee_opt_a} {\\Abteilung Musterhaft}%
	\setkomavar{rec_street}          {Musterweg}%
	\setkomavar{rec_building}        {\\Haus 63}%
	\setkomavar{rec_city}            {Musterhausen}%
	\setkomavar{fin_name}            {Musterbank}%
	\setkomavar{fin_iban_cc}         {DE}%
	\setkomavar{l_f_id}              {Mein Zeichen}%
	\setkomavar{l_f_mail_date}       {Meine Nachricht vom}%
	\setkomavar{l_r_id}              {Ihr Zeichen}%
	\setkomavar{l_r_mail_date}       {Ihre Nachricht vom}%
	\setkomavar{l_f_phone}           {Telefon}%
	\setkomavar{l_f_fax}             {Telefax}%
	\setkomavar{l_f_phone_m}         {Mobil}%
	\setkomavar{l_f_email}           {E-Mail}%
	\setkomavar{l_date}              {Datum}%
	\setkomavar{opening}             {Sehr geehrte Damen und Herren,}%
	\setkomavar{closing}             {Mit freundlichen Gr\"u{\ss}en}%
	\def        \assetSum            {Gesamtbetrag}%
	\def        \assetSumSub         {Gesamt}%	
	\def        \assetTableLabel     {Tabelle}%
	\def        \assetCategorie      {Kategorie}%
	\def        \assetTableColLabels {\textbf{Artikel} & Sorte & Marke & Menge & Anzahl & Mwst & Preis & Gesamt\expandafter\\}%
\fi%
\if@serialletter%
	\IfFileExists{serial.csv}{%
		\def\serialLetterOpt {on}%
	}{%
		\PackageWarning{tletter}{*** WARNING: No serial letter list existing! Deactivating serialletter option! ***}%
		\@serialletterfalse%
	}%
\fi%
\if@bill%
	\IfFileExists{assets}{%
		\def\billOpt {on}%
	}{%
		\PackageWarning{tletter}{*** WARNING: No asset list existing! Deactivating bill option! ***}%
		\@billfalse%
	}%
\fi%
%Load default values from tletterData package
\if@usetletterdata%
	\IfFileExists{tletterData.sty}{%
		\usepackage{tletterData}%
	}{%
		\PackageWarning{tletter}{*** WARNING: No default tletterData existing! ***}
	}%
\fi%
%
\define@key{tletter.cls}{fromid}[]{%
	\if\relax\detokenize{#1}\relax%
		\@fromidtrue%
		\setkomavar{from_id}{}%
	\else%
		\ifthenelse{%
			\equal{#1}{off}%
		}{%
			\@fromidfalse%
		}{%
			\@fromidtrue%
			\setkomavar{from_id}{#1}%
		}%
	\fi%	
}%
\define@key{tletter.cls}{frommaildate}[]{%
	\if\relax\detokenize{#1}\relax%
		\@frommaildatetrue%
		\setkomavar{from_mail_date}{}%
	\else%
		\ifthenelse{%
			\equal{#1}{off}%
		}{%
			\@frommaildatefalse%
		}{%
			\@frommaildatetrue%
			\setkomavar{from_mail_date}{#1}%
		}%
	\fi%
}%
\define@key{tletter.cls}{recid}[]{%
	\if\relax\detokenize{#1}\relax%
		\@recidtrue%
		\setkomavar{rec_id}{}%
	\else%
		\ifthenelse{%
			\equal{#1}{off}%
		}{%
			\@recidfalse%
		}{%
			\@recidtrue%
			\setkomavar{rec_id}{#1}%
		}%
	\fi%
}%
\define@key{tletter.cls}{recmaildate}[]{%
	\if\relax\detokenize{#1}\relax%
		\@recmaildatetrue%
		\setkomavar{rec_mail_date}{}%
	\else%
		\ifthenelse{%
			\equal{#1}{off}%
		}{%
			\@recmaildatefalse%
		}{%
			\@recmaildatetrue%
			\setkomavar{rec_mail_date}{#1}%
		}%
	\fi%
}%
\define@key{tletter.cls}{phone}[]{%
	\if\relax\detokenize{#1}\relax%
		\@phonetrue%
	\else%
		\@phonetrue%
		\setkomavar{from_phone}{#1}%
	\fi%
}%
\define@key{tletter.cls}{fax}[]{%
	\if\relax\detokenize{#1}\relax%
		\@faxtrue%
	\else%
		\@faxtrue%
		\setkomavar{from_fax}{#1}%
	\fi%
}%
\define@key{tletter.cls}{mobilephone}[]{%
	\if\relax\detokenize{#1}\relax%
		\@mobilephonetrue%
	\else%
		\@mobilephonetrue%
		\setkomavar{from_mobilephone}{#1}%
	\fi%
}%
\define@key{tletter.cls}{email}[]{%
	\if\relax\detokenize{#1}\relax%
		\@emailtrue%
	\else%
		\@emailtrue%
		\setkomavar{from_email}{#1}%
	\fi%
}%
\define@key{tletter.cls}{url}[]{%
	\if\relax\detokenize{#1}\relax%
		\@urltrue%
	\else%
		\@urltrue%
		\setkomavar{from_url}{#1}%
	\fi%
}%
\define@key{tletter.cls}{date}[]{%
	\if\relax\detokenize{#1}\relax%
		\@datetrue%
		\setkomavar{write_date}{\today}%
	\else%
		\ifthenelse{%
			\equal{#1}{off}%
		}{%
			\@datefalse%
		}{%
			\@datetrue%
			\setkomavar{write_date}{#1}%
		}%
	\fi%
}%
\ProcessOptionsX
%-------------------------------------------------------------------------------
%	Require packages
%-------------------------------------------------------------------------------
\KOMAoptions{%
	paper=a4,%
	parskip=half,% 
	foldmarks=true,% 
	foldmarks=HVP,%
	subject=left,%
	enlargefirstpage=on,%
	firstfoot=on,%
}%
%
\RequirePackage[utf8]{inputenc}%
\RequirePackage[T1]{fontenc}%
\RequirePackage[hyphens]{url}%
\RequirePackage{eurosym}%
\RequirePackage{graphicx}%
\RequirePackage{tabularx}%
\RequirePackage{booktabs}% for sophisticated tables
\RequirePackage{etoolbox}%
\RequirePackage{scrlayer-scrpage}% for heads and foots after first page
\RequirePackage{lastpage}% for number count of pages
\RequirePackage{soul}%
\RequirePackage{libertine}%
\RequirePackage{capt-of}%
\RequirePackage{lipsum}%
\RequirePackage{marginnote}%
\RequirePackage{typearea}%
\RequirePackage{arrayjob}%
\RequirePackage{xfp}%
\RequirePackage{siunitx}%
\RequirePackage[font=sc, labelfont=large]{caption}%
\RequirePackage{newfloat}%
\RequirePackage{datatool}%
\IfFileExists{efficiency.sty}{%
	\usepackage{efficiency}%
	\newcolumntype\assetTableColDef{L{0.13}L{0.14}L{0.15}R{0.08}R{0.07}R{0.07}R{0.105}R{0.105}}%
}{%
	\PackageWarning{tletter}{*** WARNING: Pleae install efficiency packages! ***}%
	\newcommand{\ts}{\thinspace}%
	\newcolumntype\assetTableColDef{lllrrrrr}
}%
%-------------------------------------------------------------------------------
%	Definition of meta data variables
%-------------------------------------------------------------------------------
\setkomavar{date}{}%unset date
\setkomavar{fromname}{\usekomavar{from_name}}%
\setkomavar{from_street_complete}{%
	\usekomavar{from_street}%
	~\usekomavar{from_street_number}%
}%
\setkomavar{fromaddress}{%
	\fontfamily{LinuxLibertineT-OsF}\selectfont%
	\usekomavar{from_street_complete}%
	\\\TOsF{\usekomavar{from_zip}}%
	~\usekomavar{from_city}%
	\fontfamily{LinuxLibertineT-TLF}\selectfont%
}% Your address
\setkomavar{fromphone}{\usekomavar{from_phone}}%
\setkomavar{fromfax}{\usekomavar{from_fax}}%
\setkomavar{frommobilephone}{\usekomavar{from_mobilephone}}%
\setkomavar{fromemail}{\usekomavar{from_email}}%
\setkomavar{fromurl}{\usekomavar{from_url}}%
%\setkomavar{ort}{\usekomavar{place}}%
\setkomavar{signature}{\usekomavar{fromname}}% Your name used in the signature
\setkomavar{from_bank}{%
	\usekomavar{fin_name}%
	\\IBAN:~\usekomavar{fin_iban_cc}%
	\pnums{\usekomavar{fin_iban_remainder}}%
	\\BIC:~\usekomavar{fin_bic}%
}%
\setkomavar{subject}{Das ist die Betreffszeile}%
\setkomavar{recipient}{%
	\fontfamily{LinuxLibertineT-OsF}\selectfont%
	\usekomavar{rec_addressee}%
	\usekomavar{rec_addressee_opt_a}%
	\usekomavar{rec_addressee_opt_b}%
	\\\usekomavar{rec_street}%
	~\usekomavar{rec_street_number}%
	\usekomavar{rec_building}%
	\\\usekomavar{rec_zip}%
	~\usekomavar{rec_city}%
	\fontfamily{LinuxLibertineT-TLF}\selectfont%
}%
%-------------------------------------------------------------------------------
%	Command Definitions
%-------------------------------------------------------------------------------
\makeatletter%
\ifdefined\setplength%
	\renewcommand*{\setplength}[1]{\@setplength{#1}}%
\else%
	\newcommand*{\setplength}[1]{\@setplength{#1}}%
\fi%
\makeatother%
\newcommand{\pnums}[1]{\proportionalnums{#1}}%
\newcommand{\pnumsf}[1]{\proportionalnumsf{#1}}%
%-------------------------------------------------------------------------------
%	Libertine/Biolinum setup
%-------------------------------------------------------------------------------
\newcommand{\TOsF}[1]{
	\fontfamily{LinuxLibertineT-OsF}\selectfont%
	#1%
	\fontfamily{LinuxLibertineT-TLF}\selectfont%
}%
\makeatletter%
\def\libertine@param{fxlf}% comment / uncomment to see the difference
\def\biolinum@param{fxbf}%
\makeatother%
%-------------------------------------------------------------------------------
%	Miscellaneous Settings
%-------------------------------------------------------------------------------
%Stop the signature from indenting
\renewcommand*{\raggedsignature}{\raggedright}% 
\newcommand\Sigline[3][t]{%
	\parbox[#1]{.65\linewidth}{\raggedright#2}%
	\parbox[#1]{.65\linewidth}{\raggedright#3}%
}%
%indention of text body
\setlength{\oddsidemargin}{\useplength{toaddrhpos}}%
\addtolength{\oddsidemargin}{-1in}%
\setlength{\textwidth}{\useplength{firstheadwidth}}%
%-------------------------------------------------------------------------------
%	Positioning: Header, Footer, Locationbox, Creative Common Info
%-------------------------------------------------------------------------------
%I'm still unsure, why 2.25pt is the perfect value for \offsetsetunknown.
\newlength{\offsetunknown}%----------POS: Mandatory for subseq. heads and foots
\setlength{\offsetunknown}{2.25pt}%
\setlength{\marginparsep} {1.35cm}%--POS: set position of creative common info--
\reversemarginpar%
\setplength{locheight}    {6cm}%-----POS: set position of location box----------
\setplength{lochpos}      {\useplength{toaddrhpos}}%
\setplength{locwidth}     {10cm}%
\setlength{\headheight}   {28.99998pt}%----POS: general settings----------------
\setlength{\footheight}   {75.49998pt}%
%\setplength{firstheadvpos}{1cm}%----POS: set position of first head is unnecc.-
\setplength{firstfootvpos}{27.2cm}%--POS: set position of footer----------------
%-------------------------------------------------------------------------------
%	Definitions: Header, Footer, Locationbox, Creative Common Info
%-------------------------------------------------------------------------------
\makeatletter%
\newcommand*{\contlocation}{%---------CONT: definition of location content------
	\footnotesize%
	\raggedleft%
	\flushleft%
	\color[gray]{.3}%
	\hfill%
	\begin{tabular}{rl}%
		\if@recid%
			{\scriptsize%
			\usekomavar{l_r_id}:}        & \pnums{\usekomavar{rec_id}}\\%
		\fi%
		\if@recmaildate%
			{\scriptsize%
			\usekomavar{l_r_mail_date}:} & \usekomavar{rec_mail_date}\\%
		\fi%
		\if@fromid%
		{\scriptsize%
			\usekomavar{l_f_id}:}        & \pnums{\usekomavar{from_id}}\\%
		\fi%
		\if@frommaildate%
		{\scriptsize%
			\usekomavar{l_f_mail_date}:} & \usekomavar{from_mail_date}\\%
		\fi%
		\\%
		\if@phone%
			{\scriptsize%
			\usekomavar{l_f_phone}:}     & \pnums{\usekomavar{fromphone}}\\%
		\fi%
		\if@fax%
			{\scriptsize%
			\usekomavar{l_f_fax}:}       & \pnums{\usekomavar{fromfax}}\\%
		\fi%
		\if@mobilephone%
			{\scriptsize%
			\usekomavar{l_f_phone_m}:}   & \pnums{\usekomavar{frommobilephone}}\\%
		\fi%
		\if@email%
			{\scriptsize%
			\usekomavar{l_f_email}:}     & {\scriptsize\usekomavar{fromemail}}\\%
		\fi%
		\if@url%
			{\scriptsize%
			Internet:}                   & {\scriptsize\usekomavar{fromurl}}\\%
		\fi%
		\\%
		\if@date%
			{\scriptsize%
			\usekomavar{l_date}:}        & \textsc{\pnums{\usekomavar{write_date}}}%
		\fi%
	\end{tabular}%
}%
\newcommand*{\conthead}{%-------------CONT: definition of head content----------
	\parbox{\useplength{firstheadwidth}}{%
		\centering%
		\textsc{\usekomavar{fromname}}\\%
		\rule[3pt]{\textwidth}{.4pt}%
	}%
}%
\newcommand*{\contfoot}{%-------------CONT: definition of foot content----------
	\parbox{\useplength{firstfootwidth}}{%
		\normalfont%
		\footnotesize%
			\begin{tabular}[t]{l@{}}% 
		\end{tabular}%
		\hfill%
		\begin{tabular}[t]{l@{}}%
		\end{tabular}%
		\hfill%
		\begin{tabular}[t]{l@{}}%
			\if@english%
				\pagemark{} of \pageref{LastPage}%
			\else%
				\pagemark{} von \pageref{LastPage}%
			\fi%
		\end{tabular}%
		\\%
		\footnotesize%
		\color[gray]{.3}%
		\contccinfo%
		\rule[3pt]{\textwidth}{.4pt}\\%
%		\vspace{-\offsetunknown}	
		\begin{tabular}[t]{l@{}}% 
			\fontfamily{LinuxLibertineT-OsF}\selectfont%
			\usekomavar{fromname}\\%
			\usekomavar{fromaddress}\\%
			\fontfamily{LinuxLibertineT-TLF}\selectfont%
		\end{tabular}%
		\hfill%
		\begin{tabular}[t]{l@{}}%
%			\usekomavar{fromphone}\\%
%			\usekomavar{fromemail}\\%
		\end{tabular}%
		\hfill%
		\begin{tabular}[t]{l@{}}%
			\if@bank%
				\usekomavar{from_bank}%
			\fi%
		\end{tabular}%
	}%
}%
\makeatother%
%-------------------------------------------------------------------------------
%	Header and footer content setup
%-------------------------------------------------------------------------------
%--INIT: Initialise packages and style for concluding heads and foots
\pagestyle{scrheadings}%
\clearscrheadfoot%
\setkomavar{location}{\contlocation}%--SETUP: Locationbox-----------------------
\setkomavar{firsthead}{%---------------SETUP: header----------------------------
	\conthead{}%
	\\%
	\centering%
	\textsc{\usekomavar{fromaddress}}%
}%
\DeclareNewLayer[%
	foreground,%
	textarea,%
	voffset=\useplength{firstheadvpos},%
	hoffset=\dimexpr.5\paperwidth-.5\useplength{firstheadwidth}\relax,%
	width=\useplength{firstheadwidth},%
	mode=picture,%
	contents=\putUL{\raisebox{\dimexpr-\height}{\conthead}}%
]{nexthead}%
\AddLayersToPageStyle{scrheadings}{nexthead}%
\setkomavar{firstfoot}{%---------------SETUP: footer----------------------------
	\contfoot%
}%
\DeclareNewLayer[%
	foreground,%
	textarea,%
	voffset=\useplength{firstfootvpos},%
	hoffset=\dimexpr.5\paperwidth-.5\useplength{firstfootwidth}\relax,%
	width=\useplength{firstfootwidth},%
	mode=picture,%
	contents=\putUL{\raisebox{\dimexpr-\height}{\contfoot}}%
]{nextfoot}%
\AddLayersToPageStyle{scrheadings}{nextfoot}%
\clearpairofpagestyles%
%-------------------------------------------------------------------------------
%	Letter environment wrapper
%-------------------------------------------------------------------------------
\newenvironment{tletter}{%
	\ifdefined\billOpt%
		\input{./assets}%
		\assetCalculation%
	\fi%
	\letter{\usekomavar{recipient}}%
	\opening{\usekomavar{opening}}%
}{%
	\endletter%
	\ifdefined\serialLetterOpt%	
		\endDTLenvforeach%
	\fi%
}%
\ifdefined\serialLetterOpt%
	\renewenvironment{tletter}{%
		\DTLloaddb{info}{serial.csv}%
		\DTLenvforeach{info}{\serOpen=Opening,\serAddre=Addresse,\serAddreOA=AddresseeOptA,\serAddreOB=AddresseeOptB,\serStreet=Street,\serNum=StreetNumber,\serBuild=Building,\serZip=Zip,\serCity=City,\serAddA=AddA,\serAddB=AddB}%
		\setkomavar{rec_addressee}       {\textsc{\serAddre}}%
		\setkomavar{rec_addressee_opt_a} {\serAddreOA}%
		\setkomavar{rec_addressee_opt_b} {\serAddreOB}%
		\setkomavar{rec_street}          {\serStreet}%
		\setkomavar{rec_street_number}   {\serNum}%
		\setkomavar{rec_building}        {}%
		\setkomavar{rec_zip}             {\serZip}%
		\setkomavar{rec_city}            {\serCity}%
		\setkomavar{opening}             {\serOpen,}%
		\setkomavar{add_a}               {\serAddA}%
		\setkomavar{add_b}               {\serAddB}%
		\letter{\usekomavar{recipient}}%
		\opening{\usekomavar{opening}}%
	}{%
		\endletter%
		\endDTLenvforeach%
	}%
\fi%
%-------------------------------------------------------------------------------
%	Bill calculation setup and definitions
%-------------------------------------------------------------------------------
%
\def \aACaption         {\assetTableLabel\ A}%
\def \aBCaption         {\assetTableLabel\ B}%
\def \aCCaption         {\assetTableLabel\ C}%
\def \aDCaption         {\assetTableLabel\ D}%
\def \aECaption         {\assetTableLabel\ E}%
\def \aFCaption         {\assetTableLabel\ F}%
\def \aGCaption         {\assetTableLabel\ G}%
\def \aHCaption         {\assetTableLabel\ H}%
\def \aICaption         {\assetTableLabel\ I}%
\def \aJCaption         {\assetTableLabel\ J}%
\def \aKCaption         {\assetTableLabel\ K}%
\def \aLCaption         {\assetTableLabel\ L}%
\def \aMCaption         {\assetTableLabel\ M}%
\def \aNCaption         {\assetTableLabel\ N}%
\def \aOCaption         {\assetTableLabel\ O}%
\def \aPCaption         {\assetTableLabel\ P}%
\def \aQCaption         {\assetTableLabel\ Q}%
\def \aRCaption         {\assetTableLabel\ R}%
\def \aSCaption         {\assetTableLabel\ S}%
\def \aTCaption         {\assetTableLabel\ T}%
\def \aUCaption         {\assetTableLabel\ U}%
\def \aVCaption         {\assetTableLabel\ V}%
\def \aWCaption         {\assetTableLabel\ W}%
\def \aXCaption         {\assetTableLabel\ X}%
\def \aYCaption         {\assetTableLabel\ Y}%
\def \aZCaption         {\assetTableLabel\ Z}%
\def \assetTableCaption {\assetTableLabel}%
\sisetup{%
	detect-all,%
	output-decimal-marker={,},%
	round-mode=places,%
	round-precision=2,%
	round-integer-to-decimal,%
}%
%
\ExplSyntaxOn%
\DeclareExpandableDocumentCommand{\IfNoValueOrEmptyTF}{mmm}%
{\IfNoValueTF{#1}{#2}{\tl_if_empty:nTF {#1} {#2} {#3}}}%
\DeclareExpandableDocumentCommand{\IfNVOETF}{mmm}%
{\IfNoValueTF{#1}{#2}{\tl_if_empty:nTF {#1} {#2} {#3}}}%
\ExplSyntaxOff%
%rowCalc Command. Actually, its only a short way to use the first 3 entries of an array
\NewDocumentCommand{\rCa}{m}{#1(1) & #1(2) & #1(3)}%
%Table Entry command
\newcommand{\assetEntry}[2]{}%
\newcommand{\assetCalculation}{}%
\newcommand{\assetTables}{}%
\newcommand{\assetTableMain}{}%
\ifdefined\billOpt%
	\renewcommand{\assetEntry}[2]{%
		\expandafter\newarray\csname #1\endcsname\readarray{#1}{#2}%
	}%
	\renewcommand{\assetCalculation}{%
		\ifdefined\aAAa\checkaAAa(1)\ifemptydata\relax\else\checkaAAa(6)\let\factorAAA\cachedata\checkaAAa(8)\let\factorAAB\cachedata\def\aAA{\fpeval{\factorAAA*\factorAAB}}\fi\else\def\aAA{0.00}\fi%
		\ifdefined\aABa\checkaABa(1)\ifemptydata\relax\else\checkaABa(6)\let\factorABA\cachedata\checkaABa(8)\let\factorABB\cachedata\def\aAB{\fpeval{\factorABA*\factorABB}}\fi\else\def\aAB{0.00}\fi%
		\ifdefined\aACa\checkaACa(1)\ifemptydata\relax\else\checkaACa(6)\let\factorACA\cachedata\checkaACa(8)\let\factorACB\cachedata\def\aAC{\fpeval{\factorACA*\factorACB}}\fi\else\def\aAC{0.00}\fi%
		\ifdefined\aADa\checkaADa(1)\ifemptydata\relax\else\checkaADa(6)\let\factorADA\cachedata\checkaADa(8)\let\factorADB\cachedata\def\aAD{\fpeval{\factorADA*\factorADB}}\fi\else\def\aAD{0.00}\fi%
		\ifdefined\aAEa\checkaAEa(1)\ifemptydata\relax\else\checkaAEa(6)\let\factorAEA\cachedata\checkaAEa(8)\let\factorAEB\cachedata\def\aAE{\fpeval{\factorAEA*\factorAEB}}\fi\else\def\aAE{0.00}\fi%
		\ifdefined\aAFa\checkaAFa(1)\ifemptydata\relax\else\checkaAFa(6)\let\factorAFA\cachedata\checkaAFa(8)\let\factorAFB\cachedata\def\aAF{\fpeval{\factorAFA*\factorAFB}}\fi\else\def\aAF{0.00}\fi%
		\ifdefined\aAGa\checkaAGa(1)\ifemptydata\relax\else\checkaAGa(6)\let\factorAGA\cachedata\checkaAGa(8)\let\factorAGB\cachedata\def\aAG{\fpeval{\factorAGA*\factorAGB}}\fi\else\def\aAG{0.00}\fi%
		\ifdefined\aAHa\checkaAHa(1)\ifemptydata\relax\else\checkaAHa(6)\let\factorAHA\cachedata\checkaAHa(8)\let\factorAHB\cachedata\def\aAH{\fpeval{\factorAHA*\factorAHB}}\fi\else\def\aAH{0.00}\fi%
		\ifdefined\aAIa\checkaAIa(1)\ifemptydata\relax\else\checkaAIa(6)\let\factorAIA\cachedata\checkaAIa(8)\let\factorAIB\cachedata\def\aAI{\fpeval{\factorAIA*\factorAIB}}\fi\else\def\aAI{0.00}\fi%
		\ifdefined\aAJa\checkaAJa(1)\ifemptydata\relax\else\checkaAJa(6)\let\factorAJA\cachedata\checkaAJa(8)\let\factorAJB\cachedata\def\aAJ{\fpeval{\factorAJA*\factorAJB}}\fi\else\def\aAJ{0.00}\fi%
		\ifdefined\aAKa\checkaAKa(1)\ifemptydata\relax\else\checkaAKa(6)\let\factorAKA\cachedata\checkaAKa(8)\let\factorAKB\cachedata\def\aAK{\fpeval{\factorAKA*\factorAKB}}\fi\else\def\aAK{0.00}\fi%
		\ifdefined\aALa\checkaALa(1)\ifemptydata\relax\else\checkaALa(6)\let\factorALA\cachedata\checkaALa(8)\let\factorALB\cachedata\def\aAL{\fpeval{\factorALA*\factorALB}}\fi\else\def\aAL{0.00}\fi%
		\ifdefined\aAMa\checkaAMa(1)\ifemptydata\relax\else\checkaAMa(6)\let\factorAMA\cachedata\checkaAMa(8)\let\factorAMB\cachedata\def\aAM{\fpeval{\factorAMA*\factorAMB}}\fi\else\def\aAM{0.00}\fi%
		\ifdefined\aANa\checkaANa(1)\ifemptydata\relax\else\checkaANa(6)\let\factorANA\cachedata\checkaANa(8)\let\factorANB\cachedata\def\aAN{\fpeval{\factorANA*\factorANB}}\fi\else\def\aAN{0.00}\fi%
		\ifdefined\aAOa\checkaAOa(1)\ifemptydata\relax\else\checkaAOa(6)\let\factorAOA\cachedata\checkaAOa(8)\let\factorAOB\cachedata\def\aAO{\fpeval{\factorAOA*\factorAOB}}\fi\else\def\aAO{0.00}\fi%
		\ifdefined\aAPa\checkaAPa(1)\ifemptydata\relax\else\checkaAPa(6)\let\factorAPA\cachedata\checkaAPa(8)\let\factorAPB\cachedata\def\aAP{\fpeval{\factorAPA*\factorAPB}}\fi\else\def\aAP{0.00}\fi%
		\ifdefined\aAQa\checkaAQa(1)\ifemptydata\relax\else\checkaAQa(6)\let\factorAQA\cachedata\checkaAQa(8)\let\factorAQB\cachedata\def\aAQ{\fpeval{\factorAQA*\factorAQB}}\fi\else\def\aAQ{0.00}\fi%
		\ifdefined\aARa\checkaARa(1)\ifemptydata\relax\else\checkaARa(6)\let\factorARA\cachedata\checkaARa(8)\let\factorARB\cachedata\def\aAR{\fpeval{\factorARA*\factorARB}}\fi\else\def\aAR{0.00}\fi%
		\ifdefined\aASa\checkaASa(1)\ifemptydata\relax\else\checkaASa(6)\let\factorASA\cachedata\checkaASa(8)\let\factorASB\cachedata\def\aAS{\fpeval{\factorASA*\factorASB}}\fi\else\def\aAS{0.00}\fi%
		\ifdefined\aATa\checkaATa(1)\ifemptydata\relax\else\checkaATa(6)\let\factorATA\cachedata\checkaATa(8)\let\factorATB\cachedata\def\aAT{\fpeval{\factorATA*\factorATB}}\fi\else\def\aAT{0.00}\fi%
		\ifdefined\aAUa\checkaAUa(1)\ifemptydata\relax\else\checkaAUa(6)\let\factorAUA\cachedata\checkaAUa(8)\let\factorAUB\cachedata\def\aAU{\fpeval{\factorAUA*\factorAUB}}\fi\else\def\aAU{0.00}\fi%
		\ifdefined\aAVa\checkaAVa(1)\ifemptydata\relax\else\checkaAVa(6)\let\factorAVA\cachedata\checkaAVa(8)\let\factorAVB\cachedata\def\aAV{\fpeval{\factorAVA*\factorAVB}}\fi\else\def\aAV{0.00}\fi%
		\ifdefined\aAWa\checkaAWa(1)\ifemptydata\relax\else\checkaAWa(6)\let\factorAWA\cachedata\checkaAWa(8)\let\factorAWB\cachedata\def\aAW{\fpeval{\factorAWA*\factorAWB}}\fi\else\def\aAW{0.00}\fi%
		\ifdefined\aAXa\checkaAXa(1)\ifemptydata\relax\else\checkaAXa(6)\let\factorAXA\cachedata\checkaAXa(8)\let\factorAXB\cachedata\def\aAX{\fpeval{\factorAXA*\factorAXB}}\fi\else\def\aAX{0.00}\fi%
		\ifdefined\aAYa\checkaAYa(1)\ifemptydata\relax\else\checkaAYa(6)\let\factorAYA\cachedata\checkaAYa(8)\let\factorAYB\cachedata\def\aAY{\fpeval{\factorAYA*\factorAYB}}\fi\else\def\aAY{0.00}\fi%
		\ifdefined\aAZa\checkaAZa(1)\ifemptydata\relax\else\checkaAZa(6)\let\factorAZA\cachedata\checkaAZa(8)\let\factorAZB\cachedata\def\aAZ{\fpeval{\factorAZA*\factorAZB}}\fi\else\def\aAZ{0.00}\fi%
%
		\ifdefined\aBAa\checkaBAa(1)\ifemptydata\relax\else\checkaBAa(6)\let\factorBAA\cachedata\checkaBAa(8)\let\factorBAB\cachedata\def\aBA{\fpeval{\factorBAA*\factorBAB}}\fi\else\def\aBA{0.00}\fi%
		\ifdefined\aBBa\checkaBBa(1)\ifemptydata\relax\else\checkaBBa(6)\let\factorBBA\cachedata\checkaBBa(8)\let\factorBBB\cachedata\def\aBB{\fpeval{\factorBBA*\factorBBB}}\fi\else\def\aBB{0.00}\fi%
		\ifdefined\aBCa\checkaBCa(1)\ifemptydata\relax\else\checkaBCa(6)\let\factorBCA\cachedata\checkaBCa(8)\let\factorBCB\cachedata\def\aBC{\fpeval{\factorBCA*\factorBCB}}\fi\else\def\aBC{0.00}\fi%
		\ifdefined\aBDa\checkaBDa(1)\ifemptydata\relax\else\checkaBDa(6)\let\factorBDA\cachedata\checkaBDa(8)\let\factorBDB\cachedata\def\aBD{\fpeval{\factorBDA*\factorBDB}}\fi\else\def\aBD{0.00}\fi%
		\ifdefined\aBEa\checkaBEa(1)\ifemptydata\relax\else\checkaBEa(6)\let\factorBEA\cachedata\checkaBEa(8)\let\factorBEB\cachedata\def\aBE{\fpeval{\factorBEA*\factorBEB}}\fi\else\def\aBE{0.00}\fi%
		\ifdefined\aBFa\checkaBFa(1)\ifemptydata\relax\else\checkaBFa(6)\let\factorBFA\cachedata\checkaBFa(8)\let\factorBFB\cachedata\def\aBF{\fpeval{\factorBFA*\factorBFB}}\fi\else\def\aBF{0.00}\fi%
		\ifdefined\aBGa\checkaBGa(1)\ifemptydata\relax\else\checkaBGa(6)\let\factorBGA\cachedata\checkaBGa(8)\let\factorBGB\cachedata\def\aBG{\fpeval{\factorBGA*\factorBGB}}\fi\else\def\aBG{0.00}\fi%
		\ifdefined\aBHa\checkaBHa(1)\ifemptydata\relax\else\checkaBHa(6)\let\factorBHA\cachedata\checkaBHa(8)\let\factorBHB\cachedata\def\aBH{\fpeval{\factorBHA*\factorBHB}}\fi\else\def\aBH{0.00}\fi%
		\ifdefined\aBIa\checkaBIa(1)\ifemptydata\relax\else\checkaBIa(6)\let\factorBIA\cachedata\checkaBIa(8)\let\factorBIB\cachedata\def\aBI{\fpeval{\factorBIA*\factorBIB}}\fi\else\def\aBI{0.00}\fi%
		\ifdefined\aBJa\checkaBJa(1)\ifemptydata\relax\else\checkaBJa(6)\let\factorBJA\cachedata\checkaBJa(8)\let\factorBJB\cachedata\def\aBJ{\fpeval{\factorBJA*\factorBJB}}\fi\else\def\aBJ{0.00}\fi%
		\ifdefined\aBKa\checkaBKa(1)\ifemptydata\relax\else\checkaBKa(6)\let\factorBKA\cachedata\checkaBKa(8)\let\factorBKB\cachedata\def\aBK{\fpeval{\factorBKA*\factorBKB}}\fi\else\def\aBK{0.00}\fi%
		\ifdefined\aBLa\checkaBLa(1)\ifemptydata\relax\else\checkaBLa(6)\let\factorBLA\cachedata\checkaBLa(8)\let\factorBLB\cachedata\def\aBL{\fpeval{\factorBLA*\factorBLB}}\fi\else\def\aBL{0.00}\fi%
		\ifdefined\aBMa\checkaBMa(1)\ifemptydata\relax\else\checkaBMa(6)\let\factorBMA\cachedata\checkaBMa(8)\let\factorBMB\cachedata\def\aBM{\fpeval{\factorBMA*\factorBMB}}\fi\else\def\aBM{0.00}\fi%
		\ifdefined\aBNa\checkaBNa(1)\ifemptydata\relax\else\checkaBNa(6)\let\factorBNA\cachedata\checkaBNa(8)\let\factorBNB\cachedata\def\aBN{\fpeval{\factorBNA*\factorBNB}}\fi\else\def\aBN{0.00}\fi%
		\ifdefined\aBOa\checkaBOa(1)\ifemptydata\relax\else\checkaBOa(6)\let\factorBOA\cachedata\checkaBOa(8)\let\factorBOB\cachedata\def\aBO{\fpeval{\factorBOA*\factorBOB}}\fi\else\def\aBO{0.00}\fi%
		\ifdefined\aBPa\checkaBPa(1)\ifemptydata\relax\else\checkaBPa(6)\let\factorBPA\cachedata\checkaBPa(8)\let\factorBPB\cachedata\def\aBP{\fpeval{\factorBPA*\factorBPB}}\fi\else\def\aBP{0.00}\fi%
		\ifdefined\aBQa\checkaBQa(1)\ifemptydata\relax\else\checkaBQa(6)\let\factorBQA\cachedata\checkaBQa(8)\let\factorBQB\cachedata\def\aBQ{\fpeval{\factorBQA*\factorBQB}}\fi\else\def\aBQ{0.00}\fi%
		\ifdefined\aBRa\checkaBRa(1)\ifemptydata\relax\else\checkaBRa(6)\let\factorBRA\cachedata\checkaBRa(8)\let\factorBRB\cachedata\def\aBR{\fpeval{\factorBRA*\factorBRB}}\fi\else\def\aBR{0.00}\fi%
		\ifdefined\aBSa\checkaBSa(1)\ifemptydata\relax\else\checkaBSa(6)\let\factorBSA\cachedata\checkaBSa(8)\let\factorBSB\cachedata\def\aBS{\fpeval{\factorBSA*\factorBSB}}\fi\else\def\aBS{0.00}\fi%
		\ifdefined\aBTa\checkaBTa(1)\ifemptydata\relax\else\checkaBTa(6)\let\factorBTA\cachedata\checkaBTa(8)\let\factorBTB\cachedata\def\aBT{\fpeval{\factorBTA*\factorBTB}}\fi\else\def\aBT{0.00}\fi%
		\ifdefined\aBUa\checkaBUa(1)\ifemptydata\relax\else\checkaBUa(6)\let\factorBUA\cachedata\checkaBUa(8)\let\factorBUB\cachedata\def\aBU{\fpeval{\factorBUA*\factorBUB}}\fi\else\def\aBU{0.00}\fi%
		\ifdefined\aBVa\checkaBVa(1)\ifemptydata\relax\else\checkaBVa(6)\let\factorBVA\cachedata\checkaBVa(8)\let\factorBVB\cachedata\def\aBV{\fpeval{\factorBVA*\factorBVB}}\fi\else\def\aBV{0.00}\fi%
		\ifdefined\aBWa\checkaBWa(1)\ifemptydata\relax\else\checkaBWa(6)\let\factorBWA\cachedata\checkaBWa(8)\let\factorBWB\cachedata\def\aBW{\fpeval{\factorBWA*\factorBWB}}\fi\else\def\aBW{0.00}\fi%
		\ifdefined\aBXa\checkaBXa(1)\ifemptydata\relax\else\checkaBXa(6)\let\factorBXA\cachedata\checkaBXa(8)\let\factorBXB\cachedata\def\aBX{\fpeval{\factorBXA*\factorBXB}}\fi\else\def\aBX{0.00}\fi%
		\ifdefined\aBYa\checkaBYa(1)\ifemptydata\relax\else\checkaBYa(6)\let\factorBYA\cachedata\checkaBYa(8)\let\factorBYB\cachedata\def\aBY{\fpeval{\factorBYA*\factorBYB}}\fi\else\def\aBY{0.00}\fi%
		\ifdefined\aBZa\checkaBZa(1)\ifemptydata\relax\else\checkaBZa(6)\let\factorBZA\cachedata\checkaBZa(8)\let\factorBZB\cachedata\def\aBZ{\fpeval{\factorBZA*\factorBZB}}\fi\else\def\aBZ{0.00}\fi%
%
		\ifdefined\aCAa\checkaCAa(1)\ifemptydata\relax\else\checkaCAa(6)\let\factorCAA\cachedata\checkaCAa(8)\let\factorCAB\cachedata\def\aCA{\fpeval{\factorCAA*\factorCAB}}\fi\else\def\aCA{0.00}\fi%
		\ifdefined\aCBa\checkaCBa(1)\ifemptydata\relax\else\checkaCBa(6)\let\factorCBA\cachedata\checkaCBa(8)\let\factorCBB\cachedata\def\aCB{\fpeval{\factorCBA*\factorCBB}}\fi\else\def\aCB{0.00}\fi%
		\ifdefined\aCCa\checkaCCa(1)\ifemptydata\relax\else\checkaCCa(6)\let\factorCCA\cachedata\checkaCCa(8)\let\factorCCB\cachedata\def\aCC{\fpeval{\factorCCA*\factorCCB}}\fi\else\def\aCC{0.00}\fi%
		\ifdefined\aCDa\checkaCDa(1)\ifemptydata\relax\else\checkaCDa(6)\let\factorCDA\cachedata\checkaCDa(8)\let\factorCDB\cachedata\def\aCD{\fpeval{\factorCDA*\factorCDB}}\fi\else\def\aCD{0.00}\fi%
		\ifdefined\aCEa\checkaCEa(1)\ifemptydata\relax\else\checkaCEa(6)\let\factorCEA\cachedata\checkaCEa(8)\let\factorCEB\cachedata\def\aCE{\fpeval{\factorCEA*\factorCEB}}\fi\else\def\aCE{0.00}\fi%
		\ifdefined\aCFa\checkaCFa(1)\ifemptydata\relax\else\checkaCFa(6)\let\factorCFA\cachedata\checkaCFa(8)\let\factorCFB\cachedata\def\aCF{\fpeval{\factorCFA*\factorCFB}}\fi\else\def\aCF{0.00}\fi%
		\ifdefined\aCGa\checkaCGa(1)\ifemptydata\relax\else\checkaCGa(6)\let\factorCGA\cachedata\checkaCGa(8)\let\factorCGB\cachedata\def\aCG{\fpeval{\factorCGA*\factorCGB}}\fi\else\def\aCG{0.00}\fi%
		\ifdefined\aCHa\checkaCHa(1)\ifemptydata\relax\else\checkaCHa(6)\let\factorCHA\cachedata\checkaCHa(8)\let\factorCHB\cachedata\def\aCH{\fpeval{\factorCHA*\factorCHB}}\fi\else\def\aCH{0.00}\fi%
		\ifdefined\aCIa\checkaCIa(1)\ifemptydata\relax\else\checkaCIa(6)\let\factorCIA\cachedata\checkaCIa(8)\let\factorCIB\cachedata\def\aCI{\fpeval{\factorCIA*\factorCIB}}\fi\else\def\aCI{0.00}\fi%
		\ifdefined\aCJa\checkaCJa(1)\ifemptydata\relax\else\checkaCJa(6)\let\factorCJA\cachedata\checkaCJa(8)\let\factorCJB\cachedata\def\aCJ{\fpeval{\factorCJA*\factorCJB}}\fi\else\def\aCJ{0.00}\fi%
		\ifdefined\aCKa\checkaCKa(1)\ifemptydata\relax\else\checkaCKa(6)\let\factorCKA\cachedata\checkaCKa(8)\let\factorCKB\cachedata\def\aCK{\fpeval{\factorCKA*\factorCKB}}\fi\else\def\aCK{0.00}\fi%
		\ifdefined\aCLa\checkaCLa(1)\ifemptydata\relax\else\checkaCLa(6)\let\factorCLA\cachedata\checkaCLa(8)\let\factorCLB\cachedata\def\aCL{\fpeval{\factorCLA*\factorCLB}}\fi\else\def\aCL{0.00}\fi%
		\ifdefined\aCMa\checkaCMa(1)\ifemptydata\relax\else\checkaCMa(6)\let\factorCMA\cachedata\checkaCMa(8)\let\factorCMB\cachedata\def\aCM{\fpeval{\factorCMA*\factorCMB}}\fi\else\def\aCM{0.00}\fi%
		\ifdefined\aCNa\checkaCNa(1)\ifemptydata\relax\else\checkaCNa(6)\let\factorCNA\cachedata\checkaCNa(8)\let\factorCNB\cachedata\def\aCN{\fpeval{\factorCNA*\factorCNB}}\fi\else\def\aCN{0.00}\fi%
		\ifdefined\aCOa\checkaCOa(1)\ifemptydata\relax\else\checkaCOa(6)\let\factorCOA\cachedata\checkaCOa(8)\let\factorCOB\cachedata\def\aCO{\fpeval{\factorCOA*\factorCOB}}\fi\else\def\aCO{0.00}\fi%
		\ifdefined\aCPa\checkaCPa(1)\ifemptydata\relax\else\checkaCPa(6)\let\factorCPA\cachedata\checkaCPa(8)\let\factorCPB\cachedata\def\aCP{\fpeval{\factorCPA*\factorCPB}}\fi\else\def\aCP{0.00}\fi%
		\ifdefined\aCQa\checkaCQa(1)\ifemptydata\relax\else\checkaCQa(6)\let\factorCQA\cachedata\checkaCQa(8)\let\factorCQB\cachedata\def\aCQ{\fpeval{\factorCQA*\factorCQB}}\fi\else\def\aCQ{0.00}\fi%
		\ifdefined\aCRa\checkaCRa(1)\ifemptydata\relax\else\checkaCRa(6)\let\factorCRA\cachedata\checkaCRa(8)\let\factorCRB\cachedata\def\aCR{\fpeval{\factorCRA*\factorCRB}}\fi\else\def\aCR{0.00}\fi%
		\ifdefined\aCSa\checkaCSa(1)\ifemptydata\relax\else\checkaCSa(6)\let\factorCSA\cachedata\checkaCSa(8)\let\factorCSB\cachedata\def\aCS{\fpeval{\factorCSA*\factorCSB}}\fi\else\def\aCS{0.00}\fi%
		\ifdefined\aCTa\checkaCTa(1)\ifemptydata\relax\else\checkaCTa(6)\let\factorCTA\cachedata\checkaCTa(8)\let\factorCTB\cachedata\def\aCT{\fpeval{\factorCTA*\factorCTB}}\fi\else\def\aCT{0.00}\fi%
		\ifdefined\aCUa\checkaCUa(1)\ifemptydata\relax\else\checkaCUa(6)\let\factorCUA\cachedata\checkaCUa(8)\let\factorCUB\cachedata\def\aCU{\fpeval{\factorCUA*\factorCUB}}\fi\else\def\aCU{0.00}\fi%
		\ifdefined\aCVa\checkaCVa(1)\ifemptydata\relax\else\checkaCVa(6)\let\factorCVA\cachedata\checkaCVa(8)\let\factorCVB\cachedata\def\aCV{\fpeval{\factorCVA*\factorCVB}}\fi\else\def\aCV{0.00}\fi%
		\ifdefined\aCWa\checkaCWa(1)\ifemptydata\relax\else\checkaCWa(6)\let\factorCWA\cachedata\checkaCWa(8)\let\factorCWB\cachedata\def\aCW{\fpeval{\factorCWA*\factorCWB}}\fi\else\def\aCW{0.00}\fi%
		\ifdefined\aCXa\checkaCXa(1)\ifemptydata\relax\else\checkaCXa(6)\let\factorCXA\cachedata\checkaCXa(8)\let\factorCXB\cachedata\def\aCX{\fpeval{\factorCXA*\factorCXB}}\fi\else\def\aCX{0.00}\fi%
		\ifdefined\aCYa\checkaCYa(1)\ifemptydata\relax\else\checkaCYa(6)\let\factorCYA\cachedata\checkaCYa(8)\let\factorCYB\cachedata\def\aCY{\fpeval{\factorCYA*\factorCYB}}\fi\else\def\aCY{0.00}\fi%
		\ifdefined\aCZa\checkaCZa(1)\ifemptydata\relax\else\checkaCZa(6)\let\factorCZA\cachedata\checkaCZa(8)\let\factorCZB\cachedata\def\aCZ{\fpeval{\factorCZA*\factorCZB}}\fi\else\def\aCZ{0.00}\fi%
%
		\ifdefined\aDAa\checkaDAa(1)\ifemptydata\relax\else\checkaDAa(6)\let\factorDAA\cachedata\checkaDAa(8)\let\factorDAB\cachedata\def\aDA{\fpeval{\factorDAA*\factorDAB}}\fi\else\def\aDA{0.00}\fi%
		\ifdefined\aDBa\checkaDBa(1)\ifemptydata\relax\else\checkaDBa(6)\let\factorDBA\cachedata\checkaDBa(8)\let\factorDBB\cachedata\def\aDB{\fpeval{\factorDBA*\factorDBB}}\fi\else\def\aDB{0.00}\fi%
		\ifdefined\aDCa\checkaDCa(1)\ifemptydata\relax\else\checkaDCa(6)\let\factorDCA\cachedata\checkaDCa(8)\let\factorDCB\cachedata\def\aDC{\fpeval{\factorDCA*\factorDCB}}\fi\else\def\aDC{0.00}\fi%
		\ifdefined\aDDa\checkaDDa(1)\ifemptydata\relax\else\checkaDDa(6)\let\factorDDA\cachedata\checkaDDa(8)\let\factorDDB\cachedata\def\aDD{\fpeval{\factorDDA*\factorDDB}}\fi\else\def\aDD{0.00}\fi%
		\ifdefined\aDEa\checkaDEa(1)\ifemptydata\relax\else\checkaDEa(6)\let\factorDEA\cachedata\checkaDEa(8)\let\factorDEB\cachedata\def\aDE{\fpeval{\factorDEA*\factorDEB}}\fi\else\def\aDE{0.00}\fi%
		\ifdefined\aDFa\checkaDFa(1)\ifemptydata\relax\else\checkaDFa(6)\let\factorDFA\cachedata\checkaDFa(8)\let\factorDFB\cachedata\def\aDF{\fpeval{\factorDFA*\factorDFB}}\fi\else\def\aDF{0.00}\fi%
		\ifdefined\aDGa\checkaDGa(1)\ifemptydata\relax\else\checkaDGa(6)\let\factorDGA\cachedata\checkaDGa(8)\let\factorDGB\cachedata\def\aDG{\fpeval{\factorDGA*\factorDGB}}\fi\else\def\aDG{0.00}\fi%
		\ifdefined\aDHa\checkaDHa(1)\ifemptydata\relax\else\checkaDHa(6)\let\factorDHA\cachedata\checkaDHa(8)\let\factorDHB\cachedata\def\aDH{\fpeval{\factorDHA*\factorDHB}}\fi\else\def\aDH{0.00}\fi%
		\ifdefined\aDIa\checkaDIa(1)\ifemptydata\relax\else\checkaDIa(6)\let\factorDIA\cachedata\checkaDIa(8)\let\factorDIB\cachedata\def\aDI{\fpeval{\factorDIA*\factorDIB}}\fi\else\def\aDI{0.00}\fi%
		\ifdefined\aDJa\checkaDJa(1)\ifemptydata\relax\else\checkaDJa(6)\let\factorDJA\cachedata\checkaDJa(8)\let\factorDJB\cachedata\def\aDJ{\fpeval{\factorDJA*\factorDJB}}\fi\else\def\aDJ{0.00}\fi%
		\ifdefined\aDKa\checkaDKa(1)\ifemptydata\relax\else\checkaDKa(6)\let\factorDKA\cachedata\checkaDKa(8)\let\factorDKB\cachedata\def\aDK{\fpeval{\factorDKA*\factorDKB}}\fi\else\def\aDK{0.00}\fi%
		\ifdefined\aDLa\checkaDLa(1)\ifemptydata\relax\else\checkaDLa(6)\let\factorDLA\cachedata\checkaDLa(8)\let\factorDLB\cachedata\def\aDL{\fpeval{\factorDLA*\factorDLB}}\fi\else\def\aDL{0.00}\fi%
		\ifdefined\aDMa\checkaDMa(1)\ifemptydata\relax\else\checkaDMa(6)\let\factorDMA\cachedata\checkaDMa(8)\let\factorDMB\cachedata\def\aDM{\fpeval{\factorDMA*\factorDMB}}\fi\else\def\aDM{0.00}\fi%
		\ifdefined\aDNa\checkaDNa(1)\ifemptydata\relax\else\checkaDNa(6)\let\factorDNA\cachedata\checkaDNa(8)\let\factorDNB\cachedata\def\aDN{\fpeval{\factorDNA*\factorDNB}}\fi\else\def\aDN{0.00}\fi%
		\ifdefined\aDOa\checkaDOa(1)\ifemptydata\relax\else\checkaDOa(6)\let\factorDOA\cachedata\checkaDOa(8)\let\factorDOB\cachedata\def\aDO{\fpeval{\factorDOA*\factorDOB}}\fi\else\def\aDO{0.00}\fi%
		\ifdefined\aDPa\checkaDPa(1)\ifemptydata\relax\else\checkaDPa(6)\let\factorDPA\cachedata\checkaDPa(8)\let\factorDPB\cachedata\def\aDP{\fpeval{\factorDPA*\factorDPB}}\fi\else\def\aDP{0.00}\fi%
		\ifdefined\aDQa\checkaDQa(1)\ifemptydata\relax\else\checkaDQa(6)\let\factorDQA\cachedata\checkaDQa(8)\let\factorDQB\cachedata\def\aDQ{\fpeval{\factorDQA*\factorDQB}}\fi\else\def\aDQ{0.00}\fi%
		\ifdefined\aDRa\checkaDRa(1)\ifemptydata\relax\else\checkaDRa(6)\let\factorDRA\cachedata\checkaDRa(8)\let\factorDRB\cachedata\def\aDR{\fpeval{\factorDRA*\factorDRB}}\fi\else\def\aDR{0.00}\fi%
		\ifdefined\aDSa\checkaDSa(1)\ifemptydata\relax\else\checkaDSa(6)\let\factorDSA\cachedata\checkaDSa(8)\let\factorDSB\cachedata\def\aDS{\fpeval{\factorDSA*\factorDSB}}\fi\else\def\aDS{0.00}\fi%
		\ifdefined\aDTa\checkaDTa(1)\ifemptydata\relax\else\checkaDTa(6)\let\factorDTA\cachedata\checkaDTa(8)\let\factorDTB\cachedata\def\aDT{\fpeval{\factorDTA*\factorDTB}}\fi\else\def\aDT{0.00}\fi%
		\ifdefined\aDUa\checkaDUa(1)\ifemptydata\relax\else\checkaDUa(6)\let\factorDUA\cachedata\checkaDUa(8)\let\factorDUB\cachedata\def\aDU{\fpeval{\factorDUA*\factorDUB}}\fi\else\def\aDU{0.00}\fi%
		\ifdefined\aDVa\checkaDVa(1)\ifemptydata\relax\else\checkaDVa(6)\let\factorDVA\cachedata\checkaDVa(8)\let\factorDVB\cachedata\def\aDV{\fpeval{\factorDVA*\factorDVB}}\fi\else\def\aDV{0.00}\fi%
		\ifdefined\aDWa\checkaDWa(1)\ifemptydata\relax\else\checkaDWa(6)\let\factorDWA\cachedata\checkaDWa(8)\let\factorDWB\cachedata\def\aDW{\fpeval{\factorDWA*\factorDWB}}\fi\else\def\aDW{0.00}\fi%
		\ifdefined\aDXa\checkaDXa(1)\ifemptydata\relax\else\checkaDXa(6)\let\factorDXA\cachedata\checkaDXa(8)\let\factorDXB\cachedata\def\aDX{\fpeval{\factorDXA*\factorDXB}}\fi\else\def\aDX{0.00}\fi%
		\ifdefined\aDYa\checkaDYa(1)\ifemptydata\relax\else\checkaDYa(6)\let\factorDYA\cachedata\checkaDYa(8)\let\factorDYB\cachedata\def\aDY{\fpeval{\factorDYA*\factorDYB}}\fi\else\def\aDY{0.00}\fi%
		\ifdefined\aDZa\checkaDZa(1)\ifemptydata\relax\else\checkaDZa(6)\let\factorDZA\cachedata\checkaDZa(8)\let\factorDZB\cachedata\def\aDZ{\fpeval{\factorDZA*\factorDZB}}\fi\else\def\aDZ{0.00}\fi%
%
		\ifdefined\aEAa\checkaEAa(1)\ifemptydata\relax\else\checkaEAa(6)\let\factorEAA\cachedata\checkaEAa(8)\let\factorEAB\cachedata\def\aEA{\fpeval{\factorEAA*\factorEAB}}\fi\else\def\aEA{0.00}\fi%
		\ifdefined\aEBa\checkaEBa(1)\ifemptydata\relax\else\checkaEBa(6)\let\factorEBA\cachedata\checkaEBa(8)\let\factorEBB\cachedata\def\aEB{\fpeval{\factorEBA*\factorEBB}}\fi\else\def\aEB{0.00}\fi%
		\ifdefined\aECa\checkaECa(1)\ifemptydata\relax\else\checkaECa(6)\let\factorECA\cachedata\checkaECa(8)\let\factorECB\cachedata\def\aEC{\fpeval{\factorECA*\factorECB}}\fi\else\def\aEC{0.00}\fi%
		\ifdefined\aEDa\checkaEDa(1)\ifemptydata\relax\else\checkaEDa(6)\let\factorEDA\cachedata\checkaEDa(8)\let\factorEDB\cachedata\def\aED{\fpeval{\factorEDA*\factorEDB}}\fi\else\def\aED{0.00}\fi%
		\ifdefined\aEEa\checkaEEa(1)\ifemptydata\relax\else\checkaEEa(6)\let\factorEEA\cachedata\checkaEEa(8)\let\factorEEB\cachedata\def\aEE{\fpeval{\factorEEA*\factorEEB}}\fi\else\def\aEE{0.00}\fi%
		\ifdefined\aEFa\checkaEFa(1)\ifemptydata\relax\else\checkaEFa(6)\let\factorEFA\cachedata\checkaEFa(8)\let\factorEFB\cachedata\def\aEF{\fpeval{\factorEFA*\factorEFB}}\fi\else\def\aEF{0.00}\fi%
		\ifdefined\aEGa\checkaEGa(1)\ifemptydata\relax\else\checkaEGa(6)\let\factorEGA\cachedata\checkaEGa(8)\let\factorEGB\cachedata\def\aEG{\fpeval{\factorEGA*\factorEGB}}\fi\else\def\aEG{0.00}\fi%
		\ifdefined\aEHa\checkaEHa(1)\ifemptydata\relax\else\checkaEHa(6)\let\factorEHA\cachedata\checkaEHa(8)\let\factorEHB\cachedata\def\aEH{\fpeval{\factorEHA*\factorEHB}}\fi\else\def\aEH{0.00}\fi%
		\ifdefined\aEIa\checkaEIa(1)\ifemptydata\relax\else\checkaEIa(6)\let\factorEIA\cachedata\checkaEIa(8)\let\factorEIB\cachedata\def\aEI{\fpeval{\factorEIA*\factorEIB}}\fi\else\def\aEI{0.00}\fi%
		\ifdefined\aEJa\checkaEJa(1)\ifemptydata\relax\else\checkaEJa(6)\let\factorEJA\cachedata\checkaEJa(8)\let\factorEJB\cachedata\def\aEJ{\fpeval{\factorEJA*\factorEJB}}\fi\else\def\aEJ{0.00}\fi%
		\ifdefined\aEKa\checkaEKa(1)\ifemptydata\relax\else\checkaEKa(6)\let\factorEKA\cachedata\checkaEKa(8)\let\factorEKB\cachedata\def\aEK{\fpeval{\factorEKA*\factorEKB}}\fi\else\def\aEK{0.00}\fi%
		\ifdefined\aELa\checkaELa(1)\ifemptydata\relax\else\checkaELa(6)\let\factorELA\cachedata\checkaELa(8)\let\factorELB\cachedata\def\aEL{\fpeval{\factorELA*\factorELB}}\fi\else\def\aEL{0.00}\fi%
		\ifdefined\aEMa\checkaEMa(1)\ifemptydata\relax\else\checkaEMa(6)\let\factorEMA\cachedata\checkaEMa(8)\let\factorEMB\cachedata\def\aEM{\fpeval{\factorEMA*\factorEMB}}\fi\else\def\aEM{0.00}\fi%
		\ifdefined\aENa\checkaENa(1)\ifemptydata\relax\else\checkaENa(6)\let\factorENA\cachedata\checkaENa(8)\let\factorENB\cachedata\def\aEN{\fpeval{\factorENA*\factorENB}}\fi\else\def\aEN{0.00}\fi%
		\ifdefined\aEOa\checkaEOa(1)\ifemptydata\relax\else\checkaEOa(6)\let\factorEOA\cachedata\checkaEOa(8)\let\factorEOB\cachedata\def\aEO{\fpeval{\factorEOA*\factorEOB}}\fi\else\def\aEO{0.00}\fi%
		\ifdefined\aEPa\checkaEPa(1)\ifemptydata\relax\else\checkaEPa(6)\let\factorEPA\cachedata\checkaEPa(8)\let\factorEPB\cachedata\def\aEP{\fpeval{\factorEPA*\factorEPB}}\fi\else\def\aEP{0.00}\fi%
		\ifdefined\aEQa\checkaEQa(1)\ifemptydata\relax\else\checkaEQa(6)\let\factorEQA\cachedata\checkaEQa(8)\let\factorEQB\cachedata\def\aEQ{\fpeval{\factorEQA*\factorEQB}}\fi\else\def\aEQ{0.00}\fi%
		\ifdefined\aERa\checkaERa(1)\ifemptydata\relax\else\checkaERa(6)\let\factorERA\cachedata\checkaERa(8)\let\factorERB\cachedata\def\aER{\fpeval{\factorERA*\factorERB}}\fi\else\def\aER{0.00}\fi%
		\ifdefined\aESa\checkaESa(1)\ifemptydata\relax\else\checkaESa(6)\let\factorESA\cachedata\checkaESa(8)\let\factorESB\cachedata\def\aES{\fpeval{\factorESA*\factorESB}}\fi\else\def\aES{0.00}\fi%
		\ifdefined\aETa\checkaETa(1)\ifemptydata\relax\else\checkaETa(6)\let\factorETA\cachedata\checkaETa(8)\let\factorETB\cachedata\def\aET{\fpeval{\factorETA*\factorETB}}\fi\else\def\aET{0.00}\fi%
		\ifdefined\aEUa\checkaEUa(1)\ifemptydata\relax\else\checkaEUa(6)\let\factorEUA\cachedata\checkaEUa(8)\let\factorEUB\cachedata\def\aEU{\fpeval{\factorEUA*\factorEUB}}\fi\else\def\aEU{0.00}\fi%
		\ifdefined\aEVa\checkaEVa(1)\ifemptydata\relax\else\checkaEVa(6)\let\factorEVA\cachedata\checkaEVa(8)\let\factorEVB\cachedata\def\aEV{\fpeval{\factorEVA*\factorEVB}}\fi\else\def\aEV{0.00}\fi%
		\ifdefined\aEWa\checkaEWa(1)\ifemptydata\relax\else\checkaEWa(6)\let\factorEWA\cachedata\checkaEWa(8)\let\factorEWB\cachedata\def\aEW{\fpeval{\factorEWA*\factorEWB}}\fi\else\def\aEW{0.00}\fi%
		\ifdefined\aEXa\checkaEXa(1)\ifemptydata\relax\else\checkaEXa(6)\let\factorEXA\cachedata\checkaEXa(8)\let\factorEXB\cachedata\def\aEX{\fpeval{\factorEXA*\factorEXB}}\fi\else\def\aEX{0.00}\fi%
		\ifdefined\aEYa\checkaEYa(1)\ifemptydata\relax\else\checkaEYa(6)\let\factorEYA\cachedata\checkaEYa(8)\let\factorEYB\cachedata\def\aEY{\fpeval{\factorEYA*\factorEYB}}\fi\else\def\aEY{0.00}\fi%
		\ifdefined\aEZa\checkaEZa(1)\ifemptydata\relax\else\checkaEZa(6)\let\factorEZA\cachedata\checkaEZa(8)\let\factorEZB\cachedata\def\aEZ{\fpeval{\factorEZA*\factorEZB}}\fi\else\def\aEZ{0.00}\fi%
%
		\ifdefined\aFAa\checkaFAa(1)\ifemptydata\relax\else\checkaFAa(6)\let\factorFAA\cachedata\checkaFAa(8)\let\factorFAB\cachedata\def\aFA{\fpeval{\factorFAA*\factorFAB}}\fi\else\def\aFA{0.00}\fi%
		\ifdefined\aFBa\checkaFBa(1)\ifemptydata\relax\else\checkaFBa(6)\let\factorFBA\cachedata\checkaFBa(8)\let\factorFBB\cachedata\def\aFB{\fpeval{\factorFBA*\factorFBB}}\fi\else\def\aFB{0.00}\fi%
		\ifdefined\aFCa\checkaFCa(1)\ifemptydata\relax\else\checkaFCa(6)\let\factorFCA\cachedata\checkaFCa(8)\let\factorFCB\cachedata\def\aFC{\fpeval{\factorFCA*\factorFCB}}\fi\else\def\aFC{0.00}\fi%
		\ifdefined\aFDa\checkaFDa(1)\ifemptydata\relax\else\checkaFDa(6)\let\factorFDA\cachedata\checkaFDa(8)\let\factorFDB\cachedata\def\aFD{\fpeval{\factorFDA*\factorFDB}}\fi\else\def\aFD{0.00}\fi%
		\ifdefined\aFEa\checkaFEa(1)\ifemptydata\relax\else\checkaFEa(6)\let\factorFEA\cachedata\checkaFEa(8)\let\factorFEB\cachedata\def\aFE{\fpeval{\factorFEA*\factorFEB}}\fi\else\def\aFE{0.00}\fi%
		\ifdefined\aFFa\checkaFFa(1)\ifemptydata\relax\else\checkaFFa(6)\let\factorFFA\cachedata\checkaFFa(8)\let\factorFFB\cachedata\def\aFF{\fpeval{\factorFFA*\factorFFB}}\fi\else\def\aFF{0.00}\fi%
		\ifdefined\aFGa\checkaFGa(1)\ifemptydata\relax\else\checkaFGa(6)\let\factorFGA\cachedata\checkaFGa(8)\let\factorFGB\cachedata\def\aFG{\fpeval{\factorFGA*\factorFGB}}\fi\else\def\aFG{0.00}\fi%
		\ifdefined\aFHa\checkaFHa(1)\ifemptydata\relax\else\checkaFHa(6)\let\factorFHA\cachedata\checkaFHa(8)\let\factorFHB\cachedata\def\aFH{\fpeval{\factorFHA*\factorFHB}}\fi\else\def\aFH{0.00}\fi%
		\ifdefined\aFIa\checkaFIa(1)\ifemptydata\relax\else\checkaFIa(6)\let\factorFIA\cachedata\checkaFIa(8)\let\factorFIB\cachedata\def\aFI{\fpeval{\factorFIA*\factorFIB}}\fi\else\def\aFI{0.00}\fi%
		\ifdefined\aFJa\checkaFJa(1)\ifemptydata\relax\else\checkaFJa(6)\let\factorFJA\cachedata\checkaFJa(8)\let\factorFJB\cachedata\def\aFJ{\fpeval{\factorFJA*\factorFJB}}\fi\else\def\aFJ{0.00}\fi%
		\ifdefined\aFKa\checkaFKa(1)\ifemptydata\relax\else\checkaFKa(6)\let\factorFKA\cachedata\checkaFKa(8)\let\factorFKB\cachedata\def\aFK{\fpeval{\factorFKA*\factorFKB}}\fi\else\def\aFK{0.00}\fi%
		\ifdefined\aFLa\checkaFLa(1)\ifemptydata\relax\else\checkaFLa(6)\let\factorFLA\cachedata\checkaFLa(8)\let\factorFLB\cachedata\def\aFL{\fpeval{\factorFLA*\factorFLB}}\fi\else\def\aFL{0.00}\fi%
		\ifdefined\aFMa\checkaFMa(1)\ifemptydata\relax\else\checkaFMa(6)\let\factorFMA\cachedata\checkaFMa(8)\let\factorFMB\cachedata\def\aFM{\fpeval{\factorFMA*\factorFMB}}\fi\else\def\aFM{0.00}\fi%
		\ifdefined\aFNa\checkaFNa(1)\ifemptydata\relax\else\checkaFNa(6)\let\factorFNA\cachedata\checkaFNa(8)\let\factorFNB\cachedata\def\aFN{\fpeval{\factorFNA*\factorFNB}}\fi\else\def\aFN{0.00}\fi%
		\ifdefined\aFOa\checkaFOa(1)\ifemptydata\relax\else\checkaFOa(6)\let\factorFOA\cachedata\checkaFOa(8)\let\factorFOB\cachedata\def\aFO{\fpeval{\factorFOA*\factorFOB}}\fi\else\def\aFO{0.00}\fi%
		\ifdefined\aFPa\checkaFPa(1)\ifemptydata\relax\else\checkaFPa(6)\let\factorFPA\cachedata\checkaFPa(8)\let\factorFPB\cachedata\def\aFP{\fpeval{\factorFPA*\factorFPB}}\fi\else\def\aFP{0.00}\fi%
		\ifdefined\aFQa\checkaFQa(1)\ifemptydata\relax\else\checkaFQa(6)\let\factorFQA\cachedata\checkaFQa(8)\let\factorFQB\cachedata\def\aFQ{\fpeval{\factorFQA*\factorFQB}}\fi\else\def\aFQ{0.00}\fi%
		\ifdefined\aFRa\checkaFRa(1)\ifemptydata\relax\else\checkaFRa(6)\let\factorFRA\cachedata\checkaFRa(8)\let\factorFRB\cachedata\def\aFR{\fpeval{\factorFRA*\factorFRB}}\fi\else\def\aFR{0.00}\fi%
		\ifdefined\aFSa\checkaFSa(1)\ifemptydata\relax\else\checkaFSa(6)\let\factorFSA\cachedata\checkaFSa(8)\let\factorFSB\cachedata\def\aFS{\fpeval{\factorFSA*\factorFSB}}\fi\else\def\aFS{0.00}\fi%
		\ifdefined\aFTa\checkaFTa(1)\ifemptydata\relax\else\checkaFTa(6)\let\factorFTA\cachedata\checkaFTa(8)\let\factorFTB\cachedata\def\aFT{\fpeval{\factorFTA*\factorFTB}}\fi\else\def\aFT{0.00}\fi%
		\ifdefined\aFUa\checkaFUa(1)\ifemptydata\relax\else\checkaFUa(6)\let\factorFUA\cachedata\checkaFUa(8)\let\factorFUB\cachedata\def\aFU{\fpeval{\factorFUA*\factorFUB}}\fi\else\def\aFU{0.00}\fi%
		\ifdefined\aFVa\checkaFVa(1)\ifemptydata\relax\else\checkaFVa(6)\let\factorFVA\cachedata\checkaFVa(8)\let\factorFVB\cachedata\def\aFV{\fpeval{\factorFVA*\factorFVB}}\fi\else\def\aFV{0.00}\fi%
		\ifdefined\aFWa\checkaFWa(1)\ifemptydata\relax\else\checkaFWa(6)\let\factorFWA\cachedata\checkaFWa(8)\let\factorFWB\cachedata\def\aFW{\fpeval{\factorFWA*\factorFWB}}\fi\else\def\aFW{0.00}\fi%
		\ifdefined\aFXa\checkaFXa(1)\ifemptydata\relax\else\checkaFXa(6)\let\factorFXA\cachedata\checkaFXa(8)\let\factorFXB\cachedata\def\aFX{\fpeval{\factorFXA*\factorFXB}}\fi\else\def\aFX{0.00}\fi%
		\ifdefined\aFYa\checkaFYa(1)\ifemptydata\relax\else\checkaFYa(6)\let\factorFYA\cachedata\checkaFYa(8)\let\factorFYB\cachedata\def\aFY{\fpeval{\factorFYA*\factorFYB}}\fi\else\def\aFY{0.00}\fi%
		\ifdefined\aFZa\checkaFZa(1)\ifemptydata\relax\else\checkaFZa(6)\let\factorFZA\cachedata\checkaFZa(8)\let\factorFZB\cachedata\def\aFZ{\fpeval{\factorFZA*\factorFZB}}\fi\else\def\aFZ{0.00}\fi%
%
		\ifdefined\aGAa\checkaGAa(1)\ifemptydata\relax\else\checkaGAa(6)\let\factorGAA\cachedata\checkaGAa(8)\let\factorGAB\cachedata\def\aGA{\fpeval{\factorGAA*\factorGAB}}\fi\else\def\aGA{0.00}\fi%
		\ifdefined\aGBa\checkaGBa(1)\ifemptydata\relax\else\checkaGBa(6)\let\factorGBA\cachedata\checkaGBa(8)\let\factorGBB\cachedata\def\aGB{\fpeval{\factorGBA*\factorGBB}}\fi\else\def\aGB{0.00}\fi%
		\ifdefined\aGCa\checkaGCa(1)\ifemptydata\relax\else\checkaGCa(6)\let\factorGCA\cachedata\checkaGCa(8)\let\factorGCB\cachedata\def\aGC{\fpeval{\factorGCA*\factorGCB}}\fi\else\def\aGC{0.00}\fi%
		\ifdefined\aGDa\checkaGDa(1)\ifemptydata\relax\else\checkaGDa(6)\let\factorGDA\cachedata\checkaGDa(8)\let\factorGDB\cachedata\def\aGD{\fpeval{\factorGDA*\factorGDB}}\fi\else\def\aGD{0.00}\fi%
		\ifdefined\aGEa\checkaGEa(1)\ifemptydata\relax\else\checkaGEa(6)\let\factorGEA\cachedata\checkaGEa(8)\let\factorGEB\cachedata\def\aGE{\fpeval{\factorGEA*\factorGEB}}\fi\else\def\aGE{0.00}\fi%
		\ifdefined\aGFa\checkaGFa(1)\ifemptydata\relax\else\checkaGFa(6)\let\factorGFA\cachedata\checkaGFa(8)\let\factorGFB\cachedata\def\aGF{\fpeval{\factorGFA*\factorGFB}}\fi\else\def\aGF{0.00}\fi%
		\ifdefined\aGGa\checkaGGa(1)\ifemptydata\relax\else\checkaGGa(6)\let\factorGGA\cachedata\checkaGGa(8)\let\factorGGB\cachedata\def\aGG{\fpeval{\factorGGA*\factorGGB}}\fi\else\def\aGG{0.00}\fi%
		\ifdefined\aGHa\checkaGHa(1)\ifemptydata\relax\else\checkaGHa(6)\let\factorGHA\cachedata\checkaGHa(8)\let\factorGHB\cachedata\def\aGH{\fpeval{\factorGHA*\factorGHB}}\fi\else\def\aGH{0.00}\fi%
		\ifdefined\aGIa\checkaGIa(1)\ifemptydata\relax\else\checkaGIa(6)\let\factorGIA\cachedata\checkaGIa(8)\let\factorGIB\cachedata\def\aGI{\fpeval{\factorGIA*\factorGIB}}\fi\else\def\aGI{0.00}\fi%
		\ifdefined\aGJa\checkaGJa(1)\ifemptydata\relax\else\checkaGJa(6)\let\factorGJA\cachedata\checkaGJa(8)\let\factorGJB\cachedata\def\aGJ{\fpeval{\factorGJA*\factorGJB}}\fi\else\def\aGJ{0.00}\fi%
		\ifdefined\aGKa\checkaGKa(1)\ifemptydata\relax\else\checkaGKa(6)\let\factorGKA\cachedata\checkaGKa(8)\let\factorGKB\cachedata\def\aGK{\fpeval{\factorGKA*\factorGKB}}\fi\else\def\aGK{0.00}\fi%
		\ifdefined\aGLa\checkaGLa(1)\ifemptydata\relax\else\checkaGLa(6)\let\factorGLA\cachedata\checkaGLa(8)\let\factorGLB\cachedata\def\aGL{\fpeval{\factorGLA*\factorGLB}}\fi\else\def\aGL{0.00}\fi%
		\ifdefined\aGMa\checkaGMa(1)\ifemptydata\relax\else\checkaGMa(6)\let\factorGMA\cachedata\checkaGMa(8)\let\factorGMB\cachedata\def\aGM{\fpeval{\factorGMA*\factorGMB}}\fi\else\def\aGM{0.00}\fi%
		\ifdefined\aGNa\checkaGNa(1)\ifemptydata\relax\else\checkaGNa(6)\let\factorGNA\cachedata\checkaGNa(8)\let\factorGNB\cachedata\def\aGN{\fpeval{\factorGNA*\factorGNB}}\fi\else\def\aGN{0.00}\fi%
		\ifdefined\aGOa\checkaGOa(1)\ifemptydata\relax\else\checkaGOa(6)\let\factorGOA\cachedata\checkaGOa(8)\let\factorGOB\cachedata\def\aGO{\fpeval{\factorGOA*\factorGOB}}\fi\else\def\aGO{0.00}\fi%
		\ifdefined\aGPa\checkaGPa(1)\ifemptydata\relax\else\checkaGPa(6)\let\factorGPA\cachedata\checkaGPa(8)\let\factorGPB\cachedata\def\aGP{\fpeval{\factorGPA*\factorGPB}}\fi\else\def\aGP{0.00}\fi%
		\ifdefined\aGQa\checkaGQa(1)\ifemptydata\relax\else\checkaGQa(6)\let\factorGQA\cachedata\checkaGQa(8)\let\factorGQB\cachedata\def\aGQ{\fpeval{\factorGQA*\factorGQB}}\fi\else\def\aGQ{0.00}\fi%
		\ifdefined\aGRa\checkaGRa(1)\ifemptydata\relax\else\checkaGRa(6)\let\factorGRA\cachedata\checkaGRa(8)\let\factorGRB\cachedata\def\aGR{\fpeval{\factorGRA*\factorGRB}}\fi\else\def\aGR{0.00}\fi%
		\ifdefined\aGSa\checkaGSa(1)\ifemptydata\relax\else\checkaGSa(6)\let\factorGSA\cachedata\checkaGSa(8)\let\factorGSB\cachedata\def\aGS{\fpeval{\factorGSA*\factorGSB}}\fi\else\def\aGS{0.00}\fi%
		\ifdefined\aGTa\checkaGTa(1)\ifemptydata\relax\else\checkaGTa(6)\let\factorGTA\cachedata\checkaGTa(8)\let\factorGTB\cachedata\def\aGT{\fpeval{\factorGTA*\factorGTB}}\fi\else\def\aGT{0.00}\fi%
		\ifdefined\aGUa\checkaGUa(1)\ifemptydata\relax\else\checkaGUa(6)\let\factorGUA\cachedata\checkaGUa(8)\let\factorGUB\cachedata\def\aGU{\fpeval{\factorGUA*\factorGUB}}\fi\else\def\aGU{0.00}\fi%
		\ifdefined\aGVa\checkaGVa(1)\ifemptydata\relax\else\checkaGVa(6)\let\factorGVA\cachedata\checkaGVa(8)\let\factorGVB\cachedata\def\aGV{\fpeval{\factorGVA*\factorGVB}}\fi\else\def\aGV{0.00}\fi%
		\ifdefined\aGWa\checkaGWa(1)\ifemptydata\relax\else\checkaGWa(6)\let\factorGWA\cachedata\checkaGWa(8)\let\factorGWB\cachedata\def\aGW{\fpeval{\factorGWA*\factorGWB}}\fi\else\def\aGW{0.00}\fi%
		\ifdefined\aGXa\checkaGXa(1)\ifemptydata\relax\else\checkaGXa(6)\let\factorGXA\cachedata\checkaGXa(8)\let\factorGXB\cachedata\def\aGX{\fpeval{\factorGXA*\factorGXB}}\fi\else\def\aGX{0.00}\fi%
		\ifdefined\aGYa\checkaGYa(1)\ifemptydata\relax\else\checkaGYa(6)\let\factorGYA\cachedata\checkaGYa(8)\let\factorGYB\cachedata\def\aGY{\fpeval{\factorGYA*\factorGYB}}\fi\else\def\aGY{0.00}\fi%
		\ifdefined\aGZa\checkaGZa(1)\ifemptydata\relax\else\checkaGZa(6)\let\factorGZA\cachedata\checkaGZa(8)\let\factorGZB\cachedata\def\aGZ{\fpeval{\factorGZA*\factorGZB}}\fi\else\def\aGZ{0.00}\fi%
%
		\ifdefined\aHAa\checkaHAa(1)\ifemptydata\relax\else\checkaHAa(6)\let\factorHAA\cachedata\checkaHAa(8)\let\factorHAB\cachedata\def\aHA{\fpeval{\factorHAA*\factorHAB}}\fi\else\def\aHA{0.00}\fi%
		\ifdefined\aHBa\checkaHBa(1)\ifemptydata\relax\else\checkaHBa(6)\let\factorHBA\cachedata\checkaHBa(8)\let\factorHBB\cachedata\def\aHB{\fpeval{\factorHBA*\factorHBB}}\fi\else\def\aHB{0.00}\fi%
		\ifdefined\aHCa\checkaHCa(1)\ifemptydata\relax\else\checkaHCa(6)\let\factorHCA\cachedata\checkaHCa(8)\let\factorHCB\cachedata\def\aHC{\fpeval{\factorHCA*\factorHCB}}\fi\else\def\aHC{0.00}\fi%
		\ifdefined\aHDa\checkaHDa(1)\ifemptydata\relax\else\checkaHDa(6)\let\factorHDA\cachedata\checkaHDa(8)\let\factorHDB\cachedata\def\aHD{\fpeval{\factorHDA*\factorHDB}}\fi\else\def\aHD{0.00}\fi%
		\ifdefined\aHEa\checkaHEa(1)\ifemptydata\relax\else\checkaHEa(6)\let\factorHEA\cachedata\checkaHEa(8)\let\factorHEB\cachedata\def\aHE{\fpeval{\factorHEA*\factorHEB}}\fi\else\def\aHE{0.00}\fi%
		\ifdefined\aHFa\checkaHFa(1)\ifemptydata\relax\else\checkaHFa(6)\let\factorHFA\cachedata\checkaHFa(8)\let\factorHFB\cachedata\def\aHF{\fpeval{\factorHFA*\factorHFB}}\fi\else\def\aHF{0.00}\fi%
		\ifdefined\aHGa\checkaHGa(1)\ifemptydata\relax\else\checkaHGa(6)\let\factorHGA\cachedata\checkaHGa(8)\let\factorHGB\cachedata\def\aHG{\fpeval{\factorHGA*\factorHGB}}\fi\else\def\aHG{0.00}\fi%
		\ifdefined\aHHa\checkaHHa(1)\ifemptydata\relax\else\checkaHHa(6)\let\factorHHA\cachedata\checkaHHa(8)\let\factorHHB\cachedata\def\aHH{\fpeval{\factorHHA*\factorHHB}}\fi\else\def\aHH{0.00}\fi%
		\ifdefined\aHIa\checkaHIa(1)\ifemptydata\relax\else\checkaHIa(6)\let\factorHIA\cachedata\checkaHIa(8)\let\factorHIB\cachedata\def\aHI{\fpeval{\factorHIA*\factorHIB}}\fi\else\def\aHI{0.00}\fi%
		\ifdefined\aHJa\checkaHJa(1)\ifemptydata\relax\else\checkaHJa(6)\let\factorHJA\cachedata\checkaHJa(8)\let\factorHJB\cachedata\def\aHJ{\fpeval{\factorHJA*\factorHJB}}\fi\else\def\aHJ{0.00}\fi%
		\ifdefined\aHKa\checkaHKa(1)\ifemptydata\relax\else\checkaHKa(6)\let\factorHKA\cachedata\checkaHKa(8)\let\factorHKB\cachedata\def\aHK{\fpeval{\factorHKA*\factorHKB}}\fi\else\def\aHK{0.00}\fi%
		\ifdefined\aHLa\checkaHLa(1)\ifemptydata\relax\else\checkaHLa(6)\let\factorHLA\cachedata\checkaHLa(8)\let\factorHLB\cachedata\def\aHL{\fpeval{\factorHLA*\factorHLB}}\fi\else\def\aHL{0.00}\fi%
		\ifdefined\aHMa\checkaHMa(1)\ifemptydata\relax\else\checkaHMa(6)\let\factorHMA\cachedata\checkaHMa(8)\let\factorHMB\cachedata\def\aHM{\fpeval{\factorHMA*\factorHMB}}\fi\else\def\aHM{0.00}\fi%
		\ifdefined\aHNa\checkaHNa(1)\ifemptydata\relax\else\checkaHNa(6)\let\factorHNA\cachedata\checkaHNa(8)\let\factorHNB\cachedata\def\aHN{\fpeval{\factorHNA*\factorHNB}}\fi\else\def\aHN{0.00}\fi%
		\ifdefined\aHOa\checkaHOa(1)\ifemptydata\relax\else\checkaHOa(6)\let\factorHOA\cachedata\checkaHOa(8)\let\factorHOB\cachedata\def\aHO{\fpeval{\factorHOA*\factorHOB}}\fi\else\def\aHO{0.00}\fi%
		\ifdefined\aHPa\checkaHPa(1)\ifemptydata\relax\else\checkaHPa(6)\let\factorHPA\cachedata\checkaHPa(8)\let\factorHPB\cachedata\def\aHP{\fpeval{\factorHPA*\factorHPB}}\fi\else\def\aHP{0.00}\fi%
		\ifdefined\aHQa\checkaHQa(1)\ifemptydata\relax\else\checkaHQa(6)\let\factorHQA\cachedata\checkaHQa(8)\let\factorHQB\cachedata\def\aHQ{\fpeval{\factorHQA*\factorHQB}}\fi\else\def\aHQ{0.00}\fi%
		\ifdefined\aHRa\checkaHRa(1)\ifemptydata\relax\else\checkaHRa(6)\let\factorHRA\cachedata\checkaHRa(8)\let\factorHRB\cachedata\def\aHR{\fpeval{\factorHRA*\factorHRB}}\fi\else\def\aHR{0.00}\fi%
		\ifdefined\aHSa\checkaHSa(1)\ifemptydata\relax\else\checkaHSa(6)\let\factorHSA\cachedata\checkaHSa(8)\let\factorHSB\cachedata\def\aHS{\fpeval{\factorHSA*\factorHSB}}\fi\else\def\aHS{0.00}\fi%
		\ifdefined\aHTa\checkaHTa(1)\ifemptydata\relax\else\checkaHTa(6)\let\factorHTA\cachedata\checkaHTa(8)\let\factorHTB\cachedata\def\aHT{\fpeval{\factorHTA*\factorHTB}}\fi\else\def\aHT{0.00}\fi%
		\ifdefined\aHUa\checkaHUa(1)\ifemptydata\relax\else\checkaHUa(6)\let\factorHUA\cachedata\checkaHUa(8)\let\factorHUB\cachedata\def\aHU{\fpeval{\factorHUA*\factorHUB}}\fi\else\def\aHU{0.00}\fi%
		\ifdefined\aHVa\checkaHVa(1)\ifemptydata\relax\else\checkaHVa(6)\let\factorHVA\cachedata\checkaHVa(8)\let\factorHVB\cachedata\def\aHV{\fpeval{\factorHVA*\factorHVB}}\fi\else\def\aHV{0.00}\fi%
		\ifdefined\aHWa\checkaHWa(1)\ifemptydata\relax\else\checkaHWa(6)\let\factorHWA\cachedata\checkaHWa(8)\let\factorHWB\cachedata\def\aHW{\fpeval{\factorHWA*\factorHWB}}\fi\else\def\aHW{0.00}\fi%
		\ifdefined\aHXa\checkaHXa(1)\ifemptydata\relax\else\checkaHXa(6)\let\factorHXA\cachedata\checkaHXa(8)\let\factorHXB\cachedata\def\aHX{\fpeval{\factorHXA*\factorHXB}}\fi\else\def\aHX{0.00}\fi%
		\ifdefined\aHYa\checkaHYa(1)\ifemptydata\relax\else\checkaHYa(6)\let\factorHYA\cachedata\checkaHYa(8)\let\factorHYB\cachedata\def\aHY{\fpeval{\factorHYA*\factorHYB}}\fi\else\def\aHY{0.00}\fi%
		\ifdefined\aHZa\checkaHZa(1)\ifemptydata\relax\else\checkaHZa(6)\let\factorHZA\cachedata\checkaHZa(8)\let\factorHZB\cachedata\def\aHZ{\fpeval{\factorHZA*\factorHZB}}\fi\else\def\aHZ{0.00}\fi%
%		
		\ifdefined\aIAa\checkaIAa(1)\ifemptydata\relax\else\checkaIAa(6)\let\factorIAA\cachedata\checkaIAa(8)\let\factorIAB\cachedata\def\aIA{\fpeval{\factorIAA*\factorIAB}}\fi\else\def\aIA{0.00}\fi%
		\ifdefined\aIBa\checkaIBa(1)\ifemptydata\relax\else\checkaIBa(6)\let\factorIBA\cachedata\checkaIBa(8)\let\factorIBB\cachedata\def\aIB{\fpeval{\factorIBA*\factorIBB}}\fi\else\def\aIB{0.00}\fi%
		\ifdefined\aICa\checkaICa(1)\ifemptydata\relax\else\checkaICa(6)\let\factorICA\cachedata\checkaICa(8)\let\factorICB\cachedata\def\aIC{\fpeval{\factorICA*\factorICB}}\fi\else\def\aIC{0.00}\fi%
		\ifdefined\aIDa\checkaIDa(1)\ifemptydata\relax\else\checkaIDa(6)\let\factorIDA\cachedata\checkaIDa(8)\let\factorIDB\cachedata\def\aID{\fpeval{\factorIDA*\factorIDB}}\fi\else\def\aID{0.00}\fi%
		\ifdefined\aIEa\checkaIEa(1)\ifemptydata\relax\else\checkaIEa(6)\let\factorIEA\cachedata\checkaIEa(8)\let\factorIEB\cachedata\def\aIE{\fpeval{\factorIEA*\factorIEB}}\fi\else\def\aIE{0.00}\fi%
		\ifdefined\aIFa\checkaIFa(1)\ifemptydata\relax\else\checkaIFa(6)\let\factorIFA\cachedata\checkaIFa(8)\let\factorIFB\cachedata\def\aIF{\fpeval{\factorIFA*\factorIFB}}\fi\else\def\aIF{0.00}\fi%
		\ifdefined\aIGa\checkaIGa(1)\ifemptydata\relax\else\checkaIGa(6)\let\factorIGA\cachedata\checkaIGa(8)\let\factorIGB\cachedata\def\aIG{\fpeval{\factorIGA*\factorIGB}}\fi\else\def\aIG{0.00}\fi%
		\ifdefined\aIHa\checkaIHa(1)\ifemptydata\relax\else\checkaIHa(6)\let\factorIHA\cachedata\checkaIHa(8)\let\factorIHB\cachedata\def\aIH{\fpeval{\factorIHA*\factorIHB}}\fi\else\def\aIH{0.00}\fi%
		\ifdefined\aIIa\checkaIIa(1)\ifemptydata\relax\else\checkaIIa(6)\let\factorIIA\cachedata\checkaIIa(8)\let\factorIIB\cachedata\def\aII{\fpeval{\factorIIA*\factorIIB}}\fi\else\def\aII{0.00}\fi%
		\ifdefined\aIJa\checkaIJa(1)\ifemptydata\relax\else\checkaIJa(6)\let\factorIJA\cachedata\checkaIJa(8)\let\factorIJB\cachedata\def\aIJ{\fpeval{\factorIJA*\factorIJB}}\fi\else\def\aIJ{0.00}\fi%
		\ifdefined\aIKa\checkaIKa(1)\ifemptydata\relax\else\checkaIKa(6)\let\factorIKA\cachedata\checkaIKa(8)\let\factorIKB\cachedata\def\aIK{\fpeval{\factorIKA*\factorIKB}}\fi\else\def\aIK{0.00}\fi%
		\ifdefined\aILa\checkaILa(1)\ifemptydata\relax\else\checkaILa(6)\let\factorILA\cachedata\checkaILa(8)\let\factorILB\cachedata\def\aIL{\fpeval{\factorILA*\factorILB}}\fi\else\def\aIL{0.00}\fi%
		\ifdefined\aIMa\checkaIMa(1)\ifemptydata\relax\else\checkaIMa(6)\let\factorIMA\cachedata\checkaIMa(8)\let\factorIMB\cachedata\def\aIM{\fpeval{\factorIMA*\factorIMB}}\fi\else\def\aIM{0.00}\fi%
		\ifdefined\aINa\checkaINa(1)\ifemptydata\relax\else\checkaINa(6)\let\factorINA\cachedata\checkaINa(8)\let\factorINB\cachedata\def\aIN{\fpeval{\factorINA*\factorINB}}\fi\else\def\aIN{0.00}\fi%
		\ifdefined\aIOa\checkaIOa(1)\ifemptydata\relax\else\checkaIOa(6)\let\factorIOA\cachedata\checkaIOa(8)\let\factorIOB\cachedata\def\aIO{\fpeval{\factorIOA*\factorIOB}}\fi\else\def\aIO{0.00}\fi%
		\ifdefined\aIPa\checkaIPa(1)\ifemptydata\relax\else\checkaIPa(6)\let\factorIPA\cachedata\checkaIPa(8)\let\factorIPB\cachedata\def\aIP{\fpeval{\factorIPA*\factorIPB}}\fi\else\def\aIP{0.00}\fi%
		\ifdefined\aIQa\checkaIQa(1)\ifemptydata\relax\else\checkaIQa(6)\let\factorIQA\cachedata\checkaIQa(8)\let\factorIQB\cachedata\def\aIQ{\fpeval{\factorIQA*\factorIQB}}\fi\else\def\aIQ{0.00}\fi%
		\ifdefined\aIRa\checkaIRa(1)\ifemptydata\relax\else\checkaIRa(6)\let\factorIRA\cachedata\checkaIRa(8)\let\factorIRB\cachedata\def\aIR{\fpeval{\factorIRA*\factorIRB}}\fi\else\def\aIR{0.00}\fi%
		\ifdefined\aISa\checkaISa(1)\ifemptydata\relax\else\checkaISa(6)\let\factorISA\cachedata\checkaISa(8)\let\factorISB\cachedata\def\aIS{\fpeval{\factorISA*\factorISB}}\fi\else\def\aIS{0.00}\fi%
		\ifdefined\aITa\checkaITa(1)\ifemptydata\relax\else\checkaITa(6)\let\factorITA\cachedata\checkaITa(8)\let\factorITB\cachedata\def\aIT{\fpeval{\factorITA*\factorITB}}\fi\else\def\aIT{0.00}\fi%
		\ifdefined\aIUa\checkaIUa(1)\ifemptydata\relax\else\checkaIUa(6)\let\factorIUA\cachedata\checkaIUa(8)\let\factorIUB\cachedata\def\aIU{\fpeval{\factorIUA*\factorIUB}}\fi\else\def\aIU{0.00}\fi%
		\ifdefined\aIVa\checkaIVa(1)\ifemptydata\relax\else\checkaIVa(6)\let\factorIVA\cachedata\checkaIVa(8)\let\factorIVB\cachedata\def\aIV{\fpeval{\factorIVA*\factorIVB}}\fi\else\def\aIV{0.00}\fi%
		\ifdefined\aIWa\checkaIWa(1)\ifemptydata\relax\else\checkaIWa(6)\let\factorIWA\cachedata\checkaIWa(8)\let\factorIWB\cachedata\def\aIW{\fpeval{\factorIWA*\factorIWB}}\fi\else\def\aIW{0.00}\fi%
		\ifdefined\aIXa\checkaIXa(1)\ifemptydata\relax\else\checkaIXa(6)\let\factorIXA\cachedata\checkaIXa(8)\let\factorIXB\cachedata\def\aIX{\fpeval{\factorIXA*\factorIXB}}\fi\else\def\aIX{0.00}\fi%
		\ifdefined\aIYa\checkaIYa(1)\ifemptydata\relax\else\checkaIYa(6)\let\factorIYA\cachedata\checkaIYa(8)\let\factorIYB\cachedata\def\aIY{\fpeval{\factorIYA*\factorIYB}}\fi\else\def\aIY{0.00}\fi%
		\ifdefined\aIZa\checkaIZa(1)\ifemptydata\relax\else\checkaIZa(6)\let\factorIZA\cachedata\checkaIZa(8)\let\factorIZB\cachedata\def\aIZ{\fpeval{\factorIZA*\factorIZB}}\fi\else\def\aIZ{0.00}\fi%
%
		\ifdefined\aJAa\checkaJAa(1)\ifemptydata\relax\else\checkaJAa(6)\let\factorJAA\cachedata\checkaJAa(8)\let\factorJAB\cachedata\def\aJA{\fpeval{\factorJAA*\factorJAB}}\fi\else\def\aJA{0.00}\fi%
		\ifdefined\aJBa\checkaJBa(1)\ifemptydata\relax\else\checkaJBa(6)\let\factorJBA\cachedata\checkaJBa(8)\let\factorJBB\cachedata\def\aJB{\fpeval{\factorJBA*\factorJBB}}\fi\else\def\aJB{0.00}\fi%
		\ifdefined\aJCa\checkaJCa(1)\ifemptydata\relax\else\checkaJCa(6)\let\factorJCA\cachedata\checkaJCa(8)\let\factorJCB\cachedata\def\aJC{\fpeval{\factorJCA*\factorJCB}}\fi\else\def\aJC{0.00}\fi%
		\ifdefined\aJDa\checkaJDa(1)\ifemptydata\relax\else\checkaJDa(6)\let\factorJDA\cachedata\checkaJDa(8)\let\factorJDB\cachedata\def\aJD{\fpeval{\factorJDA*\factorJDB}}\fi\else\def\aJD{0.00}\fi%
		\ifdefined\aJEa\checkaJEa(1)\ifemptydata\relax\else\checkaJEa(6)\let\factorJEA\cachedata\checkaJEa(8)\let\factorJEB\cachedata\def\aJE{\fpeval{\factorJEA*\factorJEB}}\fi\else\def\aJE{0.00}\fi%
		\ifdefined\aJFa\checkaJFa(1)\ifemptydata\relax\else\checkaJFa(6)\let\factorJFA\cachedata\checkaJFa(8)\let\factorJFB\cachedata\def\aJF{\fpeval{\factorJFA*\factorJFB}}\fi\else\def\aJF{0.00}\fi%
		\ifdefined\aJGa\checkaJGa(1)\ifemptydata\relax\else\checkaJGa(6)\let\factorJGA\cachedata\checkaJGa(8)\let\factorJGB\cachedata\def\aJG{\fpeval{\factorJGA*\factorJGB}}\fi\else\def\aJG{0.00}\fi%
		\ifdefined\aJHa\checkaJHa(1)\ifemptydata\relax\else\checkaJHa(6)\let\factorJHA\cachedata\checkaJHa(8)\let\factorJHB\cachedata\def\aJH{\fpeval{\factorJHA*\factorJHB}}\fi\else\def\aJH{0.00}\fi%
		\ifdefined\aJIa\checkaJIa(1)\ifemptydata\relax\else\checkaJIa(6)\let\factorJIA\cachedata\checkaJIa(8)\let\factorJIB\cachedata\def\aJI{\fpeval{\factorJIA*\factorJIB}}\fi\else\def\aJI{0.00}\fi%
		\ifdefined\aJJa\checkaJJa(1)\ifemptydata\relax\else\checkaJJa(6)\let\factorJJA\cachedata\checkaJJa(8)\let\factorJJB\cachedata\def\aJJ{\fpeval{\factorJJA*\factorJJB}}\fi\else\def\aJJ{0.00}\fi%
		\ifdefined\aJKa\checkaJKa(1)\ifemptydata\relax\else\checkaJKa(6)\let\factorJKA\cachedata\checkaJKa(8)\let\factorJKB\cachedata\def\aJK{\fpeval{\factorJKA*\factorJKB}}\fi\else\def\aJK{0.00}\fi%
		\ifdefined\aJLa\checkaJLa(1)\ifemptydata\relax\else\checkaJLa(6)\let\factorJLA\cachedata\checkaJLa(8)\let\factorJLB\cachedata\def\aJL{\fpeval{\factorJLA*\factorJLB}}\fi\else\def\aJL{0.00}\fi%
		\ifdefined\aJMa\checkaJMa(1)\ifemptydata\relax\else\checkaJMa(6)\let\factorJMA\cachedata\checkaJMa(8)\let\factorJMB\cachedata\def\aJM{\fpeval{\factorJMA*\factorJMB}}\fi\else\def\aJM{0.00}\fi%
		\ifdefined\aJNa\checkaJNa(1)\ifemptydata\relax\else\checkaJNa(6)\let\factorJNA\cachedata\checkaJNa(8)\let\factorJNB\cachedata\def\aJN{\fpeval{\factorJNA*\factorJNB}}\fi\else\def\aJN{0.00}\fi%
		\ifdefined\aJOa\checkaJOa(1)\ifemptydata\relax\else\checkaJOa(6)\let\factorJOA\cachedata\checkaJOa(8)\let\factorJOB\cachedata\def\aJO{\fpeval{\factorJOA*\factorJOB}}\fi\else\def\aJO{0.00}\fi%
		\ifdefined\aJPa\checkaJPa(1)\ifemptydata\relax\else\checkaJPa(6)\let\factorJPA\cachedata\checkaJPa(8)\let\factorJPB\cachedata\def\aJP{\fpeval{\factorJPA*\factorJPB}}\fi\else\def\aJP{0.00}\fi%
		\ifdefined\aJQa\checkaJQa(1)\ifemptydata\relax\else\checkaJQa(6)\let\factorJQA\cachedata\checkaJQa(8)\let\factorJQB\cachedata\def\aJQ{\fpeval{\factorJQA*\factorJQB}}\fi\else\def\aJQ{0.00}\fi%
		\ifdefined\aJRa\checkaJRa(1)\ifemptydata\relax\else\checkaJRa(6)\let\factorJRA\cachedata\checkaJRa(8)\let\factorJRB\cachedata\def\aJR{\fpeval{\factorJRA*\factorJRB}}\fi\else\def\aJR{0.00}\fi%
		\ifdefined\aJSa\checkaJSa(1)\ifemptydata\relax\else\checkaJSa(6)\let\factorJSA\cachedata\checkaJSa(8)\let\factorJSB\cachedata\def\aJS{\fpeval{\factorJSA*\factorJSB}}\fi\else\def\aJS{0.00}\fi%
		\ifdefined\aJTa\checkaJTa(1)\ifemptydata\relax\else\checkaJTa(6)\let\factorJTA\cachedata\checkaJTa(8)\let\factorJTB\cachedata\def\aJT{\fpeval{\factorJTA*\factorJTB}}\fi\else\def\aJT{0.00}\fi%
		\ifdefined\aJUa\checkaJUa(1)\ifemptydata\relax\else\checkaJUa(6)\let\factorJUA\cachedata\checkaJUa(8)\let\factorJUB\cachedata\def\aJU{\fpeval{\factorJUA*\factorJUB}}\fi\else\def\aJU{0.00}\fi%
		\ifdefined\aJVa\checkaJVa(1)\ifemptydata\relax\else\checkaJVa(6)\let\factorJVA\cachedata\checkaJVa(8)\let\factorJVB\cachedata\def\aJV{\fpeval{\factorJVA*\factorJVB}}\fi\else\def\aJV{0.00}\fi%
		\ifdefined\aJWa\checkaJWa(1)\ifemptydata\relax\else\checkaJWa(6)\let\factorJWA\cachedata\checkaJWa(8)\let\factorJWB\cachedata\def\aJW{\fpeval{\factorJWA*\factorJWB}}\fi\else\def\aJW{0.00}\fi%
		\ifdefined\aJXa\checkaJXa(1)\ifemptydata\relax\else\checkaJXa(6)\let\factorJXA\cachedata\checkaJXa(8)\let\factorJXB\cachedata\def\aJX{\fpeval{\factorJXA*\factorJXB}}\fi\else\def\aJX{0.00}\fi%
		\ifdefined\aJYa\checkaJYa(1)\ifemptydata\relax\else\checkaJYa(6)\let\factorJYA\cachedata\checkaJYa(8)\let\factorJYB\cachedata\def\aJY{\fpeval{\factorJYA*\factorJYB}}\fi\else\def\aJY{0.00}\fi%
		\ifdefined\aJZa\checkaJZa(1)\ifemptydata\relax\else\checkaJZa(6)\let\factorJZA\cachedata\checkaJZa(8)\let\factorJZB\cachedata\def\aJZ{\fpeval{\factorJZA*\factorJZB}}\fi\else\def\aJZ{0.00}\fi%
%
		\ifdefined\aKAa\checkaKAa(1)\ifemptydata\relax\else\checkaKAa(6)\let\factorKAA\cachedata\checkaKAa(8)\let\factorKAB\cachedata\def\aKA{\fpeval{\factorKAA*\factorKAB}}\fi\else\def\aKA{0.00}\fi%
		\ifdefined\aKBa\checkaKBa(1)\ifemptydata\relax\else\checkaKBa(6)\let\factorKBA\cachedata\checkaKBa(8)\let\factorKBB\cachedata\def\aKB{\fpeval{\factorKBA*\factorKBB}}\fi\else\def\aKB{0.00}\fi%
		\ifdefined\aKCa\checkaKCa(1)\ifemptydata\relax\else\checkaKCa(6)\let\factorKCA\cachedata\checkaKCa(8)\let\factorKCB\cachedata\def\aKC{\fpeval{\factorKCA*\factorKCB}}\fi\else\def\aKC{0.00}\fi%
		\ifdefined\aKDa\checkaKDa(1)\ifemptydata\relax\else\checkaKDa(6)\let\factorKDA\cachedata\checkaKDa(8)\let\factorKDB\cachedata\def\aKD{\fpeval{\factorKDA*\factorKDB}}\fi\else\def\aKD{0.00}\fi%
		\ifdefined\aKEa\checkaKEa(1)\ifemptydata\relax\else\checkaKEa(6)\let\factorKEA\cachedata\checkaKEa(8)\let\factorKEB\cachedata\def\aKE{\fpeval{\factorKEA*\factorKEB}}\fi\else\def\aKE{0.00}\fi%
		\ifdefined\aKFa\checkaKFa(1)\ifemptydata\relax\else\checkaKFa(6)\let\factorKFA\cachedata\checkaKFa(8)\let\factorKFB\cachedata\def\aKF{\fpeval{\factorKFA*\factorKFB}}\fi\else\def\aKF{0.00}\fi%
		\ifdefined\aKGa\checkaKGa(1)\ifemptydata\relax\else\checkaKGa(6)\let\factorKGA\cachedata\checkaKGa(8)\let\factorKGB\cachedata\def\aKG{\fpeval{\factorKGA*\factorKGB}}\fi\else\def\aKG{0.00}\fi%
		\ifdefined\aKHa\checkaKHa(1)\ifemptydata\relax\else\checkaKHa(6)\let\factorKHA\cachedata\checkaKHa(8)\let\factorKHB\cachedata\def\aKH{\fpeval{\factorKHA*\factorKHB}}\fi\else\def\aKH{0.00}\fi%
		\ifdefined\aKIa\checkaKIa(1)\ifemptydata\relax\else\checkaKIa(6)\let\factorKIA\cachedata\checkaKIa(8)\let\factorKIB\cachedata\def\aKI{\fpeval{\factorKIA*\factorKIB}}\fi\else\def\aKI{0.00}\fi%
		\ifdefined\aKJa\checkaKJa(1)\ifemptydata\relax\else\checkaKJa(6)\let\factorKJA\cachedata\checkaKJa(8)\let\factorKJB\cachedata\def\aKJ{\fpeval{\factorKJA*\factorKJB}}\fi\else\def\aKJ{0.00}\fi%
		\ifdefined\aKKa\checkaKKa(1)\ifemptydata\relax\else\checkaKKa(6)\let\factorKKA\cachedata\checkaKKa(8)\let\factorKKB\cachedata\def\aKK{\fpeval{\factorKKA*\factorKKB}}\fi\else\def\aKK{0.00}\fi%
		\ifdefined\aKLa\checkaKLa(1)\ifemptydata\relax\else\checkaKLa(6)\let\factorKLA\cachedata\checkaKLa(8)\let\factorKLB\cachedata\def\aKL{\fpeval{\factorKLA*\factorKLB}}\fi\else\def\aKL{0.00}\fi%
		\ifdefined\aKMa\checkaKMa(1)\ifemptydata\relax\else\checkaKMa(6)\let\factorKMA\cachedata\checkaKMa(8)\let\factorKMB\cachedata\def\aKM{\fpeval{\factorKMA*\factorKMB}}\fi\else\def\aKM{0.00}\fi%
		\ifdefined\aKNa\checkaKNa(1)\ifemptydata\relax\else\checkaKNa(6)\let\factorKNA\cachedata\checkaKNa(8)\let\factorKNB\cachedata\def\aKN{\fpeval{\factorKNA*\factorKNB}}\fi\else\def\aKN{0.00}\fi%
		\ifdefined\aKOa\checkaKOa(1)\ifemptydata\relax\else\checkaKOa(6)\let\factorKOA\cachedata\checkaKOa(8)\let\factorKOB\cachedata\def\aKO{\fpeval{\factorKOA*\factorKOB}}\fi\else\def\aKO{0.00}\fi%
		\ifdefined\aKPa\checkaKPa(1)\ifemptydata\relax\else\checkaKPa(6)\let\factorKPA\cachedata\checkaKPa(8)\let\factorKPB\cachedata\def\aKP{\fpeval{\factorKPA*\factorKPB}}\fi\else\def\aKP{0.00}\fi%
		\ifdefined\aKQa\checkaKQa(1)\ifemptydata\relax\else\checkaKQa(6)\let\factorKQA\cachedata\checkaKQa(8)\let\factorKQB\cachedata\def\aKQ{\fpeval{\factorKQA*\factorKQB}}\fi\else\def\aKQ{0.00}\fi%
		\ifdefined\aKRa\checkaKRa(1)\ifemptydata\relax\else\checkaKRa(6)\let\factorKRA\cachedata\checkaKRa(8)\let\factorKRB\cachedata\def\aKR{\fpeval{\factorKRA*\factorKRB}}\fi\else\def\aKR{0.00}\fi%
		\ifdefined\aKSa\checkaKSa(1)\ifemptydata\relax\else\checkaKSa(6)\let\factorKSA\cachedata\checkaKSa(8)\let\factorKSB\cachedata\def\aKS{\fpeval{\factorKSA*\factorKSB}}\fi\else\def\aKS{0.00}\fi%
		\ifdefined\aKTa\checkaKTa(1)\ifemptydata\relax\else\checkaKTa(6)\let\factorKTA\cachedata\checkaKTa(8)\let\factorKTB\cachedata\def\aKT{\fpeval{\factorKTA*\factorKTB}}\fi\else\def\aKT{0.00}\fi%
		\ifdefined\aKUa\checkaKUa(1)\ifemptydata\relax\else\checkaKUa(6)\let\factorKUA\cachedata\checkaKUa(8)\let\factorKUB\cachedata\def\aKU{\fpeval{\factorKUA*\factorKUB}}\fi\else\def\aKU{0.00}\fi%
		\ifdefined\aKVa\checkaKVa(1)\ifemptydata\relax\else\checkaKVa(6)\let\factorKVA\cachedata\checkaKVa(8)\let\factorKVB\cachedata\def\aKV{\fpeval{\factorKVA*\factorKVB}}\fi\else\def\aKV{0.00}\fi%
		\ifdefined\aKWa\checkaKWa(1)\ifemptydata\relax\else\checkaKWa(6)\let\factorKWA\cachedata\checkaKWa(8)\let\factorKWB\cachedata\def\aKW{\fpeval{\factorKWA*\factorKWB}}\fi\else\def\aKW{0.00}\fi%
		\ifdefined\aKXa\checkaKXa(1)\ifemptydata\relax\else\checkaKXa(6)\let\factorKXA\cachedata\checkaKXa(8)\let\factorKXB\cachedata\def\aKX{\fpeval{\factorKXA*\factorKXB}}\fi\else\def\aKX{0.00}\fi%
		\ifdefined\aKYa\checkaKYa(1)\ifemptydata\relax\else\checkaKYa(6)\let\factorKYA\cachedata\checkaKYa(8)\let\factorKYB\cachedata\def\aKY{\fpeval{\factorKYA*\factorKYB}}\fi\else\def\aKY{0.00}\fi%
		\ifdefined\aKZa\checkaKZa(1)\ifemptydata\relax\else\checkaKZa(6)\let\factorKZA\cachedata\checkaKZa(8)\let\factorKZB\cachedata\def\aKZ{\fpeval{\factorKZA*\factorKZB}}\fi\else\def\aKZ{0.00}\fi%
%
		\ifdefined\aLAa\checkaLAa(1)\ifemptydata\relax\else\checkaLAa(6)\let\factorLAA\cachedata\checkaLAa(8)\let\factorLAB\cachedata\def\aLA{\fpeval{\factorLAA*\factorLAB}}\fi\else\def\aLA{0.00}\fi%
		\ifdefined\aLBa\checkaLBa(1)\ifemptydata\relax\else\checkaLBa(6)\let\factorLBA\cachedata\checkaLBa(8)\let\factorLBB\cachedata\def\aLB{\fpeval{\factorLBA*\factorLBB}}\fi\else\def\aLB{0.00}\fi%
		\ifdefined\aLCa\checkaLCa(1)\ifemptydata\relax\else\checkaLCa(6)\let\factorLCA\cachedata\checkaLCa(8)\let\factorLCB\cachedata\def\aLC{\fpeval{\factorLCA*\factorLCB}}\fi\else\def\aLC{0.00}\fi%
		\ifdefined\aLDa\checkaLDa(1)\ifemptydata\relax\else\checkaLDa(6)\let\factorLDA\cachedata\checkaLDa(8)\let\factorLDB\cachedata\def\aLD{\fpeval{\factorLDA*\factorLDB}}\fi\else\def\aLD{0.00}\fi%
		\ifdefined\aLEa\checkaLEa(1)\ifemptydata\relax\else\checkaLEa(6)\let\factorLEA\cachedata\checkaLEa(8)\let\factorLEB\cachedata\def\aLE{\fpeval{\factorLEA*\factorLEB}}\fi\else\def\aLE{0.00}\fi%
		\ifdefined\aLFa\checkaLFa(1)\ifemptydata\relax\else\checkaLFa(6)\let\factorLFA\cachedata\checkaLFa(8)\let\factorLFB\cachedata\def\aLF{\fpeval{\factorLFA*\factorLFB}}\fi\else\def\aLF{0.00}\fi%
		\ifdefined\aLGa\checkaLGa(1)\ifemptydata\relax\else\checkaLGa(6)\let\factorLGA\cachedata\checkaLGa(8)\let\factorLGB\cachedata\def\aLG{\fpeval{\factorLGA*\factorLGB}}\fi\else\def\aLG{0.00}\fi%
		\ifdefined\aLHa\checkaLHa(1)\ifemptydata\relax\else\checkaLHa(6)\let\factorLHA\cachedata\checkaLHa(8)\let\factorLHB\cachedata\def\aLH{\fpeval{\factorLHA*\factorLHB}}\fi\else\def\aLH{0.00}\fi%
		\ifdefined\aLIa\checkaLIa(1)\ifemptydata\relax\else\checkaLIa(6)\let\factorLIA\cachedata\checkaLIa(8)\let\factorLIB\cachedata\def\aLI{\fpeval{\factorLIA*\factorLIB}}\fi\else\def\aLI{0.00}\fi%
		\ifdefined\aLJa\checkaLJa(1)\ifemptydata\relax\else\checkaLJa(6)\let\factorLJA\cachedata\checkaLJa(8)\let\factorLJB\cachedata\def\aLJ{\fpeval{\factorLJA*\factorLJB}}\fi\else\def\aLJ{0.00}\fi%
		\ifdefined\aLKa\checkaLKa(1)\ifemptydata\relax\else\checkaLKa(6)\let\factorLKA\cachedata\checkaLKa(8)\let\factorLKB\cachedata\def\aLK{\fpeval{\factorLKA*\factorLKB}}\fi\else\def\aLK{0.00}\fi%
		\ifdefined\aLLa\checkaLLa(1)\ifemptydata\relax\else\checkaLLa(6)\let\factorLLA\cachedata\checkaLLa(8)\let\factorLLB\cachedata\def\aLL{\fpeval{\factorLLA*\factorLLB}}\fi\else\def\aLL{0.00}\fi%
		\ifdefined\aLMa\checkaLMa(1)\ifemptydata\relax\else\checkaLMa(6)\let\factorLMA\cachedata\checkaLMa(8)\let\factorLMB\cachedata\def\aLM{\fpeval{\factorLMA*\factorLMB}}\fi\else\def\aLM{0.00}\fi%
		\ifdefined\aLNa\checkaLNa(1)\ifemptydata\relax\else\checkaLNa(6)\let\factorLNA\cachedata\checkaLNa(8)\let\factorLNB\cachedata\def\aLN{\fpeval{\factorLNA*\factorLNB}}\fi\else\def\aLN{0.00}\fi%
		\ifdefined\aLOa\checkaLOa(1)\ifemptydata\relax\else\checkaLOa(6)\let\factorLOA\cachedata\checkaLOa(8)\let\factorLOB\cachedata\def\aLO{\fpeval{\factorLOA*\factorLOB}}\fi\else\def\aLO{0.00}\fi%
		\ifdefined\aLPa\checkaLPa(1)\ifemptydata\relax\else\checkaLPa(6)\let\factorLPA\cachedata\checkaLPa(8)\let\factorLPB\cachedata\def\aLP{\fpeval{\factorLPA*\factorLPB}}\fi\else\def\aLP{0.00}\fi%
		\ifdefined\aLQa\checkaLQa(1)\ifemptydata\relax\else\checkaLQa(6)\let\factorLQA\cachedata\checkaLQa(8)\let\factorLQB\cachedata\def\aLQ{\fpeval{\factorLQA*\factorLQB}}\fi\else\def\aLQ{0.00}\fi%
		\ifdefined\aLRa\checkaLRa(1)\ifemptydata\relax\else\checkaLRa(6)\let\factorLRA\cachedata\checkaLRa(8)\let\factorLRB\cachedata\def\aLR{\fpeval{\factorLRA*\factorLRB}}\fi\else\def\aLR{0.00}\fi%
		\ifdefined\aLSa\checkaLSa(1)\ifemptydata\relax\else\checkaLSa(6)\let\factorLSA\cachedata\checkaLSa(8)\let\factorLSB\cachedata\def\aLS{\fpeval{\factorLSA*\factorLSB}}\fi\else\def\aLS{0.00}\fi%
		\ifdefined\aLTa\checkaLTa(1)\ifemptydata\relax\else\checkaLTa(6)\let\factorLTA\cachedata\checkaLTa(8)\let\factorLTB\cachedata\def\aLT{\fpeval{\factorLTA*\factorLTB}}\fi\else\def\aLT{0.00}\fi%
		\ifdefined\aLUa\checkaLUa(1)\ifemptydata\relax\else\checkaLUa(6)\let\factorLUA\cachedata\checkaLUa(8)\let\factorLUB\cachedata\def\aLU{\fpeval{\factorLUA*\factorLUB}}\fi\else\def\aLU{0.00}\fi%
		\ifdefined\aLVa\checkaLVa(1)\ifemptydata\relax\else\checkaLVa(6)\let\factorLVA\cachedata\checkaLVa(8)\let\factorLVB\cachedata\def\aLV{\fpeval{\factorLVA*\factorLVB}}\fi\else\def\aLV{0.00}\fi%
		\ifdefined\aLWa\checkaLWa(1)\ifemptydata\relax\else\checkaLWa(6)\let\factorLWA\cachedata\checkaLWa(8)\let\factorLWB\cachedata\def\aLW{\fpeval{\factorLWA*\factorLWB}}\fi\else\def\aLW{0.00}\fi%
		\ifdefined\aLXa\checkaLXa(1)\ifemptydata\relax\else\checkaLXa(6)\let\factorLXA\cachedata\checkaLXa(8)\let\factorLXB\cachedata\def\aLX{\fpeval{\factorLXA*\factorLXB}}\fi\else\def\aLX{0.00}\fi%
		\ifdefined\aLYa\checkaLYa(1)\ifemptydata\relax\else\checkaLYa(6)\let\factorLYA\cachedata\checkaLYa(8)\let\factorLYB\cachedata\def\aLY{\fpeval{\factorLYA*\factorLYB}}\fi\else\def\aLY{0.00}\fi%
		\ifdefined\aLZa\checkaLZa(1)\ifemptydata\relax\else\checkaLZa(6)\let\factorLZA\cachedata\checkaLZa(8)\let\factorLZB\cachedata\def\aLZ{\fpeval{\factorLZA*\factorLZB}}\fi\else\def\aLZ{0.00}\fi%
%
		\ifdefined\aMAa\checkaMAa(1)\ifemptydata\relax\else\checkaMAa(6)\let\factorMAA\cachedata\checkaMAa(8)\let\factorMAB\cachedata\def\aMA{\fpeval{\factorMAA*\factorMAB}}\fi\else\def\aMA{0.00}\fi%
		\ifdefined\aMBa\checkaMBa(1)\ifemptydata\relax\else\checkaMBa(6)\let\factorMBA\cachedata\checkaMBa(8)\let\factorMBB\cachedata\def\aMB{\fpeval{\factorMBA*\factorMBB}}\fi\else\def\aMB{0.00}\fi%
		\ifdefined\aMCa\checkaMCa(1)\ifemptydata\relax\else\checkaMCa(6)\let\factorMCA\cachedata\checkaMCa(8)\let\factorMCB\cachedata\def\aMC{\fpeval{\factorMCA*\factorMCB}}\fi\else\def\aMC{0.00}\fi%
		\ifdefined\aMDa\checkaMDa(1)\ifemptydata\relax\else\checkaMDa(6)\let\factorMDA\cachedata\checkaMDa(8)\let\factorMDB\cachedata\def\aMD{\fpeval{\factorMDA*\factorMDB}}\fi\else\def\aMD{0.00}\fi%
		\ifdefined\aMEa\checkaMEa(1)\ifemptydata\relax\else\checkaMEa(6)\let\factorMEA\cachedata\checkaMEa(8)\let\factorMEB\cachedata\def\aME{\fpeval{\factorMEA*\factorMEB}}\fi\else\def\aME{0.00}\fi%
		\ifdefined\aMFa\checkaMFa(1)\ifemptydata\relax\else\checkaMFa(6)\let\factorMFA\cachedata\checkaMFa(8)\let\factorMFB\cachedata\def\aMF{\fpeval{\factorMFA*\factorMFB}}\fi\else\def\aMF{0.00}\fi%
		\ifdefined\aMGa\checkaMGa(1)\ifemptydata\relax\else\checkaMGa(6)\let\factorMGA\cachedata\checkaMGa(8)\let\factorMGB\cachedata\def\aMG{\fpeval{\factorMGA*\factorMGB}}\fi\else\def\aMG{0.00}\fi%
		\ifdefined\aMHa\checkaMHa(1)\ifemptydata\relax\else\checkaMHa(6)\let\factorMHA\cachedata\checkaMHa(8)\let\factorMHB\cachedata\def\aMH{\fpeval{\factorMHA*\factorMHB}}\fi\else\def\aMH{0.00}\fi%
		\ifdefined\aMIa\checkaMIa(1)\ifemptydata\relax\else\checkaMIa(6)\let\factorMIA\cachedata\checkaMIa(8)\let\factorMIB\cachedata\def\aMI{\fpeval{\factorMIA*\factorMIB}}\fi\else\def\aMI{0.00}\fi%
		\ifdefined\aMJa\checkaMJa(1)\ifemptydata\relax\else\checkaMJa(6)\let\factorMJA\cachedata\checkaMJa(8)\let\factorMJB\cachedata\def\aMJ{\fpeval{\factorMJA*\factorMJB}}\fi\else\def\aMJ{0.00}\fi%
		\ifdefined\aMKa\checkaMKa(1)\ifemptydata\relax\else\checkaMKa(6)\let\factorMKA\cachedata\checkaMKa(8)\let\factorMKB\cachedata\def\aMK{\fpeval{\factorMKA*\factorMKB}}\fi\else\def\aMK{0.00}\fi%
		\ifdefined\aMLa\checkaMLa(1)\ifemptydata\relax\else\checkaMLa(6)\let\factorMLA\cachedata\checkaMLa(8)\let\factorMLB\cachedata\def\aML{\fpeval{\factorMLA*\factorMLB}}\fi\else\def\aML{0.00}\fi%
		\ifdefined\aMMa\checkaMMa(1)\ifemptydata\relax\else\checkaMMa(6)\let\factorMMA\cachedata\checkaMMa(8)\let\factorMMB\cachedata\def\aMM{\fpeval{\factorMMA*\factorMMB}}\fi\else\def\aMM{0.00}\fi%
		\ifdefined\aMNa\checkaMNa(1)\ifemptydata\relax\else\checkaMNa(6)\let\factorMNA\cachedata\checkaMNa(8)\let\factorMNB\cachedata\def\aMN{\fpeval{\factorMNA*\factorMNB}}\fi\else\def\aMN{0.00}\fi%
		\ifdefined\aMOa\checkaMOa(1)\ifemptydata\relax\else\checkaMOa(6)\let\factorMOA\cachedata\checkaMOa(8)\let\factorMOB\cachedata\def\aMO{\fpeval{\factorMOA*\factorMOB}}\fi\else\def\aMO{0.00}\fi%
		\ifdefined\aMPa\checkaMPa(1)\ifemptydata\relax\else\checkaMPa(6)\let\factorMPA\cachedata\checkaMPa(8)\let\factorMPB\cachedata\def\aMP{\fpeval{\factorMPA*\factorMPB}}\fi\else\def\aMP{0.00}\fi%
		\ifdefined\aMQa\checkaMQa(1)\ifemptydata\relax\else\checkaMQa(6)\let\factorMQA\cachedata\checkaMQa(8)\let\factorMQB\cachedata\def\aMQ{\fpeval{\factorMQA*\factorMQB}}\fi\else\def\aMQ{0.00}\fi%
		\ifdefined\aMRa\checkaMRa(1)\ifemptydata\relax\else\checkaMRa(6)\let\factorMRA\cachedata\checkaMRa(8)\let\factorMRB\cachedata\def\aMR{\fpeval{\factorMRA*\factorMRB}}\fi\else\def\aMR{0.00}\fi%
		\ifdefined\aMSa\checkaMSa(1)\ifemptydata\relax\else\checkaMSa(6)\let\factorMSA\cachedata\checkaMSa(8)\let\factorMSB\cachedata\def\aMS{\fpeval{\factorMSA*\factorMSB}}\fi\else\def\aMS{0.00}\fi%
		\ifdefined\aMTa\checkaMTa(1)\ifemptydata\relax\else\checkaMTa(6)\let\factorMTA\cachedata\checkaMTa(8)\let\factorMTB\cachedata\def\aMT{\fpeval{\factorMTA*\factorMTB}}\fi\else\def\aMT{0.00}\fi%
		\ifdefined\aMUa\checkaMUa(1)\ifemptydata\relax\else\checkaMUa(6)\let\factorMUA\cachedata\checkaMUa(8)\let\factorMUB\cachedata\def\aMU{\fpeval{\factorMUA*\factorMUB}}\fi\else\def\aMU{0.00}\fi%
		\ifdefined\aMVa\checkaMVa(1)\ifemptydata\relax\else\checkaMVa(6)\let\factorMVA\cachedata\checkaMVa(8)\let\factorMVB\cachedata\def\aMV{\fpeval{\factorMVA*\factorMVB}}\fi\else\def\aMV{0.00}\fi%
		\ifdefined\aMWa\checkaMWa(1)\ifemptydata\relax\else\checkaMWa(6)\let\factorMWA\cachedata\checkaMWa(8)\let\factorMWB\cachedata\def\aMW{\fpeval{\factorMWA*\factorMWB}}\fi\else\def\aMW{0.00}\fi%
		\ifdefined\aMXa\checkaMXa(1)\ifemptydata\relax\else\checkaMXa(6)\let\factorMXA\cachedata\checkaMXa(8)\let\factorMXB\cachedata\def\aMX{\fpeval{\factorMXA*\factorMXB}}\fi\else\def\aMX{0.00}\fi%
		\ifdefined\aMYa\checkaMYa(1)\ifemptydata\relax\else\checkaMYa(6)\let\factorMYA\cachedata\checkaMYa(8)\let\factorMYB\cachedata\def\aMY{\fpeval{\factorMYA*\factorMYB}}\fi\else\def\aMY{0.00}\fi%
		\ifdefined\aMZa\checkaMZa(1)\ifemptydata\relax\else\checkaMZa(6)\let\factorMZA\cachedata\checkaMZa(8)\let\factorMZB\cachedata\def\aMZ{\fpeval{\factorMZA*\factorMZB}}\fi\else\def\aMZ{0.00}\fi%
%
		\ifdefined\aNAa\checkaNAa(1)\ifemptydata\relax\else\checkaNAa(6)\let\factorNAA\cachedata\checkaNAa(8)\let\factorNAB\cachedata\def\aNA{\fpeval{\factorNAA*\factorNAB}}\fi\else\def\aNA{0.00}\fi%
		\ifdefined\aNBa\checkaNBa(1)\ifemptydata\relax\else\checkaNBa(6)\let\factorNBA\cachedata\checkaNBa(8)\let\factorNBB\cachedata\def\aNB{\fpeval{\factorNBA*\factorNBB}}\fi\else\def\aNB{0.00}\fi%
		\ifdefined\aNCa\checkaNCa(1)\ifemptydata\relax\else\checkaNCa(6)\let\factorNCA\cachedata\checkaNCa(8)\let\factorNCB\cachedata\def\aNC{\fpeval{\factorNCA*\factorNCB}}\fi\else\def\aNC{0.00}\fi%
		\ifdefined\aNDa\checkaNDa(1)\ifemptydata\relax\else\checkaNDa(6)\let\factorNDA\cachedata\checkaNDa(8)\let\factorNDB\cachedata\def\aND{\fpeval{\factorNDA*\factorNDB}}\fi\else\def\aND{0.00}\fi%
		\ifdefined\aNEa\checkaNEa(1)\ifemptydata\relax\else\checkaNEa(6)\let\factorNEA\cachedata\checkaNEa(8)\let\factorNEB\cachedata\def\aNE{\fpeval{\factorNEA*\factorNEB}}\fi\else\def\aNE{0.00}\fi%
		\ifdefined\aNFa\checkaNFa(1)\ifemptydata\relax\else\checkaNFa(6)\let\factorNFA\cachedata\checkaNFa(8)\let\factorNFB\cachedata\def\aNF{\fpeval{\factorNFA*\factorNFB}}\fi\else\def\aNF{0.00}\fi%
		\ifdefined\aNGa\checkaNGa(1)\ifemptydata\relax\else\checkaNGa(6)\let\factorNGA\cachedata\checkaNGa(8)\let\factorNGB\cachedata\def\aNG{\fpeval{\factorNGA*\factorNGB}}\fi\else\def\aNG{0.00}\fi%
		\ifdefined\aNHa\checkaNHa(1)\ifemptydata\relax\else\checkaNHa(6)\let\factorNHA\cachedata\checkaNHa(8)\let\factorNHB\cachedata\def\aNH{\fpeval{\factorNHA*\factorNHB}}\fi\else\def\aNH{0.00}\fi%
		\ifdefined\aNIa\checkaNIa(1)\ifemptydata\relax\else\checkaNIa(6)\let\factorNIA\cachedata\checkaNIa(8)\let\factorNIB\cachedata\def\aNI{\fpeval{\factorNIA*\factorNIB}}\fi\else\def\aNI{0.00}\fi%
		\ifdefined\aNJa\checkaNJa(1)\ifemptydata\relax\else\checkaNJa(6)\let\factorNJA\cachedata\checkaNJa(8)\let\factorNJB\cachedata\def\aNJ{\fpeval{\factorNJA*\factorNJB}}\fi\else\def\aNJ{0.00}\fi%
		\ifdefined\aNKa\checkaNKa(1)\ifemptydata\relax\else\checkaNKa(6)\let\factorNKA\cachedata\checkaNKa(8)\let\factorNKB\cachedata\def\aNK{\fpeval{\factorNKA*\factorNKB}}\fi\else\def\aNK{0.00}\fi%
		\ifdefined\aNLa\checkaNLa(1)\ifemptydata\relax\else\checkaNLa(6)\let\factorNLA\cachedata\checkaNLa(8)\let\factorNLB\cachedata\def\aNL{\fpeval{\factorNLA*\factorNLB}}\fi\else\def\aNL{0.00}\fi%
		\ifdefined\aNMa\checkaNMa(1)\ifemptydata\relax\else\checkaNMa(6)\let\factorNMA\cachedata\checkaNMa(8)\let\factorNMB\cachedata\def\aNM{\fpeval{\factorNMA*\factorNMB}}\fi\else\def\aNM{0.00}\fi%
		\ifdefined\aNNa\checkaNNa(1)\ifemptydata\relax\else\checkaNNa(6)\let\factorNNA\cachedata\checkaNNa(8)\let\factorNNB\cachedata\def\aNN{\fpeval{\factorNNA*\factorNNB}}\fi\else\def\aNN{0.00}\fi%
		\ifdefined\aNOa\checkaNOa(1)\ifemptydata\relax\else\checkaNOa(6)\let\factorNOA\cachedata\checkaNOa(8)\let\factorNOB\cachedata\def\aNO{\fpeval{\factorNOA*\factorNOB}}\fi\else\def\aNO{0.00}\fi%
		\ifdefined\aNPa\checkaNPa(1)\ifemptydata\relax\else\checkaNPa(6)\let\factorNPA\cachedata\checkaNPa(8)\let\factorNPB\cachedata\def\aNP{\fpeval{\factorNPA*\factorNPB}}\fi\else\def\aNP{0.00}\fi%
		\ifdefined\aNQa\checkaNQa(1)\ifemptydata\relax\else\checkaNQa(6)\let\factorNQA\cachedata\checkaNQa(8)\let\factorNQB\cachedata\def\aNQ{\fpeval{\factorNQA*\factorNQB}}\fi\else\def\aNQ{0.00}\fi%
		\ifdefined\aNRa\checkaNRa(1)\ifemptydata\relax\else\checkaNRa(6)\let\factorNRA\cachedata\checkaNRa(8)\let\factorNRB\cachedata\def\aNR{\fpeval{\factorNRA*\factorNRB}}\fi\else\def\aNR{0.00}\fi%
		\ifdefined\aNSa\checkaNSa(1)\ifemptydata\relax\else\checkaNSa(6)\let\factorNSA\cachedata\checkaNSa(8)\let\factorNSB\cachedata\def\aNS{\fpeval{\factorNSA*\factorNSB}}\fi\else\def\aNS{0.00}\fi%
		\ifdefined\aNTa\checkaNTa(1)\ifemptydata\relax\else\checkaNTa(6)\let\factorNTA\cachedata\checkaNTa(8)\let\factorNTB\cachedata\def\aNT{\fpeval{\factorNTA*\factorNTB}}\fi\else\def\aNT{0.00}\fi%
		\ifdefined\aNUa\checkaNUa(1)\ifemptydata\relax\else\checkaNUa(6)\let\factorNUA\cachedata\checkaNUa(8)\let\factorNUB\cachedata\def\aNU{\fpeval{\factorNUA*\factorNUB}}\fi\else\def\aNU{0.00}\fi%
		\ifdefined\aNVa\checkaNVa(1)\ifemptydata\relax\else\checkaNVa(6)\let\factorNVA\cachedata\checkaNVa(8)\let\factorNVB\cachedata\def\aNV{\fpeval{\factorNVA*\factorNVB}}\fi\else\def\aNV{0.00}\fi%
		\ifdefined\aNWa\checkaNWa(1)\ifemptydata\relax\else\checkaNWa(6)\let\factorNWA\cachedata\checkaNWa(8)\let\factorNWB\cachedata\def\aNW{\fpeval{\factorNWA*\factorNWB}}\fi\else\def\aNW{0.00}\fi%
		\ifdefined\aNXa\checkaNXa(1)\ifemptydata\relax\else\checkaNXa(6)\let\factorNXA\cachedata\checkaNXa(8)\let\factorNXB\cachedata\def\aNX{\fpeval{\factorNXA*\factorNXB}}\fi\else\def\aNX{0.00}\fi%
		\ifdefined\aNYa\checkaNYa(1)\ifemptydata\relax\else\checkaNYa(6)\let\factorNYA\cachedata\checkaNYa(8)\let\factorNYB\cachedata\def\aNY{\fpeval{\factorNYA*\factorNYB}}\fi\else\def\aNY{0.00}\fi%
		\ifdefined\aNZa\checkaNZa(1)\ifemptydata\relax\else\checkaNZa(6)\let\factorNZA\cachedata\checkaNZa(8)\let\factorNZB\cachedata\def\aNZ{\fpeval{\factorNZA*\factorNZB}}\fi\else\def\aNZ{0.00}\fi%
%
		\ifdefined\aOAa\checkaOAa(1)\ifemptydata\relax\else\checkaOAa(6)\let\factorOAA\cachedata\checkaOAa(8)\let\factorOAB\cachedata\def\aOA{\fpeval{\factorOAA*\factorOAB}}\fi\else\def\aOA{0.00}\fi%
		\ifdefined\aOBa\checkaOBa(1)\ifemptydata\relax\else\checkaOBa(6)\let\factorOBA\cachedata\checkaOBa(8)\let\factorOBB\cachedata\def\aOB{\fpeval{\factorOBA*\factorOBB}}\fi\else\def\aOB{0.00}\fi%
		\ifdefined\aOCa\checkaOCa(1)\ifemptydata\relax\else\checkaOCa(6)\let\factorOCA\cachedata\checkaOCa(8)\let\factorOCB\cachedata\def\aOC{\fpeval{\factorOCA*\factorOCB}}\fi\else\def\aOC{0.00}\fi%
		\ifdefined\aODa\checkaODa(1)\ifemptydata\relax\else\checkaODa(6)\let\factorODA\cachedata\checkaODa(8)\let\factorODB\cachedata\def\aOD{\fpeval{\factorODA*\factorODB}}\fi\else\def\aOD{0.00}\fi%
		\ifdefined\aOEa\checkaOEa(1)\ifemptydata\relax\else\checkaOEa(6)\let\factorOEA\cachedata\checkaOEa(8)\let\factorOEB\cachedata\def\aOE{\fpeval{\factorOEA*\factorOEB}}\fi\else\def\aOE{0.00}\fi%
		\ifdefined\aOFa\checkaOFa(1)\ifemptydata\relax\else\checkaOFa(6)\let\factorOFA\cachedata\checkaOFa(8)\let\factorOFB\cachedata\def\aOF{\fpeval{\factorOFA*\factorOFB}}\fi\else\def\aOF{0.00}\fi%
		\ifdefined\aOGa\checkaOGa(1)\ifemptydata\relax\else\checkaOGa(6)\let\factorOGA\cachedata\checkaOGa(8)\let\factorOGB\cachedata\def\aOG{\fpeval{\factorOGA*\factorOGB}}\fi\else\def\aOG{0.00}\fi%
		\ifdefined\aOHa\checkaOHa(1)\ifemptydata\relax\else\checkaOHa(6)\let\factorOHA\cachedata\checkaOHa(8)\let\factorOHB\cachedata\def\aOH{\fpeval{\factorOHA*\factorOHB}}\fi\else\def\aOH{0.00}\fi%
		\ifdefined\aOIa\checkaOIa(1)\ifemptydata\relax\else\checkaOIa(6)\let\factorOIA\cachedata\checkaOIa(8)\let\factorOIB\cachedata\def\aOI{\fpeval{\factorOIA*\factorOIB}}\fi\else\def\aOI{0.00}\fi%
		\ifdefined\aOJa\checkaOJa(1)\ifemptydata\relax\else\checkaOJa(6)\let\factorOJA\cachedata\checkaOJa(8)\let\factorOJB\cachedata\def\aOJ{\fpeval{\factorOJA*\factorOJB}}\fi\else\def\aOJ{0.00}\fi%
		\ifdefined\aOKa\checkaOKa(1)\ifemptydata\relax\else\checkaOKa(6)\let\factorOKA\cachedata\checkaOKa(8)\let\factorOKB\cachedata\def\aOK{\fpeval{\factorOKA*\factorOKB}}\fi\else\def\aOK{0.00}\fi%
		\ifdefined\aOLa\checkaOLa(1)\ifemptydata\relax\else\checkaOLa(6)\let\factorOLA\cachedata\checkaOLa(8)\let\factorOLB\cachedata\def\aOL{\fpeval{\factorOLA*\factorOLB}}\fi\else\def\aOL{0.00}\fi%
		\ifdefined\aOMa\checkaOMa(1)\ifemptydata\relax\else\checkaOMa(6)\let\factorOMA\cachedata\checkaOMa(8)\let\factorOMB\cachedata\def\aOM{\fpeval{\factorOMA*\factorOMB}}\fi\else\def\aOM{0.00}\fi%
		\ifdefined\aONa\checkaONa(1)\ifemptydata\relax\else\checkaONa(6)\let\factorONA\cachedata\checkaONa(8)\let\factorONB\cachedata\def\aON{\fpeval{\factorONA*\factorONB}}\fi\else\def\aON{0.00}\fi%
		\ifdefined\aOOa\checkaOOa(1)\ifemptydata\relax\else\checkaOOa(6)\let\factorOOA\cachedata\checkaOOa(8)\let\factorOOB\cachedata\def\aOO{\fpeval{\factorOOA*\factorOOB}}\fi\else\def\aOO{0.00}\fi%
		\ifdefined\aOPa\checkaOPa(1)\ifemptydata\relax\else\checkaOPa(6)\let\factorOPA\cachedata\checkaOPa(8)\let\factorOPB\cachedata\def\aOP{\fpeval{\factorOPA*\factorOPB}}\fi\else\def\aOP{0.00}\fi%
		\ifdefined\aOQa\checkaOQa(1)\ifemptydata\relax\else\checkaOQa(6)\let\factorOQA\cachedata\checkaOQa(8)\let\factorOQB\cachedata\def\aOQ{\fpeval{\factorOQA*\factorOQB}}\fi\else\def\aOQ{0.00}\fi%
		\ifdefined\aORa\checkaORa(1)\ifemptydata\relax\else\checkaORa(6)\let\factorORA\cachedata\checkaORa(8)\let\factorORB\cachedata\def\aOR{\fpeval{\factorORA*\factorORB}}\fi\else\def\aOR{0.00}\fi%
		\ifdefined\aOSa\checkaOSa(1)\ifemptydata\relax\else\checkaOSa(6)\let\factorOSA\cachedata\checkaOSa(8)\let\factorOSB\cachedata\def\aOS{\fpeval{\factorOSA*\factorOSB}}\fi\else\def\aOS{0.00}\fi%
		\ifdefined\aOTa\checkaOTa(1)\ifemptydata\relax\else\checkaOTa(6)\let\factorOTA\cachedata\checkaOTa(8)\let\factorOTB\cachedata\def\aOT{\fpeval{\factorOTA*\factorOTB}}\fi\else\def\aOT{0.00}\fi%
		\ifdefined\aOUa\checkaOUa(1)\ifemptydata\relax\else\checkaOUa(6)\let\factorOUA\cachedata\checkaOUa(8)\let\factorOUB\cachedata\def\aOU{\fpeval{\factorOUA*\factorOUB}}\fi\else\def\aOU{0.00}\fi%
		\ifdefined\aOVa\checkaOVa(1)\ifemptydata\relax\else\checkaOVa(6)\let\factorOVA\cachedata\checkaOVa(8)\let\factorOVB\cachedata\def\aOV{\fpeval{\factorOVA*\factorOVB}}\fi\else\def\aOV{0.00}\fi%
		\ifdefined\aOWa\checkaOWa(1)\ifemptydata\relax\else\checkaOWa(6)\let\factorOWA\cachedata\checkaOWa(8)\let\factorOWB\cachedata\def\aOW{\fpeval{\factorOWA*\factorOWB}}\fi\else\def\aOW{0.00}\fi%
		\ifdefined\aOXa\checkaOXa(1)\ifemptydata\relax\else\checkaOXa(6)\let\factorOXA\cachedata\checkaOXa(8)\let\factorOXB\cachedata\def\aOX{\fpeval{\factorOXA*\factorOXB}}\fi\else\def\aOX{0.00}\fi%
		\ifdefined\aOYa\checkaOYa(1)\ifemptydata\relax\else\checkaOYa(6)\let\factorOYA\cachedata\checkaOYa(8)\let\factorOYB\cachedata\def\aOY{\fpeval{\factorOYA*\factorOYB}}\fi\else\def\aOY{0.00}\fi%
		\ifdefined\aOZa\checkaOZa(1)\ifemptydata\relax\else\checkaOZa(6)\let\factorOZA\cachedata\checkaOZa(8)\let\factorOZB\cachedata\def\aOZ{\fpeval{\factorOZA*\factorOZB}}\fi\else\def\aOZ{0.00}\fi%
%
		\ifdefined\aPAa\checkaPAa(1)\ifemptydata\relax\else\checkaPAa(6)\let\factorPAA\cachedata\checkaPAa(8)\let\factorPAB\cachedata\def\aPA{\fpeval{\factorPAA*\factorPAB}}\fi\else\def\aPA{0.00}\fi%
		\ifdefined\aPBa\checkaPBa(1)\ifemptydata\relax\else\checkaPBa(6)\let\factorPBA\cachedata\checkaPBa(8)\let\factorPBB\cachedata\def\aPB{\fpeval{\factorPBA*\factorPBB}}\fi\else\def\aPB{0.00}\fi%
		\ifdefined\aPCa\checkaPCa(1)\ifemptydata\relax\else\checkaPCa(6)\let\factorPCA\cachedata\checkaPCa(8)\let\factorPCB\cachedata\def\aPC{\fpeval{\factorPCA*\factorPCB}}\fi\else\def\aPC{0.00}\fi%
		\ifdefined\aPDa\checkaPDa(1)\ifemptydata\relax\else\checkaPDa(6)\let\factorPDA\cachedata\checkaPDa(8)\let\factorPDB\cachedata\def\aPD{\fpeval{\factorPDA*\factorPDB}}\fi\else\def\aPD{0.00}\fi%
		\ifdefined\aPEa\checkaPEa(1)\ifemptydata\relax\else\checkaPEa(6)\let\factorPEA\cachedata\checkaPEa(8)\let\factorPEB\cachedata\def\aPE{\fpeval{\factorPEA*\factorPEB}}\fi\else\def\aPE{0.00}\fi%
		\ifdefined\aPFa\checkaPFa(1)\ifemptydata\relax\else\checkaPFa(6)\let\factorPFA\cachedata\checkaPFa(8)\let\factorPFB\cachedata\def\aPF{\fpeval{\factorPFA*\factorPFB}}\fi\else\def\aPF{0.00}\fi%
		\ifdefined\aPGa\checkaPGa(1)\ifemptydata\relax\else\checkaPGa(6)\let\factorPGA\cachedata\checkaPGa(8)\let\factorPGB\cachedata\def\aPG{\fpeval{\factorPGA*\factorPGB}}\fi\else\def\aPG{0.00}\fi%
		\ifdefined\aPHa\checkaPHa(1)\ifemptydata\relax\else\checkaPHa(6)\let\factorPHA\cachedata\checkaPHa(8)\let\factorPHB\cachedata\def\aPH{\fpeval{\factorPHA*\factorPHB}}\fi\else\def\aPH{0.00}\fi%
		\ifdefined\aPIa\checkaPIa(1)\ifemptydata\relax\else\checkaPIa(6)\let\factorPIA\cachedata\checkaPIa(8)\let\factorPIB\cachedata\def\aPI{\fpeval{\factorPIA*\factorPIB}}\fi\else\def\aPI{0.00}\fi%
		\ifdefined\aPJa\checkaPJa(1)\ifemptydata\relax\else\checkaPJa(6)\let\factorPJA\cachedata\checkaPJa(8)\let\factorPJB\cachedata\def\aPJ{\fpeval{\factorPJA*\factorPJB}}\fi\else\def\aPJ{0.00}\fi%
		\ifdefined\aPKa\checkaPKa(1)\ifemptydata\relax\else\checkaPKa(6)\let\factorPKA\cachedata\checkaPKa(8)\let\factorPKB\cachedata\def\aPK{\fpeval{\factorPKA*\factorPKB}}\fi\else\def\aPK{0.00}\fi%
		\ifdefined\aPLa\checkaPLa(1)\ifemptydata\relax\else\checkaPLa(6)\let\factorPLA\cachedata\checkaPLa(8)\let\factorPLB\cachedata\def\aPL{\fpeval{\factorPLA*\factorPLB}}\fi\else\def\aPL{0.00}\fi%
		\ifdefined\aPMa\checkaPMa(1)\ifemptydata\relax\else\checkaPMa(6)\let\factorPMA\cachedata\checkaPMa(8)\let\factorPMB\cachedata\def\aPM{\fpeval{\factorPMA*\factorPMB}}\fi\else\def\aPM{0.00}\fi%
		\ifdefined\aPNa\checkaPNa(1)\ifemptydata\relax\else\checkaPNa(6)\let\factorPNA\cachedata\checkaPNa(8)\let\factorPNB\cachedata\def\aPN{\fpeval{\factorPNA*\factorPNB}}\fi\else\def\aPN{0.00}\fi%
		\ifdefined\aPOa\checkaPOa(1)\ifemptydata\relax\else\checkaPOa(6)\let\factorPOA\cachedata\checkaPOa(8)\let\factorPOB\cachedata\def\aPO{\fpeval{\factorPOA*\factorPOB}}\fi\else\def\aPO{0.00}\fi%
		\ifdefined\aPPa\checkaPPa(1)\ifemptydata\relax\else\checkaPPa(6)\let\factorPPA\cachedata\checkaPPa(8)\let\factorPPB\cachedata\def\aPP{\fpeval{\factorPPA*\factorPPB}}\fi\else\def\aPP{0.00}\fi%
		\ifdefined\aPQa\checkaPQa(1)\ifemptydata\relax\else\checkaPQa(6)\let\factorPQA\cachedata\checkaPQa(8)\let\factorPQB\cachedata\def\aPQ{\fpeval{\factorPQA*\factorPQB}}\fi\else\def\aPQ{0.00}\fi%
		\ifdefined\aPRa\checkaPRa(1)\ifemptydata\relax\else\checkaPRa(6)\let\factorPRA\cachedata\checkaPRa(8)\let\factorPRB\cachedata\def\aPR{\fpeval{\factorPRA*\factorPRB}}\fi\else\def\aPR{0.00}\fi%
		\ifdefined\aPSa\checkaPSa(1)\ifemptydata\relax\else\checkaPSa(6)\let\factorPSA\cachedata\checkaPSa(8)\let\factorPSB\cachedata\def\aPS{\fpeval{\factorPSA*\factorPSB}}\fi\else\def\aPS{0.00}\fi%
		\ifdefined\aPTa\checkaPTa(1)\ifemptydata\relax\else\checkaPTa(6)\let\factorPTA\cachedata\checkaPTa(8)\let\factorPTB\cachedata\def\aPT{\fpeval{\factorPTA*\factorPTB}}\fi\else\def\aPT{0.00}\fi%
		\ifdefined\aPUa\checkaPUa(1)\ifemptydata\relax\else\checkaPUa(6)\let\factorPUA\cachedata\checkaPUa(8)\let\factorPUB\cachedata\def\aPU{\fpeval{\factorPUA*\factorPUB}}\fi\else\def\aPU{0.00}\fi%
		\ifdefined\aPVa\checkaPVa(1)\ifemptydata\relax\else\checkaPVa(6)\let\factorPVA\cachedata\checkaPVa(8)\let\factorPVB\cachedata\def\aPV{\fpeval{\factorPVA*\factorPVB}}\fi\else\def\aPV{0.00}\fi%
		\ifdefined\aPWa\checkaPWa(1)\ifemptydata\relax\else\checkaPWa(6)\let\factorPWA\cachedata\checkaPWa(8)\let\factorPWB\cachedata\def\aPW{\fpeval{\factorPWA*\factorPWB}}\fi\else\def\aPW{0.00}\fi%
		\ifdefined\aPXa\checkaPXa(1)\ifemptydata\relax\else\checkaPXa(6)\let\factorPXA\cachedata\checkaPXa(8)\let\factorPXB\cachedata\def\aPX{\fpeval{\factorPXA*\factorPXB}}\fi\else\def\aPX{0.00}\fi%
		\ifdefined\aPYa\checkaPYa(1)\ifemptydata\relax\else\checkaPYa(6)\let\factorPYA\cachedata\checkaPYa(8)\let\factorPYB\cachedata\def\aPY{\fpeval{\factorPYA*\factorPYB}}\fi\else\def\aPY{0.00}\fi%
		\ifdefined\aPZa\checkaPZa(1)\ifemptydata\relax\else\checkaPZa(6)\let\factorPZA\cachedata\checkaPZa(8)\let\factorPZB\cachedata\def\aPZ{\fpeval{\factorPZA*\factorPZB}}\fi\else\def\aPZ{0.00}\fi%
%
		\ifdefined\aQAa\checkaQAa(1)\ifemptydata\relax\else\checkaQAa(6)\let\factorQAA\cachedata\checkaQAa(8)\let\factorQAB\cachedata\def\aQA{\fpeval{\factorQAA*\factorQAB}}\fi\else\def\aQA{0.00}\fi%
		\ifdefined\aQBa\checkaQBa(1)\ifemptydata\relax\else\checkaQBa(6)\let\factorQBA\cachedata\checkaQBa(8)\let\factorQBB\cachedata\def\aQB{\fpeval{\factorQBA*\factorQBB}}\fi\else\def\aQB{0.00}\fi%
		\ifdefined\aQCa\checkaQCa(1)\ifemptydata\relax\else\checkaQCa(6)\let\factorQCA\cachedata\checkaQCa(8)\let\factorQCB\cachedata\def\aQC{\fpeval{\factorQCA*\factorQCB}}\fi\else\def\aQC{0.00}\fi%
		\ifdefined\aQDa\checkaQDa(1)\ifemptydata\relax\else\checkaQDa(6)\let\factorQDA\cachedata\checkaQDa(8)\let\factorQDB\cachedata\def\aQD{\fpeval{\factorQDA*\factorQDB}}\fi\else\def\aQD{0.00}\fi%
		\ifdefined\aQEa\checkaQEa(1)\ifemptydata\relax\else\checkaQEa(6)\let\factorQEA\cachedata\checkaQEa(8)\let\factorQEB\cachedata\def\aQE{\fpeval{\factorQEA*\factorQEB}}\fi\else\def\aQE{0.00}\fi%
		\ifdefined\aQFa\checkaQFa(1)\ifemptydata\relax\else\checkaQFa(6)\let\factorQFA\cachedata\checkaQFa(8)\let\factorQFB\cachedata\def\aQF{\fpeval{\factorQFA*\factorQFB}}\fi\else\def\aQF{0.00}\fi%
		\ifdefined\aQGa\checkaQGa(1)\ifemptydata\relax\else\checkaQGa(6)\let\factorQGA\cachedata\checkaQGa(8)\let\factorQGB\cachedata\def\aQG{\fpeval{\factorQGA*\factorQGB}}\fi\else\def\aQG{0.00}\fi%
		\ifdefined\aQHa\checkaQHa(1)\ifemptydata\relax\else\checkaQHa(6)\let\factorQHA\cachedata\checkaQHa(8)\let\factorQHB\cachedata\def\aQH{\fpeval{\factorQHA*\factorQHB}}\fi\else\def\aQH{0.00}\fi%
		\ifdefined\aQIa\checkaQIa(1)\ifemptydata\relax\else\checkaQIa(6)\let\factorQIA\cachedata\checkaQIa(8)\let\factorQIB\cachedata\def\aQI{\fpeval{\factorQIA*\factorQIB}}\fi\else\def\aQI{0.00}\fi%
		\ifdefined\aQJa\checkaQJa(1)\ifemptydata\relax\else\checkaQJa(6)\let\factorQJA\cachedata\checkaQJa(8)\let\factorQJB\cachedata\def\aQJ{\fpeval{\factorQJA*\factorQJB}}\fi\else\def\aQJ{0.00}\fi%
		\ifdefined\aQKa\checkaQKa(1)\ifemptydata\relax\else\checkaQKa(6)\let\factorQKA\cachedata\checkaQKa(8)\let\factorQKB\cachedata\def\aQK{\fpeval{\factorQKA*\factorQKB}}\fi\else\def\aQK{0.00}\fi%
		\ifdefined\aQLa\checkaQLa(1)\ifemptydata\relax\else\checkaQLa(6)\let\factorQLA\cachedata\checkaQLa(8)\let\factorQLB\cachedata\def\aQL{\fpeval{\factorQLA*\factorQLB}}\fi\else\def\aQL{0.00}\fi%
		\ifdefined\aQMa\checkaQMa(1)\ifemptydata\relax\else\checkaQMa(6)\let\factorQMA\cachedata\checkaQMa(8)\let\factorQMB\cachedata\def\aQM{\fpeval{\factorQMA*\factorQMB}}\fi\else\def\aQM{0.00}\fi%
		\ifdefined\aQNa\checkaQNa(1)\ifemptydata\relax\else\checkaQNa(6)\let\factorQNA\cachedata\checkaQNa(8)\let\factorQNB\cachedata\def\aQN{\fpeval{\factorQNA*\factorQNB}}\fi\else\def\aQN{0.00}\fi%
		\ifdefined\aQOa\checkaQOa(1)\ifemptydata\relax\else\checkaQOa(6)\let\factorQOA\cachedata\checkaQOa(8)\let\factorQOB\cachedata\def\aQO{\fpeval{\factorQOA*\factorQOB}}\fi\else\def\aQO{0.00}\fi%
		\ifdefined\aQPa\checkaQPa(1)\ifemptydata\relax\else\checkaQPa(6)\let\factorQPA\cachedata\checkaQPa(8)\let\factorQPB\cachedata\def\aQP{\fpeval{\factorQPA*\factorQPB}}\fi\else\def\aQP{0.00}\fi%
		\ifdefined\aQQa\checkaQQa(1)\ifemptydata\relax\else\checkaQQa(6)\let\factorQQA\cachedata\checkaQQa(8)\let\factorQQB\cachedata\def\aQQ{\fpeval{\factorQQA*\factorQQB}}\fi\else\def\aQQ{0.00}\fi%
		\ifdefined\aQRa\checkaQRa(1)\ifemptydata\relax\else\checkaQRa(6)\let\factorQRA\cachedata\checkaQRa(8)\let\factorQRB\cachedata\def\aQR{\fpeval{\factorQRA*\factorQRB}}\fi\else\def\aQR{0.00}\fi%
		\ifdefined\aQSa\checkaQSa(1)\ifemptydata\relax\else\checkaQSa(6)\let\factorQSA\cachedata\checkaQSa(8)\let\factorQSB\cachedata\def\aQS{\fpeval{\factorQSA*\factorQSB}}\fi\else\def\aQS{0.00}\fi%
		\ifdefined\aQTa\checkaQTa(1)\ifemptydata\relax\else\checkaQTa(6)\let\factorQTA\cachedata\checkaQTa(8)\let\factorQTB\cachedata\def\aQT{\fpeval{\factorQTA*\factorQTB}}\fi\else\def\aQT{0.00}\fi%
		\ifdefined\aQUa\checkaQUa(1)\ifemptydata\relax\else\checkaQUa(6)\let\factorQUA\cachedata\checkaQUa(8)\let\factorQUB\cachedata\def\aQU{\fpeval{\factorQUA*\factorQUB}}\fi\else\def\aQU{0.00}\fi%
		\ifdefined\aQVa\checkaQVa(1)\ifemptydata\relax\else\checkaQVa(6)\let\factorQVA\cachedata\checkaQVa(8)\let\factorQVB\cachedata\def\aQV{\fpeval{\factorQVA*\factorQVB}}\fi\else\def\aQV{0.00}\fi%
		\ifdefined\aQWa\checkaQWa(1)\ifemptydata\relax\else\checkaQWa(6)\let\factorQWA\cachedata\checkaQWa(8)\let\factorQWB\cachedata\def\aQW{\fpeval{\factorQWA*\factorQWB}}\fi\else\def\aQW{0.00}\fi%
		\ifdefined\aQXa\checkaQXa(1)\ifemptydata\relax\else\checkaQXa(6)\let\factorQXA\cachedata\checkaQXa(8)\let\factorQXB\cachedata\def\aQX{\fpeval{\factorQXA*\factorQXB}}\fi\else\def\aQX{0.00}\fi%
		\ifdefined\aQYa\checkaQYa(1)\ifemptydata\relax\else\checkaQYa(6)\let\factorQYA\cachedata\checkaQYa(8)\let\factorQYB\cachedata\def\aQY{\fpeval{\factorQYA*\factorQYB}}\fi\else\def\aQY{0.00}\fi%
		\ifdefined\aQZa\checkaQZa(1)\ifemptydata\relax\else\checkaQZa(6)\let\factorQZA\cachedata\checkaQZa(8)\let\factorQZB\cachedata\def\aQZ{\fpeval{\factorQZA*\factorQZB}}\fi\else\def\aQZ{0.00}\fi%
%
		\ifdefined\aRAa\checkaRAa(1)\ifemptydata\relax\else\checkaRAa(6)\let\factorRAA\cachedata\checkaRAa(8)\let\factorRAB\cachedata\def\aRA{\fpeval{\factorRAA*\factorRAB}}\fi\else\def\aRA{0.00}\fi%
		\ifdefined\aRBa\checkaRBa(1)\ifemptydata\relax\else\checkaRBa(6)\let\factorRBA\cachedata\checkaRBa(8)\let\factorRBB\cachedata\def\aRB{\fpeval{\factorRBA*\factorRBB}}\fi\else\def\aRB{0.00}\fi%
		\ifdefined\aRCa\checkaRCa(1)\ifemptydata\relax\else\checkaRCa(6)\let\factorRCA\cachedata\checkaRCa(8)\let\factorRCB\cachedata\def\aRC{\fpeval{\factorRCA*\factorRCB}}\fi\else\def\aRC{0.00}\fi%
		\ifdefined\aRDa\checkaRDa(1)\ifemptydata\relax\else\checkaRDa(6)\let\factorRDA\cachedata\checkaRDa(8)\let\factorRDB\cachedata\def\aRD{\fpeval{\factorRDA*\factorRDB}}\fi\else\def\aRD{0.00}\fi%
		\ifdefined\aREa\checkaREa(1)\ifemptydata\relax\else\checkaREa(6)\let\factorREA\cachedata\checkaREa(8)\let\factorREB\cachedata\def\aRE{\fpeval{\factorREA*\factorREB}}\fi\else\def\aRE{0.00}\fi%
		\ifdefined\aRFa\checkaRFa(1)\ifemptydata\relax\else\checkaRFa(6)\let\factorRFA\cachedata\checkaRFa(8)\let\factorRFB\cachedata\def\aRF{\fpeval{\factorRFA*\factorRFB}}\fi\else\def\aRF{0.00}\fi%
		\ifdefined\aRGa\checkaRGa(1)\ifemptydata\relax\else\checkaRGa(6)\let\factorRGA\cachedata\checkaRGa(8)\let\factorRGB\cachedata\def\aRG{\fpeval{\factorRGA*\factorRGB}}\fi\else\def\aRG{0.00}\fi%
		\ifdefined\aRHa\checkaRHa(1)\ifemptydata\relax\else\checkaRHa(6)\let\factorRHA\cachedata\checkaRHa(8)\let\factorRHB\cachedata\def\aRH{\fpeval{\factorRHA*\factorRHB}}\fi\else\def\aRH{0.00}\fi%
		\ifdefined\aRIa\checkaRIa(1)\ifemptydata\relax\else\checkaRIa(6)\let\factorRIA\cachedata\checkaRIa(8)\let\factorRIB\cachedata\def\aRI{\fpeval{\factorRIA*\factorRIB}}\fi\else\def\aRI{0.00}\fi%
		\ifdefined\aRJa\checkaRJa(1)\ifemptydata\relax\else\checkaRJa(6)\let\factorRJA\cachedata\checkaRJa(8)\let\factorRJB\cachedata\def\aRJ{\fpeval{\factorRJA*\factorRJB}}\fi\else\def\aRJ{0.00}\fi%
		\ifdefined\aRKa\checkaRKa(1)\ifemptydata\relax\else\checkaRKa(6)\let\factorRKA\cachedata\checkaRKa(8)\let\factorRKB\cachedata\def\aRK{\fpeval{\factorRKA*\factorRKB}}\fi\else\def\aRK{0.00}\fi%
		\ifdefined\aRLa\checkaRLa(1)\ifemptydata\relax\else\checkaRLa(6)\let\factorRLA\cachedata\checkaRLa(8)\let\factorRLB\cachedata\def\aRL{\fpeval{\factorRLA*\factorRLB}}\fi\else\def\aRL{0.00}\fi%
		\ifdefined\aRMa\checkaRMa(1)\ifemptydata\relax\else\checkaRMa(6)\let\factorRMA\cachedata\checkaRMa(8)\let\factorRMB\cachedata\def\aRM{\fpeval{\factorRMA*\factorRMB}}\fi\else\def\aRM{0.00}\fi%
		\ifdefined\aRNa\checkaRNa(1)\ifemptydata\relax\else\checkaRNa(6)\let\factorRNA\cachedata\checkaRNa(8)\let\factorRNB\cachedata\def\aRN{\fpeval{\factorRNA*\factorRNB}}\fi\else\def\aRN{0.00}\fi%
		\ifdefined\aROa\checkaROa(1)\ifemptydata\relax\else\checkaROa(6)\let\factorROA\cachedata\checkaROa(8)\let\factorROB\cachedata\def\aRO{\fpeval{\factorROA*\factorROB}}\fi\else\def\aRO{0.00}\fi%
		\ifdefined\aRPa\checkaRPa(1)\ifemptydata\relax\else\checkaRPa(6)\let\factorRPA\cachedata\checkaRPa(8)\let\factorRPB\cachedata\def\aRP{\fpeval{\factorRPA*\factorRPB}}\fi\else\def\aRP{0.00}\fi%
		\ifdefined\aRQa\checkaRQa(1)\ifemptydata\relax\else\checkaRQa(6)\let\factorRQA\cachedata\checkaRQa(8)\let\factorRQB\cachedata\def\aRQ{\fpeval{\factorRQA*\factorRQB}}\fi\else\def\aRQ{0.00}\fi%
		\ifdefined\aRRa\checkaRRa(1)\ifemptydata\relax\else\checkaRRa(6)\let\factorRRA\cachedata\checkaRRa(8)\let\factorRRB\cachedata\def\aRR{\fpeval{\factorRRA*\factorRRB}}\fi\else\def\aRR{0.00}\fi%
		\ifdefined\aRSa\checkaRSa(1)\ifemptydata\relax\else\checkaRSa(6)\let\factorRSA\cachedata\checkaRSa(8)\let\factorRSB\cachedata\def\aRS{\fpeval{\factorRSA*\factorRSB}}\fi\else\def\aRS{0.00}\fi%
		\ifdefined\aRTa\checkaRTa(1)\ifemptydata\relax\else\checkaRTa(6)\let\factorRTA\cachedata\checkaRTa(8)\let\factorRTB\cachedata\def\aRT{\fpeval{\factorRTA*\factorRTB}}\fi\else\def\aRT{0.00}\fi%
		\ifdefined\aRUa\checkaRUa(1)\ifemptydata\relax\else\checkaRUa(6)\let\factorRUA\cachedata\checkaRUa(8)\let\factorRUB\cachedata\def\aRU{\fpeval{\factorRUA*\factorRUB}}\fi\else\def\aRU{0.00}\fi%
		\ifdefined\aRVa\checkaRVa(1)\ifemptydata\relax\else\checkaRVa(6)\let\factorRVA\cachedata\checkaRVa(8)\let\factorRVB\cachedata\def\aRV{\fpeval{\factorRVA*\factorRVB}}\fi\else\def\aRV{0.00}\fi%
		\ifdefined\aRWa\checkaRWa(1)\ifemptydata\relax\else\checkaRWa(6)\let\factorRWA\cachedata\checkaRWa(8)\let\factorRWB\cachedata\def\aRW{\fpeval{\factorRWA*\factorRWB}}\fi\else\def\aRW{0.00}\fi%
		\ifdefined\aRXa\checkaRXa(1)\ifemptydata\relax\else\checkaRXa(6)\let\factorRXA\cachedata\checkaRXa(8)\let\factorRXB\cachedata\def\aRX{\fpeval{\factorRXA*\factorRXB}}\fi\else\def\aRX{0.00}\fi%
		\ifdefined\aRYa\checkaRYa(1)\ifemptydata\relax\else\checkaRYa(6)\let\factorRYA\cachedata\checkaRYa(8)\let\factorRYB\cachedata\def\aRY{\fpeval{\factorRYA*\factorRYB}}\fi\else\def\aRY{0.00}\fi%
		\ifdefined\aRZa\checkaRZa(1)\ifemptydata\relax\else\checkaRZa(6)\let\factorRZA\cachedata\checkaRZa(8)\let\factorRZB\cachedata\def\aRZ{\fpeval{\factorRZA*\factorRZB}}\fi\else\def\aRZ{0.00}\fi%
%
		\ifdefined\aSAa\checkaSAa(1)\ifemptydata\relax\else\checkaSAa(6)\let\factorSAA\cachedata\checkaSAa(8)\let\factorSAB\cachedata\def\aSA{\fpeval{\factorSAA*\factorSAB}}\fi\else\def\aSA{0.00}\fi%
		\ifdefined\aSBa\checkaSBa(1)\ifemptydata\relax\else\checkaSBa(6)\let\factorSBA\cachedata\checkaSBa(8)\let\factorSBB\cachedata\def\aSB{\fpeval{\factorSBA*\factorSBB}}\fi\else\def\aSB{0.00}\fi%
		\ifdefined\aSCa\checkaSCa(1)\ifemptydata\relax\else\checkaSCa(6)\let\factorSCA\cachedata\checkaSCa(8)\let\factorSCB\cachedata\def\aSC{\fpeval{\factorSCA*\factorSCB}}\fi\else\def\aSC{0.00}\fi%
		\ifdefined\aSDa\checkaSDa(1)\ifemptydata\relax\else\checkaSDa(6)\let\factorSDA\cachedata\checkaSDa(8)\let\factorSDB\cachedata\def\aSD{\fpeval{\factorSDA*\factorSDB}}\fi\else\def\aSD{0.00}\fi%
		\ifdefined\aSEa\checkaSEa(1)\ifemptydata\relax\else\checkaSEa(6)\let\factorSEA\cachedata\checkaSEa(8)\let\factorSEB\cachedata\def\aSE{\fpeval{\factorSEA*\factorSEB}}\fi\else\def\aSE{0.00}\fi%
		\ifdefined\aSFa\checkaSFa(1)\ifemptydata\relax\else\checkaSFa(6)\let\factorSFA\cachedata\checkaSFa(8)\let\factorSFB\cachedata\def\aSF{\fpeval{\factorSFA*\factorSFB}}\fi\else\def\aSF{0.00}\fi%
		\ifdefined\aSGa\checkaSGa(1)\ifemptydata\relax\else\checkaSGa(6)\let\factorSGA\cachedata\checkaSGa(8)\let\factorSGB\cachedata\def\aSG{\fpeval{\factorSGA*\factorSGB}}\fi\else\def\aSG{0.00}\fi%
		\ifdefined\aSHa\checkaSHa(1)\ifemptydata\relax\else\checkaSHa(6)\let\factorSHA\cachedata\checkaSHa(8)\let\factorSHB\cachedata\def\aSH{\fpeval{\factorSHA*\factorSHB}}\fi\else\def\aSH{0.00}\fi%
		\ifdefined\aSIa\checkaSIa(1)\ifemptydata\relax\else\checkaSIa(6)\let\factorSIA\cachedata\checkaSIa(8)\let\factorSIB\cachedata\def\aSI{\fpeval{\factorSIA*\factorSIB}}\fi\else\def\aSI{0.00}\fi%
		\ifdefined\aSJa\checkaSJa(1)\ifemptydata\relax\else\checkaSJa(6)\let\factorSJA\cachedata\checkaSJa(8)\let\factorSJB\cachedata\def\aSJ{\fpeval{\factorSJA*\factorSJB}}\fi\else\def\aSJ{0.00}\fi%
		\ifdefined\aSKa\checkaSKa(1)\ifemptydata\relax\else\checkaSKa(6)\let\factorSKA\cachedata\checkaSKa(8)\let\factorSKB\cachedata\def\aSK{\fpeval{\factorSKA*\factorSKB}}\fi\else\def\aSK{0.00}\fi%
		\ifdefined\aSLa\checkaSLa(1)\ifemptydata\relax\else\checkaSLa(6)\let\factorSLA\cachedata\checkaSLa(8)\let\factorSLB\cachedata\def\aSL{\fpeval{\factorSLA*\factorSLB}}\fi\else\def\aSL{0.00}\fi%
		\ifdefined\aSMa\checkaSMa(1)\ifemptydata\relax\else\checkaSMa(6)\let\factorSMA\cachedata\checkaSMa(8)\let\factorSMB\cachedata\def\aSM{\fpeval{\factorSMA*\factorSMB}}\fi\else\def\aSM{0.00}\fi%
		\ifdefined\aSNa\checkaSNa(1)\ifemptydata\relax\else\checkaSNa(6)\let\factorSNA\cachedata\checkaSNa(8)\let\factorSNB\cachedata\def\aSN{\fpeval{\factorSNA*\factorSNB}}\fi\else\def\aSN{0.00}\fi%
		\ifdefined\aSOa\checkaSOa(1)\ifemptydata\relax\else\checkaSOa(6)\let\factorSOA\cachedata\checkaSOa(8)\let\factorSOB\cachedata\def\aSO{\fpeval{\factorSOA*\factorSOB}}\fi\else\def\aSO{0.00}\fi%
		\ifdefined\aSPa\checkaSPa(1)\ifemptydata\relax\else\checkaSPa(6)\let\factorSPA\cachedata\checkaSPa(8)\let\factorSPB\cachedata\def\aSP{\fpeval{\factorSPA*\factorSPB}}\fi\else\def\aSP{0.00}\fi%
		\ifdefined\aSQa\checkaSQa(1)\ifemptydata\relax\else\checkaSQa(6)\let\factorSQA\cachedata\checkaSQa(8)\let\factorSQB\cachedata\def\aSQ{\fpeval{\factorSQA*\factorSQB}}\fi\else\def\aSQ{0.00}\fi%
		\ifdefined\aSRa\checkaSRa(1)\ifemptydata\relax\else\checkaSRa(6)\let\factorSRA\cachedata\checkaSRa(8)\let\factorSRB\cachedata\def\aSR{\fpeval{\factorSRA*\factorSRB}}\fi\else\def\aSR{0.00}\fi%
		\ifdefined\aSSa\checkaSSa(1)\ifemptydata\relax\else\checkaSSa(6)\let\factorSSA\cachedata\checkaSSa(8)\let\factorSSB\cachedata\def\aSS{\fpeval{\factorSSA*\factorSSB}}\fi\else\def\aSS{0.00}\fi%
		\ifdefined\aSTa\checkaSTa(1)\ifemptydata\relax\else\checkaSTa(6)\let\factorSTA\cachedata\checkaSTa(8)\let\factorSTB\cachedata\def\aST{\fpeval{\factorSTA*\factorSTB}}\fi\else\def\aST{0.00}\fi%
		\ifdefined\aSUa\checkaSUa(1)\ifemptydata\relax\else\checkaSUa(6)\let\factorSUA\cachedata\checkaSUa(8)\let\factorSUB\cachedata\def\aSU{\fpeval{\factorSUA*\factorSUB}}\fi\else\def\aSU{0.00}\fi%
		\ifdefined\aSVa\checkaSVa(1)\ifemptydata\relax\else\checkaSVa(6)\let\factorSVA\cachedata\checkaSVa(8)\let\factorSVB\cachedata\def\aSV{\fpeval{\factorSVA*\factorSVB}}\fi\else\def\aSV{0.00}\fi%
		\ifdefined\aSWa\checkaSWa(1)\ifemptydata\relax\else\checkaSWa(6)\let\factorSWA\cachedata\checkaSWa(8)\let\factorSWB\cachedata\def\aSW{\fpeval{\factorSWA*\factorSWB}}\fi\else\def\aSW{0.00}\fi%
		\ifdefined\aSXa\checkaSXa(1)\ifemptydata\relax\else\checkaSXa(6)\let\factorSXA\cachedata\checkaSXa(8)\let\factorSXB\cachedata\def\aSX{\fpeval{\factorSXA*\factorSXB}}\fi\else\def\aSX{0.00}\fi%
		\ifdefined\aSYa\checkaSYa(1)\ifemptydata\relax\else\checkaSYa(6)\let\factorSYA\cachedata\checkaSYa(8)\let\factorSYB\cachedata\def\aSY{\fpeval{\factorSYA*\factorSYB}}\fi\else\def\aSY{0.00}\fi%
		\ifdefined\aSZa\checkaSZa(1)\ifemptydata\relax\else\checkaSZa(6)\let\factorSZA\cachedata\checkaSZa(8)\let\factorSZB\cachedata\def\aSZ{\fpeval{\factorSZA*\factorSZB}}\fi\else\def\aSZ{0.00}\fi%
%
		\ifdefined\aTAa\checkaTAa(1)\ifemptydata\relax\else\checkaTAa(6)\let\factorTAA\cachedata\checkaTAa(8)\let\factorTAB\cachedata\def\aTA{\fpeval{\factorTAA*\factorTAB}}\fi\else\def\aTA{0.00}\fi%
		\ifdefined\aTBa\checkaTBa(1)\ifemptydata\relax\else\checkaTBa(6)\let\factorTBA\cachedata\checkaTBa(8)\let\factorTBB\cachedata\def\aTB{\fpeval{\factorTBA*\factorTBB}}\fi\else\def\aTB{0.00}\fi%
		\ifdefined\aTCa\checkaTCa(1)\ifemptydata\relax\else\checkaTCa(6)\let\factorTCA\cachedata\checkaTCa(8)\let\factorTCB\cachedata\def\aTC{\fpeval{\factorTCA*\factorTCB}}\fi\else\def\aTC{0.00}\fi%
		\ifdefined\aTDa\checkaTDa(1)\ifemptydata\relax\else\checkaTDa(6)\let\factorTDA\cachedata\checkaTDa(8)\let\factorTDB\cachedata\def\aTD{\fpeval{\factorTDA*\factorTDB}}\fi\else\def\aTD{0.00}\fi%
		\ifdefined\aTEa\checkaTEa(1)\ifemptydata\relax\else\checkaTEa(6)\let\factorTEA\cachedata\checkaTEa(8)\let\factorTEB\cachedata\def\aTE{\fpeval{\factorTEA*\factorTEB}}\fi\else\def\aTE{0.00}\fi%
		\ifdefined\aTFa\checkaTFa(1)\ifemptydata\relax\else\checkaTFa(6)\let\factorTFA\cachedata\checkaTFa(8)\let\factorTFB\cachedata\def\aTF{\fpeval{\factorTFA*\factorTFB}}\fi\else\def\aTF{0.00}\fi%
		\ifdefined\aTGa\checkaTGa(1)\ifemptydata\relax\else\checkaTGa(6)\let\factorTGA\cachedata\checkaTGa(8)\let\factorTGB\cachedata\def\aTG{\fpeval{\factorTGA*\factorTGB}}\fi\else\def\aTG{0.00}\fi%
		\ifdefined\aTHa\checkaTHa(1)\ifemptydata\relax\else\checkaTHa(6)\let\factorTHA\cachedata\checkaTHa(8)\let\factorTHB\cachedata\def\aTH{\fpeval{\factorTHA*\factorTHB}}\fi\else\def\aTH{0.00}\fi%
		\ifdefined\aTIa\checkaTIa(1)\ifemptydata\relax\else\checkaTIa(6)\let\factorTIA\cachedata\checkaTIa(8)\let\factorTIB\cachedata\def\aTI{\fpeval{\factorTIA*\factorTIB}}\fi\else\def\aTI{0.00}\fi%
		\ifdefined\aTJa\checkaTJa(1)\ifemptydata\relax\else\checkaTJa(6)\let\factorTJA\cachedata\checkaTJa(8)\let\factorTJB\cachedata\def\aTJ{\fpeval{\factorTJA*\factorTJB}}\fi\else\def\aTJ{0.00}\fi%
		\ifdefined\aTKa\checkaTKa(1)\ifemptydata\relax\else\checkaTKa(6)\let\factorTKA\cachedata\checkaTKa(8)\let\factorTKB\cachedata\def\aTK{\fpeval{\factorTKA*\factorTKB}}\fi\else\def\aTK{0.00}\fi%
		\ifdefined\aTLa\checkaTLa(1)\ifemptydata\relax\else\checkaTLa(6)\let\factorTLA\cachedata\checkaTLa(8)\let\factorTLB\cachedata\def\aTL{\fpeval{\factorTLA*\factorTLB}}\fi\else\def\aTL{0.00}\fi%
		\ifdefined\aTMa\checkaTMa(1)\ifemptydata\relax\else\checkaTMa(6)\let\factorTMA\cachedata\checkaTMa(8)\let\factorTMB\cachedata\def\aTM{\fpeval{\factorTMA*\factorTMB}}\fi\else\def\aTM{0.00}\fi%
		\ifdefined\aTNa\checkaTNa(1)\ifemptydata\relax\else\checkaTNa(6)\let\factorTNA\cachedata\checkaTNa(8)\let\factorTNB\cachedata\def\aTN{\fpeval{\factorTNA*\factorTNB}}\fi\else\def\aTN{0.00}\fi%
		\ifdefined\aTOa\checkaTOa(1)\ifemptydata\relax\else\checkaTOa(6)\let\factorTOA\cachedata\checkaTOa(8)\let\factorTOB\cachedata\def\aTO{\fpeval{\factorTOA*\factorTOB}}\fi\else\def\aTO{0.00}\fi%
		\ifdefined\aTPa\checkaTPa(1)\ifemptydata\relax\else\checkaTPa(6)\let\factorTPA\cachedata\checkaTPa(8)\let\factorTPB\cachedata\def\aTP{\fpeval{\factorTPA*\factorTPB}}\fi\else\def\aTP{0.00}\fi%
		\ifdefined\aTQa\checkaTQa(1)\ifemptydata\relax\else\checkaTQa(6)\let\factorTQA\cachedata\checkaTQa(8)\let\factorTQB\cachedata\def\aTQ{\fpeval{\factorTQA*\factorTQB}}\fi\else\def\aTQ{0.00}\fi%
		\ifdefined\aTRa\checkaTRa(1)\ifemptydata\relax\else\checkaTRa(6)\let\factorTRA\cachedata\checkaTRa(8)\let\factorTRB\cachedata\def\aTR{\fpeval{\factorTRA*\factorTRB}}\fi\else\def\aTR{0.00}\fi%
		\ifdefined\aTSa\checkaTSa(1)\ifemptydata\relax\else\checkaTSa(6)\let\factorTSA\cachedata\checkaTSa(8)\let\factorTSB\cachedata\def\aTS{\fpeval{\factorTSA*\factorTSB}}\fi\else\def\aTS{0.00}\fi%
		\ifdefined\aTTa\checkaTTa(1)\ifemptydata\relax\else\checkaTTa(6)\let\factorTTA\cachedata\checkaTTa(8)\let\factorTTB\cachedata\def\aTT{\fpeval{\factorTTA*\factorTTB}}\fi\else\def\aTT{0.00}\fi%
		\ifdefined\aTUa\checkaTUa(1)\ifemptydata\relax\else\checkaTUa(6)\let\factorTUA\cachedata\checkaTUa(8)\let\factorTUB\cachedata\def\aTU{\fpeval{\factorTUA*\factorTUB}}\fi\else\def\aTU{0.00}\fi%
		\ifdefined\aTVa\checkaTVa(1)\ifemptydata\relax\else\checkaTVa(6)\let\factorTVA\cachedata\checkaTVa(8)\let\factorTVB\cachedata\def\aTV{\fpeval{\factorTVA*\factorTVB}}\fi\else\def\aTV{0.00}\fi%
		\ifdefined\aTWa\checkaTWa(1)\ifemptydata\relax\else\checkaTWa(6)\let\factorTWA\cachedata\checkaTWa(8)\let\factorTWB\cachedata\def\aTW{\fpeval{\factorTWA*\factorTWB}}\fi\else\def\aTW{0.00}\fi%
		\ifdefined\aTXa\checkaTXa(1)\ifemptydata\relax\else\checkaTXa(6)\let\factorTXA\cachedata\checkaTXa(8)\let\factorTXB\cachedata\def\aTX{\fpeval{\factorTXA*\factorTXB}}\fi\else\def\aTX{0.00}\fi%
		\ifdefined\aTYa\checkaTYa(1)\ifemptydata\relax\else\checkaTYa(6)\let\factorTYA\cachedata\checkaTYa(8)\let\factorTYB\cachedata\def\aTY{\fpeval{\factorTYA*\factorTYB}}\fi\else\def\aTY{0.00}\fi%
		\ifdefined\aTZa\checkaTZa(1)\ifemptydata\relax\else\checkaTZa(6)\let\factorTZA\cachedata\checkaTZa(8)\let\factorTZB\cachedata\def\aTZ{\fpeval{\factorTZA*\factorTZB}}\fi\else\def\aTZ{0.00}\fi%
%
		\ifdefined\aUAa\checkaUAa(1)\ifemptydata\relax\else\checkaUAa(6)\let\factorUAA\cachedata\checkaUAa(8)\let\factorUAB\cachedata\def\aUA{\fpeval{\factorUAA*\factorUAB}}\fi\else\def\aUA{0.00}\fi%
		\ifdefined\aUBa\checkaUBa(1)\ifemptydata\relax\else\checkaUBa(6)\let\factorUBA\cachedata\checkaUBa(8)\let\factorUBB\cachedata\def\aUB{\fpeval{\factorUBA*\factorUBB}}\fi\else\def\aUB{0.00}\fi%
		\ifdefined\aUCa\checkaUCa(1)\ifemptydata\relax\else\checkaUCa(6)\let\factorUCA\cachedata\checkaUCa(8)\let\factorUCB\cachedata\def\aUC{\fpeval{\factorUCA*\factorUCB}}\fi\else\def\aUC{0.00}\fi%
		\ifdefined\aUDa\checkaUDa(1)\ifemptydata\relax\else\checkaUDa(6)\let\factorUDA\cachedata\checkaUDa(8)\let\factorUDB\cachedata\def\aUD{\fpeval{\factorUDA*\factorUDB}}\fi\else\def\aUD{0.00}\fi%
		\ifdefined\aUEa\checkaUEa(1)\ifemptydata\relax\else\checkaUEa(6)\let\factorUEA\cachedata\checkaUEa(8)\let\factorUEB\cachedata\def\aUE{\fpeval{\factorUEA*\factorUEB}}\fi\else\def\aUE{0.00}\fi%
		\ifdefined\aUFa\checkaUFa(1)\ifemptydata\relax\else\checkaUFa(6)\let\factorUFA\cachedata\checkaUFa(8)\let\factorUFB\cachedata\def\aUF{\fpeval{\factorUFA*\factorUFB}}\fi\else\def\aUF{0.00}\fi%
		\ifdefined\aUGa\checkaUGa(1)\ifemptydata\relax\else\checkaUGa(6)\let\factorUGA\cachedata\checkaUGa(8)\let\factorUGB\cachedata\def\aUG{\fpeval{\factorUGA*\factorUGB}}\fi\else\def\aUG{0.00}\fi%
		\ifdefined\aUHa\checkaUHa(1)\ifemptydata\relax\else\checkaUHa(6)\let\factorUHA\cachedata\checkaUHa(8)\let\factorUHB\cachedata\def\aUH{\fpeval{\factorUHA*\factorUHB}}\fi\else\def\aUH{0.00}\fi%
		\ifdefined\aUIa\checkaUIa(1)\ifemptydata\relax\else\checkaUIa(6)\let\factorUIA\cachedata\checkaUIa(8)\let\factorUIB\cachedata\def\aUI{\fpeval{\factorUIA*\factorUIB}}\fi\else\def\aUI{0.00}\fi%
		\ifdefined\aUJa\checkaUJa(1)\ifemptydata\relax\else\checkaUJa(6)\let\factorUJA\cachedata\checkaUJa(8)\let\factorUJB\cachedata\def\aUJ{\fpeval{\factorUJA*\factorUJB}}\fi\else\def\aUJ{0.00}\fi%
		\ifdefined\aUKa\checkaUKa(1)\ifemptydata\relax\else\checkaUKa(6)\let\factorUKA\cachedata\checkaUKa(8)\let\factorUKB\cachedata\def\aUK{\fpeval{\factorUKA*\factorUKB}}\fi\else\def\aUK{0.00}\fi%
		\ifdefined\aULa\checkaULa(1)\ifemptydata\relax\else\checkaULa(6)\let\factorULA\cachedata\checkaULa(8)\let\factorULB\cachedata\def\aUL{\fpeval{\factorULA*\factorULB}}\fi\else\def\aUL{0.00}\fi%
		\ifdefined\aUMa\checkaUMa(1)\ifemptydata\relax\else\checkaUMa(6)\let\factorUMA\cachedata\checkaUMa(8)\let\factorUMB\cachedata\def\aUM{\fpeval{\factorUMA*\factorUMB}}\fi\else\def\aUM{0.00}\fi%
		\ifdefined\aUNa\checkaUNa(1)\ifemptydata\relax\else\checkaUNa(6)\let\factorUNA\cachedata\checkaUNa(8)\let\factorUNB\cachedata\def\aUN{\fpeval{\factorUNA*\factorUNB}}\fi\else\def\aUN{0.00}\fi%
		\ifdefined\aUOa\checkaUOa(1)\ifemptydata\relax\else\checkaUOa(6)\let\factorUOA\cachedata\checkaUOa(8)\let\factorUOB\cachedata\def\aUO{\fpeval{\factorUOA*\factorUOB}}\fi\else\def\aUO{0.00}\fi%
		\ifdefined\aUPa\checkaUPa(1)\ifemptydata\relax\else\checkaUPa(6)\let\factorUPA\cachedata\checkaUPa(8)\let\factorUPB\cachedata\def\aUP{\fpeval{\factorUPA*\factorUPB}}\fi\else\def\aUP{0.00}\fi%
		\ifdefined\aUQa\checkaUQa(1)\ifemptydata\relax\else\checkaUQa(6)\let\factorUQA\cachedata\checkaUQa(8)\let\factorUQB\cachedata\def\aUQ{\fpeval{\factorUQA*\factorUQB}}\fi\else\def\aUQ{0.00}\fi%
		\ifdefined\aURa\checkaURa(1)\ifemptydata\relax\else\checkaURa(6)\let\factorURA\cachedata\checkaURa(8)\let\factorURB\cachedata\def\aUR{\fpeval{\factorURA*\factorURB}}\fi\else\def\aUR{0.00}\fi%
		\ifdefined\aUSa\checkaUSa(1)\ifemptydata\relax\else\checkaUSa(6)\let\factorUSA\cachedata\checkaUSa(8)\let\factorUSB\cachedata\def\aUS{\fpeval{\factorUSA*\factorUSB}}\fi\else\def\aUS{0.00}\fi%
		\ifdefined\aUTa\checkaUTa(1)\ifemptydata\relax\else\checkaUTa(6)\let\factorUTA\cachedata\checkaUTa(8)\let\factorUTB\cachedata\def\aUT{\fpeval{\factorUTA*\factorUTB}}\fi\else\def\aUT{0.00}\fi%
		\ifdefined\aUUa\checkaUUa(1)\ifemptydata\relax\else\checkaUUa(6)\let\factorUUA\cachedata\checkaUUa(8)\let\factorUUB\cachedata\def\aUU{\fpeval{\factorUUA*\factorUUB}}\fi\else\def\aUU{0.00}\fi%
		\ifdefined\aUVa\checkaUVa(1)\ifemptydata\relax\else\checkaUVa(6)\let\factorUVA\cachedata\checkaUVa(8)\let\factorUVB\cachedata\def\aUV{\fpeval{\factorUVA*\factorUVB}}\fi\else\def\aUV{0.00}\fi%
		\ifdefined\aUWa\checkaUWa(1)\ifemptydata\relax\else\checkaUWa(6)\let\factorUWA\cachedata\checkaUWa(8)\let\factorUWB\cachedata\def\aUW{\fpeval{\factorUWA*\factorUWB}}\fi\else\def\aUW{0.00}\fi%
		\ifdefined\aUXa\checkaUXa(1)\ifemptydata\relax\else\checkaUXa(6)\let\factorUXA\cachedata\checkaUXa(8)\let\factorUXB\cachedata\def\aUX{\fpeval{\factorUXA*\factorUXB}}\fi\else\def\aUX{0.00}\fi%
		\ifdefined\aUYa\checkaUYa(1)\ifemptydata\relax\else\checkaUYa(6)\let\factorUYA\cachedata\checkaUYa(8)\let\factorUYB\cachedata\def\aUY{\fpeval{\factorUYA*\factorUYB}}\fi\else\def\aUY{0.00}\fi%
		\ifdefined\aUZa\checkaUZa(1)\ifemptydata\relax\else\checkaUZa(6)\let\factorUZA\cachedata\checkaUZa(8)\let\factorUZB\cachedata\def\aUZ{\fpeval{\factorUZA*\factorUZB}}\fi\else\def\aUZ{0.00}\fi%
%
		\ifdefined\aVAa\checkaVAa(1)\ifemptydata\relax\else\checkaVAa(6)\let\factorVAA\cachedata\checkaVAa(8)\let\factorVAB\cachedata\def\aVA{\fpeval{\factorVAA*\factorVAB}}\fi\else\def\aVA{0.00}\fi%
		\ifdefined\aVBa\checkaVBa(1)\ifemptydata\relax\else\checkaVBa(6)\let\factorVBA\cachedata\checkaVBa(8)\let\factorVBB\cachedata\def\aVB{\fpeval{\factorVBA*\factorVBB}}\fi\else\def\aVB{0.00}\fi%
		\ifdefined\aVCa\checkaVCa(1)\ifemptydata\relax\else\checkaVCa(6)\let\factorVCA\cachedata\checkaVCa(8)\let\factorVCB\cachedata\def\aVC{\fpeval{\factorVCA*\factorVCB}}\fi\else\def\aVC{0.00}\fi%
		\ifdefined\aVDa\checkaVDa(1)\ifemptydata\relax\else\checkaVDa(6)\let\factorVDA\cachedata\checkaVDa(8)\let\factorVDB\cachedata\def\aVD{\fpeval{\factorVDA*\factorVDB}}\fi\else\def\aVD{0.00}\fi%
		\ifdefined\aVEa\checkaVEa(1)\ifemptydata\relax\else\checkaVEa(6)\let\factorVEA\cachedata\checkaVEa(8)\let\factorVEB\cachedata\def\aVE{\fpeval{\factorVEA*\factorVEB}}\fi\else\def\aVE{0.00}\fi%
		\ifdefined\aVFa\checkaVFa(1)\ifemptydata\relax\else\checkaVFa(6)\let\factorVFA\cachedata\checkaVFa(8)\let\factorVFB\cachedata\def\aVF{\fpeval{\factorVFA*\factorVFB}}\fi\else\def\aVF{0.00}\fi%
		\ifdefined\aVGa\checkaVGa(1)\ifemptydata\relax\else\checkaVGa(6)\let\factorVGA\cachedata\checkaVGa(8)\let\factorVGB\cachedata\def\aVG{\fpeval{\factorVGA*\factorVGB}}\fi\else\def\aVG{0.00}\fi%
		\ifdefined\aVHa\checkaVHa(1)\ifemptydata\relax\else\checkaVHa(6)\let\factorVHA\cachedata\checkaVHa(8)\let\factorVHB\cachedata\def\aVH{\fpeval{\factorVHA*\factorVHB}}\fi\else\def\aVH{0.00}\fi%
		\ifdefined\aVIa\checkaVIa(1)\ifemptydata\relax\else\checkaVIa(6)\let\factorVIA\cachedata\checkaVIa(8)\let\factorVIB\cachedata\def\aVI{\fpeval{\factorVIA*\factorVIB}}\fi\else\def\aVI{0.00}\fi%
		\ifdefined\aVJa\checkaVJa(1)\ifemptydata\relax\else\checkaVJa(6)\let\factorVJA\cachedata\checkaVJa(8)\let\factorVJB\cachedata\def\aVJ{\fpeval{\factorVJA*\factorVJB}}\fi\else\def\aVJ{0.00}\fi%
		\ifdefined\aVKa\checkaVKa(1)\ifemptydata\relax\else\checkaVKa(6)\let\factorVKA\cachedata\checkaVKa(8)\let\factorVKB\cachedata\def\aVK{\fpeval{\factorVKA*\factorVKB}}\fi\else\def\aVK{0.00}\fi%
		\ifdefined\aVLa\checkaVLa(1)\ifemptydata\relax\else\checkaVLa(6)\let\factorVLA\cachedata\checkaVLa(8)\let\factorVLB\cachedata\def\aVL{\fpeval{\factorVLA*\factorVLB}}\fi\else\def\aVL{0.00}\fi%
		\ifdefined\aVMa\checkaVMa(1)\ifemptydata\relax\else\checkaVMa(6)\let\factorVMA\cachedata\checkaVMa(8)\let\factorVMB\cachedata\def\aVM{\fpeval{\factorVMA*\factorVMB}}\fi\else\def\aVM{0.00}\fi%
		\ifdefined\aVNa\checkaVNa(1)\ifemptydata\relax\else\checkaVNa(6)\let\factorVNA\cachedata\checkaVNa(8)\let\factorVNB\cachedata\def\aVN{\fpeval{\factorVNA*\factorVNB}}\fi\else\def\aVN{0.00}\fi%
		\ifdefined\aVOa\checkaVOa(1)\ifemptydata\relax\else\checkaVOa(6)\let\factorVOA\cachedata\checkaVOa(8)\let\factorVOB\cachedata\def\aVO{\fpeval{\factorVOA*\factorVOB}}\fi\else\def\aVO{0.00}\fi%
		\ifdefined\aVPa\checkaVPa(1)\ifemptydata\relax\else\checkaVPa(6)\let\factorVPA\cachedata\checkaVPa(8)\let\factorVPB\cachedata\def\aVP{\fpeval{\factorVPA*\factorVPB}}\fi\else\def\aVP{0.00}\fi%
		\ifdefined\aVQa\checkaVQa(1)\ifemptydata\relax\else\checkaVQa(6)\let\factorVQA\cachedata\checkaVQa(8)\let\factorVQB\cachedata\def\aVQ{\fpeval{\factorVQA*\factorVQB}}\fi\else\def\aVQ{0.00}\fi%
		\ifdefined\aVRa\checkaVRa(1)\ifemptydata\relax\else\checkaVRa(6)\let\factorVRA\cachedata\checkaVRa(8)\let\factorVRB\cachedata\def\aVR{\fpeval{\factorVRA*\factorVRB}}\fi\else\def\aVR{0.00}\fi%
		\ifdefined\aVSa\checkaVSa(1)\ifemptydata\relax\else\checkaVSa(6)\let\factorVSA\cachedata\checkaVSa(8)\let\factorVSB\cachedata\def\aVS{\fpeval{\factorVSA*\factorVSB}}\fi\else\def\aVS{0.00}\fi%
		\ifdefined\aVTa\checkaVTa(1)\ifemptydata\relax\else\checkaVTa(6)\let\factorVTA\cachedata\checkaVTa(8)\let\factorVTB\cachedata\def\aVT{\fpeval{\factorVTA*\factorVTB}}\fi\else\def\aVT{0.00}\fi%
		\ifdefined\aVUa\checkaVUa(1)\ifemptydata\relax\else\checkaVUa(6)\let\factorVUA\cachedata\checkaVUa(8)\let\factorVUB\cachedata\def\aVU{\fpeval{\factorVUA*\factorVUB}}\fi\else\def\aVU{0.00}\fi%
		\ifdefined\aVVa\checkaVVa(1)\ifemptydata\relax\else\checkaVVa(6)\let\factorVVA\cachedata\checkaVVa(8)\let\factorVVB\cachedata\def\aVV{\fpeval{\factorVVA*\factorVVB}}\fi\else\def\aVV{0.00}\fi%
		\ifdefined\aVWa\checkaVWa(1)\ifemptydata\relax\else\checkaVWa(6)\let\factorVWA\cachedata\checkaVWa(8)\let\factorVWB\cachedata\def\aVW{\fpeval{\factorVWA*\factorVWB}}\fi\else\def\aVW{0.00}\fi%
		\ifdefined\aVXa\checkaVXa(1)\ifemptydata\relax\else\checkaVXa(6)\let\factorVXA\cachedata\checkaVXa(8)\let\factorVXB\cachedata\def\aVX{\fpeval{\factorVXA*\factorVXB}}\fi\else\def\aVX{0.00}\fi%
		\ifdefined\aVYa\checkaVYa(1)\ifemptydata\relax\else\checkaVYa(6)\let\factorVYA\cachedata\checkaVYa(8)\let\factorVYB\cachedata\def\aVY{\fpeval{\factorVYA*\factorVYB}}\fi\else\def\aVY{0.00}\fi%
		\ifdefined\aVZa\checkaVZa(1)\ifemptydata\relax\else\checkaVZa(6)\let\factorVZA\cachedata\checkaVZa(8)\let\factorVZB\cachedata\def\aVZ{\fpeval{\factorVZA*\factorVZB}}\fi\else\def\aVZ{0.00}\fi%
%	
		\ifdefined\aWAa\checkaWAa(1)\ifemptydata\relax\else\checkaWAa(6)\let\factorWAA\cachedata\checkaWAa(8)\let\factorWAB\cachedata\def\aWA{\fpeval{\factorWAA*\factorWAB}}\fi\else\def\aWA{0.00}\fi%
		\ifdefined\aWBa\checkaWBa(1)\ifemptydata\relax\else\checkaWBa(6)\let\factorWBA\cachedata\checkaWBa(8)\let\factorWBB\cachedata\def\aWB{\fpeval{\factorWBA*\factorWBB}}\fi\else\def\aWB{0.00}\fi%
		\ifdefined\aWCa\checkaWCa(1)\ifemptydata\relax\else\checkaWCa(6)\let\factorWCA\cachedata\checkaWCa(8)\let\factorWCB\cachedata\def\aWC{\fpeval{\factorWCA*\factorWCB}}\fi\else\def\aWC{0.00}\fi%
		\ifdefined\aWDa\checkaWDa(1)\ifemptydata\relax\else\checkaWDa(6)\let\factorWDA\cachedata\checkaWDa(8)\let\factorWDB\cachedata\def\aWD{\fpeval{\factorWDA*\factorWDB}}\fi\else\def\aWD{0.00}\fi%
		\ifdefined\aWEa\checkaWEa(1)\ifemptydata\relax\else\checkaWEa(6)\let\factorWEA\cachedata\checkaWEa(8)\let\factorWEB\cachedata\def\aWE{\fpeval{\factorWEA*\factorWEB}}\fi\else\def\aWE{0.00}\fi%
		\ifdefined\aWFa\checkaWFa(1)\ifemptydata\relax\else\checkaWFa(6)\let\factorWFA\cachedata\checkaWFa(8)\let\factorWFB\cachedata\def\aWF{\fpeval{\factorWFA*\factorWFB}}\fi\else\def\aWF{0.00}\fi%
		\ifdefined\aWGa\checkaWGa(1)\ifemptydata\relax\else\checkaWGa(6)\let\factorWGA\cachedata\checkaWGa(8)\let\factorWGB\cachedata\def\aWG{\fpeval{\factorWGA*\factorWGB}}\fi\else\def\aWG{0.00}\fi%
		\ifdefined\aWHa\checkaWHa(1)\ifemptydata\relax\else\checkaWHa(6)\let\factorWHA\cachedata\checkaWHa(8)\let\factorWHB\cachedata\def\aWH{\fpeval{\factorWHA*\factorWHB}}\fi\else\def\aWH{0.00}\fi%
		\ifdefined\aWIa\checkaWIa(1)\ifemptydata\relax\else\checkaWIa(6)\let\factorWIA\cachedata\checkaWIa(8)\let\factorWIB\cachedata\def\aWI{\fpeval{\factorWIA*\factorWIB}}\fi\else\def\aWI{0.00}\fi%
		\ifdefined\aWJa\checkaWJa(1)\ifemptydata\relax\else\checkaWJa(6)\let\factorWJA\cachedata\checkaWJa(8)\let\factorWJB\cachedata\def\aWJ{\fpeval{\factorWJA*\factorWJB}}\fi\else\def\aWJ{0.00}\fi%
		\ifdefined\aWKa\checkaWKa(1)\ifemptydata\relax\else\checkaWKa(6)\let\factorWKA\cachedata\checkaWKa(8)\let\factorWKB\cachedata\def\aWK{\fpeval{\factorWKA*\factorWKB}}\fi\else\def\aWK{0.00}\fi%
		\ifdefined\aWLa\checkaWLa(1)\ifemptydata\relax\else\checkaWLa(6)\let\factorWLA\cachedata\checkaWLa(8)\let\factorWLB\cachedata\def\aWL{\fpeval{\factorWLA*\factorWLB}}\fi\else\def\aWL{0.00}\fi%
		\ifdefined\aWMa\checkaWMa(1)\ifemptydata\relax\else\checkaWMa(6)\let\factorWMA\cachedata\checkaWMa(8)\let\factorWMB\cachedata\def\aWM{\fpeval{\factorWMA*\factorWMB}}\fi\else\def\aWM{0.00}\fi%
		\ifdefined\aWNa\checkaWNa(1)\ifemptydata\relax\else\checkaWNa(6)\let\factorWNA\cachedata\checkaWNa(8)\let\factorWNB\cachedata\def\aWN{\fpeval{\factorWNA*\factorWNB}}\fi\else\def\aWN{0.00}\fi%
		\ifdefined\aWOa\checkaWOa(1)\ifemptydata\relax\else\checkaWOa(6)\let\factorWOA\cachedata\checkaWOa(8)\let\factorWOB\cachedata\def\aWO{\fpeval{\factorWOA*\factorWOB}}\fi\else\def\aWO{0.00}\fi%
		\ifdefined\aWPa\checkaWPa(1)\ifemptydata\relax\else\checkaWPa(6)\let\factorWPA\cachedata\checkaWPa(8)\let\factorWPB\cachedata\def\aWP{\fpeval{\factorWPA*\factorWPB}}\fi\else\def\aWP{0.00}\fi%
		\ifdefined\aWQa\checkaWQa(1)\ifemptydata\relax\else\checkaWQa(6)\let\factorWQA\cachedata\checkaWQa(8)\let\factorWQB\cachedata\def\aWQ{\fpeval{\factorWQA*\factorWQB}}\fi\else\def\aWQ{0.00}\fi%
		\ifdefined\aWRa\checkaWRa(1)\ifemptydata\relax\else\checkaWRa(6)\let\factorWRA\cachedata\checkaWRa(8)\let\factorWRB\cachedata\def\aWR{\fpeval{\factorWRA*\factorWRB}}\fi\else\def\aWR{0.00}\fi%
		\ifdefined\aWSa\checkaWSa(1)\ifemptydata\relax\else\checkaWSa(6)\let\factorWSA\cachedata\checkaWSa(8)\let\factorWSB\cachedata\def\aWS{\fpeval{\factorWSA*\factorWSB}}\fi\else\def\aWS{0.00}\fi%
		\ifdefined\aWTa\checkaWTa(1)\ifemptydata\relax\else\checkaWTa(6)\let\factorWTA\cachedata\checkaWTa(8)\let\factorWTB\cachedata\def\aWT{\fpeval{\factorWTA*\factorWTB}}\fi\else\def\aWT{0.00}\fi%
		\ifdefined\aWUa\checkaWUa(1)\ifemptydata\relax\else\checkaWUa(6)\let\factorWUA\cachedata\checkaWUa(8)\let\factorWUB\cachedata\def\aWU{\fpeval{\factorWUA*\factorWUB}}\fi\else\def\aWU{0.00}\fi%
		\ifdefined\aWVa\checkaWVa(1)\ifemptydata\relax\else\checkaWVa(6)\let\factorWVA\cachedata\checkaWVa(8)\let\factorWVB\cachedata\def\aWV{\fpeval{\factorWVA*\factorWVB}}\fi\else\def\aWV{0.00}\fi%
		\ifdefined\aWWa\checkaWWa(1)\ifemptydata\relax\else\checkaWWa(6)\let\factorWWA\cachedata\checkaWWa(8)\let\factorWWB\cachedata\def\aWW{\fpeval{\factorWWA*\factorWWB}}\fi\else\def\aWW{0.00}\fi%
		\ifdefined\aWXa\checkaWXa(1)\ifemptydata\relax\else\checkaWXa(6)\let\factorWXA\cachedata\checkaWXa(8)\let\factorWXB\cachedata\def\aWX{\fpeval{\factorWXA*\factorWXB}}\fi\else\def\aWX{0.00}\fi%
		\ifdefined\aWYa\checkaWYa(1)\ifemptydata\relax\else\checkaWYa(6)\let\factorWYA\cachedata\checkaWYa(8)\let\factorWYB\cachedata\def\aWY{\fpeval{\factorWYA*\factorWYB}}\fi\else\def\aWY{0.00}\fi%
		\ifdefined\aWZa\checkaWZa(1)\ifemptydata\relax\else\checkaWZa(6)\let\factorWZA\cachedata\checkaWZa(8)\let\factorWZB\cachedata\def\aWZ{\fpeval{\factorWZA*\factorWZB}}\fi\else\def\aWZ{0.00}\fi%
%	
		\ifdefined\aXAa\checkaXAa(1)\ifemptydata\relax\else\checkaXAa(6)\let\factorXAA\cachedata\checkaXAa(8)\let\factorXAB\cachedata\def\aXA{\fpeval{\factorXAA*\factorXAB}}\fi\else\def\aXA{0.00}\fi%
		\ifdefined\aXBa\checkaXBa(1)\ifemptydata\relax\else\checkaXBa(6)\let\factorXBA\cachedata\checkaXBa(8)\let\factorXBB\cachedata\def\aXB{\fpeval{\factorXBA*\factorXBB}}\fi\else\def\aXB{0.00}\fi%
		\ifdefined\aXCa\checkaXCa(1)\ifemptydata\relax\else\checkaXCa(6)\let\factorXCA\cachedata\checkaXCa(8)\let\factorXCB\cachedata\def\aXC{\fpeval{\factorXCA*\factorXCB}}\fi\else\def\aXC{0.00}\fi%
		\ifdefined\aXDa\checkaXDa(1)\ifemptydata\relax\else\checkaXDa(6)\let\factorXDA\cachedata\checkaXDa(8)\let\factorXDB\cachedata\def\aXD{\fpeval{\factorXDA*\factorXDB}}\fi\else\def\aXD{0.00}\fi%
		\ifdefined\aXEa\checkaXEa(1)\ifemptydata\relax\else\checkaXEa(6)\let\factorXEA\cachedata\checkaXEa(8)\let\factorXEB\cachedata\def\aXE{\fpeval{\factorXEA*\factorXEB}}\fi\else\def\aXE{0.00}\fi%
		\ifdefined\aXFa\checkaXFa(1)\ifemptydata\relax\else\checkaXFa(6)\let\factorXFA\cachedata\checkaXFa(8)\let\factorXFB\cachedata\def\aXF{\fpeval{\factorXFA*\factorXFB}}\fi\else\def\aXF{0.00}\fi%
		\ifdefined\aXGa\checkaXGa(1)\ifemptydata\relax\else\checkaXGa(6)\let\factorXGA\cachedata\checkaXGa(8)\let\factorXGB\cachedata\def\aXG{\fpeval{\factorXGA*\factorXGB}}\fi\else\def\aXG{0.00}\fi%
		\ifdefined\aXHa\checkaXHa(1)\ifemptydata\relax\else\checkaXHa(6)\let\factorXHA\cachedata\checkaXHa(8)\let\factorXHB\cachedata\def\aXH{\fpeval{\factorXHA*\factorXHB}}\fi\else\def\aXH{0.00}\fi%
		\ifdefined\aXIa\checkaXIa(1)\ifemptydata\relax\else\checkaXIa(6)\let\factorXIA\cachedata\checkaXIa(8)\let\factorXIB\cachedata\def\aXI{\fpeval{\factorXIA*\factorXIB}}\fi\else\def\aXI{0.00}\fi%
		\ifdefined\aXJa\checkaXJa(1)\ifemptydata\relax\else\checkaXJa(6)\let\factorXJA\cachedata\checkaXJa(8)\let\factorXJB\cachedata\def\aXJ{\fpeval{\factorXJA*\factorXJB}}\fi\else\def\aXJ{0.00}\fi%
		\ifdefined\aXKa\checkaXKa(1)\ifemptydata\relax\else\checkaXKa(6)\let\factorXKA\cachedata\checkaXKa(8)\let\factorXKB\cachedata\def\aXK{\fpeval{\factorXKA*\factorXKB}}\fi\else\def\aXK{0.00}\fi%
		\ifdefined\aXLa\checkaXLa(1)\ifemptydata\relax\else\checkaXLa(6)\let\factorXLA\cachedata\checkaXLa(8)\let\factorXLB\cachedata\def\aXL{\fpeval{\factorXLA*\factorXLB}}\fi\else\def\aXL{0.00}\fi%
		\ifdefined\aXMa\checkaXMa(1)\ifemptydata\relax\else\checkaXMa(6)\let\factorXMA\cachedata\checkaXMa(8)\let\factorXMB\cachedata\def\aXM{\fpeval{\factorXMA*\factorXMB}}\fi\else\def\aXM{0.00}\fi%
		\ifdefined\aXNa\checkaXNa(1)\ifemptydata\relax\else\checkaXNa(6)\let\factorXNA\cachedata\checkaXNa(8)\let\factorXNB\cachedata\def\aXN{\fpeval{\factorXNA*\factorXNB}}\fi\else\def\aXN{0.00}\fi%
		\ifdefined\aXOa\checkaXOa(1)\ifemptydata\relax\else\checkaXOa(6)\let\factorXOA\cachedata\checkaXOa(8)\let\factorXOB\cachedata\def\aXO{\fpeval{\factorXOA*\factorXOB}}\fi\else\def\aXO{0.00}\fi%
		\ifdefined\aXPa\checkaXPa(1)\ifemptydata\relax\else\checkaXPa(6)\let\factorXPA\cachedata\checkaXPa(8)\let\factorXPB\cachedata\def\aXP{\fpeval{\factorXPA*\factorXPB}}\fi\else\def\aXP{0.00}\fi%
		\ifdefined\aXQa\checkaXQa(1)\ifemptydata\relax\else\checkaXQa(6)\let\factorXQA\cachedata\checkaXQa(8)\let\factorXQB\cachedata\def\aXQ{\fpeval{\factorXQA*\factorXQB}}\fi\else\def\aXQ{0.00}\fi%
		\ifdefined\aXRa\checkaXRa(1)\ifemptydata\relax\else\checkaXRa(6)\let\factorXRA\cachedata\checkaXRa(8)\let\factorXRB\cachedata\def\aXR{\fpeval{\factorXRA*\factorXRB}}\fi\else\def\aXR{0.00}\fi%
		\ifdefined\aXSa\checkaXSa(1)\ifemptydata\relax\else\checkaXSa(6)\let\factorXSA\cachedata\checkaXSa(8)\let\factorXSB\cachedata\def\aXS{\fpeval{\factorXSA*\factorXSB}}\fi\else\def\aXS{0.00}\fi%
		\ifdefined\aXTa\checkaXTa(1)\ifemptydata\relax\else\checkaXTa(6)\let\factorXTA\cachedata\checkaXTa(8)\let\factorXTB\cachedata\def\aXT{\fpeval{\factorXTA*\factorXTB}}\fi\else\def\aXT{0.00}\fi%
		\ifdefined\aXUa\checkaXUa(1)\ifemptydata\relax\else\checkaXUa(6)\let\factorXUA\cachedata\checkaXUa(8)\let\factorXUB\cachedata\def\aXU{\fpeval{\factorXUA*\factorXUB}}\fi\else\def\aXU{0.00}\fi%
		\ifdefined\aXVa\checkaXVa(1)\ifemptydata\relax\else\checkaXVa(6)\let\factorXVA\cachedata\checkaXVa(8)\let\factorXVB\cachedata\def\aXV{\fpeval{\factorXVA*\factorXVB}}\fi\else\def\aXV{0.00}\fi%
		\ifdefined\aXWa\checkaXWa(1)\ifemptydata\relax\else\checkaXWa(6)\let\factorXWA\cachedata\checkaXWa(8)\let\factorXWB\cachedata\def\aXW{\fpeval{\factorXWA*\factorXWB}}\fi\else\def\aXW{0.00}\fi%
		\ifdefined\aXXa\checkaXXa(1)\ifemptydata\relax\else\checkaXXa(6)\let\factorXXA\cachedata\checkaXXa(8)\let\factorXXB\cachedata\def\aXX{\fpeval{\factorXXA*\factorXXB}}\fi\else\def\aXX{0.00}\fi%
		\ifdefined\aXYa\checkaXYa(1)\ifemptydata\relax\else\checkaXYa(6)\let\factorXYA\cachedata\checkaXYa(8)\let\factorXYB\cachedata\def\aXY{\fpeval{\factorXYA*\factorXYB}}\fi\else\def\aXY{0.00}\fi%
		\ifdefined\aXZa\checkaXZa(1)\ifemptydata\relax\else\checkaXZa(6)\let\factorXZA\cachedata\checkaXZa(8)\let\factorXZB\cachedata\def\aXZ{\fpeval{\factorXZA*\factorXZB}}\fi\else\def\aXZ{0.00}\fi%
%	
		\ifdefined\aYAa\checkaYAa(1)\ifemptydata\relax\else\checkaYAa(6)\let\factorYAA\cachedata\checkaYAa(8)\let\factorYAB\cachedata\def\aYA{\fpeval{\factorYAA*\factorYAB}}\fi\else\def\aYA{0.00}\fi%
		\ifdefined\aYBa\checkaYBa(1)\ifemptydata\relax\else\checkaYBa(6)\let\factorYBA\cachedata\checkaYBa(8)\let\factorYBB\cachedata\def\aYB{\fpeval{\factorYBA*\factorYBB}}\fi\else\def\aYB{0.00}\fi%
		\ifdefined\aYCa\checkaYCa(1)\ifemptydata\relax\else\checkaYCa(6)\let\factorYCA\cachedata\checkaYCa(8)\let\factorYCB\cachedata\def\aYC{\fpeval{\factorYCA*\factorYCB}}\fi\else\def\aYC{0.00}\fi%
		\ifdefined\aYDa\checkaYDa(1)\ifemptydata\relax\else\checkaYDa(6)\let\factorYDA\cachedata\checkaYDa(8)\let\factorYDB\cachedata\def\aYD{\fpeval{\factorYDA*\factorYDB}}\fi\else\def\aYD{0.00}\fi%
		\ifdefined\aYEa\checkaYEa(1)\ifemptydata\relax\else\checkaYEa(6)\let\factorYEA\cachedata\checkaYEa(8)\let\factorYEB\cachedata\def\aYE{\fpeval{\factorYEA*\factorYEB}}\fi\else\def\aYE{0.00}\fi%
		\ifdefined\aYFa\checkaYFa(1)\ifemptydata\relax\else\checkaYFa(6)\let\factorYFA\cachedata\checkaYFa(8)\let\factorYFB\cachedata\def\aYF{\fpeval{\factorYFA*\factorYFB}}\fi\else\def\aYF{0.00}\fi%
		\ifdefined\aYGa\checkaYGa(1)\ifemptydata\relax\else\checkaYGa(6)\let\factorYGA\cachedata\checkaYGa(8)\let\factorYGB\cachedata\def\aYG{\fpeval{\factorYGA*\factorYGB}}\fi\else\def\aYG{0.00}\fi%
		\ifdefined\aYHa\checkaYHa(1)\ifemptydata\relax\else\checkaYHa(6)\let\factorYHA\cachedata\checkaYHa(8)\let\factorYHB\cachedata\def\aYH{\fpeval{\factorYHA*\factorYHB}}\fi\else\def\aYH{0.00}\fi%
		\ifdefined\aYIa\checkaYIa(1)\ifemptydata\relax\else\checkaYIa(6)\let\factorYIA\cachedata\checkaYIa(8)\let\factorYIB\cachedata\def\aYI{\fpeval{\factorYIA*\factorYIB}}\fi\else\def\aYI{0.00}\fi%
		\ifdefined\aYJa\checkaYJa(1)\ifemptydata\relax\else\checkaYJa(6)\let\factorYJA\cachedata\checkaYJa(8)\let\factorYJB\cachedata\def\aYJ{\fpeval{\factorYJA*\factorYJB}}\fi\else\def\aYJ{0.00}\fi%
		\ifdefined\aYKa\checkaYKa(1)\ifemptydata\relax\else\checkaYKa(6)\let\factorYKA\cachedata\checkaYKa(8)\let\factorYKB\cachedata\def\aYK{\fpeval{\factorYKA*\factorYKB}}\fi\else\def\aYK{0.00}\fi%
		\ifdefined\aYLa\checkaYLa(1)\ifemptydata\relax\else\checkaYLa(6)\let\factorYLA\cachedata\checkaYLa(8)\let\factorYLB\cachedata\def\aYL{\fpeval{\factorYLA*\factorYLB}}\fi\else\def\aYL{0.00}\fi%
		\ifdefined\aYMa\checkaYMa(1)\ifemptydata\relax\else\checkaYMa(6)\let\factorYMA\cachedata\checkaYMa(8)\let\factorYMB\cachedata\def\aYM{\fpeval{\factorYMA*\factorYMB}}\fi\else\def\aYM{0.00}\fi%
		\ifdefined\aYNa\checkaYNa(1)\ifemptydata\relax\else\checkaYNa(6)\let\factorYNA\cachedata\checkaYNa(8)\let\factorYNB\cachedata\def\aYN{\fpeval{\factorYNA*\factorYNB}}\fi\else\def\aYN{0.00}\fi%
		\ifdefined\aYOa\checkaYOa(1)\ifemptydata\relax\else\checkaYOa(6)\let\factorYOA\cachedata\checkaYOa(8)\let\factorYOB\cachedata\def\aYO{\fpeval{\factorYOA*\factorYOB}}\fi\else\def\aYO{0.00}\fi%
		\ifdefined\aYPa\checkaYPa(1)\ifemptydata\relax\else\checkaYPa(6)\let\factorYPA\cachedata\checkaYPa(8)\let\factorYPB\cachedata\def\aYP{\fpeval{\factorYPA*\factorYPB}}\fi\else\def\aYP{0.00}\fi%
		\ifdefined\aYQa\checkaYQa(1)\ifemptydata\relax\else\checkaYQa(6)\let\factorYQA\cachedata\checkaYQa(8)\let\factorYQB\cachedata\def\aYQ{\fpeval{\factorYQA*\factorYQB}}\fi\else\def\aYQ{0.00}\fi%
		\ifdefined\aYRa\checkaYRa(1)\ifemptydata\relax\else\checkaYRa(6)\let\factorYRA\cachedata\checkaYRa(8)\let\factorYRB\cachedata\def\aYR{\fpeval{\factorYRA*\factorYRB}}\fi\else\def\aYR{0.00}\fi%
		\ifdefined\aYSa\checkaYSa(1)\ifemptydata\relax\else\checkaYSa(6)\let\factorYSA\cachedata\checkaYSa(8)\let\factorYSB\cachedata\def\aYS{\fpeval{\factorYSA*\factorYSB}}\fi\else\def\aYS{0.00}\fi%
		\ifdefined\aYTa\checkaYTa(1)\ifemptydata\relax\else\checkaYTa(6)\let\factorYTA\cachedata\checkaYTa(8)\let\factorYTB\cachedata\def\aYT{\fpeval{\factorYTA*\factorYTB}}\fi\else\def\aYT{0.00}\fi%
		\ifdefined\aYUa\checkaYUa(1)\ifemptydata\relax\else\checkaYUa(6)\let\factorYUA\cachedata\checkaYUa(8)\let\factorYUB\cachedata\def\aYU{\fpeval{\factorYUA*\factorYUB}}\fi\else\def\aYU{0.00}\fi%
		\ifdefined\aYVa\checkaYVa(1)\ifemptydata\relax\else\checkaYVa(6)\let\factorYVA\cachedata\checkaYVa(8)\let\factorYVB\cachedata\def\aYV{\fpeval{\factorYVA*\factorYVB}}\fi\else\def\aYV{0.00}\fi%
		\ifdefined\aYWa\checkaYWa(1)\ifemptydata\relax\else\checkaYWa(6)\let\factorYWA\cachedata\checkaYWa(8)\let\factorYWB\cachedata\def\aYW{\fpeval{\factorYWA*\factorYWB}}\fi\else\def\aYW{0.00}\fi%
		\ifdefined\aYXa\checkaYXa(1)\ifemptydata\relax\else\checkaYXa(6)\let\factorYXA\cachedata\checkaYXa(8)\let\factorYXB\cachedata\def\aYX{\fpeval{\factorYXA*\factorYXB}}\fi\else\def\aYX{0.00}\fi%
		\ifdefined\aYYa\checkaYYa(1)\ifemptydata\relax\else\checkaYYa(6)\let\factorYYA\cachedata\checkaYYa(8)\let\factorYYB\cachedata\def\aYY{\fpeval{\factorYYA*\factorYYB}}\fi\else\def\aYY{0.00}\fi%
		\ifdefined\aYZa\checkaYZa(1)\ifemptydata\relax\else\checkaYZa(6)\let\factorYZA\cachedata\checkaYZa(8)\let\factorYZB\cachedata\def\aYZ{\fpeval{\factorYZA*\factorYZB}}\fi\else\def\aYZ{0.00}\fi%
%	
		\ifdefined\aZAa\checkaZAa(1)\ifemptydata\relax\else\checkaZAa(6)\let\factorZAA\cachedata\checkaZAa(8)\let\factorZAB\cachedata\def\aZA{\fpeval{\factorZAA*\factorZAB}}\fi\else\def\aZA{0.00}\fi%
		\ifdefined\aZBa\checkaZBa(1)\ifemptydata\relax\else\checkaZBa(6)\let\factorZBA\cachedata\checkaZBa(8)\let\factorZBB\cachedata\def\aZB{\fpeval{\factorZBA*\factorZBB}}\fi\else\def\aZB{0.00}\fi%
		\ifdefined\aZCa\checkaZCa(1)\ifemptydata\relax\else\checkaZCa(6)\let\factorZCA\cachedata\checkaZCa(8)\let\factorZCB\cachedata\def\aZC{\fpeval{\factorZCA*\factorZCB}}\fi\else\def\aZC{0.00}\fi%
		\ifdefined\aZDa\checkaZDa(1)\ifemptydata\relax\else\checkaZDa(6)\let\factorZDA\cachedata\checkaZDa(8)\let\factorZDB\cachedata\def\aZD{\fpeval{\factorZDA*\factorZDB}}\fi\else\def\aZD{0.00}\fi%
		\ifdefined\aZEa\checkaZEa(1)\ifemptydata\relax\else\checkaZEa(6)\let\factorZEA\cachedata\checkaZEa(8)\let\factorZEB\cachedata\def\aZE{\fpeval{\factorZEA*\factorZEB}}\fi\else\def\aZE{0.00}\fi%
		\ifdefined\aZFa\checkaZFa(1)\ifemptydata\relax\else\checkaZFa(6)\let\factorZFA\cachedata\checkaZFa(8)\let\factorZFB\cachedata\def\aZF{\fpeval{\factorZFA*\factorZFB}}\fi\else\def\aZF{0.00}\fi%
		\ifdefined\aZGa\checkaZGa(1)\ifemptydata\relax\else\checkaZGa(6)\let\factorZGA\cachedata\checkaZGa(8)\let\factorZGB\cachedata\def\aZG{\fpeval{\factorZGA*\factorZGB}}\fi\else\def\aZG{0.00}\fi%
		\ifdefined\aZHa\checkaZHa(1)\ifemptydata\relax\else\checkaZHa(6)\let\factorZHA\cachedata\checkaZHa(8)\let\factorZHB\cachedata\def\aZH{\fpeval{\factorZHA*\factorZHB}}\fi\else\def\aZH{0.00}\fi%
		\ifdefined\aZIa\checkaZIa(1)\ifemptydata\relax\else\checkaZIa(6)\let\factorZIA\cachedata\checkaZIa(8)\let\factorZIB\cachedata\def\aZI{\fpeval{\factorZIA*\factorZIB}}\fi\else\def\aZI{0.00}\fi%
		\ifdefined\aZJa\checkaZJa(1)\ifemptydata\relax\else\checkaZJa(6)\let\factorZJA\cachedata\checkaZJa(8)\let\factorZJB\cachedata\def\aZJ{\fpeval{\factorZJA*\factorZJB}}\fi\else\def\aZJ{0.00}\fi%
		\ifdefined\aZKa\checkaZKa(1)\ifemptydata\relax\else\checkaZKa(6)\let\factorZKA\cachedata\checkaZKa(8)\let\factorZKB\cachedata\def\aZK{\fpeval{\factorZKA*\factorZKB}}\fi\else\def\aZK{0.00}\fi%
		\ifdefined\aZLa\checkaZLa(1)\ifemptydata\relax\else\checkaZLa(6)\let\factorZLA\cachedata\checkaZLa(8)\let\factorZLB\cachedata\def\aZL{\fpeval{\factorZLA*\factorZLB}}\fi\else\def\aZL{0.00}\fi%
		\ifdefined\aZMa\checkaZMa(1)\ifemptydata\relax\else\checkaZMa(6)\let\factorZMA\cachedata\checkaZMa(8)\let\factorZMB\cachedata\def\aZM{\fpeval{\factorZMA*\factorZMB}}\fi\else\def\aZM{0.00}\fi%
		\ifdefined\aZNa\checkaZNa(1)\ifemptydata\relax\else\checkaZNa(6)\let\factorZNA\cachedata\checkaZNa(8)\let\factorZNB\cachedata\def\aZN{\fpeval{\factorZNA*\factorZNB}}\fi\else\def\aZN{0.00}\fi%
		\ifdefined\aZOa\checkaZOa(1)\ifemptydata\relax\else\checkaZOa(6)\let\factorZOA\cachedata\checkaZOa(8)\let\factorZOB\cachedata\def\aZO{\fpeval{\factorZOA*\factorZOB}}\fi\else\def\aZO{0.00}\fi%
		\ifdefined\aZPa\checkaZPa(1)\ifemptydata\relax\else\checkaZPa(6)\let\factorZPA\cachedata\checkaZPa(8)\let\factorZPB\cachedata\def\aZP{\fpeval{\factorZPA*\factorZPB}}\fi\else\def\aZP{0.00}\fi%
		\ifdefined\aZQa\checkaZQa(1)\ifemptydata\relax\else\checkaZQa(6)\let\factorZQA\cachedata\checkaZQa(8)\let\factorZQB\cachedata\def\aZQ{\fpeval{\factorZQA*\factorZQB}}\fi\else\def\aZQ{0.00}\fi%
		\ifdefined\aZRa\checkaZRa(1)\ifemptydata\relax\else\checkaZRa(6)\let\factorZRA\cachedata\checkaZRa(8)\let\factorZRB\cachedata\def\aZR{\fpeval{\factorZRA*\factorZRB}}\fi\else\def\aZR{0.00}\fi%
		\ifdefined\aZSa\checkaZSa(1)\ifemptydata\relax\else\checkaZSa(6)\let\factorZSA\cachedata\checkaZSa(8)\let\factorZSB\cachedata\def\aZS{\fpeval{\factorZSA*\factorZSB}}\fi\else\def\aZS{0.00}\fi%
		\ifdefined\aZTa\checkaZTa(1)\ifemptydata\relax\else\checkaZTa(6)\let\factorZTA\cachedata\checkaZTa(8)\let\factorZTB\cachedata\def\aZT{\fpeval{\factorZTA*\factorZTB}}\fi\else\def\aZT{0.00}\fi%
		\ifdefined\aZUa\checkaZUa(1)\ifemptydata\relax\else\checkaZUa(6)\let\factorZUA\cachedata\checkaZUa(8)\let\factorZUB\cachedata\def\aZU{\fpeval{\factorZUA*\factorZUB}}\fi\else\def\aZU{0.00}\fi%
		\ifdefined\aZVa\checkaZVa(1)\ifemptydata\relax\else\checkaZVa(6)\let\factorZVA\cachedata\checkaZVa(8)\let\factorZVB\cachedata\def\aZV{\fpeval{\factorZVA*\factorZVB}}\fi\else\def\aZV{0.00}\fi%
		\ifdefined\aZWa\checkaZWa(1)\ifemptydata\relax\else\checkaZWa(6)\let\factorZWA\cachedata\checkaZWa(8)\let\factorZWB\cachedata\def\aZW{\fpeval{\factorZWA*\factorZWB}}\fi\else\def\aZW{0.00}\fi%
		\ifdefined\aZXa\checkaZXa(1)\ifemptydata\relax\else\checkaZXa(6)\let\factorZXA\cachedata\checkaZXa(8)\let\factorZXB\cachedata\def\aZX{\fpeval{\factorZXA*\factorZXB}}\fi\else\def\aZX{0.00}\fi%
		\ifdefined\aZYa\checkaZYa(1)\ifemptydata\relax\else\checkaZYa(6)\let\factorZYA\cachedata\checkaZYa(8)\let\factorZYB\cachedata\def\aZY{\fpeval{\factorZYA*\factorZYB}}\fi\else\def\aZY{0.00}\fi%
		\ifdefined\aZZa\checkaZZa(1)\ifemptydata\relax\else\checkaZZa(6)\let\factorZZA\cachedata\checkaZZa(8)\let\factorZZB\cachedata\def\aZZ{\fpeval{\factorZZA*\factorZZB}}\fi\else\def\aZZ{0.00}\fi%
%
		\def \aA {%
			\fpeval{%
				\aAA+\aAB+\aAC+\aAD+\aAE+\aAF+\aAG+\aAH+\aAI+\aAJ+\aAK+\aAL+\aAM+%
				\aAN+\aAO+\aAP+\aAQ+\aAR+\aAS+\aAT+\aAU+\aAV+\aAW+\aAX+\aAY+\aAZ%
			}%
		}%
		\def \aB {%
			\fpeval{%
				\aBA+\aBB+\aBC+\aBD+\aBE+\aBF+\aBG+\aBH+\aBI+\aBJ+\aBK+\aBL+\aBM+%
				\aBN+\aBO+\aBP+\aBQ+\aBR+\aBS+\aBT+\aBU+\aBV+\aBW+\aBX+\aBY+\aBZ%
			}%
		}%
		\def \aC {%
			\fpeval{%
				\aCA+\aCB+\aCC+\aCD+\aCE+\aCF+\aCG+\aCH+\aCI+\aCJ+\aCK+\aCL+\aCM+%
				\aCN+\aCO+\aCP+\aCQ+\aCR+\aCS+\aCT+\aCU+\aCV+\aCW+\aCX+\aCY+\aCZ%
			}%
		}%
		\def \aD {%
			\fpeval{%
				\aDA+\aDB+\aDC+\aDD+\aDE+\aDF+\aDG+\aDH+\aDI+\aDJ+\aDK+\aDL+\aDM+%
				\aDN+\aDO+\aDP+\aDQ+\aDR+\aDS+\aDT+\aDU+\aDV+\aDW+\aDX+\aDY+\aDZ%
			}%
		}%
		\def \aE {%
			\fpeval{%
				\aEA+\aEB+\aEC+\aED+\aEE+\aEF+\aEG+\aEH+\aEI+\aEJ+\aEK+\aEL+\aEM+%
				\aEN+\aEO+\aEP+\aEQ+\aER+\aES+\aET+\aEU+\aEV+\aEW+\aEX+\aEY+\aEZ%
			}%
		}%
		\def \aF {%
			\fpeval{%
				\aFA+\aFB+\aFC+\aFD+\aFE+\aFF+\aFG+\aFH+\aFI+\aFJ+\aFK+\aFL+\aFM+%
				\aFN+\aFO+\aFP+\aFQ+\aFR+\aFS+\aFT+\aFU+\aFV+\aFW+\aFX+\aFY+\aFZ%
			}%
		}%
		\def \aG {%
			\fpeval{%
				\aGA+\aGB+\aGC+\aGD+\aGE+\aGF+\aGG+\aGH+\aGI+\aGJ+\aGK+\aGL+\aGM+%
				\aGN+\aGO+\aGP+\aGQ+\aGR+\aGS+\aGT+\aGU+\aGV+\aGW+\aGX+\aGY+\aGZ%
			}%
		}%
		\def \aH {%
			\fpeval{%
				\aHA+\aHB+\aHC+\aHD+\aHE+\aHF+\aHG+\aHH+\aHI+\aHJ+\aHK+\aHL+\aHM+%
				\aHN+\aHO+\aHP+\aHQ+\aHR+\aHS+\aHT+\aHU+\aHV+\aHW+\aHX+\aHY+\aHZ%
			}%
		}%
		\def \aI {%
			\fpeval{%
				\aIA+\aIB+\aIC+\aID+\aIE+\aIF+\aIG+\aIH+\aII+\aIJ+\aIK+\aIL+\aIM+%
				\aIN+\aIO+\aIP+\aIQ+\aIR+\aIS+\aIT+\aIU+\aIV+\aIW+\aIX+\aIY+\aIZ%
			}%
		}%
		\def \aJ {%
			\fpeval{%
				\aJA+\aJB+\aJC+\aJD+\aJE+\aJF+\aJG+\aJH+\aJI+\aJJ+\aJK+\aJL+\aJM+%
				\aJN+\aJO+\aJP+\aJQ+\aJR+\aJS+\aJT+\aJU+\aJV+\aJW+\aJX+\aJY+\aJZ%
			}%
		}%
		\def \aK {%
			\fpeval{%
				\aKA+\aKB+\aKC+\aKD+\aKE+\aKF+\aKG+\aKH+\aKI+\aKJ+\aKK+\aKL+\aKM+%
				\aKN+\aKO+\aKP+\aKQ+\aKR+\aKS+\aKT+\aKU+\aKV+\aKW+\aKX+\aKY+\aKZ%
			}%
		}%
		\def \aL {%
			\fpeval{%
				\aLA+\aLB+\aLC+\aLD+\aLE+\aLF+\aLG+\aLH+\aLI+\aLJ+\aLK+\aLL+\aLM+%
				\aLN+\aLO+\aLP+\aLQ+\aLR+\aLS+\aLT+\aLU+\aLV+\aLW+\aLX+\aLY+\aLZ%
			}%
		}%
		\def \aM {%
			\fpeval{%
				\aMA+\aMB+\aMC+\aMD+\aME+\aMF+\aMG+\aMH+\aMI+\aMJ+\aMK+\aML+\aMM+%
				\aMN+\aMO+\aMP+\aMQ+\aMR+\aMS+\aMT+\aMU+\aMV+\aMW+\aMX+\aMY+\aMZ%
			}%
		}%
		\def \aN {%
			\fpeval{%
				\aNA+\aNB+\aNC+\aND+\aNE+\aNF+\aNG+\aNH+\aNI+\aNJ+\aNK+\aNL+\aNM+%
				\aNN+\aNO+\aNP+\aNQ+\aNR+\aNS+\aNT+\aNU+\aNV+\aNW+\aNX+\aNY+\aNZ%
			}%
		}%
		\def \aO {%
			\fpeval{%
				\aOA+\aOB+\aOC+\aOD+\aOE+\aOF+\aOG+\aOH+\aOI+\aOJ+\aOK+\aOL+\aOM+%
				\aON+\aOO+\aOP+\aOQ+\aOR+\aOS+\aOT+\aOU+\aOV+\aOW+\aOX+\aOY+\aOZ%
			}%
		}%
		\def \aP {%
			\fpeval{%
				\aPA+\aPB+\aPC+\aPD+\aPE+\aPF+\aPG+\aPH+\aPI+\aPJ+\aPK+\aPL+\aPM+%
				\aPN+\aPO+\aPP+\aPQ+\aPR+\aPS+\aPT+\aPU+\aPV+\aPW+\aPX+\aPY+\aPZ%
			}%
		}%
		\def \aQ {%
			\fpeval{%
				\aQA+\aQB+\aQC+\aQD+\aQE+\aQF+\aQG+\aQH+\aQI+\aQJ+\aQK+\aQL+\aQM+%
				\aQN+\aQO+\aQP+\aQQ+\aQR+\aQS+\aQT+\aQU+\aQV+\aQW+\aQX+\aQY+\aQZ%
			}%
		}%
		\def \aR {%
			\fpeval{%
				\aRA+\aRB+\aRC+\aRD+\aRE+\aRF+\aRG+\aRH+\aRI+\aRJ+\aRK+\aRL+\aRM+%
				\aRN+\aRO+\aRP+\aRQ+\aRR+\aRS+\aRT+\aRU+\aRV+\aRW+\aRX+\aRY+\aRZ%
			}%
		}%
		\def \aS {%
			\fpeval{%
				\aSA+\aSB+\aSC+\aSD+\aSE+\aSF+\aSG+\aSH+\aSI+\aSJ+\aSK+\aSL+\aSM+%
				\aSN+\aSO+\aSP+\aSQ+\aSR+\aSS+\aST+\aSU+\aSV+\aSW+\aSX+\aSY+\aSZ%
			}%
		}%
		\def \aT {%
			\fpeval{%
				\aTA+\aTB+\aTC+\aTD+\aTE+\aTF+\aTG+\aTH+\aTI+\aTJ+\aTK+\aTL+\aTM+%
				\aTN+\aTO+\aTP+\aTQ+\aTR+\aTS+\aTT+\aTU+\aTV+\aTW+\aTX+\aTY+\aTZ%
			}%
		}%
		\def \aU {%
			\fpeval{%
				\aUA+\aUB+\aUC+\aUD+\aUE+\aUF+\aUG+\aUH+\aUI+\aUJ+\aUK+\aUL+\aUM+%
				\aUN+\aUO+\aUP+\aUQ+\aUR+\aUS+\aUT+\aUU+\aUV+\aUW+\aUX+\aUY+\aUZ%
			}%
		}%
		\def \aV {%
			\fpeval{%
				\aVA+\aVB+\aVC+\aVD+\aVE+\aVF+\aVG+\aVH+\aVI+\aVJ+\aVK+\aVL+\aVM+%
				\aVN+\aVO+\aVP+\aVQ+\aVR+\aVS+\aVT+\aVU+\aVV+\aVW+\aVX+\aVY+\aVZ%
			}%
		}%
		\def \aW {%
			\fpeval{%
				\aWA+\aWB+\aWC+\aWD+\aWE+\aWF+\aWG+\aWH+\aWI+\aWJ+\aWK+\aWL+\aWM+%
				\aWN+\aWO+\aWP+\aWQ+\aWR+\aWS+\aWT+\aWU+\aWV+\aWW+\aWX+\aWY+\aWZ%
			}%
		}%
		\def \aX {%
			\fpeval{%
				\aXA+\aXB+\aXC+\aXD+\aXE+\aXF+\aXG+\aXH+\aXI+\aXJ+\aXK+\aXL+\aXM+%
				\aXN+\aXO+\aXP+\aXQ+\aXR+\aXS+\aXT+\aXU+\aXV+\aXW+\aXX+\aXY+\aXZ%
			}%
		}%
		\def \aY {%
			\fpeval{%
				\aYA+\aYB+\aYC+\aYD+\aYE+\aYF+\aYG+\aYH+\aYI+\aYJ+\aYK+\aYL+\aYM+%
				\aYN+\aYO+\aYP+\aYQ+\aYR+\aYS+\aYT+\aYU+\aYV+\aYW+\aYX+\aYY+\aYZ%
			}%
		}%
		\def \aZ {%
			\fpeval{%
				\aZA+\aZB+\aZC+\aZD+\aZE+\aZF+\aZG+\aZH+\aZI+\aZJ+\aZK+\aZL+\aZM+%
				\aZN+\aZO+\aZP+\aZQ+\aZR+\aZS+\aZT+\aZU+\aZV+\aZW+\aZX+\aZY+\aZZ%
			}%
		}%
		\def \asset {%	
			\fpeval{%
				\aA+
				\aB+\aC+\aD+\aE+\aF+\aG+\aH+\aI+\aJ+\aK+\aL+\aM+%
				\aN+\aO+\aP+\aQ+\aR+\aS+\aT+\aU+\aV+\aW+\aX+\aY+\aZ%
			}%
		}%
	}%
	\renewcommand{\assetTables}{%
		\newpage%
		\begin{center} %
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aAAa%
			\captionof{table}{\large{\textsc{\aACaption}}}\label{tbl:asset:A}%
			\begin{tabularx}{\textwidth}{\assetTableColDef} %
				\assetTableColLabels%
				\toprule%
				\ifdefined\aAAa\rCa{\aAAa}&%
				\checkaAAa(4)\let\rAA\cachedata\ifemptydata\relax\else\IfNVOETF{\rAA}{}{\num{\rAA}\ts{}\aAAa(5)}\fi&%
				\checkaAAa(6)\let\rAA\cachedata\ifemptydata\relax\else\IfNVOETF{\rAA}{}{\num{\rAA}}\fi&%
				\checkaAAa(7)\let\rAA\cachedata\ifemptydata\relax\else\IfNVOETF{\rAA}{}{\num{\rAA}\%}\fi&%
				\checkaAAa(8)\let\rAA\cachedata\ifemptydata\relax\else\IfNVOETF{\rAA}{}{\num{\rAA} \euro}\fi&%
				\IfNVOETF{\aAA}{}{\num{\aAA} \euro}\expandafter\\\fi%
				\ifdefined\aABa\rCa{\aABa}&%
				\checkaABa(4)\let\rAB\cachedata\ifemptydata\relax\else\IfNVOETF{\rAB}{}{\num{\rAB}\ts{}\aABa(5)}\fi&%
				\checkaABa(6)\let\rAB\cachedata\ifemptydata\relax\else\IfNVOETF{\rAB}{}{\num{\rAB}}\fi&%
				\checkaABa(7)\let\rAB\cachedata\ifemptydata\relax\else\IfNVOETF{\rAB}{}{\num{\rAB}\%}\fi&%
				\checkaABa(8)\let\rAB\cachedata\ifemptydata\relax\else\IfNVOETF{\rAB}{}{\num{\rAB} \euro}\fi&%
				\IfNVOETF{\aAB}{}{\num{\aAB} \euro}\expandafter\\\fi%
				\ifdefined\aACa\rCa{\aACa}&%
				\checkaACa(4)\let\rAC\cachedata\ifemptydata\relax\else\IfNVOETF{\rAC}{}{\num{\rAC}\ts{}\aACa(5)}\fi&%
				\checkaACa(6)\let\rAC\cachedata\ifemptydata\relax\else\IfNVOETF{\rAC}{}{\num{\rAC}}\fi&%
				\checkaACa(7)\let\rAC\cachedata\ifemptydata\relax\else\IfNVOETF{\rAC}{}{\num{\rAC}\%}\fi&%
				\checkaACa(8)\let\rAC\cachedata\ifemptydata\relax\else\IfNVOETF{\rAC}{}{\num{\rAC} \euro}\fi&%
				\IfNVOETF{\aAC}{}{\num{\aAC} \euro}\expandafter\\\fi%
				\ifdefined\aADa\rCa{\aADa}&%
				\checkaADa(4)\let\rAD\cachedata\ifemptydata\relax\else\IfNVOETF{\rAD}{}{\num{\rAD}\ts{}\aADa(5)}\fi&%
				\checkaADa(6)\let\rAD\cachedata\ifemptydata\relax\else\IfNVOETF{\rAD}{}{\num{\rAD}}\fi&%
				\checkaADa(7)\let\rAD\cachedata\ifemptydata\relax\else\IfNVOETF{\rAD}{}{\num{\rAD}\%}\fi&%
				\checkaADa(8)\let\rAD\cachedata\ifemptydata\relax\else\IfNVOETF{\rAD}{}{\num{\rAD} \euro}\fi&%
				\IfNVOETF{\aAD}{}{\num{\aAD} \euro}\expandafter\\\fi%
				\ifdefined\aAEa\rCa{\aAEa}&%
				\checkaAEa(4)\let\rAE\cachedata\ifemptydata\relax\else\IfNVOETF{\rAE}{}{\num{\rAE}\ts{}\aAEa(5)}\fi&%
				\checkaAEa(6)\let\rAE\cachedata\ifemptydata\relax\else\IfNVOETF{\rAE}{}{\num{\rAE}}\fi&%
				\checkaAEa(7)\let\rAE\cachedata\ifemptydata\relax\else\IfNVOETF{\rAE}{}{\num{\rAE}\%}\fi&%
				\checkaAEa(8)\let\rAE\cachedata\ifemptydata\relax\else\IfNVOETF{\rAE}{}{\num{\rAE} \euro}\fi&%
				\IfNVOETF{\aAE}{}{\num{\aAE} \euro}\expandafter\\\fi%
				\ifdefined\aAFa\rCa{\aAFa}&%
				\checkaAFa(4)\let\rAF\cachedata\ifemptydata\relax\else\IfNVOETF{\rAF}{}{\num{\rAF}\ts{}\aAFa(5)}\fi&%
				\checkaAFa(6)\let\rAF\cachedata\ifemptydata\relax\else\IfNVOETF{\rAF}{}{\num{\rAF}}\fi&%
				\checkaAFa(7)\let\rAF\cachedata\ifemptydata\relax\else\IfNVOETF{\rAF}{}{\num{\rAF}\%}\fi&%
				\checkaAFa(8)\let\rAF\cachedata\ifemptydata\relax\else\IfNVOETF{\rAF}{}{\num{\rAF} \euro}\fi&%
				\IfNVOETF{\aAF}{}{\num{\aAF} \euro}\expandafter\\\fi%
				\ifdefined\aAGa\rCa{\aAGa}&%
				\checkaAGa(4)\let\rAG\cachedata\ifemptydata\relax\else\IfNVOETF{\rAG}{}{\num{\rAG}\ts{}\aAGa(5)}\fi&%
				\checkaAGa(6)\let\rAG\cachedata\ifemptydata\relax\else\IfNVOETF{\rAG}{}{\num{\rAG}}\fi&%
				\checkaAGa(7)\let\rAG\cachedata\ifemptydata\relax\else\IfNVOETF{\rAG}{}{\num{\rAG}\%}\fi&%
				\checkaAGa(8)\let\rAG\cachedata\ifemptydata\relax\else\IfNVOETF{\rAG}{}{\num{\rAG} \euro}\fi&%
				\IfNVOETF{\aAG}{}{\num{\aAG} \euro}\expandafter\\\fi%
				\ifdefined\aAIa\rCa{\aAIa}&%
				\checkaAIa(4)\let\rAI\cachedata\ifemptydata\relax\else\IfNVOETF{\rAI}{}{\num{\rAI}\ts{}\aAIa(5)}\fi&%
				\checkaAIa(6)\let\rAI\cachedata\ifemptydata\relax\else\IfNVOETF{\rAI}{}{\num{\rAI}}\fi&%
				\checkaAIa(7)\let\rAI\cachedata\ifemptydata\relax\else\IfNVOETF{\rAI}{}{\num{\rAI}\%}\fi&%
				\checkaAIa(8)\let\rAI\cachedata\ifemptydata\relax\else\IfNVOETF{\rAI}{}{\num{\rAI} \euro}\fi&%
				\IfNVOETF{\aAI}{}{\num{\aAI} \euro}\expandafter\\\fi%
				\ifdefined\aAJa\rCa{\aAJa}&%
				\checkaAJa(4)\let\rAJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAJ}{}{\num{\rAJ}\ts{}\aAJa(5)}\fi&%
				\checkaAJa(6)\let\rAJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAJ}{}{\num{\rAJ}}\fi&%
				\checkaAJa(7)\let\rAJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAJ}{}{\num{\rAJ}\%}\fi&%
				\checkaAJa(8)\let\rAJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAJ}{}{\num{\rAJ} \euro}\fi&%
				\IfNVOETF{\aAJ}{}{\num{\aAJ} \euro}\expandafter\\\fi%
				\ifdefined\aAKa\rCa{\aAKa}&%
				\checkaAKa(4)\let\rAK\cachedata\ifemptydata\relax\else\IfNVOETF{\rAK}{}{\num{\rAK}\ts{}\aAKa(5)}\fi&%
				\checkaAKa(6)\let\rAK\cachedata\ifemptydata\relax\else\IfNVOETF{\rAK}{}{\num{\rAK}}\fi&%
				\checkaAKa(7)\let\rAK\cachedata\ifemptydata\relax\else\IfNVOETF{\rAK}{}{\num{\rAK}\%}\fi&%
				\checkaAKa(8)\let\rAK\cachedata\ifemptydata\relax\else\IfNVOETF{\rAK}{}{\num{\rAK} \euro}\fi&%
				\IfNVOETF{\aAK}{}{\num{\aAK} \euro}\expandafter\\\fi%
				\ifdefined\aALa\rCa{\aALa}&%
				\checkaALa(4)\let\rAL\cachedata\ifemptydata\relax\else\IfNVOETF{\rAL}{}{\num{\rAL}\ts{}\aALa(5)}\fi&%
				\checkaALa(6)\let\rAL\cachedata\ifemptydata\relax\else\IfNVOETF{\rAL}{}{\num{\rAL}}\fi&%
				\checkaALa(7)\let\rAL\cachedata\ifemptydata\relax\else\IfNVOETF{\rAL}{}{\num{\rAL}\%}\fi&%
				\checkaALa(8)\let\rAL\cachedata\ifemptydata\relax\else\IfNVOETF{\rAL}{}{\num{\rAL} \euro}\fi&%
				\IfNVOETF{\aAL}{}{\num{\aAL} \euro}\expandafter\\\fi%
				\ifdefined\aAMa\rCa{\aAMa}&%
				\checkaAMa(4)\let\rAM\cachedata\ifemptydata\relax\else\IfNVOETF{\rAM}{}{\num{\rAM}\ts{}\aAMa(5)}\fi&%
				\checkaAMa(6)\let\rAM\cachedata\ifemptydata\relax\else\IfNVOETF{\rAM}{}{\num{\rAM}}\fi&%
				\checkaAMa(7)\let\rAM\cachedata\ifemptydata\relax\else\IfNVOETF{\rAM}{}{\num{\rAM}\%}\fi&%
				\checkaAMa(8)\let\rAM\cachedata\ifemptydata\relax\else\IfNVOETF{\rAM}{}{\num{\rAM} \euro}\fi&%
				\IfNVOETF{\aAM}{}{\num{\aAM} \euro}\expandafter\\\fi%
				\ifdefined\aANa\rCa{\aANa}&%
				\checkaANa(4)\let\rAN\cachedata\ifemptydata\relax\else\IfNVOETF{\rAN}{}{\num{\rAN}\ts{}\aANa(5)}\fi&%
				\checkaANa(6)\let\rAN\cachedata\ifemptydata\relax\else\IfNVOETF{\rAN}{}{\num{\rAN}}\fi&%
				\checkaANa(7)\let\rAN\cachedata\ifemptydata\relax\else\IfNVOETF{\rAN}{}{\num{\rAN}\%}\fi&%
				\checkaANa(8)\let\rAN\cachedata\ifemptydata\relax\else\IfNVOETF{\rAN}{}{\num{\rAN} \euro}\fi&%
				\IfNVOETF{\aAN}{}{\num{\aAN} \euro}\expandafter\\\fi%
				\ifdefined\aAOa\rCa{\aAOa}&%
				\checkaAOa(4)\let\rAO\cachedata\ifemptydata\relax\else\IfNVOETF{\rAO}{}{\num{\rAO}\ts{}\aAOa(5)}\fi&%
				\checkaAOa(6)\let\rAO\cachedata\ifemptydata\relax\else\IfNVOETF{\rAO}{}{\num{\rAO}}\fi&%
				\checkaAOa(7)\let\rAO\cachedata\ifemptydata\relax\else\IfNVOETF{\rAO}{}{\num{\rAO}\%}\fi&%
				\checkaAOa(8)\let\rAO\cachedata\ifemptydata\relax\else\IfNVOETF{\rAO}{}{\num{\rAO} \euro}\fi&%
				\IfNVOETF{\aAO}{}{\num{\aAO} \euro}\expandafter\\\fi%
				\ifdefined\aAPa\rCa{\aAPa}&%
				\checkaAPa(4)\let\rAP\cachedata\ifemptydata\relax\else\IfNVOETF{\rAP}{}{\num{\rAP}\ts{}\aAPa(5)}\fi&%
				\checkaAPa(6)\let\rAP\cachedata\ifemptydata\relax\else\IfNVOETF{\rAP}{}{\num{\rAP}}\fi&%
				\checkaAPa(7)\let\rAP\cachedata\ifemptydata\relax\else\IfNVOETF{\rAP}{}{\num{\rAP}\%}\fi&%
				\checkaAPa(8)\let\rAP\cachedata\ifemptydata\relax\else\IfNVOETF{\rAP}{}{\num{\rAP} \euro}\fi&%
				\IfNVOETF{\aAP}{}{\num{\aAP} \euro}\expandafter\\\fi%
				\ifdefined\aAQa\rCa{\aAQa}&%
				\checkaAQa(4)\let\rAQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAQ}{}{\num{\rAQ}\ts{}\aAQa(5)}\fi&%
				\checkaAQa(6)\let\rAQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAQ}{}{\num{\rAQ}}\fi&%
				\checkaAQa(7)\let\rAQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAQ}{}{\num{\rAQ}\%}\fi&%
				\checkaAQa(8)\let\rAQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAQ}{}{\num{\rAQ} \euro}\fi&%
				\IfNVOETF{\aAQ}{}{\num{\aAQ} \euro}\expandafter\\\fi%
				\ifdefined\aARa\rCa{\aARa}&%
				\checkaARa(4)\let\rAR\cachedata\ifemptydata\relax\else\IfNVOETF{\rAR}{}{\num{\rAR}\ts{}\aARa(5)}\fi&%
				\checkaARa(6)\let\rAR\cachedata\ifemptydata\relax\else\IfNVOETF{\rAR}{}{\num{\rAR}}\fi&%
				\checkaARa(7)\let\rAR\cachedata\ifemptydata\relax\else\IfNVOETF{\rAR}{}{\num{\rAR}\%}\fi&%
				\checkaARa(8)\let\rAR\cachedata\ifemptydata\relax\else\IfNVOETF{\rAR}{}{\num{\rAR} \euro}\fi&%
				\IfNVOETF{\aAR}{}{\num{\aAR} \euro}\expandafter\\\fi%
				\ifdefined\aASa\rCa{\aASa}&%
				\checkaASa(4)\let\rAS\cachedata\ifemptydata\relax\else\IfNVOETF{\rAS}{}{\num{\rAS}\ts{}\aASa(5)}\fi&%
				\checkaASa(6)\let\rAS\cachedata\ifemptydata\relax\else\IfNVOETF{\rAS}{}{\num{\rAS}}\fi&%
				\checkaASa(7)\let\rAS\cachedata\ifemptydata\relax\else\IfNVOETF{\rAS}{}{\num{\rAS}\%}\fi&%
				\checkaASa(8)\let\rAS\cachedata\ifemptydata\relax\else\IfNVOETF{\rAS}{}{\num{\rAS} \euro}\fi&%
				\IfNVOETF{\aAS}{}{\num{\aAS} \euro}\expandafter\\\fi%
				\ifdefined\aATa\rCa{\aATa}&%
				\checkaATa(4)\let\rAT\cachedata\ifemptydata\relax\else\IfNVOETF{\rAT}{}{\num{\rAT}\ts{}\aATa(5)}\fi&%
				\checkaATa(6)\let\rAT\cachedata\ifemptydata\relax\else\IfNVOETF{\rAT}{}{\num{\rAT}}\fi&%
				\checkaATa(7)\let\rAT\cachedata\ifemptydata\relax\else\IfNVOETF{\rAT}{}{\num{\rAT}\%}\fi&%
				\checkaATa(8)\let\rAT\cachedata\ifemptydata\relax\else\IfNVOETF{\rAT}{}{\num{\rAT} \euro}\fi&%
				\IfNVOETF{\aAT}{}{\num{\aAT} \euro}\expandafter\\\fi%
				\ifdefined\aAUa\rCa{\aAUa}&%
				\checkaAUa(4)\let\rAU\cachedata\ifemptydata\relax\else\IfNVOETF{\rAU}{}{\num{\rAU}\ts{}\aAUa(5)}\fi&%
				\checkaAUa(6)\let\rAU\cachedata\ifemptydata\relax\else\IfNVOETF{\rAU}{}{\num{\rAU}}\fi&%
				\checkaAUa(7)\let\rAU\cachedata\ifemptydata\relax\else\IfNVOETF{\rAU}{}{\num{\rAU}\%}\fi&%
				\checkaAUa(8)\let\rAU\cachedata\ifemptydata\relax\else\IfNVOETF{\rAU}{}{\num{\rAU} \euro}\fi&%
				\IfNVOETF{\aAU}{}{\num{\aAU} \euro}\expandafter\\\fi%
				\ifdefined\aAVa\rCa{\aAVa}&%
				\checkaAVa(4)\let\rAV\cachedata\ifemptydata\relax\else\IfNVOETF{\rAV}{}{\num{\rAV}\ts{}\aAVa(5)}\fi&%
				\checkaAVa(6)\let\rAV\cachedata\ifemptydata\relax\else\IfNVOETF{\rAV}{}{\num{\rAV}}\fi&%
				\checkaAVa(7)\let\rAV\cachedata\ifemptydata\relax\else\IfNVOETF{\rAV}{}{\num{\rAV}\%}\fi&%
				\checkaAVa(8)\let\rAV\cachedata\ifemptydata\relax\else\IfNVOETF{\rAV}{}{\num{\rAV} \euro}\fi&%
				\IfNVOETF{\aAV}{}{\num{\aAV} \euro}\expandafter\\\fi%
				\ifdefined\aAWa\rCa{\aAWa}&%
				\checkaAWa(4)\let\rAW\cachedata\ifemptydata\relax\else\IfNVOETF{\rAW}{}{\num{\rAW}\ts{}\aAWa(5)}\fi&%
				\checkaAWa(6)\let\rAW\cachedata\ifemptydata\relax\else\IfNVOETF{\rAW}{}{\num{\rAW}}\fi&%
				\checkaAWa(7)\let\rAW\cachedata\ifemptydata\relax\else\IfNVOETF{\rAW}{}{\num{\rAW}\%}\fi&%
				\checkaAWa(8)\let\rAW\cachedata\ifemptydata\relax\else\IfNVOETF{\rAW}{}{\num{\rAW} \euro}\fi&%
				\IfNVOETF{\aAW}{}{\num{\aAW} \euro}\expandafter\\\fi%
				\ifdefined\aAXa\rCa{\aAXa}&%
				\checkaAXa(4)\let\rAX\cachedata\ifemptydata\relax\else\IfNVOETF{\rAX}{}{\num{\rAX}\ts{}\aAXa(5)}\fi&%
				\checkaAXa(6)\let\rAX\cachedata\ifemptydata\relax\else\IfNVOETF{\rAX}{}{\num{\rAX}}\fi&%
				\checkaAXa(7)\let\rAX\cachedata\ifemptydata\relax\else\IfNVOETF{\rAX}{}{\num{\rAX}\%}\fi&%
				\checkaAXa(8)\let\rAX\cachedata\ifemptydata\relax\else\IfNVOETF{\rAX}{}{\num{\rAX} \euro}\fi&%
				\IfNVOETF{\aAX}{}{\num{\aAX} \euro}\expandafter\\\fi%
				\ifdefined\aAYa\rCa{\aAYa}&%
				\checkaAYa(4)\let\rAY\cachedata\ifemptydata\relax\else\IfNVOETF{\rAY}{}{\num{\rAY}\ts{}\aAYa(5)}\fi&%
				\checkaAYa(6)\let\rAY\cachedata\ifemptydata\relax\else\IfNVOETF{\rAY}{}{\num{\rAY}}\fi&%
				\checkaAYa(7)\let\rAY\cachedata\ifemptydata\relax\else\IfNVOETF{\rAY}{}{\num{\rAY}\%}\fi&%
				\checkaAYa(8)\let\rAY\cachedata\ifemptydata\relax\else\IfNVOETF{\rAY}{}{\num{\rAY} \euro}\fi&%
				\IfNVOETF{\aAY}{}{\num{\aAY} \euro}\expandafter\\\fi%	
				\ifdefined\aAZa\rCa{\aAZa}&%
				\checkaAZa(4)\let\rAZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAZ}{}{\num{\rAZ}\ts{}\aAZa(5)}\fi&%
				\checkaAZa(6)\let\rAZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAZ}{}{\num{\rAZ}}\fi&%
				\checkaAZa(7)\let\rAZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAZ}{}{\num{\rAZ}\%}\fi&%
				\checkaAZa(8)\let\rAZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rAZ}{}{\num{\rAZ} \euro}\fi&%
				\IfNVOETF{\aAZ}{}{\num{\aAZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aA} \euro    \\%
			\end{tabularx} %	
			\fi%
			\ifdefined\aBAa%
			\captionof{table}{\large{\textsc{\aBCaption}}}\label{tbl:asset:B}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aBAa\rCa{\aBAa}&%
				\checkaBAa(4)\let\rBA\cachedata\ifemptydata\relax\else\IfNVOETF{\rBA}{}{\num{\rBA}\ts{}\aBAa(5)}\fi&%
				\checkaBAa(6)\let\rBA\cachedata\ifemptydata\relax\else\IfNVOETF{\rBA}{}{\num{\rBA}}\fi&%
				\checkaBAa(7)\let\rBA\cachedata\ifemptydata\relax\else\IfNVOETF{\rBA}{}{\num{\rBA}\%}\fi&%
				\checkaBAa(8)\let\rBA\cachedata\ifemptydata\relax\else\IfNVOETF{\rBA}{}{\num{\rBA} \euro}\fi&%
				\IfNVOETF{\aBA}{}{\num{\aBA} \euro}\expandafter\\\fi%
				\ifdefined\aBBa\rCa{\aBBa}&%
				\checkaBBa(4)\let\rBB\cachedata\ifemptydata\relax\else\IfNVOETF{\rBB}{}{\num{\rBB}\ts{}\aBBa(5)}\fi&%
				\checkaBBa(6)\let\rBB\cachedata\ifemptydata\relax\else\IfNVOETF{\rBB}{}{\num{\rBB}}\fi&%
				\checkaBBa(7)\let\rBB\cachedata\ifemptydata\relax\else\IfNVOETF{\rBB}{}{\num{\rBB}\%}\fi&%
				\checkaBBa(8)\let\rBB\cachedata\ifemptydata\relax\else\IfNVOETF{\rBB}{}{\num{\rBB} \euro}\fi&%
				\IfNVOETF{\aBB}{}{\num{\aBB} \euro}\expandafter\\\fi%
				\ifdefined\aBCa\rCa{\aBCa}&%
				\checkaBCa(4)\let\rBC\cachedata\ifemptydata\relax\else\IfNVOETF{\rBC}{}{\num{\rBC}\ts{}\aBCa(5)}\fi&%
				\checkaBCa(6)\let\rBC\cachedata\ifemptydata\relax\else\IfNVOETF{\rBC}{}{\num{\rBC}}\fi&%
				\checkaBCa(7)\let\rBC\cachedata\ifemptydata\relax\else\IfNVOETF{\rBC}{}{\num{\rBC}\%}\fi&%
				\checkaBCa(8)\let\rBC\cachedata\ifemptydata\relax\else\IfNVOETF{\rBC}{}{\num{\rBC} \euro}\fi&%
				\IfNVOETF{\aBC}{}{\num{\aBC} \euro}\expandafter\\\fi%
				\ifdefined\aBDa\rCa{\aBDa}&%
				\checkaBDa(4)\let\rBD\cachedata\ifemptydata\relax\else\IfNVOETF{\rBD}{}{\num{\rBD}\ts{}\aBDa(5)}\fi&%
				\checkaBDa(6)\let\rBD\cachedata\ifemptydata\relax\else\IfNVOETF{\rBD}{}{\num{\rBD}}\fi&%
				\checkaBDa(7)\let\rBD\cachedata\ifemptydata\relax\else\IfNVOETF{\rBD}{}{\num{\rBD}\%}\fi&%
				\checkaBDa(8)\let\rBD\cachedata\ifemptydata\relax\else\IfNVOETF{\rBD}{}{\num{\rBD} \euro}\fi&%
				\IfNVOETF{\aBD}{}{\num{\aBD} \euro}\expandafter\\\fi%
				\ifdefined\aBEa\rCa{\aBEa}&%
				\checkaBEa(4)\let\rBE\cachedata\ifemptydata\relax\else\IfNVOETF{\rBE}{}{\num{\rBE}\ts{}\aBEa(5)}\fi&%
				\checkaBEa(6)\let\rBE\cachedata\ifemptydata\relax\else\IfNVOETF{\rBE}{}{\num{\rBE}}\fi&%
				\checkaBEa(7)\let\rBE\cachedata\ifemptydata\relax\else\IfNVOETF{\rBE}{}{\num{\rBE}\%}\fi&%
				\checkaBEa(8)\let\rBE\cachedata\ifemptydata\relax\else\IfNVOETF{\rBE}{}{\num{\rBE} \euro}\fi&%
				\IfNVOETF{\aBE}{}{\num{\aBE} \euro}\expandafter\\\fi%
				\ifdefined\aBFa\rCa{\aBFa}&%
				\checkaBFa(4)\let\rBF\cachedata\ifemptydata\relax\else\IfNVOETF{\rBF}{}{\num{\rBF}\ts{}\aBFa(5)}\fi&%
				\checkaBFa(6)\let\rBF\cachedata\ifemptydata\relax\else\IfNVOETF{\rBF}{}{\num{\rBF}}\fi&%
				\checkaBFa(7)\let\rBF\cachedata\ifemptydata\relax\else\IfNVOETF{\rBF}{}{\num{\rBF}\%}\fi&%
				\checkaBFa(8)\let\rBF\cachedata\ifemptydata\relax\else\IfNVOETF{\rBF}{}{\num{\rBF} \euro}\fi&%
				\IfNVOETF{\aBF}{}{\num{\aBF} \euro}\expandafter\\\fi%
				\ifdefined\aBGa\rCa{\aBGa}&%
				\checkaBGa(4)\let\rBG\cachedata\ifemptydata\relax\else\IfNVOETF{\rBG}{}{\num{\rBG}\ts{}\aBGa(5)}\fi&%
				\checkaBGa(6)\let\rBG\cachedata\ifemptydata\relax\else\IfNVOETF{\rBG}{}{\num{\rBG}}\fi&%
				\checkaBGa(7)\let\rBG\cachedata\ifemptydata\relax\else\IfNVOETF{\rBG}{}{\num{\rBG}\%}\fi&%
				\checkaBGa(8)\let\rBG\cachedata\ifemptydata\relax\else\IfNVOETF{\rBG}{}{\num{\rBG} \euro}\fi&%
				\IfNVOETF{\aBG}{}{\num{\aBG} \euro}\expandafter\\\fi%
				\ifdefined\aBIa\rCa{\aBIa}&%
				\checkaBIa(4)\let\rBI\cachedata\ifemptydata\relax\else\IfNVOETF{\rBI}{}{\num{\rBI}\ts{}\aBIa(5)}\fi&%
				\checkaBIa(6)\let\rBI\cachedata\ifemptydata\relax\else\IfNVOETF{\rBI}{}{\num{\rBI}}\fi&%
				\checkaBIa(7)\let\rBI\cachedata\ifemptydata\relax\else\IfNVOETF{\rBI}{}{\num{\rBI}\%}\fi&%
				\checkaBIa(8)\let\rBI\cachedata\ifemptydata\relax\else\IfNVOETF{\rBI}{}{\num{\rBI} \euro}\fi&%
				\IfNVOETF{\aBI}{}{\num{\aBI} \euro}\expandafter\\\fi%
				\ifdefined\aBJa\rCa{\aBJa}&%
				\checkaBJa(4)\let\rBJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBJ}{}{\num{\rBJ}\ts{}\aBJa(5)}\fi&%
				\checkaBJa(6)\let\rBJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBJ}{}{\num{\rBJ}}\fi&%
				\checkaBJa(7)\let\rBJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBJ}{}{\num{\rBJ}\%}\fi&%
				\checkaBJa(8)\let\rBJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBJ}{}{\num{\rBJ} \euro}\fi&%
				\IfNVOETF{\aBJ}{}{\num{\aBJ} \euro}\expandafter\\\fi%
				\ifdefined\aBKa\rCa{\aBKa}&%
				\checkaBKa(4)\let\rBK\cachedata\ifemptydata\relax\else\IfNVOETF{\rBK}{}{\num{\rBK}\ts{}\aBKa(5)}\fi&%
				\checkaBKa(6)\let\rBK\cachedata\ifemptydata\relax\else\IfNVOETF{\rBK}{}{\num{\rBK}}\fi&%
				\checkaBKa(7)\let\rBK\cachedata\ifemptydata\relax\else\IfNVOETF{\rBK}{}{\num{\rBK}\%}\fi&%
				\checkaBKa(8)\let\rBK\cachedata\ifemptydata\relax\else\IfNVOETF{\rBK}{}{\num{\rBK} \euro}\fi&%
				\IfNVOETF{\aBK}{}{\num{\aBK} \euro}\expandafter\\\fi%
				\ifdefined\aBLa\rCa{\aBLa}&%
				\checkaBLa(4)\let\rBL\cachedata\ifemptydata\relax\else\IfNVOETF{\rBL}{}{\num{\rBL}\ts{}\aBLa(5)}\fi&%
				\checkaBLa(6)\let\rBL\cachedata\ifemptydata\relax\else\IfNVOETF{\rBL}{}{\num{\rBL}}\fi&%
				\checkaBLa(7)\let\rBL\cachedata\ifemptydata\relax\else\IfNVOETF{\rBL}{}{\num{\rBL}\%}\fi&%
				\checkaBLa(8)\let\rBL\cachedata\ifemptydata\relax\else\IfNVOETF{\rBL}{}{\num{\rBL} \euro}\fi&%
				\IfNVOETF{\aBL}{}{\num{\aBL} \euro}\expandafter\\\fi%
				\ifdefined\aBMa\rCa{\aBMa}&%
				\checkaBMa(4)\let\rBM\cachedata\ifemptydata\relax\else\IfNVOETF{\rBM}{}{\num{\rBM}\ts{}\aBMa(5)}\fi&%
				\checkaBMa(6)\let\rBM\cachedata\ifemptydata\relax\else\IfNVOETF{\rBM}{}{\num{\rBM}}\fi&%
				\checkaBMa(7)\let\rBM\cachedata\ifemptydata\relax\else\IfNVOETF{\rBM}{}{\num{\rBM}\%}\fi&%
				\checkaBMa(8)\let\rBM\cachedata\ifemptydata\relax\else\IfNVOETF{\rBM}{}{\num{\rBM} \euro}\fi&%
				\IfNVOETF{\aBM}{}{\num{\aBM} \euro}\expandafter\\\fi%
				\ifdefined\aBNa\rCa{\aBNa}&%
				\checkaBNa(4)\let\rBN\cachedata\ifemptydata\relax\else\IfNVOETF{\rBN}{}{\num{\rBN}\ts{}\aBNa(5)}\fi&%
				\checkaBNa(6)\let\rBN\cachedata\ifemptydata\relax\else\IfNVOETF{\rBN}{}{\num{\rBN}}\fi&%
				\checkaBNa(7)\let\rBN\cachedata\ifemptydata\relax\else\IfNVOETF{\rBN}{}{\num{\rBN}\%}\fi&%
				\checkaBNa(8)\let\rBN\cachedata\ifemptydata\relax\else\IfNVOETF{\rBN}{}{\num{\rBN} \euro}\fi&%
				\IfNVOETF{\aBN}{}{\num{\aBN} \euro}\expandafter\\\fi%
				\ifdefined\aBOa\rCa{\aBOa}&%
				\checkaBOa(4)\let\rBO\cachedata\ifemptydata\relax\else\IfNVOETF{\rBO}{}{\num{\rBO}\ts{}\aBOa(5)}\fi&%
				\checkaBOa(6)\let\rBO\cachedata\ifemptydata\relax\else\IfNVOETF{\rBO}{}{\num{\rBO}}\fi&%
				\checkaBOa(7)\let\rBO\cachedata\ifemptydata\relax\else\IfNVOETF{\rBO}{}{\num{\rBO}\%}\fi&%
				\checkaBOa(8)\let\rBO\cachedata\ifemptydata\relax\else\IfNVOETF{\rBO}{}{\num{\rBO} \euro}\fi&%
				\IfNVOETF{\aBO}{}{\num{\aBO} \euro}\expandafter\\\fi%
				\ifdefined\aBPa\rCa{\aBPa}&%
				\checkaBPa(4)\let\rBP\cachedata\ifemptydata\relax\else\IfNVOETF{\rBP}{}{\num{\rBP}\ts{}\aBPa(5)}\fi&%
				\checkaBPa(6)\let\rBP\cachedata\ifemptydata\relax\else\IfNVOETF{\rBP}{}{\num{\rBP}}\fi&%
				\checkaBPa(7)\let\rBP\cachedata\ifemptydata\relax\else\IfNVOETF{\rBP}{}{\num{\rBP}\%}\fi&%
				\checkaBPa(8)\let\rBP\cachedata\ifemptydata\relax\else\IfNVOETF{\rBP}{}{\num{\rBP} \euro}\fi&%
				\IfNVOETF{\aBP}{}{\num{\aBP} \euro}\expandafter\\\fi%
				\ifdefined\aBQa\rCa{\aBQa}&%
				\checkaBQa(4)\let\rBQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBQ}{}{\num{\rBQ}\ts{}\aBQa(5)}\fi&%
				\checkaBQa(6)\let\rBQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBQ}{}{\num{\rBQ}}\fi&%
				\checkaBQa(7)\let\rBQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBQ}{}{\num{\rBQ}\%}\fi&%
				\checkaBQa(8)\let\rBQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBQ}{}{\num{\rBQ} \euro}\fi&%
				\IfNVOETF{\aBQ}{}{\num{\aBQ} \euro}\expandafter\\\fi%
				\ifdefined\aBRa\rCa{\aBRa}&%
				\checkaBRa(4)\let\rBR\cachedata\ifemptydata\relax\else\IfNVOETF{\rBR}{}{\num{\rBR}\ts{}\aBRa(5)}\fi&%
				\checkaBRa(6)\let\rBR\cachedata\ifemptydata\relax\else\IfNVOETF{\rBR}{}{\num{\rBR}}\fi&%
				\checkaBRa(7)\let\rBR\cachedata\ifemptydata\relax\else\IfNVOETF{\rBR}{}{\num{\rBR}\%}\fi&%
				\checkaBRa(8)\let\rBR\cachedata\ifemptydata\relax\else\IfNVOETF{\rBR}{}{\num{\rBR} \euro}\fi&%
				\IfNVOETF{\aBR}{}{\num{\aBR} \euro}\expandafter\\\fi%
				\ifdefined\aBSa\rCa{\aBSa}&%
				\checkaBSa(4)\let\rBS\cachedata\ifemptydata\relax\else\IfNVOETF{\rBS}{}{\num{\rBS}\ts{}\aBSa(5)}\fi&%
				\checkaBSa(6)\let\rBS\cachedata\ifemptydata\relax\else\IfNVOETF{\rBS}{}{\num{\rBS}}\fi&%
				\checkaBSa(7)\let\rBS\cachedata\ifemptydata\relax\else\IfNVOETF{\rBS}{}{\num{\rBS}\%}\fi&%
				\checkaBSa(8)\let\rBS\cachedata\ifemptydata\relax\else\IfNVOETF{\rBS}{}{\num{\rBS} \euro}\fi&%
				\IfNVOETF{\aBS}{}{\num{\aBS} \euro}\expandafter\\\fi%
				\ifdefined\aBTa\rCa{\aBTa}&%
				\checkaBTa(4)\let\rBT\cachedata\ifemptydata\relax\else\IfNVOETF{\rBT}{}{\num{\rBT}\ts{}\aBTa(5)}\fi&%
				\checkaBTa(6)\let\rBT\cachedata\ifemptydata\relax\else\IfNVOETF{\rBT}{}{\num{\rBT}}\fi&%
				\checkaBTa(7)\let\rBT\cachedata\ifemptydata\relax\else\IfNVOETF{\rBT}{}{\num{\rBT}\%}\fi&%
				\checkaBTa(8)\let\rBT\cachedata\ifemptydata\relax\else\IfNVOETF{\rBT}{}{\num{\rBT} \euro}\fi&%
				\IfNVOETF{\aBT}{}{\num{\aBT} \euro}\expandafter\\\fi%
				\ifdefined\aBUa\rCa{\aBUa}&%
				\checkaBUa(4)\let\rBU\cachedata\ifemptydata\relax\else\IfNVOETF{\rBU}{}{\num{\rBU}\ts{}\aBUa(5)}\fi&%
				\checkaBUa(6)\let\rBU\cachedata\ifemptydata\relax\else\IfNVOETF{\rBU}{}{\num{\rBU}}\fi&%
				\checkaBUa(7)\let\rBU\cachedata\ifemptydata\relax\else\IfNVOETF{\rBU}{}{\num{\rBU}\%}\fi&%
				\checkaBUa(8)\let\rBU\cachedata\ifemptydata\relax\else\IfNVOETF{\rBU}{}{\num{\rBU} \euro}\fi&%
				\IfNVOETF{\aBU}{}{\num{\aBU} \euro}\expandafter\\\fi%
				\ifdefined\aBVa\rCa{\aBVa}&%
				\checkaBVa(4)\let\rBV\cachedata\ifemptydata\relax\else\IfNVOETF{\rBV}{}{\num{\rBV}\ts{}\aBVa(5)}\fi&%
				\checkaBVa(6)\let\rBV\cachedata\ifemptydata\relax\else\IfNVOETF{\rBV}{}{\num{\rBV}}\fi&%
				\checkaBVa(7)\let\rBV\cachedata\ifemptydata\relax\else\IfNVOETF{\rBV}{}{\num{\rBV}\%}\fi&%
				\checkaBVa(8)\let\rBV\cachedata\ifemptydata\relax\else\IfNVOETF{\rBV}{}{\num{\rBV} \euro}\fi&%
				\IfNVOETF{\aBV}{}{\num{\aBV} \euro}\expandafter\\\fi%
				\ifdefined\aBWa\rCa{\aBWa}&%
				\checkaBWa(4)\let\rBW\cachedata\ifemptydata\relax\else\IfNVOETF{\rBW}{}{\num{\rBW}\ts{}\aBWa(5)}\fi&%
				\checkaBWa(6)\let\rBW\cachedata\ifemptydata\relax\else\IfNVOETF{\rBW}{}{\num{\rBW}}\fi&%
				\checkaBWa(7)\let\rBW\cachedata\ifemptydata\relax\else\IfNVOETF{\rBW}{}{\num{\rBW}\%}\fi&%
				\checkaBWa(8)\let\rBW\cachedata\ifemptydata\relax\else\IfNVOETF{\rBW}{}{\num{\rBW} \euro}\fi&%
				\IfNVOETF{\aBW}{}{\num{\aBW} \euro}\expandafter\\\fi%
				\ifdefined\aBXa\rCa{\aBXa}&%
				\checkaBXa(4)\let\rBX\cachedata\ifemptydata\relax\else\IfNVOETF{\rBX}{}{\num{\rBX}\ts{}\aBXa(5)}\fi&%
				\checkaBXa(6)\let\rBX\cachedata\ifemptydata\relax\else\IfNVOETF{\rBX}{}{\num{\rBX}}\fi&%
				\checkaBXa(7)\let\rBX\cachedata\ifemptydata\relax\else\IfNVOETF{\rBX}{}{\num{\rBX}\%}\fi&%
				\checkaBXa(8)\let\rBX\cachedata\ifemptydata\relax\else\IfNVOETF{\rBX}{}{\num{\rBX} \euro}\fi&%
				\IfNVOETF{\aBX}{}{\num{\aBX} \euro}\expandafter\\\fi%
				\ifdefined\aBYa\rCa{\aBYa}&%
				\checkaBYa(4)\let\rBY\cachedata\ifemptydata\relax\else\IfNVOETF{\rBY}{}{\num{\rBY}\ts{}\aBYa(5)}\fi&%
				\checkaBYa(6)\let\rBY\cachedata\ifemptydata\relax\else\IfNVOETF{\rBY}{}{\num{\rBY}}\fi&%
				\checkaBYa(7)\let\rBY\cachedata\ifemptydata\relax\else\IfNVOETF{\rBY}{}{\num{\rBY}\%}\fi&%
				\checkaBYa(8)\let\rBY\cachedata\ifemptydata\relax\else\IfNVOETF{\rBY}{}{\num{\rBY} \euro}\fi&%
				\IfNVOETF{\aBY}{}{\num{\aBY} \euro}\expandafter\\\fi%	
				\ifdefined\aBZa\rCa{\aBZa}&%
				\checkaBZa(4)\let\rBZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBZ}{}{\num{\rBZ}\ts{}\aBZa(5)}\fi&%
				\checkaBZa(6)\let\rBZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBZ}{}{\num{\rBZ}}\fi&%
				\checkaBZa(7)\let\rBZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBZ}{}{\num{\rBZ}\%}\fi&%
				\checkaBZa(8)\let\rBZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rBZ}{}{\num{\rBZ} \euro}\fi&%
				\IfNVOETF{\aBZ}{}{\num{\aBZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aB} \euro    \\%
			\end{tabularx} %
			\fi%		
			\ifdefined\aCAa%
			\captionof{table}{\large{\textsc{\aCCaption}}}\label{tbl:asset:C}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aCAa\rCa{\aCAa}&%
				\checkaCAa(4)\let\rCA\cachedata\ifemptydata\relax\else\IfNVOETF{\rCA}{}{\num{\rCA}\ts{}\aCAa(5)}\fi&%
				\checkaCAa(6)\let\rCA\cachedata\ifemptydata\relax\else\IfNVOETF{\rCA}{}{\num{\rCA}}\fi&%
				\checkaCAa(7)\let\rCA\cachedata\ifemptydata\relax\else\IfNVOETF{\rCA}{}{\num{\rCA}\%}\fi&%
				\checkaCAa(8)\let\rCA\cachedata\ifemptydata\relax\else\IfNVOETF{\rCA}{}{\num{\rCA} \euro}\fi&%
				\IfNVOETF{\aCA}{}{\num{\aCA} \euro}\expandafter\\\fi%
				\ifdefined\aCBa\rCa{\aCBa}&%
				\checkaCBa(4)\let\rCB\cachedata\ifemptydata\relax\else\IfNVOETF{\rCB}{}{\num{\rCB}\ts{}\aCBa(5)}\fi&%
				\checkaCBa(6)\let\rCB\cachedata\ifemptydata\relax\else\IfNVOETF{\rCB}{}{\num{\rCB}}\fi&%
				\checkaCBa(7)\let\rCB\cachedata\ifemptydata\relax\else\IfNVOETF{\rCB}{}{\num{\rCB}\%}\fi&%
				\checkaCBa(8)\let\rCB\cachedata\ifemptydata\relax\else\IfNVOETF{\rCB}{}{\num{\rCB} \euro}\fi&%
				\IfNVOETF{\aCB}{}{\num{\aCB} \euro}\expandafter\\\fi%
				\ifdefined\aCCa\rCa{\aCCa}&%
				\checkaCCa(4)\let\rCC\cachedata\ifemptydata\relax\else\IfNVOETF{\rCC}{}{\num{\rCC}\ts{}\aCCa(5)}\fi&%
				\checkaCCa(6)\let\rCC\cachedata\ifemptydata\relax\else\IfNVOETF{\rCC}{}{\num{\rCC}}\fi&%
				\checkaCCa(7)\let\rCC\cachedata\ifemptydata\relax\else\IfNVOETF{\rCC}{}{\num{\rCC}\%}\fi&%
				\checkaCCa(8)\let\rCC\cachedata\ifemptydata\relax\else\IfNVOETF{\rCC}{}{\num{\rCC} \euro}\fi&%
				\IfNVOETF{\aCC}{}{\num{\aCC} \euro}\expandafter\\\fi%
				\ifdefined\aCDa\rCa{\aCDa}&%
				\checkaCDa(4)\let\rCD\cachedata\ifemptydata\relax\else\IfNVOETF{\rCD}{}{\num{\rCD}\ts{}\aCDa(5)}\fi&%
				\checkaCDa(6)\let\rCD\cachedata\ifemptydata\relax\else\IfNVOETF{\rCD}{}{\num{\rCD}}\fi&%
				\checkaCDa(7)\let\rCD\cachedata\ifemptydata\relax\else\IfNVOETF{\rCD}{}{\num{\rCD}\%}\fi&%
				\checkaCDa(8)\let\rCD\cachedata\ifemptydata\relax\else\IfNVOETF{\rCD}{}{\num{\rCD} \euro}\fi&%
				\IfNVOETF{\aCD}{}{\num{\aCD} \euro}\expandafter\\\fi%
				\ifdefined\aCEa\rCa{\aCEa}&%
				\checkaCEa(4)\let\rCE\cachedata\ifemptydata\relax\else\IfNVOETF{\rCE}{}{\num{\rCE}\ts{}\aCEa(5)}\fi&%
				\checkaCEa(6)\let\rCE\cachedata\ifemptydata\relax\else\IfNVOETF{\rCE}{}{\num{\rCE}}\fi&%
				\checkaCEa(7)\let\rCE\cachedata\ifemptydata\relax\else\IfNVOETF{\rCE}{}{\num{\rCE}\%}\fi&%
				\checkaCEa(8)\let\rCE\cachedata\ifemptydata\relax\else\IfNVOETF{\rCE}{}{\num{\rCE} \euro}\fi&%
				\IfNVOETF{\aCE}{}{\num{\aCE} \euro}\expandafter\\\fi%
				\ifdefined\aCFa\rCa{\aCFa}&%
				\checkaCFa(4)\let\rCF\cachedata\ifemptydata\relax\else\IfNVOETF{\rCF}{}{\num{\rCF}\ts{}\aCFa(5)}\fi&%
				\checkaCFa(6)\let\rCF\cachedata\ifemptydata\relax\else\IfNVOETF{\rCF}{}{\num{\rCF}}\fi&%
				\checkaCFa(7)\let\rCF\cachedata\ifemptydata\relax\else\IfNVOETF{\rCF}{}{\num{\rCF}\%}\fi&%
				\checkaCFa(8)\let\rCF\cachedata\ifemptydata\relax\else\IfNVOETF{\rCF}{}{\num{\rCF} \euro}\fi&%
				\IfNVOETF{\aCF}{}{\num{\aCF} \euro}\expandafter\\\fi%
				\ifdefined\aCGa\rCa{\aCGa}&%
				\checkaCGa(4)\let\rCG\cachedata\ifemptydata\relax\else\IfNVOETF{\rCG}{}{\num{\rCG}\ts{}\aCGa(5)}\fi&%
				\checkaCGa(6)\let\rCG\cachedata\ifemptydata\relax\else\IfNVOETF{\rCG}{}{\num{\rCG}}\fi&%
				\checkaCGa(7)\let\rCG\cachedata\ifemptydata\relax\else\IfNVOETF{\rCG}{}{\num{\rCG}\%}\fi&%
				\checkaCGa(8)\let\rCG\cachedata\ifemptydata\relax\else\IfNVOETF{\rCG}{}{\num{\rCG} \euro}\fi&%
				\IfNVOETF{\aCG}{}{\num{\aCG} \euro}\expandafter\\\fi%
				\ifdefined\aCIa\rCa{\aCIa}&%
				\checkaCIa(4)\let\rCI\cachedata\ifemptydata\relax\else\IfNVOETF{\rCI}{}{\num{\rCI}\ts{}\aCIa(5)}\fi&%
				\checkaCIa(6)\let\rCI\cachedata\ifemptydata\relax\else\IfNVOETF{\rCI}{}{\num{\rCI}}\fi&%
				\checkaCIa(7)\let\rCI\cachedata\ifemptydata\relax\else\IfNVOETF{\rCI}{}{\num{\rCI}\%}\fi&%
				\checkaCIa(8)\let\rCI\cachedata\ifemptydata\relax\else\IfNVOETF{\rCI}{}{\num{\rCI} \euro}\fi&%
				\IfNVOETF{\aCI}{}{\num{\aCI} \euro}\expandafter\\\fi%
				\ifdefined\aCJa\rCa{\aCJa}&%
				\checkaCJa(4)\let\rCJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCJ}{}{\num{\rCJ}\ts{}\aCJa(5)}\fi&%
				\checkaCJa(6)\let\rCJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCJ}{}{\num{\rCJ}}\fi&%
				\checkaCJa(7)\let\rCJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCJ}{}{\num{\rCJ}\%}\fi&%
				\checkaCJa(8)\let\rCJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCJ}{}{\num{\rCJ} \euro}\fi&%
				\IfNVOETF{\aCJ}{}{\num{\aCJ} \euro}\expandafter\\\fi%
				\ifdefined\aCKa\rCa{\aCKa}&%
				\checkaCKa(4)\let\rCK\cachedata\ifemptydata\relax\else\IfNVOETF{\rCK}{}{\num{\rCK}\ts{}\aCKa(5)}\fi&%
				\checkaCKa(6)\let\rCK\cachedata\ifemptydata\relax\else\IfNVOETF{\rCK}{}{\num{\rCK}}\fi&%
				\checkaCKa(7)\let\rCK\cachedata\ifemptydata\relax\else\IfNVOETF{\rCK}{}{\num{\rCK}\%}\fi&%
				\checkaCKa(8)\let\rCK\cachedata\ifemptydata\relax\else\IfNVOETF{\rCK}{}{\num{\rCK} \euro}\fi&%
				\IfNVOETF{\aCK}{}{\num{\aCK} \euro}\expandafter\\\fi%
				\ifdefined\aCLa\rCa{\aCLa}&%
				\checkaCLa(4)\let\rCL\cachedata\ifemptydata\relax\else\IfNVOETF{\rCL}{}{\num{\rCL}\ts{}\aCLa(5)}\fi&%
				\checkaCLa(6)\let\rCL\cachedata\ifemptydata\relax\else\IfNVOETF{\rCL}{}{\num{\rCL}}\fi&%
				\checkaCLa(7)\let\rCL\cachedata\ifemptydata\relax\else\IfNVOETF{\rCL}{}{\num{\rCL}\%}\fi&%
				\checkaCLa(8)\let\rCL\cachedata\ifemptydata\relax\else\IfNVOETF{\rCL}{}{\num{\rCL} \euro}\fi&%
				\IfNVOETF{\aCL}{}{\num{\aCL} \euro}\expandafter\\\fi%
				\ifdefined\aCMa\rCa{\aCMa}&%
				\checkaCMa(4)\let\rCM\cachedata\ifemptydata\relax\else\IfNVOETF{\rCM}{}{\num{\rCM}\ts{}\aCMa(5)}\fi&%
				\checkaCMa(6)\let\rCM\cachedata\ifemptydata\relax\else\IfNVOETF{\rCM}{}{\num{\rCM}}\fi&%
				\checkaCMa(7)\let\rCM\cachedata\ifemptydata\relax\else\IfNVOETF{\rCM}{}{\num{\rCM}\%}\fi&%
				\checkaCMa(8)\let\rCM\cachedata\ifemptydata\relax\else\IfNVOETF{\rCM}{}{\num{\rCM} \euro}\fi&%
				\IfNVOETF{\aCM}{}{\num{\aCM} \euro}\expandafter\\\fi%
				\ifdefined\aCNa\rCa{\aCNa}&%
				\checkaCNa(4)\let\rCN\cachedata\ifemptydata\relax\else\IfNVOETF{\rCN}{}{\num{\rCN}\ts{}\aCNa(5)}\fi&%
				\checkaCNa(6)\let\rCN\cachedata\ifemptydata\relax\else\IfNVOETF{\rCN}{}{\num{\rCN}}\fi&%
				\checkaCNa(7)\let\rCN\cachedata\ifemptydata\relax\else\IfNVOETF{\rCN}{}{\num{\rCN}\%}\fi&%
				\checkaCNa(8)\let\rCN\cachedata\ifemptydata\relax\else\IfNVOETF{\rCN}{}{\num{\rCN} \euro}\fi&%
				\IfNVOETF{\aCN}{}{\num{\aCN} \euro}\expandafter\\\fi%
				\ifdefined\aCOa\rCa{\aCOa}&%
				\checkaCOa(4)\let\rCO\cachedata\ifemptydata\relax\else\IfNVOETF{\rCO}{}{\num{\rCO}\ts{}\aCOa(5)}\fi&%
				\checkaCOa(6)\let\rCO\cachedata\ifemptydata\relax\else\IfNVOETF{\rCO}{}{\num{\rCO}}\fi&%
				\checkaCOa(7)\let\rCO\cachedata\ifemptydata\relax\else\IfNVOETF{\rCO}{}{\num{\rCO}\%}\fi&%
				\checkaCOa(8)\let\rCO\cachedata\ifemptydata\relax\else\IfNVOETF{\rCO}{}{\num{\rCO} \euro}\fi&%
				\IfNVOETF{\aCO}{}{\num{\aCO} \euro}\expandafter\\\fi%
				\ifdefined\aCPa\rCa{\aCPa}&%
				\checkaCPa(4)\let\rCP\cachedata\ifemptydata\relax\else\IfNVOETF{\rCP}{}{\num{\rCP}\ts{}\aCPa(5)}\fi&%
				\checkaCPa(6)\let\rCP\cachedata\ifemptydata\relax\else\IfNVOETF{\rCP}{}{\num{\rCP}}\fi&%
				\checkaCPa(7)\let\rCP\cachedata\ifemptydata\relax\else\IfNVOETF{\rCP}{}{\num{\rCP}\%}\fi&%
				\checkaCPa(8)\let\rCP\cachedata\ifemptydata\relax\else\IfNVOETF{\rCP}{}{\num{\rCP} \euro}\fi&%
				\IfNVOETF{\aCP}{}{\num{\aCP} \euro}\expandafter\\\fi%
				\ifdefined\aCQa\rCa{\aCQa}&%
				\checkaCQa(4)\let\rCQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCQ}{}{\num{\rCQ}\ts{}\aCQa(5)}\fi&%
				\checkaCQa(6)\let\rCQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCQ}{}{\num{\rCQ}}\fi&%
				\checkaCQa(7)\let\rCQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCQ}{}{\num{\rCQ}\%}\fi&%
				\checkaCQa(8)\let\rCQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCQ}{}{\num{\rCQ} \euro}\fi&%
				\IfNVOETF{\aCQ}{}{\num{\aCQ} \euro}\expandafter\\\fi%
				\ifdefined\aCRa\rCa{\aCRa}&%
				\checkaCRa(4)\let\rCR\cachedata\ifemptydata\relax\else\IfNVOETF{\rCR}{}{\num{\rCR}\ts{}\aCRa(5)}\fi&%
				\checkaCRa(6)\let\rCR\cachedata\ifemptydata\relax\else\IfNVOETF{\rCR}{}{\num{\rCR}}\fi&%
				\checkaCRa(7)\let\rCR\cachedata\ifemptydata\relax\else\IfNVOETF{\rCR}{}{\num{\rCR}\%}\fi&%
				\checkaCRa(8)\let\rCR\cachedata\ifemptydata\relax\else\IfNVOETF{\rCR}{}{\num{\rCR} \euro}\fi&%
				\IfNVOETF{\aCR}{}{\num{\aCR} \euro}\expandafter\\\fi%
				\ifdefined\aCSa\rCa{\aCSa}&%
				\checkaCSa(4)\let\rCS\cachedata\ifemptydata\relax\else\IfNVOETF{\rCS}{}{\num{\rCS}\ts{}\aCSa(5)}\fi&%
				\checkaCSa(6)\let\rCS\cachedata\ifemptydata\relax\else\IfNVOETF{\rCS}{}{\num{\rCS}}\fi&%
				\checkaCSa(7)\let\rCS\cachedata\ifemptydata\relax\else\IfNVOETF{\rCS}{}{\num{\rCS}\%}\fi&%
				\checkaCSa(8)\let\rCS\cachedata\ifemptydata\relax\else\IfNVOETF{\rCS}{}{\num{\rCS} \euro}\fi&%
				\IfNVOETF{\aCS}{}{\num{\aCS} \euro}\expandafter\\\fi%
				\ifdefined\aCTa\rCa{\aCTa}&%
				\checkaCTa(4)\let\rCT\cachedata\ifemptydata\relax\else\IfNVOETF{\rCT}{}{\num{\rCT}\ts{}\aCTa(5)}\fi&%
				\checkaCTa(6)\let\rCT\cachedata\ifemptydata\relax\else\IfNVOETF{\rCT}{}{\num{\rCT}}\fi&%
				\checkaCTa(7)\let\rCT\cachedata\ifemptydata\relax\else\IfNVOETF{\rCT}{}{\num{\rCT}\%}\fi&%
				\checkaCTa(8)\let\rCT\cachedata\ifemptydata\relax\else\IfNVOETF{\rCT}{}{\num{\rCT} \euro}\fi&%
				\IfNVOETF{\aCT}{}{\num{\aCT} \euro}\expandafter\\\fi%
				\ifdefined\aCUa\rCa{\aCUa}&%
				\checkaCUa(4)\let\rCU\cachedata\ifemptydata\relax\else\IfNVOETF{\rCU}{}{\num{\rCU}\ts{}\aCUa(5)}\fi&%
				\checkaCUa(6)\let\rCU\cachedata\ifemptydata\relax\else\IfNVOETF{\rCU}{}{\num{\rCU}}\fi&%
				\checkaCUa(7)\let\rCU\cachedata\ifemptydata\relax\else\IfNVOETF{\rCU}{}{\num{\rCU}\%}\fi&%
				\checkaCUa(8)\let\rCU\cachedata\ifemptydata\relax\else\IfNVOETF{\rCU}{}{\num{\rCU} \euro}\fi&%
				\IfNVOETF{\aCU}{}{\num{\aCU} \euro}\expandafter\\\fi%
				\ifdefined\aCVa\rCa{\aCVa}&%
				\checkaCVa(4)\let\rCV\cachedata\ifemptydata\relax\else\IfNVOETF{\rCV}{}{\num{\rCV}\ts{}\aCVa(5)}\fi&%
				\checkaCVa(6)\let\rCV\cachedata\ifemptydata\relax\else\IfNVOETF{\rCV}{}{\num{\rCV}}\fi&%
				\checkaCVa(7)\let\rCV\cachedata\ifemptydata\relax\else\IfNVOETF{\rCV}{}{\num{\rCV}\%}\fi&%
				\checkaCVa(8)\let\rCV\cachedata\ifemptydata\relax\else\IfNVOETF{\rCV}{}{\num{\rCV} \euro}\fi&%
				\IfNVOETF{\aCV}{}{\num{\aCV} \euro}\expandafter\\\fi%
				\ifdefined\aCWa\rCa{\aCWa}&%
				\checkaCWa(4)\let\rCW\cachedata\ifemptydata\relax\else\IfNVOETF{\rCW}{}{\num{\rCW}\ts{}\aCWa(5)}\fi&%
				\checkaCWa(6)\let\rCW\cachedata\ifemptydata\relax\else\IfNVOETF{\rCW}{}{\num{\rCW}}\fi&%
				\checkaCWa(7)\let\rCW\cachedata\ifemptydata\relax\else\IfNVOETF{\rCW}{}{\num{\rCW}\%}\fi&%
				\checkaCWa(8)\let\rCW\cachedata\ifemptydata\relax\else\IfNVOETF{\rCW}{}{\num{\rCW} \euro}\fi&%
				\IfNVOETF{\aCW}{}{\num{\aCW} \euro}\expandafter\\\fi%
				\ifdefined\aCXa\rCa{\aCXa}&%
				\checkaCXa(4)\let\rCX\cachedata\ifemptydata\relax\else\IfNVOETF{\rCX}{}{\num{\rCX}\ts{}\aCXa(5)}\fi&%
				\checkaCXa(6)\let\rCX\cachedata\ifemptydata\relax\else\IfNVOETF{\rCX}{}{\num{\rCX}}\fi&%
				\checkaCXa(7)\let\rCX\cachedata\ifemptydata\relax\else\IfNVOETF{\rCX}{}{\num{\rCX}\%}\fi&%
				\checkaCXa(8)\let\rCX\cachedata\ifemptydata\relax\else\IfNVOETF{\rCX}{}{\num{\rCX} \euro}\fi&%
				\IfNVOETF{\aCX}{}{\num{\aCX} \euro}\expandafter\\\fi%
				\ifdefined\aCYa\rCa{\aCYa}&%
				\checkaCYa(4)\let\rCY\cachedata\ifemptydata\relax\else\IfNVOETF{\rCY}{}{\num{\rCY}\ts{}\aCYa(5)}\fi&%
				\checkaCYa(6)\let\rCY\cachedata\ifemptydata\relax\else\IfNVOETF{\rCY}{}{\num{\rCY}}\fi&%
				\checkaCYa(7)\let\rCY\cachedata\ifemptydata\relax\else\IfNVOETF{\rCY}{}{\num{\rCY}\%}\fi&%
				\checkaCYa(8)\let\rCY\cachedata\ifemptydata\relax\else\IfNVOETF{\rCY}{}{\num{\rCY} \euro}\fi&%
				\IfNVOETF{\aCY}{}{\num{\aCY} \euro}\expandafter\\\fi%	
				\ifdefined\aCZa\rCa{\aCZa}&%
				\checkaCZa(4)\let\rCZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCZ}{}{\num{\rCZ}\ts{}\aCZa(5)}\fi&%
				\checkaCZa(6)\let\rCZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCZ}{}{\num{\rCZ}}\fi&%
				\checkaCZa(7)\let\rCZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCZ}{}{\num{\rCZ}\%}\fi&%
				\checkaCZa(8)\let\rCZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rCZ}{}{\num{\rCZ} \euro}\fi&%
				\IfNVOETF{\aCZ}{}{\num{\aCZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aC} \euro    \\%
			\end{tabularx} %	
			\fi%		
			\ifdefined\aDAa%
			\captionof{table}{\large{\textsc{\aDCaption}}}\label{tbl:asset:D}%
			\begin{tabularx}{\textwidth}{L{0.14}L{0.14}L{0.14}R{0.08}R{0.07}R{0.07}R{0.105}R{0.105}}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aDAa\rCa{\aDAa}&%
				\checkaDAa(4)\let\rDA\cachedata\ifemptydata\relax\else\IfNVOETF{\rDA}{}{\num{\rDA}\ts{}\aDAa(5)}\fi&%
				\checkaDAa(6)\let\rDA\cachedata\ifemptydata\relax\else\IfNVOETF{\rDA}{}{\num{\rDA}}\fi&%
				\checkaDAa(7)\let\rDA\cachedata\ifemptydata\relax\else\IfNVOETF{\rDA}{}{\num{\rDA}\%}\fi&%
				\checkaDAa(8)\let\rDA\cachedata\ifemptydata\relax\else\IfNVOETF{\rDA}{}{\num{\rDA} \euro}\fi&%
				\IfNVOETF{\aDA}{}{\num{\aDA} \euro}\expandafter\\\fi%
				\ifdefined\aDBa\rCa{\aDBa}&%
				\checkaDBa(4)\let\rDB\cachedata\ifemptydata\relax\else\IfNVOETF{\rDB}{}{\num{\rDB}\ts{}\aDBa(5)}\fi&%
				\checkaDBa(6)\let\rDB\cachedata\ifemptydata\relax\else\IfNVOETF{\rDB}{}{\num{\rDB}}\fi&%
				\checkaDBa(7)\let\rDB\cachedata\ifemptydata\relax\else\IfNVOETF{\rDB}{}{\num{\rDB}\%}\fi&%
				\checkaDBa(8)\let\rDB\cachedata\ifemptydata\relax\else\IfNVOETF{\rDB}{}{\num{\rDB} \euro}\fi&%
				\IfNVOETF{\aDB}{}{\num{\aDB} \euro}\expandafter\\\fi%
				\ifdefined\aDCa\rCa{\aDCa}&%
				\checkaDCa(4)\let\rDC\cachedata\ifemptydata\relax\else\IfNVOETF{\rDC}{}{\num{\rDC}\ts{}\aDCa(5)}\fi&%
				\checkaDCa(6)\let\rDC\cachedata\ifemptydata\relax\else\IfNVOETF{\rDC}{}{\num{\rDC}}\fi&%
				\checkaDCa(7)\let\rDC\cachedata\ifemptydata\relax\else\IfNVOETF{\rDC}{}{\num{\rDC}\%}\fi&%
				\checkaDCa(8)\let\rDC\cachedata\ifemptydata\relax\else\IfNVOETF{\rDC}{}{\num{\rDC} \euro}\fi&%
				\IfNVOETF{\aDC}{}{\num{\aDC} \euro}\expandafter\\\fi%
				\ifdefined\aDDa\rCa{\aDDa}&%
				\checkaDDa(4)\let\rDD\cachedata\ifemptydata\relax\else\IfNVOETF{\rDD}{}{\num{\rDD}\ts{}\aDDa(5)}\fi&%
				\checkaDDa(6)\let\rDD\cachedata\ifemptydata\relax\else\IfNVOETF{\rDD}{}{\num{\rDD}}\fi&%
				\checkaDDa(7)\let\rDD\cachedata\ifemptydata\relax\else\IfNVOETF{\rDD}{}{\num{\rDD}\%}\fi&%
				\checkaDDa(8)\let\rDD\cachedata\ifemptydata\relax\else\IfNVOETF{\rDD}{}{\num{\rDD} \euro}\fi&%
				\IfNVOETF{\aDD}{}{\num{\aDD} \euro}\expandafter\\\fi%
				\ifdefined\aDEa\rCa{\aDEa}&%
				\checkaDEa(4)\let\rDE\cachedata\ifemptydata\relax\else\IfNVOETF{\rDE}{}{\num{\rDE}\ts{}\aDEa(5)}\fi&%
				\checkaDEa(6)\let\rDE\cachedata\ifemptydata\relax\else\IfNVOETF{\rDE}{}{\num{\rDE}}\fi&%
				\checkaDEa(7)\let\rDE\cachedata\ifemptydata\relax\else\IfNVOETF{\rDE}{}{\num{\rDE}\%}\fi&%
				\checkaDEa(8)\let\rDE\cachedata\ifemptydata\relax\else\IfNVOETF{\rDE}{}{\num{\rDE} \euro}\fi&%
				\IfNVOETF{\aDE}{}{\num{\aDE} \euro}\expandafter\\\fi%
				\ifdefined\aDFa\rCa{\aDFa}&%
				\checkaDFa(4)\let\rDF\cachedata\ifemptydata\relax\else\IfNVOETF{\rDF}{}{\num{\rDF}\ts{}\aDFa(5)}\fi&%
				\checkaDFa(6)\let\rDF\cachedata\ifemptydata\relax\else\IfNVOETF{\rDF}{}{\num{\rDF}}\fi&%
				\checkaDFa(7)\let\rDF\cachedata\ifemptydata\relax\else\IfNVOETF{\rDF}{}{\num{\rDF}\%}\fi&%
				\checkaDFa(8)\let\rDF\cachedata\ifemptydata\relax\else\IfNVOETF{\rDF}{}{\num{\rDF} \euro}\fi&%
				\IfNVOETF{\aDF}{}{\num{\aDF} \euro}\expandafter\\\fi%
				\ifdefined\aDGa\rCa{\aDGa}&%
				\checkaDGa(4)\let\rDG\cachedata\ifemptydata\relax\else\IfNVOETF{\rDG}{}{\num{\rDG}\ts{}\aDGa(5)}\fi&%
				\checkaDGa(6)\let\rDG\cachedata\ifemptydata\relax\else\IfNVOETF{\rDG}{}{\num{\rDG}}\fi&%
				\checkaDGa(7)\let\rDG\cachedata\ifemptydata\relax\else\IfNVOETF{\rDG}{}{\num{\rDG}\%}\fi&%
				\checkaDGa(8)\let\rDG\cachedata\ifemptydata\relax\else\IfNVOETF{\rDG}{}{\num{\rDG} \euro}\fi&%
				\IfNVOETF{\aDG}{}{\num{\aDG} \euro}\expandafter\\\fi%
				\ifdefined\aDIa\rCa{\aDIa}&%
				\checkaDIa(4)\let\rDI\cachedata\ifemptydata\relax\else\IfNVOETF{\rDI}{}{\num{\rDI}\ts{}\aDIa(5)}\fi&%
				\checkaDIa(6)\let\rDI\cachedata\ifemptydata\relax\else\IfNVOETF{\rDI}{}{\num{\rDI}}\fi&%
				\checkaDIa(7)\let\rDI\cachedata\ifemptydata\relax\else\IfNVOETF{\rDI}{}{\num{\rDI}\%}\fi&%
				\checkaDIa(8)\let\rDI\cachedata\ifemptydata\relax\else\IfNVOETF{\rDI}{}{\num{\rDI} \euro}\fi&%
				\IfNVOETF{\aDI}{}{\num{\aDI} \euro}\expandafter\\\fi%
				\ifdefined\aDJa\rCa{\aDJa}&%
				\checkaDJa(4)\let\rDJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDJ}{}{\num{\rDJ}\ts{}\aDJa(5)}\fi&%
				\checkaDJa(6)\let\rDJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDJ}{}{\num{\rDJ}}\fi&%
				\checkaDJa(7)\let\rDJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDJ}{}{\num{\rDJ}\%}\fi&%
				\checkaDJa(8)\let\rDJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDJ}{}{\num{\rDJ} \euro}\fi&%
				\IfNVOETF{\aDJ}{}{\num{\aDJ} \euro}\expandafter\\\fi%
				\ifdefined\aDKa\rCa{\aDKa}&%
				\checkaDKa(4)\let\rDK\cachedata\ifemptydata\relax\else\IfNVOETF{\rDK}{}{\num{\rDK}\ts{}\aDKa(5)}\fi&%
				\checkaDKa(6)\let\rDK\cachedata\ifemptydata\relax\else\IfNVOETF{\rDK}{}{\num{\rDK}}\fi&%
				\checkaDKa(7)\let\rDK\cachedata\ifemptydata\relax\else\IfNVOETF{\rDK}{}{\num{\rDK}\%}\fi&%
				\checkaDKa(8)\let\rDK\cachedata\ifemptydata\relax\else\IfNVOETF{\rDK}{}{\num{\rDK} \euro}\fi&%
				\IfNVOETF{\aDK}{}{\num{\aDK} \euro}\expandafter\\\fi%
				\ifdefined\aDLa\rCa{\aDLa}&%
				\checkaDLa(4)\let\rDL\cachedata\ifemptydata\relax\else\IfNVOETF{\rDL}{}{\num{\rDL}\ts{}\aDLa(5)}\fi&%
				\checkaDLa(6)\let\rDL\cachedata\ifemptydata\relax\else\IfNVOETF{\rDL}{}{\num{\rDL}}\fi&%
				\checkaDLa(7)\let\rDL\cachedata\ifemptydata\relax\else\IfNVOETF{\rDL}{}{\num{\rDL}\%}\fi&%
				\checkaDLa(8)\let\rDL\cachedata\ifemptydata\relax\else\IfNVOETF{\rDL}{}{\num{\rDL} \euro}\fi&%
				\IfNVOETF{\aDL}{}{\num{\aDL} \euro}\expandafter\\\fi%
				\ifdefined\aDMa\rCa{\aDMa}&%
				\checkaDMa(4)\let\rDM\cachedata\ifemptydata\relax\else\IfNVOETF{\rDM}{}{\num{\rDM}\ts{}\aDMa(5)}\fi&%
				\checkaDMa(6)\let\rDM\cachedata\ifemptydata\relax\else\IfNVOETF{\rDM}{}{\num{\rDM}}\fi&%
				\checkaDMa(7)\let\rDM\cachedata\ifemptydata\relax\else\IfNVOETF{\rDM}{}{\num{\rDM}\%}\fi&%
				\checkaDMa(8)\let\rDM\cachedata\ifemptydata\relax\else\IfNVOETF{\rDM}{}{\num{\rDM} \euro}\fi&%
				\IfNVOETF{\aDM}{}{\num{\aDM} \euro}\expandafter\\\fi%
				\ifdefined\aDNa\rCa{\aDNa}&%
				\checkaDNa(4)\let\rDN\cachedata\ifemptydata\relax\else\IfNVOETF{\rDN}{}{\num{\rDN}\ts{}\aDNa(5)}\fi&%
				\checkaDNa(6)\let\rDN\cachedata\ifemptydata\relax\else\IfNVOETF{\rDN}{}{\num{\rDN}}\fi&%
				\checkaDNa(7)\let\rDN\cachedata\ifemptydata\relax\else\IfNVOETF{\rDN}{}{\num{\rDN}\%}\fi&%
				\checkaDNa(8)\let\rDN\cachedata\ifemptydata\relax\else\IfNVOETF{\rDN}{}{\num{\rDN} \euro}\fi&%
				\IfNVOETF{\aDN}{}{\num{\aDN} \euro}\expandafter\\\fi%
				\ifdefined\aDOa\rCa{\aDOa}&%
				\checkaDOa(4)\let\rDO\cachedata\ifemptydata\relax\else\IfNVOETF{\rDO}{}{\num{\rDO}\ts{}\aDOa(5)}\fi&%
				\checkaDOa(6)\let\rDO\cachedata\ifemptydata\relax\else\IfNVOETF{\rDO}{}{\num{\rDO}}\fi&%
				\checkaDOa(7)\let\rDO\cachedata\ifemptydata\relax\else\IfNVOETF{\rDO}{}{\num{\rDO}\%}\fi&%
				\checkaDOa(8)\let\rDO\cachedata\ifemptydata\relax\else\IfNVOETF{\rDO}{}{\num{\rDO} \euro}\fi&%
				\IfNVOETF{\aDO}{}{\num{\aDO} \euro}\expandafter\\\fi%
				\ifdefined\aDPa\rCa{\aDPa}&%
				\checkaDPa(4)\let\rDP\cachedata\ifemptydata\relax\else\IfNVOETF{\rDP}{}{\num{\rDP}\ts{}\aDPa(5)}\fi&%
				\checkaDPa(6)\let\rDP\cachedata\ifemptydata\relax\else\IfNVOETF{\rDP}{}{\num{\rDP}}\fi&%
				\checkaDPa(7)\let\rDP\cachedata\ifemptydata\relax\else\IfNVOETF{\rDP}{}{\num{\rDP}\%}\fi&%
				\checkaDPa(8)\let\rDP\cachedata\ifemptydata\relax\else\IfNVOETF{\rDP}{}{\num{\rDP} \euro}\fi&%
				\IfNVOETF{\aDP}{}{\num{\aDP} \euro}\expandafter\\\fi%
				\ifdefined\aDQa\rCa{\aDQa}&%
				\checkaDQa(4)\let\rDQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDQ}{}{\num{\rDQ}\ts{}\aDQa(5)}\fi&%
				\checkaDQa(6)\let\rDQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDQ}{}{\num{\rDQ}}\fi&%
				\checkaDQa(7)\let\rDQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDQ}{}{\num{\rDQ}\%}\fi&%
				\checkaDQa(8)\let\rDQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDQ}{}{\num{\rDQ} \euro}\fi&%
				\IfNVOETF{\aDQ}{}{\num{\aDQ} \euro}\expandafter\\\fi%
				\ifdefined\aDRa\rCa{\aDRa}&%
				\checkaDRa(4)\let\rDR\cachedata\ifemptydata\relax\else\IfNVOETF{\rDR}{}{\num{\rDR}\ts{}\aDRa(5)}\fi&%
				\checkaDRa(6)\let\rDR\cachedata\ifemptydata\relax\else\IfNVOETF{\rDR}{}{\num{\rDR}}\fi&%
				\checkaDRa(7)\let\rDR\cachedata\ifemptydata\relax\else\IfNVOETF{\rDR}{}{\num{\rDR}\%}\fi&%
				\checkaDRa(8)\let\rDR\cachedata\ifemptydata\relax\else\IfNVOETF{\rDR}{}{\num{\rDR} \euro}\fi&%
				\IfNVOETF{\aDR}{}{\num{\aDR} \euro}\expandafter\\\fi%
				\ifdefined\aDSa\rCa{\aDSa}&%
				\checkaDSa(4)\let\rDS\cachedata\ifemptydata\relax\else\IfNVOETF{\rDS}{}{\num{\rDS}\ts{}\aDSa(5)}\fi&%
				\checkaDSa(6)\let\rDS\cachedata\ifemptydata\relax\else\IfNVOETF{\rDS}{}{\num{\rDS}}\fi&%
				\checkaDSa(7)\let\rDS\cachedata\ifemptydata\relax\else\IfNVOETF{\rDS}{}{\num{\rDS}\%}\fi&%
				\checkaDSa(8)\let\rDS\cachedata\ifemptydata\relax\else\IfNVOETF{\rDS}{}{\num{\rDS} \euro}\fi&%
				\IfNVOETF{\aDS}{}{\num{\aDS} \euro}\expandafter\\\fi%
				\ifdefined\aDTa\rCa{\aDTa}&%
				\checkaDTa(4)\let\rDT\cachedata\ifemptydata\relax\else\IfNVOETF{\rDT}{}{\num{\rDT}\ts{}\aDTa(5)}\fi&%
				\checkaDTa(6)\let\rDT\cachedata\ifemptydata\relax\else\IfNVOETF{\rDT}{}{\num{\rDT}}\fi&%
				\checkaDTa(7)\let\rDT\cachedata\ifemptydata\relax\else\IfNVOETF{\rDT}{}{\num{\rDT}\%}\fi&%
				\checkaDTa(8)\let\rDT\cachedata\ifemptydata\relax\else\IfNVOETF{\rDT}{}{\num{\rDT} \euro}\fi&%
				\IfNVOETF{\aDT}{}{\num{\aDT} \euro}\expandafter\\\fi%
				\ifdefined\aDUa\rCa{\aDUa}&%
				\checkaDUa(4)\let\rDU\cachedata\ifemptydata\relax\else\IfNVOETF{\rDU}{}{\num{\rDU}\ts{}\aDUa(5)}\fi&%
				\checkaDUa(6)\let\rDU\cachedata\ifemptydata\relax\else\IfNVOETF{\rDU}{}{\num{\rDU}}\fi&%
				\checkaDUa(7)\let\rDU\cachedata\ifemptydata\relax\else\IfNVOETF{\rDU}{}{\num{\rDU}\%}\fi&%
				\checkaDUa(8)\let\rDU\cachedata\ifemptydata\relax\else\IfNVOETF{\rDU}{}{\num{\rDU} \euro}\fi&%
				\IfNVOETF{\aDU}{}{\num{\aDU} \euro}\expandafter\\\fi%
				\ifdefined\aDVa\rCa{\aDVa}&%
				\checkaDVa(4)\let\rDV\cachedata\ifemptydata\relax\else\IfNVOETF{\rDV}{}{\num{\rDV}\ts{}\aDVa(5)}\fi&%
				\checkaDVa(6)\let\rDV\cachedata\ifemptydata\relax\else\IfNVOETF{\rDV}{}{\num{\rDV}}\fi&%
				\checkaDVa(7)\let\rDV\cachedata\ifemptydata\relax\else\IfNVOETF{\rDV}{}{\num{\rDV}\%}\fi&%
				\checkaDVa(8)\let\rDV\cachedata\ifemptydata\relax\else\IfNVOETF{\rDV}{}{\num{\rDV} \euro}\fi&%
				\IfNVOETF{\aDV}{}{\num{\aDV} \euro}\expandafter\\\fi%
				\ifdefined\aDWa\rCa{\aDWa}&%
				\checkaDWa(4)\let\rDW\cachedata\ifemptydata\relax\else\IfNVOETF{\rDW}{}{\num{\rDW}\ts{}\aDWa(5)}\fi&%
				\checkaDWa(6)\let\rDW\cachedata\ifemptydata\relax\else\IfNVOETF{\rDW}{}{\num{\rDW}}\fi&%
				\checkaDWa(7)\let\rDW\cachedata\ifemptydata\relax\else\IfNVOETF{\rDW}{}{\num{\rDW}\%}\fi&%
				\checkaDWa(8)\let\rDW\cachedata\ifemptydata\relax\else\IfNVOETF{\rDW}{}{\num{\rDW} \euro}\fi&%
				\IfNVOETF{\aDW}{}{\num{\aDW} \euro}\expandafter\\\fi%
				\ifdefined\aDXa\rCa{\aDXa}&%
				\checkaDXa(4)\let\rDX\cachedata\ifemptydata\relax\else\IfNVOETF{\rDX}{}{\num{\rDX}\ts{}\aDXa(5)}\fi&%
				\checkaDXa(6)\let\rDX\cachedata\ifemptydata\relax\else\IfNVOETF{\rDX}{}{\num{\rDX}}\fi&%
				\checkaDXa(7)\let\rDX\cachedata\ifemptydata\relax\else\IfNVOETF{\rDX}{}{\num{\rDX}\%}\fi&%
				\checkaDXa(8)\let\rDX\cachedata\ifemptydata\relax\else\IfNVOETF{\rDX}{}{\num{\rDX} \euro}\fi&%
				\IfNVOETF{\aDX}{}{\num{\aDX} \euro}\expandafter\\\fi%
				\ifdefined\aDYa\rCa{\aDYa}&%
				\checkaDYa(4)\let\rDY\cachedata\ifemptydata\relax\else\IfNVOETF{\rDY}{}{\num{\rDY}\ts{}\aDYa(5)}\fi&%
				\checkaDYa(6)\let\rDY\cachedata\ifemptydata\relax\else\IfNVOETF{\rDY}{}{\num{\rDY}}\fi&%
				\checkaDYa(7)\let\rDY\cachedata\ifemptydata\relax\else\IfNVOETF{\rDY}{}{\num{\rDY}\%}\fi&%
				\checkaDYa(8)\let\rDY\cachedata\ifemptydata\relax\else\IfNVOETF{\rDY}{}{\num{\rDY} \euro}\fi&%
				\IfNVOETF{\aDY}{}{\num{\aDY} \euro}\expandafter\\\fi%	
				\ifdefined\aDZa\rCa{\aDZa}&%
				\checkaDZa(4)\let\rDZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDZ}{}{\num{\rDZ}\ts{}\aDZa(5)}\fi&%
				\checkaDZa(6)\let\rDZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDZ}{}{\num{\rDZ}}\fi&%
				\checkaDZa(7)\let\rDZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDZ}{}{\num{\rDZ}\%}\fi&%
				\checkaDZa(8)\let\rDZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rDZ}{}{\num{\rDZ} \euro}\fi&%
				\IfNVOETF{\aDZ}{}{\num{\aDZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aD} \euro    \\%
			\end{tabularx} %			
			\fi%
		\end{center}%
%		\newpage%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aEAa%
			\captionof{table}{\large{\textsc{\aECaption}}}\label{tbl:asset:E}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aEAa\rCa{\aEAa}&%
				\checkaEAa(4)\let\rEA\cachedata\ifemptydata\relax\else\IfNVOETF{\rEA}{}{\num{\rEA}\ts{}\aEAa(5)}\fi&%
				\checkaEAa(6)\let\rEA\cachedata\ifemptydata\relax\else\IfNVOETF{\rEA}{}{\num{\rEA}}\fi&%
				\checkaEAa(7)\let\rEA\cachedata\ifemptydata\relax\else\IfNVOETF{\rEA}{}{\num{\rEA}\%}\fi&%
				\checkaEAa(8)\let\rEA\cachedata\ifemptydata\relax\else\IfNVOETF{\rEA}{}{\num{\rEA} \euro}\fi&%
				\IfNVOETF{\aEA}{}{\num{\aEA} \euro}\expandafter\\\fi%
				\ifdefined\aEBa\rCa{\aEBa}&%
				\checkaEBa(4)\let\rEB\cachedata\ifemptydata\relax\else\IfNVOETF{\rEB}{}{\num{\rEB}\ts{}\aEBa(5)}\fi&%
				\checkaEBa(6)\let\rEB\cachedata\ifemptydata\relax\else\IfNVOETF{\rEB}{}{\num{\rEB}}\fi&%
				\checkaEBa(7)\let\rEB\cachedata\ifemptydata\relax\else\IfNVOETF{\rEB}{}{\num{\rEB}\%}\fi&%
				\checkaEBa(8)\let\rEB\cachedata\ifemptydata\relax\else\IfNVOETF{\rEB}{}{\num{\rEB} \euro}\fi&%
				\IfNVOETF{\aEB}{}{\num{\aEB} \euro}\expandafter\\\fi%
				\ifdefined\aECa\rCa{\aECa}&%
				\checkaECa(4)\let\rEC\cachedata\ifemptydata\relax\else\IfNVOETF{\rEC}{}{\num{\rEC}\ts{}\aECa(5)}\fi&%
				\checkaECa(6)\let\rEC\cachedata\ifemptydata\relax\else\IfNVOETF{\rEC}{}{\num{\rEC}}\fi&%
				\checkaECa(7)\let\rEC\cachedata\ifemptydata\relax\else\IfNVOETF{\rEC}{}{\num{\rEC}\%}\fi&%
				\checkaECa(8)\let\rEC\cachedata\ifemptydata\relax\else\IfNVOETF{\rEC}{}{\num{\rEC} \euro}\fi&%
				\IfNVOETF{\aEC}{}{\num{\aEC} \euro}\expandafter\\\fi%
				\ifdefined\aEDa\rCa{\aEDa}&%
				\checkaEDa(4)\let\rED\cachedata\ifemptydata\relax\else\IfNVOETF{\rED}{}{\num{\rED}\ts{}\aEDa(5)}\fi&%
				\checkaEDa(6)\let\rED\cachedata\ifemptydata\relax\else\IfNVOETF{\rED}{}{\num{\rED}}\fi&%
				\checkaEDa(7)\let\rED\cachedata\ifemptydata\relax\else\IfNVOETF{\rED}{}{\num{\rED}\%}\fi&%
				\checkaEDa(8)\let\rED\cachedata\ifemptydata\relax\else\IfNVOETF{\rED}{}{\num{\rED} \euro}\fi&%
				\IfNVOETF{\aED}{}{\num{\aED} \euro}\expandafter\\\fi%
				\ifdefined\aEEa\rCa{\aEEa}&%
				\checkaEEa(4)\let\rEE\cachedata\ifemptydata\relax\else\IfNVOETF{\rEE}{}{\num{\rEE}\ts{}\aEEa(5)}\fi&%
				\checkaEEa(6)\let\rEE\cachedata\ifemptydata\relax\else\IfNVOETF{\rEE}{}{\num{\rEE}}\fi&%
				\checkaEEa(7)\let\rEE\cachedata\ifemptydata\relax\else\IfNVOETF{\rEE}{}{\num{\rEE}\%}\fi&%
				\checkaEEa(8)\let\rEE\cachedata\ifemptydata\relax\else\IfNVOETF{\rEE}{}{\num{\rEE} \euro}\fi&%
				\IfNVOETF{\aEE}{}{\num{\aEE} \euro}\expandafter\\\fi%
				\ifdefined\aEFa\rCa{\aEFa}&%
				\checkaEFa(4)\let\rEF\cachedata\ifemptydata\relax\else\IfNVOETF{\rEF}{}{\num{\rEF}\ts{}\aEFa(5)}\fi&%
				\checkaEFa(6)\let\rEF\cachedata\ifemptydata\relax\else\IfNVOETF{\rEF}{}{\num{\rEF}}\fi&%
				\checkaEFa(7)\let\rEF\cachedata\ifemptydata\relax\else\IfNVOETF{\rEF}{}{\num{\rEF}\%}\fi&%
				\checkaEFa(8)\let\rEF\cachedata\ifemptydata\relax\else\IfNVOETF{\rEF}{}{\num{\rEF} \euro}\fi&%
				\IfNVOETF{\aEF}{}{\num{\aEF} \euro}\expandafter\\\fi%
				\ifdefined\aEGa\rCa{\aEGa}&%
				\checkaEGa(4)\let\rEG\cachedata\ifemptydata\relax\else\IfNVOETF{\rEG}{}{\num{\rEG}\ts{}\aEGa(5)}\fi&%
				\checkaEGa(6)\let\rEG\cachedata\ifemptydata\relax\else\IfNVOETF{\rEG}{}{\num{\rEG}}\fi&%
				\checkaEGa(7)\let\rEG\cachedata\ifemptydata\relax\else\IfNVOETF{\rEG}{}{\num{\rEG}\%}\fi&%
				\checkaEGa(8)\let\rEG\cachedata\ifemptydata\relax\else\IfNVOETF{\rEG}{}{\num{\rEG} \euro}\fi&%
				\IfNVOETF{\aEG}{}{\num{\aEG} \euro}\expandafter\\\fi%
				\ifdefined\aEIa\rCa{\aEIa}&%
				\checkaEIa(4)\let\rEI\cachedata\ifemptydata\relax\else\IfNVOETF{\rEI}{}{\num{\rEI}\ts{}\aEIa(5)}\fi&%
				\checkaEIa(6)\let\rEI\cachedata\ifemptydata\relax\else\IfNVOETF{\rEI}{}{\num{\rEI}}\fi&%
				\checkaEIa(7)\let\rEI\cachedata\ifemptydata\relax\else\IfNVOETF{\rEI}{}{\num{\rEI}\%}\fi&%
				\checkaEIa(8)\let\rEI\cachedata\ifemptydata\relax\else\IfNVOETF{\rEI}{}{\num{\rEI} \euro}\fi&%
				\IfNVOETF{\aEI}{}{\num{\aEI} \euro}\expandafter\\\fi%
				\ifdefined\aEJa\rCa{\aEJa}&%
				\checkaEJa(4)\let\rEJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEJ}{}{\num{\rEJ}\ts{}\aEJa(5)}\fi&%
				\checkaEJa(6)\let\rEJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEJ}{}{\num{\rEJ}}\fi&%
				\checkaEJa(7)\let\rEJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEJ}{}{\num{\rEJ}\%}\fi&%
				\checkaEJa(8)\let\rEJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEJ}{}{\num{\rEJ} \euro}\fi&%
				\IfNVOETF{\aEJ}{}{\num{\aEJ} \euro}\expandafter\\\fi%
				\ifdefined\aEKa\rCa{\aEKa}&%
				\checkaEKa(4)\let\rEK\cachedata\ifemptydata\relax\else\IfNVOETF{\rEK}{}{\num{\rEK}\ts{}\aEKa(5)}\fi&%
				\checkaEKa(6)\let\rEK\cachedata\ifemptydata\relax\else\IfNVOETF{\rEK}{}{\num{\rEK}}\fi&%
				\checkaEKa(7)\let\rEK\cachedata\ifemptydata\relax\else\IfNVOETF{\rEK}{}{\num{\rEK}\%}\fi&%
				\checkaEKa(8)\let\rEK\cachedata\ifemptydata\relax\else\IfNVOETF{\rEK}{}{\num{\rEK} \euro}\fi&%
				\IfNVOETF{\aEK}{}{\num{\aEK} \euro}\expandafter\\\fi%
				\ifdefined\aELa\rCa{\aELa}&%
				\checkaELa(4)\let\rEL\cachedata\ifemptydata\relax\else\IfNVOETF{\rEL}{}{\num{\rEL}\ts{}\aELa(5)}\fi&%
				\checkaELa(6)\let\rEL\cachedata\ifemptydata\relax\else\IfNVOETF{\rEL}{}{\num{\rEL}}\fi&%
				\checkaELa(7)\let\rEL\cachedata\ifemptydata\relax\else\IfNVOETF{\rEL}{}{\num{\rEL}\%}\fi&%
				\checkaELa(8)\let\rEL\cachedata\ifemptydata\relax\else\IfNVOETF{\rEL}{}{\num{\rEL} \euro}\fi&%
				\IfNVOETF{\aEL}{}{\num{\aEL} \euro}\expandafter\\\fi%
				\ifdefined\aEMa\rCa{\aEMa}&%
				\checkaEMa(4)\let\rEM\cachedata\ifemptydata\relax\else\IfNVOETF{\rEM}{}{\num{\rEM}\ts{}\aEMa(5)}\fi&%
				\checkaEMa(6)\let\rEM\cachedata\ifemptydata\relax\else\IfNVOETF{\rEM}{}{\num{\rEM}}\fi&%
				\checkaEMa(7)\let\rEM\cachedata\ifemptydata\relax\else\IfNVOETF{\rEM}{}{\num{\rEM}\%}\fi&%
				\checkaEMa(8)\let\rEM\cachedata\ifemptydata\relax\else\IfNVOETF{\rEM}{}{\num{\rEM} \euro}\fi&%
				\IfNVOETF{\aEM}{}{\num{\aEM} \euro}\expandafter\\\fi%
				\ifdefined\aENa\rCa{\aENa}&%
				\checkaENa(4)\let\rEN\cachedata\ifemptydata\relax\else\IfNVOETF{\rEN}{}{\num{\rEN}\ts{}\aENa(5)}\fi&%
				\checkaENa(6)\let\rEN\cachedata\ifemptydata\relax\else\IfNVOETF{\rEN}{}{\num{\rEN}}\fi&%
				\checkaENa(7)\let\rEN\cachedata\ifemptydata\relax\else\IfNVOETF{\rEN}{}{\num{\rEN}\%}\fi&%
				\checkaENa(8)\let\rEN\cachedata\ifemptydata\relax\else\IfNVOETF{\rEN}{}{\num{\rEN} \euro}\fi&%
				\IfNVOETF{\aEN}{}{\num{\aEN} \euro}\expandafter\\\fi%
				\ifdefined\aEOa\rCa{\aEOa}&%
				\checkaEOa(4)\let\rEO\cachedata\ifemptydata\relax\else\IfNVOETF{\rEO}{}{\num{\rEO}\ts{}\aEOa(5)}\fi&%
				\checkaEOa(6)\let\rEO\cachedata\ifemptydata\relax\else\IfNVOETF{\rEO}{}{\num{\rEO}}\fi&%
				\checkaEOa(7)\let\rEO\cachedata\ifemptydata\relax\else\IfNVOETF{\rEO}{}{\num{\rEO}\%}\fi&%
				\checkaEOa(8)\let\rEO\cachedata\ifemptydata\relax\else\IfNVOETF{\rEO}{}{\num{\rEO} \euro}\fi&%
				\IfNVOETF{\aEO}{}{\num{\aEO} \euro}\expandafter\\\fi%
				\ifdefined\aEPa\rCa{\aEPa}&%
				\checkaEPa(4)\let\rEP\cachedata\ifemptydata\relax\else\IfNVOETF{\rEP}{}{\num{\rEP}\ts{}\aEPa(5)}\fi&%
				\checkaEPa(6)\let\rEP\cachedata\ifemptydata\relax\else\IfNVOETF{\rEP}{}{\num{\rEP}}\fi&%
				\checkaEPa(7)\let\rEP\cachedata\ifemptydata\relax\else\IfNVOETF{\rEP}{}{\num{\rEP}\%}\fi&%
				\checkaEPa(8)\let\rEP\cachedata\ifemptydata\relax\else\IfNVOETF{\rEP}{}{\num{\rEP} \euro}\fi&%
				\IfNVOETF{\aEP}{}{\num{\aEP} \euro}\expandafter\\\fi%
				\ifdefined\aEQa\rCa{\aEQa}&%
				\checkaEQa(4)\let\rEQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEQ}{}{\num{\rEQ}\ts{}\aEQa(5)}\fi&%
				\checkaEQa(6)\let\rEQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEQ}{}{\num{\rEQ}}\fi&%
				\checkaEQa(7)\let\rEQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEQ}{}{\num{\rEQ}\%}\fi&%
				\checkaEQa(8)\let\rEQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEQ}{}{\num{\rEQ} \euro}\fi&%
				\IfNVOETF{\aEQ}{}{\num{\aEQ} \euro}\expandafter\\\fi%
				\ifdefined\aERa\rCa{\aERa}&%
				\checkaERa(4)\let\rER\cachedata\ifemptydata\relax\else\IfNVOETF{\rER}{}{\num{\rER}\ts{}\aERa(5)}\fi&%
				\checkaERa(6)\let\rER\cachedata\ifemptydata\relax\else\IfNVOETF{\rER}{}{\num{\rER}}\fi&%
				\checkaERa(7)\let\rER\cachedata\ifemptydata\relax\else\IfNVOETF{\rER}{}{\num{\rER}\%}\fi&%
				\checkaERa(8)\let\rER\cachedata\ifemptydata\relax\else\IfNVOETF{\rER}{}{\num{\rER} \euro}\fi&%
				\IfNVOETF{\aER}{}{\num{\aER} \euro}\expandafter\\\fi%
				\ifdefined\aESa\rCa{\aESa}&%
				\checkaESa(4)\let\rES\cachedata\ifemptydata\relax\else\IfNVOETF{\rES}{}{\num{\rES}\ts{}\aESa(5)}\fi&%
				\checkaESa(6)\let\rES\cachedata\ifemptydata\relax\else\IfNVOETF{\rES}{}{\num{\rES}}\fi&%
				\checkaESa(7)\let\rES\cachedata\ifemptydata\relax\else\IfNVOETF{\rES}{}{\num{\rES}\%}\fi&%
				\checkaESa(8)\let\rES\cachedata\ifemptydata\relax\else\IfNVOETF{\rES}{}{\num{\rES} \euro}\fi&%
				\IfNVOETF{\aES}{}{\num{\aES} \euro}\expandafter\\\fi%
				\ifdefined\aETa\rCa{\aETa}&%
				\checkaETa(4)\let\rET\cachedata\ifemptydata\relax\else\IfNVOETF{\rET}{}{\num{\rET}\ts{}\aETa(5)}\fi&%
				\checkaETa(6)\let\rET\cachedata\ifemptydata\relax\else\IfNVOETF{\rET}{}{\num{\rET}}\fi&%
				\checkaETa(7)\let\rET\cachedata\ifemptydata\relax\else\IfNVOETF{\rET}{}{\num{\rET}\%}\fi&%
				\checkaETa(8)\let\rET\cachedata\ifemptydata\relax\else\IfNVOETF{\rET}{}{\num{\rET} \euro}\fi&%
				\IfNVOETF{\aET}{}{\num{\aET} \euro}\expandafter\\\fi%
				\ifdefined\aEUa\rCa{\aEUa}&%
				\checkaEUa(4)\let\rEU\cachedata\ifemptydata\relax\else\IfNVOETF{\rEU}{}{\num{\rEU}\ts{}\aEUa(5)}\fi&%
				\checkaEUa(6)\let\rEU\cachedata\ifemptydata\relax\else\IfNVOETF{\rEU}{}{\num{\rEU}}\fi&%
				\checkaEUa(7)\let\rEU\cachedata\ifemptydata\relax\else\IfNVOETF{\rEU}{}{\num{\rEU}\%}\fi&%
				\checkaEUa(8)\let\rEU\cachedata\ifemptydata\relax\else\IfNVOETF{\rEU}{}{\num{\rEU} \euro}\fi&%
				\IfNVOETF{\aEU}{}{\num{\aEU} \euro}\expandafter\\\fi%
				\ifdefined\aEVa\rCa{\aEVa}&%
				\checkaEVa(4)\let\rEV\cachedata\ifemptydata\relax\else\IfNVOETF{\rEV}{}{\num{\rEV}\ts{}\aEVa(5)}\fi&%
				\checkaEVa(6)\let\rEV\cachedata\ifemptydata\relax\else\IfNVOETF{\rEV}{}{\num{\rEV}}\fi&%
				\checkaEVa(7)\let\rEV\cachedata\ifemptydata\relax\else\IfNVOETF{\rEV}{}{\num{\rEV}\%}\fi&%
				\checkaEVa(8)\let\rEV\cachedata\ifemptydata\relax\else\IfNVOETF{\rEV}{}{\num{\rEV} \euro}\fi&%
				\IfNVOETF{\aEV}{}{\num{\aEV} \euro}\expandafter\\\fi%
				\ifdefined\aEWa\rCa{\aEWa}&%
				\checkaEWa(4)\let\rEW\cachedata\ifemptydata\relax\else\IfNVOETF{\rEW}{}{\num{\rEW}\ts{}\aEWa(5)}\fi&%
				\checkaEWa(6)\let\rEW\cachedata\ifemptydata\relax\else\IfNVOETF{\rEW}{}{\num{\rEW}}\fi&%
				\checkaEWa(7)\let\rEW\cachedata\ifemptydata\relax\else\IfNVOETF{\rEW}{}{\num{\rEW}\%}\fi&%
				\checkaEWa(8)\let\rEW\cachedata\ifemptydata\relax\else\IfNVOETF{\rEW}{}{\num{\rEW} \euro}\fi&%
				\IfNVOETF{\aEW}{}{\num{\aEW} \euro}\expandafter\\\fi%
				\ifdefined\aEXa\rCa{\aEXa}&%
				\checkaEXa(4)\let\rEX\cachedata\ifemptydata\relax\else\IfNVOETF{\rEX}{}{\num{\rEX}\ts{}\aEXa(5)}\fi&%
				\checkaEXa(6)\let\rEX\cachedata\ifemptydata\relax\else\IfNVOETF{\rEX}{}{\num{\rEX}}\fi&%
				\checkaEXa(7)\let\rEX\cachedata\ifemptydata\relax\else\IfNVOETF{\rEX}{}{\num{\rEX}\%}\fi&%
				\checkaEXa(8)\let\rEX\cachedata\ifemptydata\relax\else\IfNVOETF{\rEX}{}{\num{\rEX} \euro}\fi&%
				\IfNVOETF{\aEX}{}{\num{\aEX} \euro}\expandafter\\\fi%
				\ifdefined\aEYa\rCa{\aEYa}&%
				\checkaEYa(4)\let\rEY\cachedata\ifemptydata\relax\else\IfNVOETF{\rEY}{}{\num{\rEY}\ts{}\aEYa(5)}\fi&%
				\checkaEYa(6)\let\rEY\cachedata\ifemptydata\relax\else\IfNVOETF{\rEY}{}{\num{\rEY}}\fi&%
				\checkaEYa(7)\let\rEY\cachedata\ifemptydata\relax\else\IfNVOETF{\rEY}{}{\num{\rEY}\%}\fi&%
				\checkaEYa(8)\let\rEY\cachedata\ifemptydata\relax\else\IfNVOETF{\rEY}{}{\num{\rEY} \euro}\fi&%
				\IfNVOETF{\aEY}{}{\num{\aEY} \euro}\expandafter\\\fi%	
				\ifdefined\aEZa\rCa{\aEZa}&%
				\checkaEZa(4)\let\rEZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEZ}{}{\num{\rEZ}\ts{}\aEZa(5)}\fi&%
				\checkaEZa(6)\let\rEZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEZ}{}{\num{\rEZ}}\fi&%
				\checkaEZa(7)\let\rEZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEZ}{}{\num{\rEZ}\%}\fi&%
				\checkaEZa(8)\let\rEZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rEZ}{}{\num{\rEZ} \euro}\fi&%
				\IfNVOETF{\aEZ}{}{\num{\aEZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aE} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aFAa%
			\captionof{table}{\large{\textsc{\aFCaption}}}\label{tbl:asset:F}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aFAa\rCa{\aFAa}&%
				\checkaFAa(4)\let\rFA\cachedata\ifemptydata\relax\else\IfNVOETF{\rFA}{}{\num{\rFA}\ts{}\aFAa(5)}\fi&%
				\checkaFAa(6)\let\rFA\cachedata\ifemptydata\relax\else\IfNVOETF{\rFA}{}{\num{\rFA}}\fi&%
				\checkaFAa(7)\let\rFA\cachedata\ifemptydata\relax\else\IfNVOETF{\rFA}{}{\num{\rFA}\%}\fi&%
				\checkaFAa(8)\let\rFA\cachedata\ifemptydata\relax\else\IfNVOETF{\rFA}{}{\num{\rFA} \euro}\fi&%
				\IfNVOETF{\aFA}{}{\num{\aFA} \euro}\expandafter\\\fi%
				\ifdefined\aFBa\rCa{\aFBa}&%
				\checkaFBa(4)\let\rFB\cachedata\ifemptydata\relax\else\IfNVOETF{\rFB}{}{\num{\rFB}\ts{}\aFBa(5)}\fi&%
				\checkaFBa(6)\let\rFB\cachedata\ifemptydata\relax\else\IfNVOETF{\rFB}{}{\num{\rFB}}\fi&%
				\checkaFBa(7)\let\rFB\cachedata\ifemptydata\relax\else\IfNVOETF{\rFB}{}{\num{\rFB}\%}\fi&%
				\checkaFBa(8)\let\rFB\cachedata\ifemptydata\relax\else\IfNVOETF{\rFB}{}{\num{\rFB} \euro}\fi&%
				\IfNVOETF{\aFB}{}{\num{\aFB} \euro}\expandafter\\\fi%
				\ifdefined\aFCa\rCa{\aFCa}&%
				\checkaFCa(4)\let\rFC\cachedata\ifemptydata\relax\else\IfNVOETF{\rFC}{}{\num{\rFC}\ts{}\aFCa(5)}\fi&%
				\checkaFCa(6)\let\rFC\cachedata\ifemptydata\relax\else\IfNVOETF{\rFC}{}{\num{\rFC}}\fi&%
				\checkaFCa(7)\let\rFC\cachedata\ifemptydata\relax\else\IfNVOETF{\rFC}{}{\num{\rFC}\%}\fi&%
				\checkaFCa(8)\let\rFC\cachedata\ifemptydata\relax\else\IfNVOETF{\rFC}{}{\num{\rFC} \euro}\fi&%
				\IfNVOETF{\aFC}{}{\num{\aFC} \euro}\expandafter\\\fi%
				\ifdefined\aFDa\rCa{\aFDa}&%
				\checkaFDa(4)\let\rFD\cachedata\ifemptydata\relax\else\IfNVOETF{\rFD}{}{\num{\rFD}\ts{}\aFDa(5)}\fi&%
				\checkaFDa(6)\let\rFD\cachedata\ifemptydata\relax\else\IfNVOETF{\rFD}{}{\num{\rFD}}\fi&%
				\checkaFDa(7)\let\rFD\cachedata\ifemptydata\relax\else\IfNVOETF{\rFD}{}{\num{\rFD}\%}\fi&%
				\checkaFDa(8)\let\rFD\cachedata\ifemptydata\relax\else\IfNVOETF{\rFD}{}{\num{\rFD} \euro}\fi&%
				\IfNVOETF{\aFD}{}{\num{\aFD} \euro}\expandafter\\\fi%
				\ifdefined\aFEa\rCa{\aFEa}&%
				\checkaFEa(4)\let\rFE\cachedata\ifemptydata\relax\else\IfNVOETF{\rFE}{}{\num{\rFE}\ts{}\aFEa(5)}\fi&%
				\checkaFEa(6)\let\rFE\cachedata\ifemptydata\relax\else\IfNVOETF{\rFE}{}{\num{\rFE}}\fi&%
				\checkaFEa(7)\let\rFE\cachedata\ifemptydata\relax\else\IfNVOETF{\rFE}{}{\num{\rFE}\%}\fi&%
				\checkaFEa(8)\let\rFE\cachedata\ifemptydata\relax\else\IfNVOETF{\rFE}{}{\num{\rFE} \euro}\fi&%
				\IfNVOETF{\aFE}{}{\num{\aFE} \euro}\expandafter\\\fi%
				\ifdefined\aFFa\rCa{\aFFa}&%
				\checkaFFa(4)\let\rFF\cachedata\ifemptydata\relax\else\IfNVOETF{\rFF}{}{\num{\rFF}\ts{}\aFFa(5)}\fi&%
				\checkaFFa(6)\let\rFF\cachedata\ifemptydata\relax\else\IfNVOETF{\rFF}{}{\num{\rFF}}\fi&%
				\checkaFFa(7)\let\rFF\cachedata\ifemptydata\relax\else\IfNVOETF{\rFF}{}{\num{\rFF}\%}\fi&%
				\checkaFFa(8)\let\rFF\cachedata\ifemptydata\relax\else\IfNVOETF{\rFF}{}{\num{\rFF} \euro}\fi&%
				\IfNVOETF{\aFF}{}{\num{\aFF} \euro}\expandafter\\\fi%
				\ifdefined\aFGa\rCa{\aFGa}&%
				\checkaFGa(4)\let\rFG\cachedata\ifemptydata\relax\else\IfNVOETF{\rFG}{}{\num{\rFG}\ts{}\aFGa(5)}\fi&%
				\checkaFGa(6)\let\rFG\cachedata\ifemptydata\relax\else\IfNVOETF{\rFG}{}{\num{\rFG}}\fi&%
				\checkaFGa(7)\let\rFG\cachedata\ifemptydata\relax\else\IfNVOETF{\rFG}{}{\num{\rFG}\%}\fi&%
				\checkaFGa(8)\let\rFG\cachedata\ifemptydata\relax\else\IfNVOETF{\rFG}{}{\num{\rFG} \euro}\fi&%
				\IfNVOETF{\aFG}{}{\num{\aFG} \euro}\expandafter\\\fi%
				\ifdefined\aFIa\rCa{\aFIa}&%
				\checkaFIa(4)\let\rFI\cachedata\ifemptydata\relax\else\IfNVOETF{\rFI}{}{\num{\rFI}\ts{}\aFIa(5)}\fi&%
				\checkaFIa(6)\let\rFI\cachedata\ifemptydata\relax\else\IfNVOETF{\rFI}{}{\num{\rFI}}\fi&%
				\checkaFIa(7)\let\rFI\cachedata\ifemptydata\relax\else\IfNVOETF{\rFI}{}{\num{\rFI}\%}\fi&%
				\checkaFIa(8)\let\rFI\cachedata\ifemptydata\relax\else\IfNVOETF{\rFI}{}{\num{\rFI} \euro}\fi&%
				\IfNVOETF{\aFI}{}{\num{\aFI} \euro}\expandafter\\\fi%
				\ifdefined\aFJa\rCa{\aFJa}&%
				\checkaFJa(4)\let\rFJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFJ}{}{\num{\rFJ}\ts{}\aFJa(5)}\fi&%
				\checkaFJa(6)\let\rFJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFJ}{}{\num{\rFJ}}\fi&%
				\checkaFJa(7)\let\rFJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFJ}{}{\num{\rFJ}\%}\fi&%
				\checkaFJa(8)\let\rFJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFJ}{}{\num{\rFJ} \euro}\fi&%
				\IfNVOETF{\aFJ}{}{\num{\aFJ} \euro}\expandafter\\\fi%
				\ifdefined\aFKa\rCa{\aFKa}&%
				\checkaFKa(4)\let\rFK\cachedata\ifemptydata\relax\else\IfNVOETF{\rFK}{}{\num{\rFK}\ts{}\aFKa(5)}\fi&%
				\checkaFKa(6)\let\rFK\cachedata\ifemptydata\relax\else\IfNVOETF{\rFK}{}{\num{\rFK}}\fi&%
				\checkaFKa(7)\let\rFK\cachedata\ifemptydata\relax\else\IfNVOETF{\rFK}{}{\num{\rFK}\%}\fi&%
				\checkaFKa(8)\let\rFK\cachedata\ifemptydata\relax\else\IfNVOETF{\rFK}{}{\num{\rFK} \euro}\fi&%
				\IfNVOETF{\aFK}{}{\num{\aFK} \euro}\expandafter\\\fi%
				\ifdefined\aFLa\rCa{\aFLa}&%
				\checkaFLa(4)\let\rFL\cachedata\ifemptydata\relax\else\IfNVOETF{\rFL}{}{\num{\rFL}\ts{}\aFLa(5)}\fi&%
				\checkaFLa(6)\let\rFL\cachedata\ifemptydata\relax\else\IfNVOETF{\rFL}{}{\num{\rFL}}\fi&%
				\checkaFLa(7)\let\rFL\cachedata\ifemptydata\relax\else\IfNVOETF{\rFL}{}{\num{\rFL}\%}\fi&%
				\checkaFLa(8)\let\rFL\cachedata\ifemptydata\relax\else\IfNVOETF{\rFL}{}{\num{\rFL} \euro}\fi&%
				\IfNVOETF{\aFL}{}{\num{\aFL} \euro}\expandafter\\\fi%
				\ifdefined\aFMa\rCa{\aFMa}&%
				\checkaFMa(4)\let\rFM\cachedata\ifemptydata\relax\else\IfNVOETF{\rFM}{}{\num{\rFM}\ts{}\aFMa(5)}\fi&%
				\checkaFMa(6)\let\rFM\cachedata\ifemptydata\relax\else\IfNVOETF{\rFM}{}{\num{\rFM}}\fi&%
				\checkaFMa(7)\let\rFM\cachedata\ifemptydata\relax\else\IfNVOETF{\rFM}{}{\num{\rFM}\%}\fi&%
				\checkaFMa(8)\let\rFM\cachedata\ifemptydata\relax\else\IfNVOETF{\rFM}{}{\num{\rFM} \euro}\fi&%
				\IfNVOETF{\aFM}{}{\num{\aFM} \euro}\expandafter\\\fi%
				\ifdefined\aFNa\rCa{\aFNa}&%
				\checkaFNa(4)\let\rFN\cachedata\ifemptydata\relax\else\IfNVOETF{\rFN}{}{\num{\rFN}\ts{}\aFNa(5)}\fi&%
				\checkaFNa(6)\let\rFN\cachedata\ifemptydata\relax\else\IfNVOETF{\rFN}{}{\num{\rFN}}\fi&%
				\checkaFNa(7)\let\rFN\cachedata\ifemptydata\relax\else\IfNVOETF{\rFN}{}{\num{\rFN}\%}\fi&%
				\checkaFNa(8)\let\rFN\cachedata\ifemptydata\relax\else\IfNVOETF{\rFN}{}{\num{\rFN} \euro}\fi&%
				\IfNVOETF{\aFN}{}{\num{\aFN} \euro}\expandafter\\\fi%
				\ifdefined\aFOa\rCa{\aFOa}&%
				\checkaFOa(4)\let\rFO\cachedata\ifemptydata\relax\else\IfNVOETF{\rFO}{}{\num{\rFO}\ts{}\aFOa(5)}\fi&%
				\checkaFOa(6)\let\rFO\cachedata\ifemptydata\relax\else\IfNVOETF{\rFO}{}{\num{\rFO}}\fi&%
				\checkaFOa(7)\let\rFO\cachedata\ifemptydata\relax\else\IfNVOETF{\rFO}{}{\num{\rFO}\%}\fi&%
				\checkaFOa(8)\let\rFO\cachedata\ifemptydata\relax\else\IfNVOETF{\rFO}{}{\num{\rFO} \euro}\fi&%
				\IfNVOETF{\aFO}{}{\num{\aFO} \euro}\expandafter\\\fi%
				\ifdefined\aFPa\rCa{\aFPa}&%
				\checkaFPa(4)\let\rFP\cachedata\ifemptydata\relax\else\IfNVOETF{\rFP}{}{\num{\rFP}\ts{}\aFPa(5)}\fi&%
				\checkaFPa(6)\let\rFP\cachedata\ifemptydata\relax\else\IfNVOETF{\rFP}{}{\num{\rFP}}\fi&%
				\checkaFPa(7)\let\rFP\cachedata\ifemptydata\relax\else\IfNVOETF{\rFP}{}{\num{\rFP}\%}\fi&%
				\checkaFPa(8)\let\rFP\cachedata\ifemptydata\relax\else\IfNVOETF{\rFP}{}{\num{\rFP} \euro}\fi&%
				\IfNVOETF{\aFP}{}{\num{\aFP} \euro}\expandafter\\\fi%
				\ifdefined\aFQa\rCa{\aFQa}&%
				\checkaFQa(4)\let\rFQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFQ}{}{\num{\rFQ}\ts{}\aFQa(5)}\fi&%
				\checkaFQa(6)\let\rFQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFQ}{}{\num{\rFQ}}\fi&%
				\checkaFQa(7)\let\rFQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFQ}{}{\num{\rFQ}\%}\fi&%
				\checkaFQa(8)\let\rFQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFQ}{}{\num{\rFQ} \euro}\fi&%
				\IfNVOETF{\aFQ}{}{\num{\aFQ} \euro}\expandafter\\\fi%
				\ifdefined\aFRa\rCa{\aFRa}&%
				\checkaFRa(4)\let\rFR\cachedata\ifemptydata\relax\else\IfNVOETF{\rFR}{}{\num{\rFR}\ts{}\aFRa(5)}\fi&%
				\checkaFRa(6)\let\rFR\cachedata\ifemptydata\relax\else\IfNVOETF{\rFR}{}{\num{\rFR}}\fi&%
				\checkaFRa(7)\let\rFR\cachedata\ifemptydata\relax\else\IfNVOETF{\rFR}{}{\num{\rFR}\%}\fi&%
				\checkaFRa(8)\let\rFR\cachedata\ifemptydata\relax\else\IfNVOETF{\rFR}{}{\num{\rFR} \euro}\fi&%
				\IfNVOETF{\aFR}{}{\num{\aFR} \euro}\expandafter\\\fi%
				\ifdefined\aFSa\rCa{\aFSa}&%
				\checkaFSa(4)\let\rFS\cachedata\ifemptydata\relax\else\IfNVOETF{\rFS}{}{\num{\rFS}\ts{}\aFSa(5)}\fi&%
				\checkaFSa(6)\let\rFS\cachedata\ifemptydata\relax\else\IfNVOETF{\rFS}{}{\num{\rFS}}\fi&%
				\checkaFSa(7)\let\rFS\cachedata\ifemptydata\relax\else\IfNVOETF{\rFS}{}{\num{\rFS}\%}\fi&%
				\checkaFSa(8)\let\rFS\cachedata\ifemptydata\relax\else\IfNVOETF{\rFS}{}{\num{\rFS} \euro}\fi&%
				\IfNVOETF{\aFS}{}{\num{\aFS} \euro}\expandafter\\\fi%
				\ifdefined\aFTa\rCa{\aFTa}&%
				\checkaFTa(4)\let\rFT\cachedata\ifemptydata\relax\else\IfNVOETF{\rFT}{}{\num{\rFT}\ts{}\aFTa(5)}\fi&%
				\checkaFTa(6)\let\rFT\cachedata\ifemptydata\relax\else\IfNVOETF{\rFT}{}{\num{\rFT}}\fi&%
				\checkaFTa(7)\let\rFT\cachedata\ifemptydata\relax\else\IfNVOETF{\rFT}{}{\num{\rFT}\%}\fi&%
				\checkaFTa(8)\let\rFT\cachedata\ifemptydata\relax\else\IfNVOETF{\rFT}{}{\num{\rFT} \euro}\fi&%
				\IfNVOETF{\aFT}{}{\num{\aFT} \euro}\expandafter\\\fi%
				\ifdefined\aFUa\rCa{\aFUa}&%
				\checkaFUa(4)\let\rFU\cachedata\ifemptydata\relax\else\IfNVOETF{\rFU}{}{\num{\rFU}\ts{}\aFUa(5)}\fi&%
				\checkaFUa(6)\let\rFU\cachedata\ifemptydata\relax\else\IfNVOETF{\rFU}{}{\num{\rFU}}\fi&%
				\checkaFUa(7)\let\rFU\cachedata\ifemptydata\relax\else\IfNVOETF{\rFU}{}{\num{\rFU}\%}\fi&%
				\checkaFUa(8)\let\rFU\cachedata\ifemptydata\relax\else\IfNVOETF{\rFU}{}{\num{\rFU} \euro}\fi&%
				\IfNVOETF{\aFU}{}{\num{\aFU} \euro}\expandafter\\\fi%
				\ifdefined\aFVa\rCa{\aFVa}&%
				\checkaFVa(4)\let\rFV\cachedata\ifemptydata\relax\else\IfNVOETF{\rFV}{}{\num{\rFV}\ts{}\aFVa(5)}\fi&%
				\checkaFVa(6)\let\rFV\cachedata\ifemptydata\relax\else\IfNVOETF{\rFV}{}{\num{\rFV}}\fi&%
				\checkaFVa(7)\let\rFV\cachedata\ifemptydata\relax\else\IfNVOETF{\rFV}{}{\num{\rFV}\%}\fi&%
				\checkaFVa(8)\let\rFV\cachedata\ifemptydata\relax\else\IfNVOETF{\rFV}{}{\num{\rFV} \euro}\fi&%
				\IfNVOETF{\aFV}{}{\num{\aFV} \euro}\expandafter\\\fi%
				\ifdefined\aFWa\rCa{\aFWa}&%
				\checkaFWa(4)\let\rFW\cachedata\ifemptydata\relax\else\IfNVOETF{\rFW}{}{\num{\rFW}\ts{}\aFWa(5)}\fi&%
				\checkaFWa(6)\let\rFW\cachedata\ifemptydata\relax\else\IfNVOETF{\rFW}{}{\num{\rFW}}\fi&%
				\checkaFWa(7)\let\rFW\cachedata\ifemptydata\relax\else\IfNVOETF{\rFW}{}{\num{\rFW}\%}\fi&%
				\checkaFWa(8)\let\rFW\cachedata\ifemptydata\relax\else\IfNVOETF{\rFW}{}{\num{\rFW} \euro}\fi&%
				\IfNVOETF{\aFW}{}{\num{\aFW} \euro}\expandafter\\\fi%
				\ifdefined\aFXa\rCa{\aFXa}&%
				\checkaFXa(4)\let\rFX\cachedata\ifemptydata\relax\else\IfNVOETF{\rFX}{}{\num{\rFX}\ts{}\aFXa(5)}\fi&%
				\checkaFXa(6)\let\rFX\cachedata\ifemptydata\relax\else\IfNVOETF{\rFX}{}{\num{\rFX}}\fi&%
				\checkaFXa(7)\let\rFX\cachedata\ifemptydata\relax\else\IfNVOETF{\rFX}{}{\num{\rFX}\%}\fi&%
				\checkaFXa(8)\let\rFX\cachedata\ifemptydata\relax\else\IfNVOETF{\rFX}{}{\num{\rFX} \euro}\fi&%
				\IfNVOETF{\aFX}{}{\num{\aFX} \euro}\expandafter\\\fi%
				\ifdefined\aFYa\rCa{\aFYa}&%
				\checkaFYa(4)\let\rFY\cachedata\ifemptydata\relax\else\IfNVOETF{\rFY}{}{\num{\rFY}\ts{}\aFYa(5)}\fi&%
				\checkaFYa(6)\let\rFY\cachedata\ifemptydata\relax\else\IfNVOETF{\rFY}{}{\num{\rFY}}\fi&%
				\checkaFYa(7)\let\rFY\cachedata\ifemptydata\relax\else\IfNVOETF{\rFY}{}{\num{\rFY}\%}\fi&%
				\checkaFYa(8)\let\rFY\cachedata\ifemptydata\relax\else\IfNVOETF{\rFY}{}{\num{\rFY} \euro}\fi&%
				\IfNVOETF{\aFY}{}{\num{\aFY} \euro}\expandafter\\\fi%	
				\ifdefined\aFZa\rCa{\aFZa}&%
				\checkaFZa(4)\let\rFZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFZ}{}{\num{\rFZ}\ts{}\aFZa(5)}\fi&%
				\checkaFZa(6)\let\rFZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFZ}{}{\num{\rFZ}}\fi&%
				\checkaFZa(7)\let\rFZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFZ}{}{\num{\rFZ}\%}\fi&%
				\checkaFZa(8)\let\rFZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rFZ}{}{\num{\rFZ} \euro}\fi&%
				\IfNVOETF{\aFZ}{}{\num{\aFZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aF} \euro    \\%
			\end{tabularx} %
			\fi%			
			\ifdefined\aGAa%
			\captionof{table}{\large{\textsc{\aGCaption}}}\label{tbl:asset:G}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aGAa\rCa{\aGAa}&%
				\checkaGAa(4)\let\rGA\cachedata\ifemptydata\relax\else\IfNVOETF{\rGA}{}{\num{\rGA}\ts{}\aGAa(5)}\fi&%
				\checkaGAa(6)\let\rGA\cachedata\ifemptydata\relax\else\IfNVOETF{\rGA}{}{\num{\rGA}}\fi&%
				\checkaGAa(7)\let\rGA\cachedata\ifemptydata\relax\else\IfNVOETF{\rGA}{}{\num{\rGA}\%}\fi&%
				\checkaGAa(8)\let\rGA\cachedata\ifemptydata\relax\else\IfNVOETF{\rGA}{}{\num{\rGA} \euro}\fi&%
				\IfNVOETF{\aGA}{}{\num{\aGA} \euro}\expandafter\\\fi%
				\ifdefined\aGBa\rCa{\aGBa}&%
				\checkaGBa(4)\let\rGB\cachedata\ifemptydata\relax\else\IfNVOETF{\rGB}{}{\num{\rGB}\ts{}\aGBa(5)}\fi&%
				\checkaGBa(6)\let\rGB\cachedata\ifemptydata\relax\else\IfNVOETF{\rGB}{}{\num{\rGB}}\fi&%
				\checkaGBa(7)\let\rGB\cachedata\ifemptydata\relax\else\IfNVOETF{\rGB}{}{\num{\rGB}\%}\fi&%
				\checkaGBa(8)\let\rGB\cachedata\ifemptydata\relax\else\IfNVOETF{\rGB}{}{\num{\rGB} \euro}\fi&%
				\IfNVOETF{\aGB}{}{\num{\aGB} \euro}\expandafter\\\fi%
				\ifdefined\aGCa\rCa{\aGCa}&%
				\checkaGCa(4)\let\rGC\cachedata\ifemptydata\relax\else\IfNVOETF{\rGC}{}{\num{\rGC}\ts{}\aGCa(5)}\fi&%
				\checkaGCa(6)\let\rGC\cachedata\ifemptydata\relax\else\IfNVOETF{\rGC}{}{\num{\rGC}}\fi&%
				\checkaGCa(7)\let\rGC\cachedata\ifemptydata\relax\else\IfNVOETF{\rGC}{}{\num{\rGC}\%}\fi&%
				\checkaGCa(8)\let\rGC\cachedata\ifemptydata\relax\else\IfNVOETF{\rGC}{}{\num{\rGC} \euro}\fi&%
				\IfNVOETF{\aGC}{}{\num{\aGC} \euro}\expandafter\\\fi%
				\ifdefined\aGDa\rCa{\aGDa}&%
				\checkaGDa(4)\let\rGD\cachedata\ifemptydata\relax\else\IfNVOETF{\rGD}{}{\num{\rGD}\ts{}\aGDa(5)}\fi&%
				\checkaGDa(6)\let\rGD\cachedata\ifemptydata\relax\else\IfNVOETF{\rGD}{}{\num{\rGD}}\fi&%
				\checkaGDa(7)\let\rGD\cachedata\ifemptydata\relax\else\IfNVOETF{\rGD}{}{\num{\rGD}\%}\fi&%
				\checkaGDa(8)\let\rGD\cachedata\ifemptydata\relax\else\IfNVOETF{\rGD}{}{\num{\rGD} \euro}\fi&%
				\IfNVOETF{\aGD}{}{\num{\aGD} \euro}\expandafter\\\fi%
				\ifdefined\aGEa\rCa{\aGEa}&%
				\checkaGEa(4)\let\rGE\cachedata\ifemptydata\relax\else\IfNVOETF{\rGE}{}{\num{\rGE}\ts{}\aGEa(5)}\fi&%
				\checkaGEa(6)\let\rGE\cachedata\ifemptydata\relax\else\IfNVOETF{\rGE}{}{\num{\rGE}}\fi&%
				\checkaGEa(7)\let\rGE\cachedata\ifemptydata\relax\else\IfNVOETF{\rGE}{}{\num{\rGE}\%}\fi&%
				\checkaGEa(8)\let\rGE\cachedata\ifemptydata\relax\else\IfNVOETF{\rGE}{}{\num{\rGE} \euro}\fi&%
				\IfNVOETF{\aGE}{}{\num{\aGE} \euro}\expandafter\\\fi%
				\ifdefined\aGFa\rCa{\aGFa}&%
				\checkaGFa(4)\let\rGF\cachedata\ifemptydata\relax\else\IfNVOETF{\rGF}{}{\num{\rGF}\ts{}\aGFa(5)}\fi&%
				\checkaGFa(6)\let\rGF\cachedata\ifemptydata\relax\else\IfNVOETF{\rGF}{}{\num{\rGF}}\fi&%
				\checkaGFa(7)\let\rGF\cachedata\ifemptydata\relax\else\IfNVOETF{\rGF}{}{\num{\rGF}\%}\fi&%
				\checkaGFa(8)\let\rGF\cachedata\ifemptydata\relax\else\IfNVOETF{\rGF}{}{\num{\rGF} \euro}\fi&%
				\IfNVOETF{\aGF}{}{\num{\aGF} \euro}\expandafter\\\fi%
				\ifdefined\aGGa\rCa{\aGGa}&%
				\checkaGGa(4)\let\rGG\cachedata\ifemptydata\relax\else\IfNVOETF{\rGG}{}{\num{\rGG}\ts{}\aGGa(5)}\fi&%
				\checkaGGa(6)\let\rGG\cachedata\ifemptydata\relax\else\IfNVOETF{\rGG}{}{\num{\rGG}}\fi&%
				\checkaGGa(7)\let\rGG\cachedata\ifemptydata\relax\else\IfNVOETF{\rGG}{}{\num{\rGG}\%}\fi&%
				\checkaGGa(8)\let\rGG\cachedata\ifemptydata\relax\else\IfNVOETF{\rGG}{}{\num{\rGG} \euro}\fi&%
				\IfNVOETF{\aGG}{}{\num{\aGG} \euro}\expandafter\\\fi%
				\ifdefined\aGIa\rCa{\aGIa}&%
				\checkaGIa(4)\let\rGI\cachedata\ifemptydata\relax\else\IfNVOETF{\rGI}{}{\num{\rGI}\ts{}\aGIa(5)}\fi&%
				\checkaGIa(6)\let\rGI\cachedata\ifemptydata\relax\else\IfNVOETF{\rGI}{}{\num{\rGI}}\fi&%
				\checkaGIa(7)\let\rGI\cachedata\ifemptydata\relax\else\IfNVOETF{\rGI}{}{\num{\rGI}\%}\fi&%
				\checkaGIa(8)\let\rGI\cachedata\ifemptydata\relax\else\IfNVOETF{\rGI}{}{\num{\rGI} \euro}\fi&%
				\IfNVOETF{\aGI}{}{\num{\aGI} \euro}\expandafter\\\fi%
				\ifdefined\aGJa\rCa{\aGJa}&%
				\checkaGJa(4)\let\rGJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGJ}{}{\num{\rGJ}\ts{}\aGJa(5)}\fi&%
				\checkaGJa(6)\let\rGJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGJ}{}{\num{\rGJ}}\fi&%
				\checkaGJa(7)\let\rGJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGJ}{}{\num{\rGJ}\%}\fi&%
				\checkaGJa(8)\let\rGJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGJ}{}{\num{\rGJ} \euro}\fi&%
				\IfNVOETF{\aGJ}{}{\num{\aGJ} \euro}\expandafter\\\fi%
				\ifdefined\aGKa\rCa{\aGKa}&%
				\checkaGKa(4)\let\rGK\cachedata\ifemptydata\relax\else\IfNVOETF{\rGK}{}{\num{\rGK}\ts{}\aGKa(5)}\fi&%
				\checkaGKa(6)\let\rGK\cachedata\ifemptydata\relax\else\IfNVOETF{\rGK}{}{\num{\rGK}}\fi&%
				\checkaGKa(7)\let\rGK\cachedata\ifemptydata\relax\else\IfNVOETF{\rGK}{}{\num{\rGK}\%}\fi&%
				\checkaGKa(8)\let\rGK\cachedata\ifemptydata\relax\else\IfNVOETF{\rGK}{}{\num{\rGK} \euro}\fi&%
				\IfNVOETF{\aGK}{}{\num{\aGK} \euro}\expandafter\\\fi%
				\ifdefined\aGLa\rCa{\aGLa}&%
				\checkaGLa(4)\let\rGL\cachedata\ifemptydata\relax\else\IfNVOETF{\rGL}{}{\num{\rGL}\ts{}\aGLa(5)}\fi&%
				\checkaGLa(6)\let\rGL\cachedata\ifemptydata\relax\else\IfNVOETF{\rGL}{}{\num{\rGL}}\fi&%
				\checkaGLa(7)\let\rGL\cachedata\ifemptydata\relax\else\IfNVOETF{\rGL}{}{\num{\rGL}\%}\fi&%
				\checkaGLa(8)\let\rGL\cachedata\ifemptydata\relax\else\IfNVOETF{\rGL}{}{\num{\rGL} \euro}\fi&%
				\IfNVOETF{\aGL}{}{\num{\aGL} \euro}\expandafter\\\fi%
				\ifdefined\aGMa\rCa{\aGMa}&%
				\checkaGMa(4)\let\rGM\cachedata\ifemptydata\relax\else\IfNVOETF{\rGM}{}{\num{\rGM}\ts{}\aGMa(5)}\fi&%
				\checkaGMa(6)\let\rGM\cachedata\ifemptydata\relax\else\IfNVOETF{\rGM}{}{\num{\rGM}}\fi&%
				\checkaGMa(7)\let\rGM\cachedata\ifemptydata\relax\else\IfNVOETF{\rGM}{}{\num{\rGM}\%}\fi&%
				\checkaGMa(8)\let\rGM\cachedata\ifemptydata\relax\else\IfNVOETF{\rGM}{}{\num{\rGM} \euro}\fi&%
				\IfNVOETF{\aGM}{}{\num{\aGM} \euro}\expandafter\\\fi%
				\ifdefined\aGNa\rCa{\aGNa}&%
				\checkaGNa(4)\let\rGN\cachedata\ifemptydata\relax\else\IfNVOETF{\rGN}{}{\num{\rGN}\ts{}\aGNa(5)}\fi&%
				\checkaGNa(6)\let\rGN\cachedata\ifemptydata\relax\else\IfNVOETF{\rGN}{}{\num{\rGN}}\fi&%
				\checkaGNa(7)\let\rGN\cachedata\ifemptydata\relax\else\IfNVOETF{\rGN}{}{\num{\rGN}\%}\fi&%
				\checkaGNa(8)\let\rGN\cachedata\ifemptydata\relax\else\IfNVOETF{\rGN}{}{\num{\rGN} \euro}\fi&%
				\IfNVOETF{\aGN}{}{\num{\aGN} \euro}\expandafter\\\fi%
				\ifdefined\aGOa\rCa{\aGOa}&%
				\checkaGOa(4)\let\rGO\cachedata\ifemptydata\relax\else\IfNVOETF{\rGO}{}{\num{\rGO}\ts{}\aGOa(5)}\fi&%
				\checkaGOa(6)\let\rGO\cachedata\ifemptydata\relax\else\IfNVOETF{\rGO}{}{\num{\rGO}}\fi&%
				\checkaGOa(7)\let\rGO\cachedata\ifemptydata\relax\else\IfNVOETF{\rGO}{}{\num{\rGO}\%}\fi&%
				\checkaGOa(8)\let\rGO\cachedata\ifemptydata\relax\else\IfNVOETF{\rGO}{}{\num{\rGO} \euro}\fi&%
				\IfNVOETF{\aGO}{}{\num{\aGO} \euro}\expandafter\\\fi%
				\ifdefined\aGPa\rCa{\aGPa}&%
				\checkaGPa(4)\let\rGP\cachedata\ifemptydata\relax\else\IfNVOETF{\rGP}{}{\num{\rGP}\ts{}\aGPa(5)}\fi&%
				\checkaGPa(6)\let\rGP\cachedata\ifemptydata\relax\else\IfNVOETF{\rGP}{}{\num{\rGP}}\fi&%
				\checkaGPa(7)\let\rGP\cachedata\ifemptydata\relax\else\IfNVOETF{\rGP}{}{\num{\rGP}\%}\fi&%
				\checkaGPa(8)\let\rGP\cachedata\ifemptydata\relax\else\IfNVOETF{\rGP}{}{\num{\rGP} \euro}\fi&%
				\IfNVOETF{\aGP}{}{\num{\aGP} \euro}\expandafter\\\fi%
				\ifdefined\aGQa\rCa{\aGQa}&%
				\checkaGQa(4)\let\rGQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGQ}{}{\num{\rGQ}\ts{}\aGQa(5)}\fi&%
				\checkaGQa(6)\let\rGQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGQ}{}{\num{\rGQ}}\fi&%
				\checkaGQa(7)\let\rGQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGQ}{}{\num{\rGQ}\%}\fi&%
				\checkaGQa(8)\let\rGQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGQ}{}{\num{\rGQ} \euro}\fi&%
				\IfNVOETF{\aGQ}{}{\num{\aGQ} \euro}\expandafter\\\fi%
				\ifdefined\aGRa\rCa{\aGRa}&%
				\checkaGRa(4)\let\rGR\cachedata\ifemptydata\relax\else\IfNVOETF{\rGR}{}{\num{\rGR}\ts{}\aGRa(5)}\fi&%
				\checkaGRa(6)\let\rGR\cachedata\ifemptydata\relax\else\IfNVOETF{\rGR}{}{\num{\rGR}}\fi&%
				\checkaGRa(7)\let\rGR\cachedata\ifemptydata\relax\else\IfNVOETF{\rGR}{}{\num{\rGR}\%}\fi&%
				\checkaGRa(8)\let\rGR\cachedata\ifemptydata\relax\else\IfNVOETF{\rGR}{}{\num{\rGR} \euro}\fi&%
				\IfNVOETF{\aGR}{}{\num{\aGR} \euro}\expandafter\\\fi%
				\ifdefined\aGSa\rCa{\aGSa}&%
				\checkaGSa(4)\let\rGS\cachedata\ifemptydata\relax\else\IfNVOETF{\rGS}{}{\num{\rGS}\ts{}\aGSa(5)}\fi&%
				\checkaGSa(6)\let\rGS\cachedata\ifemptydata\relax\else\IfNVOETF{\rGS}{}{\num{\rGS}}\fi&%
				\checkaGSa(7)\let\rGS\cachedata\ifemptydata\relax\else\IfNVOETF{\rGS}{}{\num{\rGS}\%}\fi&%
				\checkaGSa(8)\let\rGS\cachedata\ifemptydata\relax\else\IfNVOETF{\rGS}{}{\num{\rGS} \euro}\fi&%
				\IfNVOETF{\aGS}{}{\num{\aGS} \euro}\expandafter\\\fi%
				\ifdefined\aGTa\rCa{\aGTa}&%
				\checkaGTa(4)\let\rGT\cachedata\ifemptydata\relax\else\IfNVOETF{\rGT}{}{\num{\rGT}\ts{}\aGTa(5)}\fi&%
				\checkaGTa(6)\let\rGT\cachedata\ifemptydata\relax\else\IfNVOETF{\rGT}{}{\num{\rGT}}\fi&%
				\checkaGTa(7)\let\rGT\cachedata\ifemptydata\relax\else\IfNVOETF{\rGT}{}{\num{\rGT}\%}\fi&%
				\checkaGTa(8)\let\rGT\cachedata\ifemptydata\relax\else\IfNVOETF{\rGT}{}{\num{\rGT} \euro}\fi&%
				\IfNVOETF{\aGT}{}{\num{\aGT} \euro}\expandafter\\\fi%
				\ifdefined\aGUa\rCa{\aGUa}&%
				\checkaGUa(4)\let\rGU\cachedata\ifemptydata\relax\else\IfNVOETF{\rGU}{}{\num{\rGU}\ts{}\aGUa(5)}\fi&%
				\checkaGUa(6)\let\rGU\cachedata\ifemptydata\relax\else\IfNVOETF{\rGU}{}{\num{\rGU}}\fi&%
				\checkaGUa(7)\let\rGU\cachedata\ifemptydata\relax\else\IfNVOETF{\rGU}{}{\num{\rGU}\%}\fi&%
				\checkaGUa(8)\let\rGU\cachedata\ifemptydata\relax\else\IfNVOETF{\rGU}{}{\num{\rGU} \euro}\fi&%
				\IfNVOETF{\aGU}{}{\num{\aGU} \euro}\expandafter\\\fi%
				\ifdefined\aGVa\rCa{\aGVa}&%
				\checkaGVa(4)\let\rGV\cachedata\ifemptydata\relax\else\IfNVOETF{\rGV}{}{\num{\rGV}\ts{}\aGVa(5)}\fi&%
				\checkaGVa(6)\let\rGV\cachedata\ifemptydata\relax\else\IfNVOETF{\rGV}{}{\num{\rGV}}\fi&%
				\checkaGVa(7)\let\rGV\cachedata\ifemptydata\relax\else\IfNVOETF{\rGV}{}{\num{\rGV}\%}\fi&%
				\checkaGVa(8)\let\rGV\cachedata\ifemptydata\relax\else\IfNVOETF{\rGV}{}{\num{\rGV} \euro}\fi&%
				\IfNVOETF{\aGV}{}{\num{\aGV} \euro}\expandafter\\\fi%
				\ifdefined\aGWa\rCa{\aGWa}&%
				\checkaGWa(4)\let\rGW\cachedata\ifemptydata\relax\else\IfNVOETF{\rGW}{}{\num{\rGW}\ts{}\aGWa(5)}\fi&%
				\checkaGWa(6)\let\rGW\cachedata\ifemptydata\relax\else\IfNVOETF{\rGW}{}{\num{\rGW}}\fi&%
				\checkaGWa(7)\let\rGW\cachedata\ifemptydata\relax\else\IfNVOETF{\rGW}{}{\num{\rGW}\%}\fi&%
				\checkaGWa(8)\let\rGW\cachedata\ifemptydata\relax\else\IfNVOETF{\rGW}{}{\num{\rGW} \euro}\fi&%
				\IfNVOETF{\aGW}{}{\num{\aGW} \euro}\expandafter\\\fi%
				\ifdefined\aGXa\rCa{\aGXa}&%
				\checkaGXa(4)\let\rGX\cachedata\ifemptydata\relax\else\IfNVOETF{\rGX}{}{\num{\rGX}\ts{}\aGXa(5)}\fi&%
				\checkaGXa(6)\let\rGX\cachedata\ifemptydata\relax\else\IfNVOETF{\rGX}{}{\num{\rGX}}\fi&%
				\checkaGXa(7)\let\rGX\cachedata\ifemptydata\relax\else\IfNVOETF{\rGX}{}{\num{\rGX}\%}\fi&%
				\checkaGXa(8)\let\rGX\cachedata\ifemptydata\relax\else\IfNVOETF{\rGX}{}{\num{\rGX} \euro}\fi&%
				\IfNVOETF{\aGX}{}{\num{\aGX} \euro}\expandafter\\\fi%
				\ifdefined\aGYa\rCa{\aGYa}&%
				\checkaGYa(4)\let\rGY\cachedata\ifemptydata\relax\else\IfNVOETF{\rGY}{}{\num{\rGY}\ts{}\aGYa(5)}\fi&%
				\checkaGYa(6)\let\rGY\cachedata\ifemptydata\relax\else\IfNVOETF{\rGY}{}{\num{\rGY}}\fi&%
				\checkaGYa(7)\let\rGY\cachedata\ifemptydata\relax\else\IfNVOETF{\rGY}{}{\num{\rGY}\%}\fi&%
				\checkaGYa(8)\let\rGY\cachedata\ifemptydata\relax\else\IfNVOETF{\rGY}{}{\num{\rGY} \euro}\fi&%
				\IfNVOETF{\aGY}{}{\num{\aGY} \euro}\expandafter\\\fi%	
				\ifdefined\aGZa\rCa{\aGZa}&%
				\checkaGZa(4)\let\rGZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGZ}{}{\num{\rGZ}\ts{}\aGZa(5)}\fi&%
				\checkaGZa(6)\let\rGZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGZ}{}{\num{\rGZ}}\fi&%
				\checkaGZa(7)\let\rGZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGZ}{}{\num{\rGZ}\%}\fi&%
				\checkaGZa(8)\let\rGZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rGZ}{}{\num{\rGZ} \euro}\fi&%
				\IfNVOETF{\aGZ}{}{\num{\aGZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aG} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aHAa%
			\captionof{table}{\large{\textsc{\aHCaption}}}\label{tbl:asset:H}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aHAa\rCa{\aHAa}&%
				\checkaHAa(4)\let\rHA\cachedata\ifemptydata\relax\else\IfNVOETF{\rHA}{}{\num{\rHA}\ts{}\aHAa(5)}\fi&%
				\checkaHAa(6)\let\rHA\cachedata\ifemptydata\relax\else\IfNVOETF{\rHA}{}{\num{\rHA}}\fi&%
				\checkaHAa(7)\let\rHA\cachedata\ifemptydata\relax\else\IfNVOETF{\rHA}{}{\num{\rHA}\%}\fi&%
				\checkaHAa(8)\let\rHA\cachedata\ifemptydata\relax\else\IfNVOETF{\rHA}{}{\num{\rHA} \euro}\fi&%
				\IfNVOETF{\aHA}{}{\num{\aHA} \euro}\expandafter\\\fi%
				\ifdefined\aHBa\rCa{\aHBa}&%
				\checkaHBa(4)\let\rHB\cachedata\ifemptydata\relax\else\IfNVOETF{\rHB}{}{\num{\rHB}\ts{}\aHBa(5)}\fi&%
				\checkaHBa(6)\let\rHB\cachedata\ifemptydata\relax\else\IfNVOETF{\rHB}{}{\num{\rHB}}\fi&%
				\checkaHBa(7)\let\rHB\cachedata\ifemptydata\relax\else\IfNVOETF{\rHB}{}{\num{\rHB}\%}\fi&%
				\checkaHBa(8)\let\rHB\cachedata\ifemptydata\relax\else\IfNVOETF{\rHB}{}{\num{\rHB} \euro}\fi&%
				\IfNVOETF{\aHB}{}{\num{\aHB} \euro}\expandafter\\\fi%
				\ifdefined\aHCa\rCa{\aHCa}&%
				\checkaHCa(4)\let\rHC\cachedata\ifemptydata\relax\else\IfNVOETF{\rHC}{}{\num{\rHC}\ts{}\aHCa(5)}\fi&%
				\checkaHCa(6)\let\rHC\cachedata\ifemptydata\relax\else\IfNVOETF{\rHC}{}{\num{\rHC}}\fi&%
				\checkaHCa(7)\let\rHC\cachedata\ifemptydata\relax\else\IfNVOETF{\rHC}{}{\num{\rHC}\%}\fi&%
				\checkaHCa(8)\let\rHC\cachedata\ifemptydata\relax\else\IfNVOETF{\rHC}{}{\num{\rHC} \euro}\fi&%
				\IfNVOETF{\aHC}{}{\num{\aHC} \euro}\expandafter\\\fi%
				\ifdefined\aHDa\rCa{\aHDa}&%
				\checkaHDa(4)\let\rHD\cachedata\ifemptydata\relax\else\IfNVOETF{\rHD}{}{\num{\rHD}\ts{}\aHDa(5)}\fi&%
				\checkaHDa(6)\let\rHD\cachedata\ifemptydata\relax\else\IfNVOETF{\rHD}{}{\num{\rHD}}\fi&%
				\checkaHDa(7)\let\rHD\cachedata\ifemptydata\relax\else\IfNVOETF{\rHD}{}{\num{\rHD}\%}\fi&%
				\checkaHDa(8)\let\rHD\cachedata\ifemptydata\relax\else\IfNVOETF{\rHD}{}{\num{\rHD} \euro}\fi&%
				\IfNVOETF{\aHD}{}{\num{\aHD} \euro}\expandafter\\\fi%
				\ifdefined\aHEa\rCa{\aHEa}&%
				\checkaHEa(4)\let\rHE\cachedata\ifemptydata\relax\else\IfNVOETF{\rHE}{}{\num{\rHE}\ts{}\aHEa(5)}\fi&%
				\checkaHEa(6)\let\rHE\cachedata\ifemptydata\relax\else\IfNVOETF{\rHE}{}{\num{\rHE}}\fi&%
				\checkaHEa(7)\let\rHE\cachedata\ifemptydata\relax\else\IfNVOETF{\rHE}{}{\num{\rHE}\%}\fi&%
				\checkaHEa(8)\let\rHE\cachedata\ifemptydata\relax\else\IfNVOETF{\rHE}{}{\num{\rHE} \euro}\fi&%
				\IfNVOETF{\aHE}{}{\num{\aHE} \euro}\expandafter\\\fi%
				\ifdefined\aHFa\rCa{\aHFa}&%
				\checkaHFa(4)\let\rHF\cachedata\ifemptydata\relax\else\IfNVOETF{\rHF}{}{\num{\rHF}\ts{}\aHFa(5)}\fi&%
				\checkaHFa(6)\let\rHF\cachedata\ifemptydata\relax\else\IfNVOETF{\rHF}{}{\num{\rHF}}\fi&%
				\checkaHFa(7)\let\rHF\cachedata\ifemptydata\relax\else\IfNVOETF{\rHF}{}{\num{\rHF}\%}\fi&%
				\checkaHFa(8)\let\rHF\cachedata\ifemptydata\relax\else\IfNVOETF{\rHF}{}{\num{\rHF} \euro}\fi&%
				\IfNVOETF{\aHF}{}{\num{\aHF} \euro}\expandafter\\\fi%
				\ifdefined\aHGa\rCa{\aHGa}&%
				\checkaHGa(4)\let\rHG\cachedata\ifemptydata\relax\else\IfNVOETF{\rHG}{}{\num{\rHG}\ts{}\aHGa(5)}\fi&%
				\checkaHGa(6)\let\rHG\cachedata\ifemptydata\relax\else\IfNVOETF{\rHG}{}{\num{\rHG}}\fi&%
				\checkaHGa(7)\let\rHG\cachedata\ifemptydata\relax\else\IfNVOETF{\rHG}{}{\num{\rHG}\%}\fi&%
				\checkaHGa(8)\let\rHG\cachedata\ifemptydata\relax\else\IfNVOETF{\rHG}{}{\num{\rHG} \euro}\fi&%
				\IfNVOETF{\aHG}{}{\num{\aHG} \euro}\expandafter\\\fi%
				\ifdefined\aHIa\rCa{\aHIa}&%
				\checkaHIa(4)\let\rHI\cachedata\ifemptydata\relax\else\IfNVOETF{\rHI}{}{\num{\rHI}\ts{}\aHIa(5)}\fi&%
				\checkaHIa(6)\let\rHI\cachedata\ifemptydata\relax\else\IfNVOETF{\rHI}{}{\num{\rHI}}\fi&%
				\checkaHIa(7)\let\rHI\cachedata\ifemptydata\relax\else\IfNVOETF{\rHI}{}{\num{\rHI}\%}\fi&%
				\checkaHIa(8)\let\rHI\cachedata\ifemptydata\relax\else\IfNVOETF{\rHI}{}{\num{\rHI} \euro}\fi&%
				\IfNVOETF{\aHI}{}{\num{\aHI} \euro}\expandafter\\\fi%
				\ifdefined\aHJa\rCa{\aHJa}&%
				\checkaHJa(4)\let\rHJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHJ}{}{\num{\rHJ}\ts{}\aHJa(5)}\fi&%
				\checkaHJa(6)\let\rHJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHJ}{}{\num{\rHJ}}\fi&%
				\checkaHJa(7)\let\rHJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHJ}{}{\num{\rHJ}\%}\fi&%
				\checkaHJa(8)\let\rHJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHJ}{}{\num{\rHJ} \euro}\fi&%
				\IfNVOETF{\aHJ}{}{\num{\aHJ} \euro}\expandafter\\\fi%
				\ifdefined\aHKa\rCa{\aHKa}&%
				\checkaHKa(4)\let\rHK\cachedata\ifemptydata\relax\else\IfNVOETF{\rHK}{}{\num{\rHK}\ts{}\aHKa(5)}\fi&%
				\checkaHKa(6)\let\rHK\cachedata\ifemptydata\relax\else\IfNVOETF{\rHK}{}{\num{\rHK}}\fi&%
				\checkaHKa(7)\let\rHK\cachedata\ifemptydata\relax\else\IfNVOETF{\rHK}{}{\num{\rHK}\%}\fi&%
				\checkaHKa(8)\let\rHK\cachedata\ifemptydata\relax\else\IfNVOETF{\rHK}{}{\num{\rHK} \euro}\fi&%
				\IfNVOETF{\aHK}{}{\num{\aHK} \euro}\expandafter\\\fi%
				\ifdefined\aHLa\rCa{\aHLa}&%
				\checkaHLa(4)\let\rHL\cachedata\ifemptydata\relax\else\IfNVOETF{\rHL}{}{\num{\rHL}\ts{}\aHLa(5)}\fi&%
				\checkaHLa(6)\let\rHL\cachedata\ifemptydata\relax\else\IfNVOETF{\rHL}{}{\num{\rHL}}\fi&%
				\checkaHLa(7)\let\rHL\cachedata\ifemptydata\relax\else\IfNVOETF{\rHL}{}{\num{\rHL}\%}\fi&%
				\checkaHLa(8)\let\rHL\cachedata\ifemptydata\relax\else\IfNVOETF{\rHL}{}{\num{\rHL} \euro}\fi&%
				\IfNVOETF{\aHL}{}{\num{\aHL} \euro}\expandafter\\\fi%
				\ifdefined\aHMa\rCa{\aHMa}&%
				\checkaHMa(4)\let\rHM\cachedata\ifemptydata\relax\else\IfNVOETF{\rHM}{}{\num{\rHM}\ts{}\aHMa(5)}\fi&%
				\checkaHMa(6)\let\rHM\cachedata\ifemptydata\relax\else\IfNVOETF{\rHM}{}{\num{\rHM}}\fi&%
				\checkaHMa(7)\let\rHM\cachedata\ifemptydata\relax\else\IfNVOETF{\rHM}{}{\num{\rHM}\%}\fi&%
				\checkaHMa(8)\let\rHM\cachedata\ifemptydata\relax\else\IfNVOETF{\rHM}{}{\num{\rHM} \euro}\fi&%
				\IfNVOETF{\aHM}{}{\num{\aHM} \euro}\expandafter\\\fi%
				\ifdefined\aHNa\rCa{\aHNa}&%
				\checkaHNa(4)\let\rHN\cachedata\ifemptydata\relax\else\IfNVOETF{\rHN}{}{\num{\rHN}\ts{}\aHNa(5)}\fi&%
				\checkaHNa(6)\let\rHN\cachedata\ifemptydata\relax\else\IfNVOETF{\rHN}{}{\num{\rHN}}\fi&%
				\checkaHNa(7)\let\rHN\cachedata\ifemptydata\relax\else\IfNVOETF{\rHN}{}{\num{\rHN}\%}\fi&%
				\checkaHNa(8)\let\rHN\cachedata\ifemptydata\relax\else\IfNVOETF{\rHN}{}{\num{\rHN} \euro}\fi&%
				\IfNVOETF{\aHN}{}{\num{\aHN} \euro}\expandafter\\\fi%
				\ifdefined\aHOa\rCa{\aHOa}&%
				\checkaHOa(4)\let\rHO\cachedata\ifemptydata\relax\else\IfNVOETF{\rHO}{}{\num{\rHO}\ts{}\aHOa(5)}\fi&%
				\checkaHOa(6)\let\rHO\cachedata\ifemptydata\relax\else\IfNVOETF{\rHO}{}{\num{\rHO}}\fi&%
				\checkaHOa(7)\let\rHO\cachedata\ifemptydata\relax\else\IfNVOETF{\rHO}{}{\num{\rHO}\%}\fi&%
				\checkaHOa(8)\let\rHO\cachedata\ifemptydata\relax\else\IfNVOETF{\rHO}{}{\num{\rHO} \euro}\fi&%
				\IfNVOETF{\aHO}{}{\num{\aHO} \euro}\expandafter\\\fi%
				\ifdefined\aHPa\rCa{\aHPa}&%
				\checkaHPa(4)\let\rHP\cachedata\ifemptydata\relax\else\IfNVOETF{\rHP}{}{\num{\rHP}\ts{}\aHPa(5)}\fi&%
				\checkaHPa(6)\let\rHP\cachedata\ifemptydata\relax\else\IfNVOETF{\rHP}{}{\num{\rHP}}\fi&%
				\checkaHPa(7)\let\rHP\cachedata\ifemptydata\relax\else\IfNVOETF{\rHP}{}{\num{\rHP}\%}\fi&%
				\checkaHPa(8)\let\rHP\cachedata\ifemptydata\relax\else\IfNVOETF{\rHP}{}{\num{\rHP} \euro}\fi&%
				\IfNVOETF{\aHP}{}{\num{\aHP} \euro}\expandafter\\\fi%
				\ifdefined\aHQa\rCa{\aHQa}&%
				\checkaHQa(4)\let\rHQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHQ}{}{\num{\rHQ}\ts{}\aHQa(5)}\fi&%
				\checkaHQa(6)\let\rHQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHQ}{}{\num{\rHQ}}\fi&%
				\checkaHQa(7)\let\rHQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHQ}{}{\num{\rHQ}\%}\fi&%
				\checkaHQa(8)\let\rHQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHQ}{}{\num{\rHQ} \euro}\fi&%
				\IfNVOETF{\aHQ}{}{\num{\aHQ} \euro}\expandafter\\\fi%
				\ifdefined\aHRa\rCa{\aHRa}&%
				\checkaHRa(4)\let\rHR\cachedata\ifemptydata\relax\else\IfNVOETF{\rHR}{}{\num{\rHR}\ts{}\aHRa(5)}\fi&%
				\checkaHRa(6)\let\rHR\cachedata\ifemptydata\relax\else\IfNVOETF{\rHR}{}{\num{\rHR}}\fi&%
				\checkaHRa(7)\let\rHR\cachedata\ifemptydata\relax\else\IfNVOETF{\rHR}{}{\num{\rHR}\%}\fi&%
				\checkaHRa(8)\let\rHR\cachedata\ifemptydata\relax\else\IfNVOETF{\rHR}{}{\num{\rHR} \euro}\fi&%
				\IfNVOETF{\aHR}{}{\num{\aHR} \euro}\expandafter\\\fi%
				\ifdefined\aHSa\rCa{\aHSa}&%
				\checkaHSa(4)\let\rHS\cachedata\ifemptydata\relax\else\IfNVOETF{\rHS}{}{\num{\rHS}\ts{}\aHSa(5)}\fi&%
				\checkaHSa(6)\let\rHS\cachedata\ifemptydata\relax\else\IfNVOETF{\rHS}{}{\num{\rHS}}\fi&%
				\checkaHSa(7)\let\rHS\cachedata\ifemptydata\relax\else\IfNVOETF{\rHS}{}{\num{\rHS}\%}\fi&%
				\checkaHSa(8)\let\rHS\cachedata\ifemptydata\relax\else\IfNVOETF{\rHS}{}{\num{\rHS} \euro}\fi&%
				\IfNVOETF{\aHS}{}{\num{\aHS} \euro}\expandafter\\\fi%
				\ifdefined\aHTa\rCa{\aHTa}&%
				\checkaHTa(4)\let\rHT\cachedata\ifemptydata\relax\else\IfNVOETF{\rHT}{}{\num{\rHT}\ts{}\aHTa(5)}\fi&%
				\checkaHTa(6)\let\rHT\cachedata\ifemptydata\relax\else\IfNVOETF{\rHT}{}{\num{\rHT}}\fi&%
				\checkaHTa(7)\let\rHT\cachedata\ifemptydata\relax\else\IfNVOETF{\rHT}{}{\num{\rHT}\%}\fi&%
				\checkaHTa(8)\let\rHT\cachedata\ifemptydata\relax\else\IfNVOETF{\rHT}{}{\num{\rHT} \euro}\fi&%
				\IfNVOETF{\aHT}{}{\num{\aHT} \euro}\expandafter\\\fi%
				\ifdefined\aHUa\rCa{\aHUa}&%
				\checkaHUa(4)\let\rHU\cachedata\ifemptydata\relax\else\IfNVOETF{\rHU}{}{\num{\rHU}\ts{}\aHUa(5)}\fi&%
				\checkaHUa(6)\let\rHU\cachedata\ifemptydata\relax\else\IfNVOETF{\rHU}{}{\num{\rHU}}\fi&%
				\checkaHUa(7)\let\rHU\cachedata\ifemptydata\relax\else\IfNVOETF{\rHU}{}{\num{\rHU}\%}\fi&%
				\checkaHUa(8)\let\rHU\cachedata\ifemptydata\relax\else\IfNVOETF{\rHU}{}{\num{\rHU} \euro}\fi&%
				\IfNVOETF{\aHU}{}{\num{\aHU} \euro}\expandafter\\\fi%
				\ifdefined\aHVa\rCa{\aHVa}&%
				\checkaHVa(4)\let\rHV\cachedata\ifemptydata\relax\else\IfNVOETF{\rHV}{}{\num{\rHV}\ts{}\aHVa(5)}\fi&%
				\checkaHVa(6)\let\rHV\cachedata\ifemptydata\relax\else\IfNVOETF{\rHV}{}{\num{\rHV}}\fi&%
				\checkaHVa(7)\let\rHV\cachedata\ifemptydata\relax\else\IfNVOETF{\rHV}{}{\num{\rHV}\%}\fi&%
				\checkaHVa(8)\let\rHV\cachedata\ifemptydata\relax\else\IfNVOETF{\rHV}{}{\num{\rHV} \euro}\fi&%
				\IfNVOETF{\aHV}{}{\num{\aHV} \euro}\expandafter\\\fi%
				\ifdefined\aHWa\rCa{\aHWa}&%
				\checkaHWa(4)\let\rHW\cachedata\ifemptydata\relax\else\IfNVOETF{\rHW}{}{\num{\rHW}\ts{}\aHWa(5)}\fi&%
				\checkaHWa(6)\let\rHW\cachedata\ifemptydata\relax\else\IfNVOETF{\rHW}{}{\num{\rHW}}\fi&%
				\checkaHWa(7)\let\rHW\cachedata\ifemptydata\relax\else\IfNVOETF{\rHW}{}{\num{\rHW}\%}\fi&%
				\checkaHWa(8)\let\rHW\cachedata\ifemptydata\relax\else\IfNVOETF{\rHW}{}{\num{\rHW} \euro}\fi&%
				\IfNVOETF{\aHW}{}{\num{\aHW} \euro}\expandafter\\\fi%
				\ifdefined\aHXa\rCa{\aHXa}&%
				\checkaHXa(4)\let\rHX\cachedata\ifemptydata\relax\else\IfNVOETF{\rHX}{}{\num{\rHX}\ts{}\aHXa(5)}\fi&%
				\checkaHXa(6)\let\rHX\cachedata\ifemptydata\relax\else\IfNVOETF{\rHX}{}{\num{\rHX}}\fi&%
				\checkaHXa(7)\let\rHX\cachedata\ifemptydata\relax\else\IfNVOETF{\rHX}{}{\num{\rHX}\%}\fi&%
				\checkaHXa(8)\let\rHX\cachedata\ifemptydata\relax\else\IfNVOETF{\rHX}{}{\num{\rHX} \euro}\fi&%
				\IfNVOETF{\aHX}{}{\num{\aHX} \euro}\expandafter\\\fi%
				\ifdefined\aHYa\rCa{\aHYa}&%
				\checkaHYa(4)\let\rHY\cachedata\ifemptydata\relax\else\IfNVOETF{\rHY}{}{\num{\rHY}\ts{}\aHYa(5)}\fi&%
				\checkaHYa(6)\let\rHY\cachedata\ifemptydata\relax\else\IfNVOETF{\rHY}{}{\num{\rHY}}\fi&%
				\checkaHYa(7)\let\rHY\cachedata\ifemptydata\relax\else\IfNVOETF{\rHY}{}{\num{\rHY}\%}\fi&%
				\checkaHYa(8)\let\rHY\cachedata\ifemptydata\relax\else\IfNVOETF{\rHY}{}{\num{\rHY} \euro}\fi&%
				\IfNVOETF{\aHY}{}{\num{\aHY} \euro}\expandafter\\\fi%	
				\ifdefined\aHZa\rCa{\aHZa}&%
				\checkaHZa(4)\let\rHZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHZ}{}{\num{\rHZ}\ts{}\aHZa(5)}\fi&%
				\checkaHZa(6)\let\rHZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHZ}{}{\num{\rHZ}}\fi&%
				\checkaHZa(7)\let\rHZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHZ}{}{\num{\rHZ}\%}\fi&%
				\checkaHZa(8)\let\rHZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rHZ}{}{\num{\rHZ} \euro}\fi&%
				\IfNVOETF{\aHZ}{}{\num{\aHZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aH} \euro    \\%
			\end{tabularx} %
			\fi%		
		\end{center}%
%		\newpage%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aIAa%
			\captionof{table}{\large{\textsc{\aICaption}}}\label{tbl:asset:I}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aIAa\rCa{\aIAa}&%
				\checkaIAa(4)\let\rIA\cachedata\ifemptydata\relax\else\IfNVOETF{\rIA}{}{\num{\rIA}\ts{}\aIAa(5)}\fi&%
				\checkaIAa(6)\let\rIA\cachedata\ifemptydata\relax\else\IfNVOETF{\rIA}{}{\num{\rIA}}\fi&%
				\checkaIAa(7)\let\rIA\cachedata\ifemptydata\relax\else\IfNVOETF{\rIA}{}{\num{\rIA}\%}\fi&%
				\checkaIAa(8)\let\rIA\cachedata\ifemptydata\relax\else\IfNVOETF{\rIA}{}{\num{\rIA} \euro}\fi&%
				\IfNVOETF{\aIA}{}{\num{\aIA} \euro}\expandafter\\\fi%
				\ifdefined\aIBa\rCa{\aIBa}&%
				\checkaIBa(4)\let\rIB\cachedata\ifemptydata\relax\else\IfNVOETF{\rIB}{}{\num{\rIB}\ts{}\aIBa(5)}\fi&%
				\checkaIBa(6)\let\rIB\cachedata\ifemptydata\relax\else\IfNVOETF{\rIB}{}{\num{\rIB}}\fi&%
				\checkaIBa(7)\let\rIB\cachedata\ifemptydata\relax\else\IfNVOETF{\rIB}{}{\num{\rIB}\%}\fi&%
				\checkaIBa(8)\let\rIB\cachedata\ifemptydata\relax\else\IfNVOETF{\rIB}{}{\num{\rIB} \euro}\fi&%
				\IfNVOETF{\aIB}{}{\num{\aIB} \euro}\expandafter\\\fi%
				\ifdefined\aICa\rCa{\aICa}&%
				\checkaICa(4)\let\rIC\cachedata\ifemptydata\relax\else\IfNVOETF{\rIC}{}{\num{\rIC}\ts{}\aICa(5)}\fi&%
				\checkaICa(6)\let\rIC\cachedata\ifemptydata\relax\else\IfNVOETF{\rIC}{}{\num{\rIC}}\fi&%
				\checkaICa(7)\let\rIC\cachedata\ifemptydata\relax\else\IfNVOETF{\rIC}{}{\num{\rIC}\%}\fi&%
				\checkaICa(8)\let\rIC\cachedata\ifemptydata\relax\else\IfNVOETF{\rIC}{}{\num{\rIC} \euro}\fi&%
				\IfNVOETF{\aIC}{}{\num{\aIC} \euro}\expandafter\\\fi%
				\ifdefined\aIDa\rCa{\aIDa}&%
				\checkaIDa(4)\let\rID\cachedata\ifemptydata\relax\else\IfNVOETF{\rID}{}{\num{\rID}\ts{}\aIDa(5)}\fi&%
				\checkaIDa(6)\let\rID\cachedata\ifemptydata\relax\else\IfNVOETF{\rID}{}{\num{\rID}}\fi&%
				\checkaIDa(7)\let\rID\cachedata\ifemptydata\relax\else\IfNVOETF{\rID}{}{\num{\rID}\%}\fi&%
				\checkaIDa(8)\let\rID\cachedata\ifemptydata\relax\else\IfNVOETF{\rID}{}{\num{\rID} \euro}\fi&%
				\IfNVOETF{\aID}{}{\num{\aID} \euro}\expandafter\\\fi%
				\ifdefined\aIEa\rCa{\aIEa}&%
				\checkaIEa(4)\let\rIE\cachedata\ifemptydata\relax\else\IfNVOETF{\rIE}{}{\num{\rIE}\ts{}\aIEa(5)}\fi&%
				\checkaIEa(6)\let\rIE\cachedata\ifemptydata\relax\else\IfNVOETF{\rIE}{}{\num{\rIE}}\fi&%
				\checkaIEa(7)\let\rIE\cachedata\ifemptydata\relax\else\IfNVOETF{\rIE}{}{\num{\rIE}\%}\fi&%
				\checkaIEa(8)\let\rIE\cachedata\ifemptydata\relax\else\IfNVOETF{\rIE}{}{\num{\rIE} \euro}\fi&%
				\IfNVOETF{\aIE}{}{\num{\aIE} \euro}\expandafter\\\fi%
				\ifdefined\aIFa\rCa{\aIFa}&%
				\checkaIFa(4)\let\rIF\cachedata\ifemptydata\relax\else\IfNVOETF{\rIF}{}{\num{\rIF}\ts{}\aIFa(5)}\fi&%
				\checkaIFa(6)\let\rIF\cachedata\ifemptydata\relax\else\IfNVOETF{\rIF}{}{\num{\rIF}}\fi&%
				\checkaIFa(7)\let\rIF\cachedata\ifemptydata\relax\else\IfNVOETF{\rIF}{}{\num{\rIF}\%}\fi&%
				\checkaIFa(8)\let\rIF\cachedata\ifemptydata\relax\else\IfNVOETF{\rIF}{}{\num{\rIF} \euro}\fi&%
				\IfNVOETF{\aIF}{}{\num{\aIF} \euro}\expandafter\\\fi%
				\ifdefined\aIGa\rCa{\aIGa}&%
				\checkaIGa(4)\let\rIG\cachedata\ifemptydata\relax\else\IfNVOETF{\rIG}{}{\num{\rIG}\ts{}\aIGa(5)}\fi&%
				\checkaIGa(6)\let\rIG\cachedata\ifemptydata\relax\else\IfNVOETF{\rIG}{}{\num{\rIG}}\fi&%
				\checkaIGa(7)\let\rIG\cachedata\ifemptydata\relax\else\IfNVOETF{\rIG}{}{\num{\rIG}\%}\fi&%
				\checkaIGa(8)\let\rIG\cachedata\ifemptydata\relax\else\IfNVOETF{\rIG}{}{\num{\rIG} \euro}\fi&%
				\IfNVOETF{\aIG}{}{\num{\aIG} \euro}\expandafter\\\fi%
				\ifdefined\aIIa\rCa{\aIIa}&%
				\checkaIIa(4)\let\rII\cachedata\ifemptydata\relax\else\IfNVOETF{\rII}{}{\num{\rII}\ts{}\aIIa(5)}\fi&%
				\checkaIIa(6)\let\rII\cachedata\ifemptydata\relax\else\IfNVOETF{\rII}{}{\num{\rII}}\fi&%
				\checkaIIa(7)\let\rII\cachedata\ifemptydata\relax\else\IfNVOETF{\rII}{}{\num{\rII}\%}\fi&%
				\checkaIIa(8)\let\rII\cachedata\ifemptydata\relax\else\IfNVOETF{\rII}{}{\num{\rII} \euro}\fi&%
				\IfNVOETF{\aII}{}{\num{\aII} \euro}\expandafter\\\fi%
				\ifdefined\aIJa\rCa{\aIJa}&%
				\checkaIJa(4)\let\rIJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIJ}{}{\num{\rIJ}\ts{}\aIJa(5)}\fi&%
				\checkaIJa(6)\let\rIJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIJ}{}{\num{\rIJ}}\fi&%
				\checkaIJa(7)\let\rIJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIJ}{}{\num{\rIJ}\%}\fi&%
				\checkaIJa(8)\let\rIJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIJ}{}{\num{\rIJ} \euro}\fi&%
				\IfNVOETF{\aIJ}{}{\num{\aIJ} \euro}\expandafter\\\fi%
				\ifdefined\aIKa\rCa{\aIKa}&%
				\checkaIKa(4)\let\rIK\cachedata\ifemptydata\relax\else\IfNVOETF{\rIK}{}{\num{\rIK}\ts{}\aIKa(5)}\fi&%
				\checkaIKa(6)\let\rIK\cachedata\ifemptydata\relax\else\IfNVOETF{\rIK}{}{\num{\rIK}}\fi&%
				\checkaIKa(7)\let\rIK\cachedata\ifemptydata\relax\else\IfNVOETF{\rIK}{}{\num{\rIK}\%}\fi&%
				\checkaIKa(8)\let\rIK\cachedata\ifemptydata\relax\else\IfNVOETF{\rIK}{}{\num{\rIK} \euro}\fi&%
				\IfNVOETF{\aIK}{}{\num{\aIK} \euro}\expandafter\\\fi%
				\ifdefined\aILa\rCa{\aILa}&%
				\checkaILa(4)\let\rIL\cachedata\ifemptydata\relax\else\IfNVOETF{\rIL}{}{\num{\rIL}\ts{}\aILa(5)}\fi&%
				\checkaILa(6)\let\rIL\cachedata\ifemptydata\relax\else\IfNVOETF{\rIL}{}{\num{\rIL}}\fi&%
				\checkaILa(7)\let\rIL\cachedata\ifemptydata\relax\else\IfNVOETF{\rIL}{}{\num{\rIL}\%}\fi&%
				\checkaILa(8)\let\rIL\cachedata\ifemptydata\relax\else\IfNVOETF{\rIL}{}{\num{\rIL} \euro}\fi&%
				\IfNVOETF{\aIL}{}{\num{\aIL} \euro}\expandafter\\\fi%
				\ifdefined\aIMa\rCa{\aIMa}&%
				\checkaIMa(4)\let\rIM\cachedata\ifemptydata\relax\else\IfNVOETF{\rIM}{}{\num{\rIM}\ts{}\aIMa(5)}\fi&%
				\checkaIMa(6)\let\rIM\cachedata\ifemptydata\relax\else\IfNVOETF{\rIM}{}{\num{\rIM}}\fi&%
				\checkaIMa(7)\let\rIM\cachedata\ifemptydata\relax\else\IfNVOETF{\rIM}{}{\num{\rIM}\%}\fi&%
				\checkaIMa(8)\let\rIM\cachedata\ifemptydata\relax\else\IfNVOETF{\rIM}{}{\num{\rIM} \euro}\fi&%
				\IfNVOETF{\aIM}{}{\num{\aIM} \euro}\expandafter\\\fi%
				\ifdefined\aINa\rCa{\aINa}&%
				\checkaINa(4)\let\rIN\cachedata\ifemptydata\relax\else\IfNVOETF{\rIN}{}{\num{\rIN}\ts{}\aINa(5)}\fi&%
				\checkaINa(6)\let\rIN\cachedata\ifemptydata\relax\else\IfNVOETF{\rIN}{}{\num{\rIN}}\fi&%
				\checkaINa(7)\let\rIN\cachedata\ifemptydata\relax\else\IfNVOETF{\rIN}{}{\num{\rIN}\%}\fi&%
				\checkaINa(8)\let\rIN\cachedata\ifemptydata\relax\else\IfNVOETF{\rIN}{}{\num{\rIN} \euro}\fi&%
				\IfNVOETF{\aIN}{}{\num{\aIN} \euro}\expandafter\\\fi%
				\ifdefined\aIOa\rCa{\aIOa}&%
				\checkaIOa(4)\let\rIO\cachedata\ifemptydata\relax\else\IfNVOETF{\rIO}{}{\num{\rIO}\ts{}\aIOa(5)}\fi&%
				\checkaIOa(6)\let\rIO\cachedata\ifemptydata\relax\else\IfNVOETF{\rIO}{}{\num{\rIO}}\fi&%
				\checkaIOa(7)\let\rIO\cachedata\ifemptydata\relax\else\IfNVOETF{\rIO}{}{\num{\rIO}\%}\fi&%
				\checkaIOa(8)\let\rIO\cachedata\ifemptydata\relax\else\IfNVOETF{\rIO}{}{\num{\rIO} \euro}\fi&%
				\IfNVOETF{\aIO}{}{\num{\aIO} \euro}\expandafter\\\fi%
				\ifdefined\aIPa\rCa{\aIPa}&%
				\checkaIPa(4)\let\rIP\cachedata\ifemptydata\relax\else\IfNVOETF{\rIP}{}{\num{\rIP}\ts{}\aIPa(5)}\fi&%
				\checkaIPa(6)\let\rIP\cachedata\ifemptydata\relax\else\IfNVOETF{\rIP}{}{\num{\rIP}}\fi&%
				\checkaIPa(7)\let\rIP\cachedata\ifemptydata\relax\else\IfNVOETF{\rIP}{}{\num{\rIP}\%}\fi&%
				\checkaIPa(8)\let\rIP\cachedata\ifemptydata\relax\else\IfNVOETF{\rIP}{}{\num{\rIP} \euro}\fi&%
				\IfNVOETF{\aIP}{}{\num{\aIP} \euro}\expandafter\\\fi%
				\ifdefined\aIQa\rCa{\aIQa}&%
				\checkaIQa(4)\let\rIQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIQ}{}{\num{\rIQ}\ts{}\aIQa(5)}\fi&%
				\checkaIQa(6)\let\rIQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIQ}{}{\num{\rIQ}}\fi&%
				\checkaIQa(7)\let\rIQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIQ}{}{\num{\rIQ}\%}\fi&%
				\checkaIQa(8)\let\rIQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIQ}{}{\num{\rIQ} \euro}\fi&%
				\IfNVOETF{\aIQ}{}{\num{\aIQ} \euro}\expandafter\\\fi%
				\ifdefined\aIRa\rCa{\aIRa}&%
				\checkaIRa(4)\let\rIR\cachedata\ifemptydata\relax\else\IfNVOETF{\rIR}{}{\num{\rIR}\ts{}\aIRa(5)}\fi&%
				\checkaIRa(6)\let\rIR\cachedata\ifemptydata\relax\else\IfNVOETF{\rIR}{}{\num{\rIR}}\fi&%
				\checkaIRa(7)\let\rIR\cachedata\ifemptydata\relax\else\IfNVOETF{\rIR}{}{\num{\rIR}\%}\fi&%
				\checkaIRa(8)\let\rIR\cachedata\ifemptydata\relax\else\IfNVOETF{\rIR}{}{\num{\rIR} \euro}\fi&%
				\IfNVOETF{\aIR}{}{\num{\aIR} \euro}\expandafter\\\fi%
				\ifdefined\aISa\rCa{\aISa}&%
				\checkaISa(4)\let\rIS\cachedata\ifemptydata\relax\else\IfNVOETF{\rIS}{}{\num{\rIS}\ts{}\aISa(5)}\fi&%
				\checkaISa(6)\let\rIS\cachedata\ifemptydata\relax\else\IfNVOETF{\rIS}{}{\num{\rIS}}\fi&%
				\checkaISa(7)\let\rIS\cachedata\ifemptydata\relax\else\IfNVOETF{\rIS}{}{\num{\rIS}\%}\fi&%
				\checkaISa(8)\let\rIS\cachedata\ifemptydata\relax\else\IfNVOETF{\rIS}{}{\num{\rIS} \euro}\fi&%
				\IfNVOETF{\aIS}{}{\num{\aIS} \euro}\expandafter\\\fi%
				\ifdefined\aITa\rCa{\aITa}&%
				\checkaITa(4)\let\rIT\cachedata\ifemptydata\relax\else\IfNVOETF{\rIT}{}{\num{\rIT}\ts{}\aITa(5)}\fi&%
				\checkaITa(6)\let\rIT\cachedata\ifemptydata\relax\else\IfNVOETF{\rIT}{}{\num{\rIT}}\fi&%
				\checkaITa(7)\let\rIT\cachedata\ifemptydata\relax\else\IfNVOETF{\rIT}{}{\num{\rIT}\%}\fi&%
				\checkaITa(8)\let\rIT\cachedata\ifemptydata\relax\else\IfNVOETF{\rIT}{}{\num{\rIT} \euro}\fi&%
				\IfNVOETF{\aIT}{}{\num{\aIT} \euro}\expandafter\\\fi%
				\ifdefined\aIUa\rCa{\aIUa}&%
				\checkaIUa(4)\let\rIU\cachedata\ifemptydata\relax\else\IfNVOETF{\rIU}{}{\num{\rIU}\ts{}\aIUa(5)}\fi&%
				\checkaIUa(6)\let\rIU\cachedata\ifemptydata\relax\else\IfNVOETF{\rIU}{}{\num{\rIU}}\fi&%
				\checkaIUa(7)\let\rIU\cachedata\ifemptydata\relax\else\IfNVOETF{\rIU}{}{\num{\rIU}\%}\fi&%
				\checkaIUa(8)\let\rIU\cachedata\ifemptydata\relax\else\IfNVOETF{\rIU}{}{\num{\rIU} \euro}\fi&%
				\IfNVOETF{\aIU}{}{\num{\aIU} \euro}\expandafter\\\fi%
				\ifdefined\aIVa\rCa{\aIVa}&%
				\checkaIVa(4)\let\rIV\cachedata\ifemptydata\relax\else\IfNVOETF{\rIV}{}{\num{\rIV}\ts{}\aIVa(5)}\fi&%
				\checkaIVa(6)\let\rIV\cachedata\ifemptydata\relax\else\IfNVOETF{\rIV}{}{\num{\rIV}}\fi&%
				\checkaIVa(7)\let\rIV\cachedata\ifemptydata\relax\else\IfNVOETF{\rIV}{}{\num{\rIV}\%}\fi&%
				\checkaIVa(8)\let\rIV\cachedata\ifemptydata\relax\else\IfNVOETF{\rIV}{}{\num{\rIV} \euro}\fi&%
				\IfNVOETF{\aIV}{}{\num{\aIV} \euro}\expandafter\\\fi%
				\ifdefined\aIWa\rCa{\aIWa}&%
				\checkaIWa(4)\let\rIW\cachedata\ifemptydata\relax\else\IfNVOETF{\rIW}{}{\num{\rIW}\ts{}\aIWa(5)}\fi&%
				\checkaIWa(6)\let\rIW\cachedata\ifemptydata\relax\else\IfNVOETF{\rIW}{}{\num{\rIW}}\fi&%
				\checkaIWa(7)\let\rIW\cachedata\ifemptydata\relax\else\IfNVOETF{\rIW}{}{\num{\rIW}\%}\fi&%
				\checkaIWa(8)\let\rIW\cachedata\ifemptydata\relax\else\IfNVOETF{\rIW}{}{\num{\rIW} \euro}\fi&%
				\IfNVOETF{\aIW}{}{\num{\aIW} \euro}\expandafter\\\fi%
				\ifdefined\aIXa\rCa{\aIXa}&%
				\checkaIXa(4)\let\rIX\cachedata\ifemptydata\relax\else\IfNVOETF{\rIX}{}{\num{\rIX}\ts{}\aIXa(5)}\fi&%
				\checkaIXa(6)\let\rIX\cachedata\ifemptydata\relax\else\IfNVOETF{\rIX}{}{\num{\rIX}}\fi&%
				\checkaIXa(7)\let\rIX\cachedata\ifemptydata\relax\else\IfNVOETF{\rIX}{}{\num{\rIX}\%}\fi&%
				\checkaIXa(8)\let\rIX\cachedata\ifemptydata\relax\else\IfNVOETF{\rIX}{}{\num{\rIX} \euro}\fi&%
				\IfNVOETF{\aIX}{}{\num{\aIX} \euro}\expandafter\\\fi%
				\ifdefined\aIYa\rCa{\aIYa}&%
				\checkaIYa(4)\let\rIY\cachedata\ifemptydata\relax\else\IfNVOETF{\rIY}{}{\num{\rIY}\ts{}\aIYa(5)}\fi&%
				\checkaIYa(6)\let\rIY\cachedata\ifemptydata\relax\else\IfNVOETF{\rIY}{}{\num{\rIY}}\fi&%
				\checkaIYa(7)\let\rIY\cachedata\ifemptydata\relax\else\IfNVOETF{\rIY}{}{\num{\rIY}\%}\fi&%
				\checkaIYa(8)\let\rIY\cachedata\ifemptydata\relax\else\IfNVOETF{\rIY}{}{\num{\rIY} \euro}\fi&%
				\IfNVOETF{\aIY}{}{\num{\aIY} \euro}\expandafter\\\fi%	
				\ifdefined\aIZa\rCa{\aIZa}&%
				\checkaIZa(4)\let\rIZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIZ}{}{\num{\rIZ}\ts{}\aIZa(5)}\fi&%
				\checkaIZa(6)\let\rIZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIZ}{}{\num{\rIZ}}\fi&%
				\checkaIZa(7)\let\rIZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIZ}{}{\num{\rIZ}\%}\fi&%
				\checkaIZa(8)\let\rIZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rIZ}{}{\num{\rIZ} \euro}\fi&%
				\IfNVOETF{\aIZ}{}{\num{\aIZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aI} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aJAa%
			\captionof{table}{\large{\textsc{\aJCaption}}}\label{tbl:asset:J}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aJAa\rCa{\aJAa}&%
				\checkaJAa(4)\let\rJA\cachedata\ifemptydata\relax\else\IfNVOETF{\rJA}{}{\num{\rJA}\ts{}\aJAa(5)}\fi&%
				\checkaJAa(6)\let\rJA\cachedata\ifemptydata\relax\else\IfNVOETF{\rJA}{}{\num{\rJA}}\fi&%
				\checkaJAa(7)\let\rJA\cachedata\ifemptydata\relax\else\IfNVOETF{\rJA}{}{\num{\rJA}\%}\fi&%
				\checkaJAa(8)\let\rJA\cachedata\ifemptydata\relax\else\IfNVOETF{\rJA}{}{\num{\rJA} \euro}\fi&%
				\IfNVOETF{\aJA}{}{\num{\aJA} \euro}\expandafter\\\fi%
				\ifdefined\aJBa\rCa{\aJBa}&%
				\checkaJBa(4)\let\rJB\cachedata\ifemptydata\relax\else\IfNVOETF{\rJB}{}{\num{\rJB}\ts{}\aJBa(5)}\fi&%
				\checkaJBa(6)\let\rJB\cachedata\ifemptydata\relax\else\IfNVOETF{\rJB}{}{\num{\rJB}}\fi&%
				\checkaJBa(7)\let\rJB\cachedata\ifemptydata\relax\else\IfNVOETF{\rJB}{}{\num{\rJB}\%}\fi&%
				\checkaJBa(8)\let\rJB\cachedata\ifemptydata\relax\else\IfNVOETF{\rJB}{}{\num{\rJB} \euro}\fi&%
				\IfNVOETF{\aJB}{}{\num{\aJB} \euro}\expandafter\\\fi%
				\ifdefined\aJCa\rCa{\aJCa}&%
				\checkaJCa(4)\let\rJC\cachedata\ifemptydata\relax\else\IfNVOETF{\rJC}{}{\num{\rJC}\ts{}\aJCa(5)}\fi&%
				\checkaJCa(6)\let\rJC\cachedata\ifemptydata\relax\else\IfNVOETF{\rJC}{}{\num{\rJC}}\fi&%
				\checkaJCa(7)\let\rJC\cachedata\ifemptydata\relax\else\IfNVOETF{\rJC}{}{\num{\rJC}\%}\fi&%
				\checkaJCa(8)\let\rJC\cachedata\ifemptydata\relax\else\IfNVOETF{\rJC}{}{\num{\rJC} \euro}\fi&%
				\IfNVOETF{\aJC}{}{\num{\aJC} \euro}\expandafter\\\fi%
				\ifdefined\aJDa\rCa{\aJDa}&%
				\checkaJDa(4)\let\rJD\cachedata\ifemptydata\relax\else\IfNVOETF{\rJD}{}{\num{\rJD}\ts{}\aJDa(5)}\fi&%
				\checkaJDa(6)\let\rJD\cachedata\ifemptydata\relax\else\IfNVOETF{\rJD}{}{\num{\rJD}}\fi&%
				\checkaJDa(7)\let\rJD\cachedata\ifemptydata\relax\else\IfNVOETF{\rJD}{}{\num{\rJD}\%}\fi&%
				\checkaJDa(8)\let\rJD\cachedata\ifemptydata\relax\else\IfNVOETF{\rJD}{}{\num{\rJD} \euro}\fi&%
				\IfNVOETF{\aJD}{}{\num{\aJD} \euro}\expandafter\\\fi%
				\ifdefined\aJEa\rCa{\aJEa}&%
				\checkaJEa(4)\let\rJE\cachedata\ifemptydata\relax\else\IfNVOETF{\rJE}{}{\num{\rJE}\ts{}\aJEa(5)}\fi&%
				\checkaJEa(6)\let\rJE\cachedata\ifemptydata\relax\else\IfNVOETF{\rJE}{}{\num{\rJE}}\fi&%
				\checkaJEa(7)\let\rJE\cachedata\ifemptydata\relax\else\IfNVOETF{\rJE}{}{\num{\rJE}\%}\fi&%
				\checkaJEa(8)\let\rJE\cachedata\ifemptydata\relax\else\IfNVOETF{\rJE}{}{\num{\rJE} \euro}\fi&%
				\IfNVOETF{\aJE}{}{\num{\aJE} \euro}\expandafter\\\fi%
				\ifdefined\aJFa\rCa{\aJFa}&%
				\checkaJFa(4)\let\rJF\cachedata\ifemptydata\relax\else\IfNVOETF{\rJF}{}{\num{\rJF}\ts{}\aJFa(5)}\fi&%
				\checkaJFa(6)\let\rJF\cachedata\ifemptydata\relax\else\IfNVOETF{\rJF}{}{\num{\rJF}}\fi&%
				\checkaJFa(7)\let\rJF\cachedata\ifemptydata\relax\else\IfNVOETF{\rJF}{}{\num{\rJF}\%}\fi&%
				\checkaJFa(8)\let\rJF\cachedata\ifemptydata\relax\else\IfNVOETF{\rJF}{}{\num{\rJF} \euro}\fi&%
				\IfNVOETF{\aJF}{}{\num{\aJF} \euro}\expandafter\\\fi%
				\ifdefined\aJGa\rCa{\aJGa}&%
				\checkaJGa(4)\let\rJG\cachedata\ifemptydata\relax\else\IfNVOETF{\rJG}{}{\num{\rJG}\ts{}\aJGa(5)}\fi&%
				\checkaJGa(6)\let\rJG\cachedata\ifemptydata\relax\else\IfNVOETF{\rJG}{}{\num{\rJG}}\fi&%
				\checkaJGa(7)\let\rJG\cachedata\ifemptydata\relax\else\IfNVOETF{\rJG}{}{\num{\rJG}\%}\fi&%
				\checkaJGa(8)\let\rJG\cachedata\ifemptydata\relax\else\IfNVOETF{\rJG}{}{\num{\rJG} \euro}\fi&%
				\IfNVOETF{\aJG}{}{\num{\aJG} \euro}\expandafter\\\fi%
				\ifdefined\aJIa\rCa{\aJIa}&%
				\checkaJIa(4)\let\rJI\cachedata\ifemptydata\relax\else\IfNVOETF{\rJI}{}{\num{\rJI}\ts{}\aJIa(5)}\fi&%
				\checkaJIa(6)\let\rJI\cachedata\ifemptydata\relax\else\IfNVOETF{\rJI}{}{\num{\rJI}}\fi&%
				\checkaJIa(7)\let\rJI\cachedata\ifemptydata\relax\else\IfNVOETF{\rJI}{}{\num{\rJI}\%}\fi&%
				\checkaJIa(8)\let\rJI\cachedata\ifemptydata\relax\else\IfNVOETF{\rJI}{}{\num{\rJI} \euro}\fi&%
				\IfNVOETF{\aJI}{}{\num{\aJI} \euro}\expandafter\\\fi%
				\ifdefined\aJJa\rCa{\aJJa}&%
				\checkaJJa(4)\let\rJJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJJ}{}{\num{\rJJ}\ts{}\aJJa(5)}\fi&%
				\checkaJJa(6)\let\rJJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJJ}{}{\num{\rJJ}}\fi&%
				\checkaJJa(7)\let\rJJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJJ}{}{\num{\rJJ}\%}\fi&%
				\checkaJJa(8)\let\rJJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJJ}{}{\num{\rJJ} \euro}\fi&%
				\IfNVOETF{\aJJ}{}{\num{\aJJ} \euro}\expandafter\\\fi%
				\ifdefined\aJKa\rCa{\aJKa}&%
				\checkaJKa(4)\let\rJK\cachedata\ifemptydata\relax\else\IfNVOETF{\rJK}{}{\num{\rJK}\ts{}\aJKa(5)}\fi&%
				\checkaJKa(6)\let\rJK\cachedata\ifemptydata\relax\else\IfNVOETF{\rJK}{}{\num{\rJK}}\fi&%
				\checkaJKa(7)\let\rJK\cachedata\ifemptydata\relax\else\IfNVOETF{\rJK}{}{\num{\rJK}\%}\fi&%
				\checkaJKa(8)\let\rJK\cachedata\ifemptydata\relax\else\IfNVOETF{\rJK}{}{\num{\rJK} \euro}\fi&%
				\IfNVOETF{\aJK}{}{\num{\aJK} \euro}\expandafter\\\fi%
				\ifdefined\aJLa\rCa{\aJLa}&%
				\checkaJLa(4)\let\rJL\cachedata\ifemptydata\relax\else\IfNVOETF{\rJL}{}{\num{\rJL}\ts{}\aJLa(5)}\fi&%
				\checkaJLa(6)\let\rJL\cachedata\ifemptydata\relax\else\IfNVOETF{\rJL}{}{\num{\rJL}}\fi&%
				\checkaJLa(7)\let\rJL\cachedata\ifemptydata\relax\else\IfNVOETF{\rJL}{}{\num{\rJL}\%}\fi&%
				\checkaJLa(8)\let\rJL\cachedata\ifemptydata\relax\else\IfNVOETF{\rJL}{}{\num{\rJL} \euro}\fi&%
				\IfNVOETF{\aJL}{}{\num{\aJL} \euro}\expandafter\\\fi%
				\ifdefined\aJMa\rCa{\aJMa}&%
				\checkaJMa(4)\let\rJM\cachedata\ifemptydata\relax\else\IfNVOETF{\rJM}{}{\num{\rJM}\ts{}\aJMa(5)}\fi&%
				\checkaJMa(6)\let\rJM\cachedata\ifemptydata\relax\else\IfNVOETF{\rJM}{}{\num{\rJM}}\fi&%
				\checkaJMa(7)\let\rJM\cachedata\ifemptydata\relax\else\IfNVOETF{\rJM}{}{\num{\rJM}\%}\fi&%
				\checkaJMa(8)\let\rJM\cachedata\ifemptydata\relax\else\IfNVOETF{\rJM}{}{\num{\rJM} \euro}\fi&%
				\IfNVOETF{\aJM}{}{\num{\aJM} \euro}\expandafter\\\fi%
				\ifdefined\aJNa\rCa{\aJNa}&%
				\checkaJNa(4)\let\rJN\cachedata\ifemptydata\relax\else\IfNVOETF{\rJN}{}{\num{\rJN}\ts{}\aJNa(5)}\fi&%
				\checkaJNa(6)\let\rJN\cachedata\ifemptydata\relax\else\IfNVOETF{\rJN}{}{\num{\rJN}}\fi&%
				\checkaJNa(7)\let\rJN\cachedata\ifemptydata\relax\else\IfNVOETF{\rJN}{}{\num{\rJN}\%}\fi&%
				\checkaJNa(8)\let\rJN\cachedata\ifemptydata\relax\else\IfNVOETF{\rJN}{}{\num{\rJN} \euro}\fi&%
				\IfNVOETF{\aJN}{}{\num{\aJN} \euro}\expandafter\\\fi%
				\ifdefined\aJOa\rCa{\aJOa}&%
				\checkaJOa(4)\let\rJO\cachedata\ifemptydata\relax\else\IfNVOETF{\rJO}{}{\num{\rJO}\ts{}\aJOa(5)}\fi&%
				\checkaJOa(6)\let\rJO\cachedata\ifemptydata\relax\else\IfNVOETF{\rJO}{}{\num{\rJO}}\fi&%
				\checkaJOa(7)\let\rJO\cachedata\ifemptydata\relax\else\IfNVOETF{\rJO}{}{\num{\rJO}\%}\fi&%
				\checkaJOa(8)\let\rJO\cachedata\ifemptydata\relax\else\IfNVOETF{\rJO}{}{\num{\rJO} \euro}\fi&%
				\IfNVOETF{\aJO}{}{\num{\aJO} \euro}\expandafter\\\fi%
				\ifdefined\aJPa\rCa{\aJPa}&%
				\checkaJPa(4)\let\rJP\cachedata\ifemptydata\relax\else\IfNVOETF{\rJP}{}{\num{\rJP}\ts{}\aJPa(5)}\fi&%
				\checkaJPa(6)\let\rJP\cachedata\ifemptydata\relax\else\IfNVOETF{\rJP}{}{\num{\rJP}}\fi&%
				\checkaJPa(7)\let\rJP\cachedata\ifemptydata\relax\else\IfNVOETF{\rJP}{}{\num{\rJP}\%}\fi&%
				\checkaJPa(8)\let\rJP\cachedata\ifemptydata\relax\else\IfNVOETF{\rJP}{}{\num{\rJP} \euro}\fi&%
				\IfNVOETF{\aJP}{}{\num{\aJP} \euro}\expandafter\\\fi%
				\ifdefined\aJQa\rCa{\aJQa}&%
				\checkaJQa(4)\let\rJQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJQ}{}{\num{\rJQ}\ts{}\aJQa(5)}\fi&%
				\checkaJQa(6)\let\rJQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJQ}{}{\num{\rJQ}}\fi&%
				\checkaJQa(7)\let\rJQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJQ}{}{\num{\rJQ}\%}\fi&%
				\checkaJQa(8)\let\rJQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJQ}{}{\num{\rJQ} \euro}\fi&%
				\IfNVOETF{\aJQ}{}{\num{\aJQ} \euro}\expandafter\\\fi%
				\ifdefined\aJRa\rCa{\aJRa}&%
				\checkaJRa(4)\let\rJR\cachedata\ifemptydata\relax\else\IfNVOETF{\rJR}{}{\num{\rJR}\ts{}\aJRa(5)}\fi&%
				\checkaJRa(6)\let\rJR\cachedata\ifemptydata\relax\else\IfNVOETF{\rJR}{}{\num{\rJR}}\fi&%
				\checkaJRa(7)\let\rJR\cachedata\ifemptydata\relax\else\IfNVOETF{\rJR}{}{\num{\rJR}\%}\fi&%
				\checkaJRa(8)\let\rJR\cachedata\ifemptydata\relax\else\IfNVOETF{\rJR}{}{\num{\rJR} \euro}\fi&%
				\IfNVOETF{\aJR}{}{\num{\aJR} \euro}\expandafter\\\fi%
				\ifdefined\aJSa\rCa{\aJSa}&%
				\checkaJSa(4)\let\rJS\cachedata\ifemptydata\relax\else\IfNVOETF{\rJS}{}{\num{\rJS}\ts{}\aJSa(5)}\fi&%
				\checkaJSa(6)\let\rJS\cachedata\ifemptydata\relax\else\IfNVOETF{\rJS}{}{\num{\rJS}}\fi&%
				\checkaJSa(7)\let\rJS\cachedata\ifemptydata\relax\else\IfNVOETF{\rJS}{}{\num{\rJS}\%}\fi&%
				\checkaJSa(8)\let\rJS\cachedata\ifemptydata\relax\else\IfNVOETF{\rJS}{}{\num{\rJS} \euro}\fi&%
				\IfNVOETF{\aJS}{}{\num{\aJS} \euro}\expandafter\\\fi%
				\ifdefined\aJTa\rCa{\aJTa}&%
				\checkaJTa(4)\let\rJT\cachedata\ifemptydata\relax\else\IfNVOETF{\rJT}{}{\num{\rJT}\ts{}\aJTa(5)}\fi&%
				\checkaJTa(6)\let\rJT\cachedata\ifemptydata\relax\else\IfNVOETF{\rJT}{}{\num{\rJT}}\fi&%
				\checkaJTa(7)\let\rJT\cachedata\ifemptydata\relax\else\IfNVOETF{\rJT}{}{\num{\rJT}\%}\fi&%
				\checkaJTa(8)\let\rJT\cachedata\ifemptydata\relax\else\IfNVOETF{\rJT}{}{\num{\rJT} \euro}\fi&%
				\IfNVOETF{\aJT}{}{\num{\aJT} \euro}\expandafter\\\fi%
				\ifdefined\aJUa\rCa{\aJUa}&%
				\checkaJUa(4)\let\rJU\cachedata\ifemptydata\relax\else\IfNVOETF{\rJU}{}{\num{\rJU}\ts{}\aJUa(5)}\fi&%
				\checkaJUa(6)\let\rJU\cachedata\ifemptydata\relax\else\IfNVOETF{\rJU}{}{\num{\rJU}}\fi&%
				\checkaJUa(7)\let\rJU\cachedata\ifemptydata\relax\else\IfNVOETF{\rJU}{}{\num{\rJU}\%}\fi&%
				\checkaJUa(8)\let\rJU\cachedata\ifemptydata\relax\else\IfNVOETF{\rJU}{}{\num{\rJU} \euro}\fi&%
				\IfNVOETF{\aJU}{}{\num{\aJU} \euro}\expandafter\\\fi%
				\ifdefined\aJVa\rCa{\aJVa}&%
				\checkaJVa(4)\let\rJV\cachedata\ifemptydata\relax\else\IfNVOETF{\rJV}{}{\num{\rJV}\ts{}\aJVa(5)}\fi&%
				\checkaJVa(6)\let\rJV\cachedata\ifemptydata\relax\else\IfNVOETF{\rJV}{}{\num{\rJV}}\fi&%
				\checkaJVa(7)\let\rJV\cachedata\ifemptydata\relax\else\IfNVOETF{\rJV}{}{\num{\rJV}\%}\fi&%
				\checkaJVa(8)\let\rJV\cachedata\ifemptydata\relax\else\IfNVOETF{\rJV}{}{\num{\rJV} \euro}\fi&%
				\IfNVOETF{\aJV}{}{\num{\aJV} \euro}\expandafter\\\fi%
				\ifdefined\aJWa\rCa{\aJWa}&%
				\checkaJWa(4)\let\rJW\cachedata\ifemptydata\relax\else\IfNVOETF{\rJW}{}{\num{\rJW}\ts{}\aJWa(5)}\fi&%
				\checkaJWa(6)\let\rJW\cachedata\ifemptydata\relax\else\IfNVOETF{\rJW}{}{\num{\rJW}}\fi&%
				\checkaJWa(7)\let\rJW\cachedata\ifemptydata\relax\else\IfNVOETF{\rJW}{}{\num{\rJW}\%}\fi&%
				\checkaJWa(8)\let\rJW\cachedata\ifemptydata\relax\else\IfNVOETF{\rJW}{}{\num{\rJW} \euro}\fi&%
				\IfNVOETF{\aJW}{}{\num{\aJW} \euro}\expandafter\\\fi%
				\ifdefined\aJXa\rCa{\aJXa}&%
				\checkaJXa(4)\let\rJX\cachedata\ifemptydata\relax\else\IfNVOETF{\rJX}{}{\num{\rJX}\ts{}\aJXa(5)}\fi&%
				\checkaJXa(6)\let\rJX\cachedata\ifemptydata\relax\else\IfNVOETF{\rJX}{}{\num{\rJX}}\fi&%
				\checkaJXa(7)\let\rJX\cachedata\ifemptydata\relax\else\IfNVOETF{\rJX}{}{\num{\rJX}\%}\fi&%
				\checkaJXa(8)\let\rJX\cachedata\ifemptydata\relax\else\IfNVOETF{\rJX}{}{\num{\rJX} \euro}\fi&%
				\IfNVOETF{\aJX}{}{\num{\aJX} \euro}\expandafter\\\fi%
				\ifdefined\aJYa\rCa{\aJYa}&%
				\checkaJYa(4)\let\rJY\cachedata\ifemptydata\relax\else\IfNVOETF{\rJY}{}{\num{\rJY}\ts{}\aJYa(5)}\fi&%
				\checkaJYa(6)\let\rJY\cachedata\ifemptydata\relax\else\IfNVOETF{\rJY}{}{\num{\rJY}}\fi&%
				\checkaJYa(7)\let\rJY\cachedata\ifemptydata\relax\else\IfNVOETF{\rJY}{}{\num{\rJY}\%}\fi&%
				\checkaJYa(8)\let\rJY\cachedata\ifemptydata\relax\else\IfNVOETF{\rJY}{}{\num{\rJY} \euro}\fi&%
				\IfNVOETF{\aJY}{}{\num{\aJY} \euro}\expandafter\\\fi%	
				\ifdefined\aJZa\rCa{\aJZa}&%
				\checkaJZa(4)\let\rJZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJZ}{}{\num{\rJZ}\ts{}\aJZa(5)}\fi&%
				\checkaJZa(6)\let\rJZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJZ}{}{\num{\rJZ}}\fi&%
				\checkaJZa(7)\let\rJZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJZ}{}{\num{\rJZ}\%}\fi&%
				\checkaJZa(8)\let\rJZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rJZ}{}{\num{\rJZ} \euro}\fi&%
				\IfNVOETF{\aJZ}{}{\num{\aJZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aJ} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aKAa%
			\captionof{table}{\large{\textsc{\aKCaption}}}\label{tbl:asset:K}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aKAa\rCa{\aKAa}&%
				\checkaKAa(4)\let\rKA\cachedata\ifemptydata\relax\else\IfNVOETF{\rKA}{}{\num{\rKA}\ts{}\aKAa(5)}\fi&%
				\checkaKAa(6)\let\rKA\cachedata\ifemptydata\relax\else\IfNVOETF{\rKA}{}{\num{\rKA}}\fi&%
				\checkaKAa(7)\let\rKA\cachedata\ifemptydata\relax\else\IfNVOETF{\rKA}{}{\num{\rKA}\%}\fi&%
				\checkaKAa(8)\let\rKA\cachedata\ifemptydata\relax\else\IfNVOETF{\rKA}{}{\num{\rKA} \euro}\fi&%
				\IfNVOETF{\aKA}{}{\num{\aKA} \euro}\expandafter\\\fi%
				\ifdefined\aKBa\rCa{\aKBa}&%
				\checkaKBa(4)\let\rKB\cachedata\ifemptydata\relax\else\IfNVOETF{\rKB}{}{\num{\rKB}\ts{}\aKBa(5)}\fi&%
				\checkaKBa(6)\let\rKB\cachedata\ifemptydata\relax\else\IfNVOETF{\rKB}{}{\num{\rKB}}\fi&%
				\checkaKBa(7)\let\rKB\cachedata\ifemptydata\relax\else\IfNVOETF{\rKB}{}{\num{\rKB}\%}\fi&%
				\checkaKBa(8)\let\rKB\cachedata\ifemptydata\relax\else\IfNVOETF{\rKB}{}{\num{\rKB} \euro}\fi&%
				\IfNVOETF{\aKB}{}{\num{\aKB} \euro}\expandafter\\\fi%
				\ifdefined\aKCa\rCa{\aKCa}&%
				\checkaKCa(4)\let\rKC\cachedata\ifemptydata\relax\else\IfNVOETF{\rKC}{}{\num{\rKC}\ts{}\aKCa(5)}\fi&%
				\checkaKCa(6)\let\rKC\cachedata\ifemptydata\relax\else\IfNVOETF{\rKC}{}{\num{\rKC}}\fi&%
				\checkaKCa(7)\let\rKC\cachedata\ifemptydata\relax\else\IfNVOETF{\rKC}{}{\num{\rKC}\%}\fi&%
				\checkaKCa(8)\let\rKC\cachedata\ifemptydata\relax\else\IfNVOETF{\rKC}{}{\num{\rKC} \euro}\fi&%
				\IfNVOETF{\aKC}{}{\num{\aKC} \euro}\expandafter\\\fi%
				\ifdefined\aKDa\rCa{\aKDa}&%
				\checkaKDa(4)\let\rKD\cachedata\ifemptydata\relax\else\IfNVOETF{\rKD}{}{\num{\rKD}\ts{}\aKDa(5)}\fi&%
				\checkaKDa(6)\let\rKD\cachedata\ifemptydata\relax\else\IfNVOETF{\rKD}{}{\num{\rKD}}\fi&%
				\checkaKDa(7)\let\rKD\cachedata\ifemptydata\relax\else\IfNVOETF{\rKD}{}{\num{\rKD}\%}\fi&%
				\checkaKDa(8)\let\rKD\cachedata\ifemptydata\relax\else\IfNVOETF{\rKD}{}{\num{\rKD} \euro}\fi&%
				\IfNVOETF{\aKD}{}{\num{\aKD} \euro}\expandafter\\\fi%
				\ifdefined\aKEa\rCa{\aKEa}&%
				\checkaKEa(4)\let\rKE\cachedata\ifemptydata\relax\else\IfNVOETF{\rKE}{}{\num{\rKE}\ts{}\aKEa(5)}\fi&%
				\checkaKEa(6)\let\rKE\cachedata\ifemptydata\relax\else\IfNVOETF{\rKE}{}{\num{\rKE}}\fi&%
				\checkaKEa(7)\let\rKE\cachedata\ifemptydata\relax\else\IfNVOETF{\rKE}{}{\num{\rKE}\%}\fi&%
				\checkaKEa(8)\let\rKE\cachedata\ifemptydata\relax\else\IfNVOETF{\rKE}{}{\num{\rKE} \euro}\fi&%
				\IfNVOETF{\aKE}{}{\num{\aKE} \euro}\expandafter\\\fi%
				\ifdefined\aKFa\rCa{\aKFa}&%
				\checkaKFa(4)\let\rKF\cachedata\ifemptydata\relax\else\IfNVOETF{\rKF}{}{\num{\rKF}\ts{}\aKFa(5)}\fi&%
				\checkaKFa(6)\let\rKF\cachedata\ifemptydata\relax\else\IfNVOETF{\rKF}{}{\num{\rKF}}\fi&%
				\checkaKFa(7)\let\rKF\cachedata\ifemptydata\relax\else\IfNVOETF{\rKF}{}{\num{\rKF}\%}\fi&%
				\checkaKFa(8)\let\rKF\cachedata\ifemptydata\relax\else\IfNVOETF{\rKF}{}{\num{\rKF} \euro}\fi&%
				\IfNVOETF{\aKF}{}{\num{\aKF} \euro}\expandafter\\\fi%
				\ifdefined\aKGa\rCa{\aKGa}&%
				\checkaKGa(4)\let\rKG\cachedata\ifemptydata\relax\else\IfNVOETF{\rKG}{}{\num{\rKG}\ts{}\aKGa(5)}\fi&%
				\checkaKGa(6)\let\rKG\cachedata\ifemptydata\relax\else\IfNVOETF{\rKG}{}{\num{\rKG}}\fi&%
				\checkaKGa(7)\let\rKG\cachedata\ifemptydata\relax\else\IfNVOETF{\rKG}{}{\num{\rKG}\%}\fi&%
				\checkaKGa(8)\let\rKG\cachedata\ifemptydata\relax\else\IfNVOETF{\rKG}{}{\num{\rKG} \euro}\fi&%
				\IfNVOETF{\aKG}{}{\num{\aKG} \euro}\expandafter\\\fi%
				\ifdefined\aKIa\rCa{\aKIa}&%
				\checkaKIa(4)\let\rKI\cachedata\ifemptydata\relax\else\IfNVOETF{\rKI}{}{\num{\rKI}\ts{}\aKIa(5)}\fi&%
				\checkaKIa(6)\let\rKI\cachedata\ifemptydata\relax\else\IfNVOETF{\rKI}{}{\num{\rKI}}\fi&%
				\checkaKIa(7)\let\rKI\cachedata\ifemptydata\relax\else\IfNVOETF{\rKI}{}{\num{\rKI}\%}\fi&%
				\checkaKIa(8)\let\rKI\cachedata\ifemptydata\relax\else\IfNVOETF{\rKI}{}{\num{\rKI} \euro}\fi&%
				\IfNVOETF{\aKI}{}{\num{\aKI} \euro}\expandafter\\\fi%
				\ifdefined\aKJa\rCa{\aKJa}&%
				\checkaKJa(4)\let\rKJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKJ}{}{\num{\rKJ}\ts{}\aKJa(5)}\fi&%
				\checkaKJa(6)\let\rKJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKJ}{}{\num{\rKJ}}\fi&%
				\checkaKJa(7)\let\rKJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKJ}{}{\num{\rKJ}\%}\fi&%
				\checkaKJa(8)\let\rKJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKJ}{}{\num{\rKJ} \euro}\fi&%
				\IfNVOETF{\aKJ}{}{\num{\aKJ} \euro}\expandafter\\\fi%
				\ifdefined\aKKa\rCa{\aKKa}&%
				\checkaKKa(4)\let\rKK\cachedata\ifemptydata\relax\else\IfNVOETF{\rKK}{}{\num{\rKK}\ts{}\aKKa(5)}\fi&%
				\checkaKKa(6)\let\rKK\cachedata\ifemptydata\relax\else\IfNVOETF{\rKK}{}{\num{\rKK}}\fi&%
				\checkaKKa(7)\let\rKK\cachedata\ifemptydata\relax\else\IfNVOETF{\rKK}{}{\num{\rKK}\%}\fi&%
				\checkaKKa(8)\let\rKK\cachedata\ifemptydata\relax\else\IfNVOETF{\rKK}{}{\num{\rKK} \euro}\fi&%
				\IfNVOETF{\aKK}{}{\num{\aKK} \euro}\expandafter\\\fi%
				\ifdefined\aKLa\rCa{\aKLa}&%
				\checkaKLa(4)\let\rKL\cachedata\ifemptydata\relax\else\IfNVOETF{\rKL}{}{\num{\rKL}\ts{}\aKLa(5)}\fi&%
				\checkaKLa(6)\let\rKL\cachedata\ifemptydata\relax\else\IfNVOETF{\rKL}{}{\num{\rKL}}\fi&%
				\checkaKLa(7)\let\rKL\cachedata\ifemptydata\relax\else\IfNVOETF{\rKL}{}{\num{\rKL}\%}\fi&%
				\checkaKLa(8)\let\rKL\cachedata\ifemptydata\relax\else\IfNVOETF{\rKL}{}{\num{\rKL} \euro}\fi&%
				\IfNVOETF{\aKL}{}{\num{\aKL} \euro}\expandafter\\\fi%
				\ifdefined\aKMa\rCa{\aKMa}&%
				\checkaKMa(4)\let\rKM\cachedata\ifemptydata\relax\else\IfNVOETF{\rKM}{}{\num{\rKM}\ts{}\aKMa(5)}\fi&%
				\checkaKMa(6)\let\rKM\cachedata\ifemptydata\relax\else\IfNVOETF{\rKM}{}{\num{\rKM}}\fi&%
				\checkaKMa(7)\let\rKM\cachedata\ifemptydata\relax\else\IfNVOETF{\rKM}{}{\num{\rKM}\%}\fi&%
				\checkaKMa(8)\let\rKM\cachedata\ifemptydata\relax\else\IfNVOETF{\rKM}{}{\num{\rKM} \euro}\fi&%
				\IfNVOETF{\aKM}{}{\num{\aKM} \euro}\expandafter\\\fi%
				\ifdefined\aKNa\rCa{\aKNa}&%
				\checkaKNa(4)\let\rKN\cachedata\ifemptydata\relax\else\IfNVOETF{\rKN}{}{\num{\rKN}\ts{}\aKNa(5)}\fi&%
				\checkaKNa(6)\let\rKN\cachedata\ifemptydata\relax\else\IfNVOETF{\rKN}{}{\num{\rKN}}\fi&%
				\checkaKNa(7)\let\rKN\cachedata\ifemptydata\relax\else\IfNVOETF{\rKN}{}{\num{\rKN}\%}\fi&%
				\checkaKNa(8)\let\rKN\cachedata\ifemptydata\relax\else\IfNVOETF{\rKN}{}{\num{\rKN} \euro}\fi&%
				\IfNVOETF{\aKN}{}{\num{\aKN} \euro}\expandafter\\\fi%
				\ifdefined\aKOa\rCa{\aKOa}&%
				\checkaKOa(4)\let\rKO\cachedata\ifemptydata\relax\else\IfNVOETF{\rKO}{}{\num{\rKO}\ts{}\aKOa(5)}\fi&%
				\checkaKOa(6)\let\rKO\cachedata\ifemptydata\relax\else\IfNVOETF{\rKO}{}{\num{\rKO}}\fi&%
				\checkaKOa(7)\let\rKO\cachedata\ifemptydata\relax\else\IfNVOETF{\rKO}{}{\num{\rKO}\%}\fi&%
				\checkaKOa(8)\let\rKO\cachedata\ifemptydata\relax\else\IfNVOETF{\rKO}{}{\num{\rKO} \euro}\fi&%
				\IfNVOETF{\aKO}{}{\num{\aKO} \euro}\expandafter\\\fi%
				\ifdefined\aKPa\rCa{\aKPa}&%
				\checkaKPa(4)\let\rKP\cachedata\ifemptydata\relax\else\IfNVOETF{\rKP}{}{\num{\rKP}\ts{}\aKPa(5)}\fi&%
				\checkaKPa(6)\let\rKP\cachedata\ifemptydata\relax\else\IfNVOETF{\rKP}{}{\num{\rKP}}\fi&%
				\checkaKPa(7)\let\rKP\cachedata\ifemptydata\relax\else\IfNVOETF{\rKP}{}{\num{\rKP}\%}\fi&%
				\checkaKPa(8)\let\rKP\cachedata\ifemptydata\relax\else\IfNVOETF{\rKP}{}{\num{\rKP} \euro}\fi&%
				\IfNVOETF{\aKP}{}{\num{\aKP} \euro}\expandafter\\\fi%
				\ifdefined\aKQa\rCa{\aKQa}&%
				\checkaKQa(4)\let\rKQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKQ}{}{\num{\rKQ}\ts{}\aKQa(5)}\fi&%
				\checkaKQa(6)\let\rKQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKQ}{}{\num{\rKQ}}\fi&%
				\checkaKQa(7)\let\rKQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKQ}{}{\num{\rKQ}\%}\fi&%
				\checkaKQa(8)\let\rKQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKQ}{}{\num{\rKQ} \euro}\fi&%
				\IfNVOETF{\aKQ}{}{\num{\aKQ} \euro}\expandafter\\\fi%
				\ifdefined\aKRa\rCa{\aKRa}&%
				\checkaKRa(4)\let\rKR\cachedata\ifemptydata\relax\else\IfNVOETF{\rKR}{}{\num{\rKR}\ts{}\aKRa(5)}\fi&%
				\checkaKRa(6)\let\rKR\cachedata\ifemptydata\relax\else\IfNVOETF{\rKR}{}{\num{\rKR}}\fi&%
				\checkaKRa(7)\let\rKR\cachedata\ifemptydata\relax\else\IfNVOETF{\rKR}{}{\num{\rKR}\%}\fi&%
				\checkaKRa(8)\let\rKR\cachedata\ifemptydata\relax\else\IfNVOETF{\rKR}{}{\num{\rKR} \euro}\fi&%
				\IfNVOETF{\aKR}{}{\num{\aKR} \euro}\expandafter\\\fi%
				\ifdefined\aKSa\rCa{\aKSa}&%
				\checkaKSa(4)\let\rKS\cachedata\ifemptydata\relax\else\IfNVOETF{\rKS}{}{\num{\rKS}\ts{}\aKSa(5)}\fi&%
				\checkaKSa(6)\let\rKS\cachedata\ifemptydata\relax\else\IfNVOETF{\rKS}{}{\num{\rKS}}\fi&%
				\checkaKSa(7)\let\rKS\cachedata\ifemptydata\relax\else\IfNVOETF{\rKS}{}{\num{\rKS}\%}\fi&%
				\checkaKSa(8)\let\rKS\cachedata\ifemptydata\relax\else\IfNVOETF{\rKS}{}{\num{\rKS} \euro}\fi&%
				\IfNVOETF{\aKS}{}{\num{\aKS} \euro}\expandafter\\\fi%
				\ifdefined\aKTa\rCa{\aKTa}&%
				\checkaKTa(4)\let\rKT\cachedata\ifemptydata\relax\else\IfNVOETF{\rKT}{}{\num{\rKT}\ts{}\aKTa(5)}\fi&%
				\checkaKTa(6)\let\rKT\cachedata\ifemptydata\relax\else\IfNVOETF{\rKT}{}{\num{\rKT}}\fi&%
				\checkaKTa(7)\let\rKT\cachedata\ifemptydata\relax\else\IfNVOETF{\rKT}{}{\num{\rKT}\%}\fi&%
				\checkaKTa(8)\let\rKT\cachedata\ifemptydata\relax\else\IfNVOETF{\rKT}{}{\num{\rKT} \euro}\fi&%
				\IfNVOETF{\aKT}{}{\num{\aKT} \euro}\expandafter\\\fi%
				\ifdefined\aKUa\rCa{\aKUa}&%
				\checkaKUa(4)\let\rKU\cachedata\ifemptydata\relax\else\IfNVOETF{\rKU}{}{\num{\rKU}\ts{}\aKUa(5)}\fi&%
				\checkaKUa(6)\let\rKU\cachedata\ifemptydata\relax\else\IfNVOETF{\rKU}{}{\num{\rKU}}\fi&%
				\checkaKUa(7)\let\rKU\cachedata\ifemptydata\relax\else\IfNVOETF{\rKU}{}{\num{\rKU}\%}\fi&%
				\checkaKUa(8)\let\rKU\cachedata\ifemptydata\relax\else\IfNVOETF{\rKU}{}{\num{\rKU} \euro}\fi&%
				\IfNVOETF{\aKU}{}{\num{\aKU} \euro}\expandafter\\\fi%
				\ifdefined\aKVa\rCa{\aKVa}&%
				\checkaKVa(4)\let\rKV\cachedata\ifemptydata\relax\else\IfNVOETF{\rKV}{}{\num{\rKV}\ts{}\aKVa(5)}\fi&%
				\checkaKVa(6)\let\rKV\cachedata\ifemptydata\relax\else\IfNVOETF{\rKV}{}{\num{\rKV}}\fi&%
				\checkaKVa(7)\let\rKV\cachedata\ifemptydata\relax\else\IfNVOETF{\rKV}{}{\num{\rKV}\%}\fi&%
				\checkaKVa(8)\let\rKV\cachedata\ifemptydata\relax\else\IfNVOETF{\rKV}{}{\num{\rKV} \euro}\fi&%
				\IfNVOETF{\aKV}{}{\num{\aKV} \euro}\expandafter\\\fi%
				\ifdefined\aKWa\rCa{\aKWa}&%
				\checkaKWa(4)\let\rKW\cachedata\ifemptydata\relax\else\IfNVOETF{\rKW}{}{\num{\rKW}\ts{}\aKWa(5)}\fi&%
				\checkaKWa(6)\let\rKW\cachedata\ifemptydata\relax\else\IfNVOETF{\rKW}{}{\num{\rKW}}\fi&%
				\checkaKWa(7)\let\rKW\cachedata\ifemptydata\relax\else\IfNVOETF{\rKW}{}{\num{\rKW}\%}\fi&%
				\checkaKWa(8)\let\rKW\cachedata\ifemptydata\relax\else\IfNVOETF{\rKW}{}{\num{\rKW} \euro}\fi&%
				\IfNVOETF{\aKW}{}{\num{\aKW} \euro}\expandafter\\\fi%
				\ifdefined\aKXa\rCa{\aKXa}&%
				\checkaKXa(4)\let\rKX\cachedata\ifemptydata\relax\else\IfNVOETF{\rKX}{}{\num{\rKX}\ts{}\aKXa(5)}\fi&%
				\checkaKXa(6)\let\rKX\cachedata\ifemptydata\relax\else\IfNVOETF{\rKX}{}{\num{\rKX}}\fi&%
				\checkaKXa(7)\let\rKX\cachedata\ifemptydata\relax\else\IfNVOETF{\rKX}{}{\num{\rKX}\%}\fi&%
				\checkaKXa(8)\let\rKX\cachedata\ifemptydata\relax\else\IfNVOETF{\rKX}{}{\num{\rKX} \euro}\fi&%
				\IfNVOETF{\aKX}{}{\num{\aKX} \euro}\expandafter\\\fi%
				\ifdefined\aKYa\rCa{\aKYa}&%
				\checkaKYa(4)\let\rKY\cachedata\ifemptydata\relax\else\IfNVOETF{\rKY}{}{\num{\rKY}\ts{}\aKYa(5)}\fi&%
				\checkaKYa(6)\let\rKY\cachedata\ifemptydata\relax\else\IfNVOETF{\rKY}{}{\num{\rKY}}\fi&%
				\checkaKYa(7)\let\rKY\cachedata\ifemptydata\relax\else\IfNVOETF{\rKY}{}{\num{\rKY}\%}\fi&%
				\checkaKYa(8)\let\rKY\cachedata\ifemptydata\relax\else\IfNVOETF{\rKY}{}{\num{\rKY} \euro}\fi&%
				\IfNVOETF{\aKY}{}{\num{\aKY} \euro}\expandafter\\\fi%	
				\ifdefined\aKZa\rCa{\aKZa}&%
				\checkaKZa(4)\let\rKZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKZ}{}{\num{\rKZ}\ts{}\aKZa(5)}\fi&%
				\checkaKZa(6)\let\rKZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKZ}{}{\num{\rKZ}}\fi&%
				\checkaKZa(7)\let\rKZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKZ}{}{\num{\rKZ}\%}\fi&%
				\checkaKZa(8)\let\rKZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rKZ}{}{\num{\rKZ} \euro}\fi&%
				\IfNVOETF{\aKZ}{}{\num{\aKZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aK} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aLAa%
			\captionof{table}{\large{\textsc{\aLCaption}}}\label{tbl:asset:L}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aLAa\rCa{\aLAa}&%
				\checkaLAa(4)\let\rLA\cachedata\ifemptydata\relax\else\IfNVOETF{\rLA}{}{\num{\rLA}\ts{}\aLAa(5)}\fi&%
				\checkaLAa(6)\let\rLA\cachedata\ifemptydata\relax\else\IfNVOETF{\rLA}{}{\num{\rLA}}\fi&%
				\checkaLAa(7)\let\rLA\cachedata\ifemptydata\relax\else\IfNVOETF{\rLA}{}{\num{\rLA}\%}\fi&%
				\checkaLAa(8)\let\rLA\cachedata\ifemptydata\relax\else\IfNVOETF{\rLA}{}{\num{\rLA} \euro}\fi&%
				\IfNVOETF{\aLA}{}{\num{\aLA} \euro}\expandafter\\\fi%
				\ifdefined\aLBa\rCa{\aLBa}&%
				\checkaLBa(4)\let\rLB\cachedata\ifemptydata\relax\else\IfNVOETF{\rLB}{}{\num{\rLB}\ts{}\aLBa(5)}\fi&%
				\checkaLBa(6)\let\rLB\cachedata\ifemptydata\relax\else\IfNVOETF{\rLB}{}{\num{\rLB}}\fi&%
				\checkaLBa(7)\let\rLB\cachedata\ifemptydata\relax\else\IfNVOETF{\rLB}{}{\num{\rLB}\%}\fi&%
				\checkaLBa(8)\let\rLB\cachedata\ifemptydata\relax\else\IfNVOETF{\rLB}{}{\num{\rLB} \euro}\fi&%
				\IfNVOETF{\aLB}{}{\num{\aLB} \euro}\expandafter\\\fi%
				\ifdefined\aLCa\rCa{\aLCa}&%
				\checkaLCa(4)\let\rLC\cachedata\ifemptydata\relax\else\IfNVOETF{\rLC}{}{\num{\rLC}\ts{}\aLCa(5)}\fi&%
				\checkaLCa(6)\let\rLC\cachedata\ifemptydata\relax\else\IfNVOETF{\rLC}{}{\num{\rLC}}\fi&%
				\checkaLCa(7)\let\rLC\cachedata\ifemptydata\relax\else\IfNVOETF{\rLC}{}{\num{\rLC}\%}\fi&%
				\checkaLCa(8)\let\rLC\cachedata\ifemptydata\relax\else\IfNVOETF{\rLC}{}{\num{\rLC} \euro}\fi&%
				\IfNVOETF{\aLC}{}{\num{\aLC} \euro}\expandafter\\\fi%
				\ifdefined\aLDa\rCa{\aLDa}&%
				\checkaLDa(4)\let\rLD\cachedata\ifemptydata\relax\else\IfNVOETF{\rLD}{}{\num{\rLD}\ts{}\aLDa(5)}\fi&%
				\checkaLDa(6)\let\rLD\cachedata\ifemptydata\relax\else\IfNVOETF{\rLD}{}{\num{\rLD}}\fi&%
				\checkaLDa(7)\let\rLD\cachedata\ifemptydata\relax\else\IfNVOETF{\rLD}{}{\num{\rLD}\%}\fi&%
				\checkaLDa(8)\let\rLD\cachedata\ifemptydata\relax\else\IfNVOETF{\rLD}{}{\num{\rLD} \euro}\fi&%
				\IfNVOETF{\aLD}{}{\num{\aLD} \euro}\expandafter\\\fi%
				\ifdefined\aLEa\rCa{\aLEa}&%
				\checkaLEa(4)\let\rLE\cachedata\ifemptydata\relax\else\IfNVOETF{\rLE}{}{\num{\rLE}\ts{}\aLEa(5)}\fi&%
				\checkaLEa(6)\let\rLE\cachedata\ifemptydata\relax\else\IfNVOETF{\rLE}{}{\num{\rLE}}\fi&%
				\checkaLEa(7)\let\rLE\cachedata\ifemptydata\relax\else\IfNVOETF{\rLE}{}{\num{\rLE}\%}\fi&%
				\checkaLEa(8)\let\rLE\cachedata\ifemptydata\relax\else\IfNVOETF{\rLE}{}{\num{\rLE} \euro}\fi&%
				\IfNVOETF{\aLE}{}{\num{\aLE} \euro}\expandafter\\\fi%
				\ifdefined\aLFa\rCa{\aLFa}&%
				\checkaLFa(4)\let\rLF\cachedata\ifemptydata\relax\else\IfNVOETF{\rLF}{}{\num{\rLF}\ts{}\aLFa(5)}\fi&%
				\checkaLFa(6)\let\rLF\cachedata\ifemptydata\relax\else\IfNVOETF{\rLF}{}{\num{\rLF}}\fi&%
				\checkaLFa(7)\let\rLF\cachedata\ifemptydata\relax\else\IfNVOETF{\rLF}{}{\num{\rLF}\%}\fi&%
				\checkaLFa(8)\let\rLF\cachedata\ifemptydata\relax\else\IfNVOETF{\rLF}{}{\num{\rLF} \euro}\fi&%
				\IfNVOETF{\aLF}{}{\num{\aLF} \euro}\expandafter\\\fi%
				\ifdefined\aLGa\rCa{\aLGa}&%
				\checkaLGa(4)\let\rLG\cachedata\ifemptydata\relax\else\IfNVOETF{\rLG}{}{\num{\rLG}\ts{}\aLGa(5)}\fi&%
				\checkaLGa(6)\let\rLG\cachedata\ifemptydata\relax\else\IfNVOETF{\rLG}{}{\num{\rLG}}\fi&%
				\checkaLGa(7)\let\rLG\cachedata\ifemptydata\relax\else\IfNVOETF{\rLG}{}{\num{\rLG}\%}\fi&%
				\checkaLGa(8)\let\rLG\cachedata\ifemptydata\relax\else\IfNVOETF{\rLG}{}{\num{\rLG} \euro}\fi&%
				\IfNVOETF{\aLG}{}{\num{\aLG} \euro}\expandafter\\\fi%
				\ifdefined\aLIa\rCa{\aLIa}&%
				\checkaLIa(4)\let\rLI\cachedata\ifemptydata\relax\else\IfNVOETF{\rLI}{}{\num{\rLI}\ts{}\aLIa(5)}\fi&%
				\checkaLIa(6)\let\rLI\cachedata\ifemptydata\relax\else\IfNVOETF{\rLI}{}{\num{\rLI}}\fi&%
				\checkaLIa(7)\let\rLI\cachedata\ifemptydata\relax\else\IfNVOETF{\rLI}{}{\num{\rLI}\%}\fi&%
				\checkaLIa(8)\let\rLI\cachedata\ifemptydata\relax\else\IfNVOETF{\rLI}{}{\num{\rLI} \euro}\fi&%
				\IfNVOETF{\aLI}{}{\num{\aLI} \euro}\expandafter\\\fi%
				\ifdefined\aLJa\rCa{\aLJa}&%
				\checkaLJa(4)\let\rLJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLJ}{}{\num{\rLJ}\ts{}\aLJa(5)}\fi&%
				\checkaLJa(6)\let\rLJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLJ}{}{\num{\rLJ}}\fi&%
				\checkaLJa(7)\let\rLJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLJ}{}{\num{\rLJ}\%}\fi&%
				\checkaLJa(8)\let\rLJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLJ}{}{\num{\rLJ} \euro}\fi&%
				\IfNVOETF{\aLJ}{}{\num{\aLJ} \euro}\expandafter\\\fi%
				\ifdefined\aLKa\rCa{\aLKa}&%
				\checkaLKa(4)\let\rLK\cachedata\ifemptydata\relax\else\IfNVOETF{\rLK}{}{\num{\rLK}\ts{}\aLKa(5)}\fi&%
				\checkaLKa(6)\let\rLK\cachedata\ifemptydata\relax\else\IfNVOETF{\rLK}{}{\num{\rLK}}\fi&%
				\checkaLKa(7)\let\rLK\cachedata\ifemptydata\relax\else\IfNVOETF{\rLK}{}{\num{\rLK}\%}\fi&%
				\checkaLKa(8)\let\rLK\cachedata\ifemptydata\relax\else\IfNVOETF{\rLK}{}{\num{\rLK} \euro}\fi&%
				\IfNVOETF{\aLK}{}{\num{\aLK} \euro}\expandafter\\\fi%
				\ifdefined\aLLa\rCa{\aLLa}&%
				\checkaLLa(4)\let\rLL\cachedata\ifemptydata\relax\else\IfNVOETF{\rLL}{}{\num{\rLL}\ts{}\aLLa(5)}\fi&%
				\checkaLLa(6)\let\rLL\cachedata\ifemptydata\relax\else\IfNVOETF{\rLL}{}{\num{\rLL}}\fi&%
				\checkaLLa(7)\let\rLL\cachedata\ifemptydata\relax\else\IfNVOETF{\rLL}{}{\num{\rLL}\%}\fi&%
				\checkaLLa(8)\let\rLL\cachedata\ifemptydata\relax\else\IfNVOETF{\rLL}{}{\num{\rLL} \euro}\fi&%
				\IfNVOETF{\aLL}{}{\num{\aLL} \euro}\expandafter\\\fi%
				\ifdefined\aLMa\rCa{\aLMa}&%
				\checkaLMa(4)\let\rLM\cachedata\ifemptydata\relax\else\IfNVOETF{\rLM}{}{\num{\rLM}\ts{}\aLMa(5)}\fi&%
				\checkaLMa(6)\let\rLM\cachedata\ifemptydata\relax\else\IfNVOETF{\rLM}{}{\num{\rLM}}\fi&%
				\checkaLMa(7)\let\rLM\cachedata\ifemptydata\relax\else\IfNVOETF{\rLM}{}{\num{\rLM}\%}\fi&%
				\checkaLMa(8)\let\rLM\cachedata\ifemptydata\relax\else\IfNVOETF{\rLM}{}{\num{\rLM} \euro}\fi&%
				\IfNVOETF{\aLM}{}{\num{\aLM} \euro}\expandafter\\\fi%
				\ifdefined\aLNa\rCa{\aLNa}&%
				\checkaLNa(4)\let\rLN\cachedata\ifemptydata\relax\else\IfNVOETF{\rLN}{}{\num{\rLN}\ts{}\aLNa(5)}\fi&%
				\checkaLNa(6)\let\rLN\cachedata\ifemptydata\relax\else\IfNVOETF{\rLN}{}{\num{\rLN}}\fi&%
				\checkaLNa(7)\let\rLN\cachedata\ifemptydata\relax\else\IfNVOETF{\rLN}{}{\num{\rLN}\%}\fi&%
				\checkaLNa(8)\let\rLN\cachedata\ifemptydata\relax\else\IfNVOETF{\rLN}{}{\num{\rLN} \euro}\fi&%
				\IfNVOETF{\aLN}{}{\num{\aLN} \euro}\expandafter\\\fi%
				\ifdefined\aLOa\rCa{\aLOa}&%
				\checkaLOa(4)\let\rLO\cachedata\ifemptydata\relax\else\IfNVOETF{\rLO}{}{\num{\rLO}\ts{}\aLOa(5)}\fi&%
				\checkaLOa(6)\let\rLO\cachedata\ifemptydata\relax\else\IfNVOETF{\rLO}{}{\num{\rLO}}\fi&%
				\checkaLOa(7)\let\rLO\cachedata\ifemptydata\relax\else\IfNVOETF{\rLO}{}{\num{\rLO}\%}\fi&%
				\checkaLOa(8)\let\rLO\cachedata\ifemptydata\relax\else\IfNVOETF{\rLO}{}{\num{\rLO} \euro}\fi&%
				\IfNVOETF{\aLO}{}{\num{\aLO} \euro}\expandafter\\\fi%
				\ifdefined\aLPa\rCa{\aLPa}&%
				\checkaLPa(4)\let\rLP\cachedata\ifemptydata\relax\else\IfNVOETF{\rLP}{}{\num{\rLP}\ts{}\aLPa(5)}\fi&%
				\checkaLPa(6)\let\rLP\cachedata\ifemptydata\relax\else\IfNVOETF{\rLP}{}{\num{\rLP}}\fi&%
				\checkaLPa(7)\let\rLP\cachedata\ifemptydata\relax\else\IfNVOETF{\rLP}{}{\num{\rLP}\%}\fi&%
				\checkaLPa(8)\let\rLP\cachedata\ifemptydata\relax\else\IfNVOETF{\rLP}{}{\num{\rLP} \euro}\fi&%
				\IfNVOETF{\aLP}{}{\num{\aLP} \euro}\expandafter\\\fi%
				\ifdefined\aLQa\rCa{\aLQa}&%
				\checkaLQa(4)\let\rLQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLQ}{}{\num{\rLQ}\ts{}\aLQa(5)}\fi&%
				\checkaLQa(6)\let\rLQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLQ}{}{\num{\rLQ}}\fi&%
				\checkaLQa(7)\let\rLQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLQ}{}{\num{\rLQ}\%}\fi&%
				\checkaLQa(8)\let\rLQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLQ}{}{\num{\rLQ} \euro}\fi&%
				\IfNVOETF{\aLQ}{}{\num{\aLQ} \euro}\expandafter\\\fi%
				\ifdefined\aLRa\rCa{\aLRa}&%
				\checkaLRa(4)\let\rLR\cachedata\ifemptydata\relax\else\IfNVOETF{\rLR}{}{\num{\rLR}\ts{}\aLRa(5)}\fi&%
				\checkaLRa(6)\let\rLR\cachedata\ifemptydata\relax\else\IfNVOETF{\rLR}{}{\num{\rLR}}\fi&%
				\checkaLRa(7)\let\rLR\cachedata\ifemptydata\relax\else\IfNVOETF{\rLR}{}{\num{\rLR}\%}\fi&%
				\checkaLRa(8)\let\rLR\cachedata\ifemptydata\relax\else\IfNVOETF{\rLR}{}{\num{\rLR} \euro}\fi&%
				\IfNVOETF{\aLR}{}{\num{\aLR} \euro}\expandafter\\\fi%
				\ifdefined\aLSa\rCa{\aLSa}&%
				\checkaLSa(4)\let\rLS\cachedata\ifemptydata\relax\else\IfNVOETF{\rLS}{}{\num{\rLS}\ts{}\aLSa(5)}\fi&%
				\checkaLSa(6)\let\rLS\cachedata\ifemptydata\relax\else\IfNVOETF{\rLS}{}{\num{\rLS}}\fi&%
				\checkaLSa(7)\let\rLS\cachedata\ifemptydata\relax\else\IfNVOETF{\rLS}{}{\num{\rLS}\%}\fi&%
				\checkaLSa(8)\let\rLS\cachedata\ifemptydata\relax\else\IfNVOETF{\rLS}{}{\num{\rLS} \euro}\fi&%
				\IfNVOETF{\aLS}{}{\num{\aLS} \euro}\expandafter\\\fi%
				\ifdefined\aLTa\rCa{\aLTa}&%
				\checkaLTa(4)\let\rLT\cachedata\ifemptydata\relax\else\IfNVOETF{\rLT}{}{\num{\rLT}\ts{}\aLTa(5)}\fi&%
				\checkaLTa(6)\let\rLT\cachedata\ifemptydata\relax\else\IfNVOETF{\rLT}{}{\num{\rLT}}\fi&%
				\checkaLTa(7)\let\rLT\cachedata\ifemptydata\relax\else\IfNVOETF{\rLT}{}{\num{\rLT}\%}\fi&%
				\checkaLTa(8)\let\rLT\cachedata\ifemptydata\relax\else\IfNVOETF{\rLT}{}{\num{\rLT} \euro}\fi&%
				\IfNVOETF{\aLT}{}{\num{\aLT} \euro}\expandafter\\\fi%
				\ifdefined\aLUa\rCa{\aLUa}&%
				\checkaLUa(4)\let\rLU\cachedata\ifemptydata\relax\else\IfNVOETF{\rLU}{}{\num{\rLU}\ts{}\aLUa(5)}\fi&%
				\checkaLUa(6)\let\rLU\cachedata\ifemptydata\relax\else\IfNVOETF{\rLU}{}{\num{\rLU}}\fi&%
				\checkaLUa(7)\let\rLU\cachedata\ifemptydata\relax\else\IfNVOETF{\rLU}{}{\num{\rLU}\%}\fi&%
				\checkaLUa(8)\let\rLU\cachedata\ifemptydata\relax\else\IfNVOETF{\rLU}{}{\num{\rLU} \euro}\fi&%
				\IfNVOETF{\aLU}{}{\num{\aLU} \euro}\expandafter\\\fi%
				\ifdefined\aLVa\rCa{\aLVa}&%
				\checkaLVa(4)\let\rLV\cachedata\ifemptydata\relax\else\IfNVOETF{\rLV}{}{\num{\rLV}\ts{}\aLVa(5)}\fi&%
				\checkaLVa(6)\let\rLV\cachedata\ifemptydata\relax\else\IfNVOETF{\rLV}{}{\num{\rLV}}\fi&%
				\checkaLVa(7)\let\rLV\cachedata\ifemptydata\relax\else\IfNVOETF{\rLV}{}{\num{\rLV}\%}\fi&%
				\checkaLVa(8)\let\rLV\cachedata\ifemptydata\relax\else\IfNVOETF{\rLV}{}{\num{\rLV} \euro}\fi&%
				\IfNVOETF{\aLV}{}{\num{\aLV} \euro}\expandafter\\\fi%
				\ifdefined\aLWa\rCa{\aLWa}&%
				\checkaLWa(4)\let\rLW\cachedata\ifemptydata\relax\else\IfNVOETF{\rLW}{}{\num{\rLW}\ts{}\aLWa(5)}\fi&%
				\checkaLWa(6)\let\rLW\cachedata\ifemptydata\relax\else\IfNVOETF{\rLW}{}{\num{\rLW}}\fi&%
				\checkaLWa(7)\let\rLW\cachedata\ifemptydata\relax\else\IfNVOETF{\rLW}{}{\num{\rLW}\%}\fi&%
				\checkaLWa(8)\let\rLW\cachedata\ifemptydata\relax\else\IfNVOETF{\rLW}{}{\num{\rLW} \euro}\fi&%
				\IfNVOETF{\aLW}{}{\num{\aLW} \euro}\expandafter\\\fi%
				\ifdefined\aLXa\rCa{\aLXa}&%
				\checkaLXa(4)\let\rLX\cachedata\ifemptydata\relax\else\IfNVOETF{\rLX}{}{\num{\rLX}\ts{}\aLXa(5)}\fi&%
				\checkaLXa(6)\let\rLX\cachedata\ifemptydata\relax\else\IfNVOETF{\rLX}{}{\num{\rLX}}\fi&%
				\checkaLXa(7)\let\rLX\cachedata\ifemptydata\relax\else\IfNVOETF{\rLX}{}{\num{\rLX}\%}\fi&%
				\checkaLXa(8)\let\rLX\cachedata\ifemptydata\relax\else\IfNVOETF{\rLX}{}{\num{\rLX} \euro}\fi&%
				\IfNVOETF{\aLX}{}{\num{\aLX} \euro}\expandafter\\\fi%
				\ifdefined\aLYa\rCa{\aLYa}&%
				\checkaLYa(4)\let\rLY\cachedata\ifemptydata\relax\else\IfNVOETF{\rLY}{}{\num{\rLY}\ts{}\aLYa(5)}\fi&%
				\checkaLYa(6)\let\rLY\cachedata\ifemptydata\relax\else\IfNVOETF{\rLY}{}{\num{\rLY}}\fi&%
				\checkaLYa(7)\let\rLY\cachedata\ifemptydata\relax\else\IfNVOETF{\rLY}{}{\num{\rLY}\%}\fi&%
				\checkaLYa(8)\let\rLY\cachedata\ifemptydata\relax\else\IfNVOETF{\rLY}{}{\num{\rLY} \euro}\fi&%
				\IfNVOETF{\aLY}{}{\num{\aLY} \euro}\expandafter\\\fi%	
				\ifdefined\aLZa\rCa{\aLZa}&%
				\checkaLZa(4)\let\rLZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLZ}{}{\num{\rLZ}\ts{}\aLZa(5)}\fi&%
				\checkaLZa(6)\let\rLZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLZ}{}{\num{\rLZ}}\fi&%
				\checkaLZa(7)\let\rLZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLZ}{}{\num{\rLZ}\%}\fi&%
				\checkaLZa(8)\let\rLZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rLZ}{}{\num{\rLZ} \euro}\fi&%
				\IfNVOETF{\aLZ}{}{\num{\aLZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aL} \euro    \\%
			\end{tabularx} %
			\fi%
		\end{center}%
%		\newpage%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aMAa%
			\captionof{table}{\large{\textsc{\aMCaption}}}\label{tbl:asset:M}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aMAa\rCa{\aMAa}&%
				\checkaMAa(4)\let\rMA\cachedata\ifemptydata\relax\else\IfNVOETF{\rMA}{}{\num{\rMA}\ts{}\aMAa(5)}\fi&%
				\checkaMAa(6)\let\rMA\cachedata\ifemptydata\relax\else\IfNVOETF{\rMA}{}{\num{\rMA}}\fi&%
				\checkaMAa(7)\let\rMA\cachedata\ifemptydata\relax\else\IfNVOETF{\rMA}{}{\num{\rMA}\%}\fi&%
				\checkaMAa(8)\let\rMA\cachedata\ifemptydata\relax\else\IfNVOETF{\rMA}{}{\num{\rMA} \euro}\fi&%
				\IfNVOETF{\aMA}{}{\num{\aMA} \euro}\expandafter\\\fi%
				\ifdefined\aMBa\rCa{\aMBa}&%
				\checkaMBa(4)\let\rMB\cachedata\ifemptydata\relax\else\IfNVOETF{\rMB}{}{\num{\rMB}\ts{}\aMBa(5)}\fi&%
				\checkaMBa(6)\let\rMB\cachedata\ifemptydata\relax\else\IfNVOETF{\rMB}{}{\num{\rMB}}\fi&%
				\checkaMBa(7)\let\rMB\cachedata\ifemptydata\relax\else\IfNVOETF{\rMB}{}{\num{\rMB}\%}\fi&%
				\checkaMBa(8)\let\rMB\cachedata\ifemptydata\relax\else\IfNVOETF{\rMB}{}{\num{\rMB} \euro}\fi&%
				\IfNVOETF{\aMB}{}{\num{\aMB} \euro}\expandafter\\\fi%
				\ifdefined\aMCa\rCa{\aMCa}&%
				\checkaMCa(4)\let\rMC\cachedata\ifemptydata\relax\else\IfNVOETF{\rMC}{}{\num{\rMC}\ts{}\aMCa(5)}\fi&%
				\checkaMCa(6)\let\rMC\cachedata\ifemptydata\relax\else\IfNVOETF{\rMC}{}{\num{\rMC}}\fi&%
				\checkaMCa(7)\let\rMC\cachedata\ifemptydata\relax\else\IfNVOETF{\rMC}{}{\num{\rMC}\%}\fi&%
				\checkaMCa(8)\let\rMC\cachedata\ifemptydata\relax\else\IfNVOETF{\rMC}{}{\num{\rMC} \euro}\fi&%
				\IfNVOETF{\aMC}{}{\num{\aMC} \euro}\expandafter\\\fi%
				\ifdefined\aMDa\rCa{\aMDa}&%
				\checkaMDa(4)\let\rMD\cachedata\ifemptydata\relax\else\IfNVOETF{\rMD}{}{\num{\rMD}\ts{}\aMDa(5)}\fi&%
				\checkaMDa(6)\let\rMD\cachedata\ifemptydata\relax\else\IfNVOETF{\rMD}{}{\num{\rMD}}\fi&%
				\checkaMDa(7)\let\rMD\cachedata\ifemptydata\relax\else\IfNVOETF{\rMD}{}{\num{\rMD}\%}\fi&%
				\checkaMDa(8)\let\rMD\cachedata\ifemptydata\relax\else\IfNVOETF{\rMD}{}{\num{\rMD} \euro}\fi&%
				\IfNVOETF{\aMD}{}{\num{\aMD} \euro}\expandafter\\\fi%
				\ifdefined\aMEa\rCa{\aMEa}&%
				\checkaMEa(4)\let\rME\cachedata\ifemptydata\relax\else\IfNVOETF{\rME}{}{\num{\rME}\ts{}\aMEa(5)}\fi&%
				\checkaMEa(6)\let\rME\cachedata\ifemptydata\relax\else\IfNVOETF{\rME}{}{\num{\rME}}\fi&%
				\checkaMEa(7)\let\rME\cachedata\ifemptydata\relax\else\IfNVOETF{\rME}{}{\num{\rME}\%}\fi&%
				\checkaMEa(8)\let\rME\cachedata\ifemptydata\relax\else\IfNVOETF{\rME}{}{\num{\rME} \euro}\fi&%
				\IfNVOETF{\aME}{}{\num{\aME} \euro}\expandafter\\\fi%
				\ifdefined\aMFa\rCa{\aMFa}&%
				\checkaMFa(4)\let\rMF\cachedata\ifemptydata\relax\else\IfNVOETF{\rMF}{}{\num{\rMF}\ts{}\aMFa(5)}\fi&%
				\checkaMFa(6)\let\rMF\cachedata\ifemptydata\relax\else\IfNVOETF{\rMF}{}{\num{\rMF}}\fi&%
				\checkaMFa(7)\let\rMF\cachedata\ifemptydata\relax\else\IfNVOETF{\rMF}{}{\num{\rMF}\%}\fi&%
				\checkaMFa(8)\let\rMF\cachedata\ifemptydata\relax\else\IfNVOETF{\rMF}{}{\num{\rMF} \euro}\fi&%
				\IfNVOETF{\aMF}{}{\num{\aMF} \euro}\expandafter\\\fi%
				\ifdefined\aMGa\rCa{\aMGa}&%
				\checkaMGa(4)\let\rMG\cachedata\ifemptydata\relax\else\IfNVOETF{\rMG}{}{\num{\rMG}\ts{}\aMGa(5)}\fi&%
				\checkaMGa(6)\let\rMG\cachedata\ifemptydata\relax\else\IfNVOETF{\rMG}{}{\num{\rMG}}\fi&%
				\checkaMGa(7)\let\rMG\cachedata\ifemptydata\relax\else\IfNVOETF{\rMG}{}{\num{\rMG}\%}\fi&%
				\checkaMGa(8)\let\rMG\cachedata\ifemptydata\relax\else\IfNVOETF{\rMG}{}{\num{\rMG} \euro}\fi&%
				\IfNVOETF{\aMG}{}{\num{\aMG} \euro}\expandafter\\\fi%
				\ifdefined\aMIa\rCa{\aMIa}&%
				\checkaMIa(4)\let\rMI\cachedata\ifemptydata\relax\else\IfNVOETF{\rMI}{}{\num{\rMI}\ts{}\aMIa(5)}\fi&%
				\checkaMIa(6)\let\rMI\cachedata\ifemptydata\relax\else\IfNVOETF{\rMI}{}{\num{\rMI}}\fi&%
				\checkaMIa(7)\let\rMI\cachedata\ifemptydata\relax\else\IfNVOETF{\rMI}{}{\num{\rMI}\%}\fi&%
				\checkaMIa(8)\let\rMI\cachedata\ifemptydata\relax\else\IfNVOETF{\rMI}{}{\num{\rMI} \euro}\fi&%
				\IfNVOETF{\aMI}{}{\num{\aMI} \euro}\expandafter\\\fi%
				\ifdefined\aMJa\rCa{\aMJa}&%
				\checkaMJa(4)\let\rMJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMJ}{}{\num{\rMJ}\ts{}\aMJa(5)}\fi&%
				\checkaMJa(6)\let\rMJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMJ}{}{\num{\rMJ}}\fi&%
				\checkaMJa(7)\let\rMJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMJ}{}{\num{\rMJ}\%}\fi&%
				\checkaMJa(8)\let\rMJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMJ}{}{\num{\rMJ} \euro}\fi&%
				\IfNVOETF{\aMJ}{}{\num{\aMJ} \euro}\expandafter\\\fi%
				\ifdefined\aMKa\rCa{\aMKa}&%
				\checkaMKa(4)\let\rMK\cachedata\ifemptydata\relax\else\IfNVOETF{\rMK}{}{\num{\rMK}\ts{}\aMKa(5)}\fi&%
				\checkaMKa(6)\let\rMK\cachedata\ifemptydata\relax\else\IfNVOETF{\rMK}{}{\num{\rMK}}\fi&%
				\checkaMKa(7)\let\rMK\cachedata\ifemptydata\relax\else\IfNVOETF{\rMK}{}{\num{\rMK}\%}\fi&%
				\checkaMKa(8)\let\rMK\cachedata\ifemptydata\relax\else\IfNVOETF{\rMK}{}{\num{\rMK} \euro}\fi&%
				\IfNVOETF{\aMK}{}{\num{\aMK} \euro}\expandafter\\\fi%
				\ifdefined\aMLa\rCa{\aMLa}&%
				\checkaMLa(4)\let\rML\cachedata\ifemptydata\relax\else\IfNVOETF{\rML}{}{\num{\rML}\ts{}\aMLa(5)}\fi&%
				\checkaMLa(6)\let\rML\cachedata\ifemptydata\relax\else\IfNVOETF{\rML}{}{\num{\rML}}\fi&%
				\checkaMLa(7)\let\rML\cachedata\ifemptydata\relax\else\IfNVOETF{\rML}{}{\num{\rML}\%}\fi&%
				\checkaMLa(8)\let\rML\cachedata\ifemptydata\relax\else\IfNVOETF{\rML}{}{\num{\rML} \euro}\fi&%
				\IfNVOETF{\aML}{}{\num{\aML} \euro}\expandafter\\\fi%
				\ifdefined\aMMa\rCa{\aMMa}&%
				\checkaMMa(4)\let\rMM\cachedata\ifemptydata\relax\else\IfNVOETF{\rMM}{}{\num{\rMM}\ts{}\aMMa(5)}\fi&%
				\checkaMMa(6)\let\rMM\cachedata\ifemptydata\relax\else\IfNVOETF{\rMM}{}{\num{\rMM}}\fi&%
				\checkaMMa(7)\let\rMM\cachedata\ifemptydata\relax\else\IfNVOETF{\rMM}{}{\num{\rMM}\%}\fi&%
				\checkaMMa(8)\let\rMM\cachedata\ifemptydata\relax\else\IfNVOETF{\rMM}{}{\num{\rMM} \euro}\fi&%
				\IfNVOETF{\aMM}{}{\num{\aMM} \euro}\expandafter\\\fi%
				\ifdefined\aMNa\rCa{\aMNa}&%
				\checkaMNa(4)\let\rMN\cachedata\ifemptydata\relax\else\IfNVOETF{\rMN}{}{\num{\rMN}\ts{}\aMNa(5)}\fi&%
				\checkaMNa(6)\let\rMN\cachedata\ifemptydata\relax\else\IfNVOETF{\rMN}{}{\num{\rMN}}\fi&%
				\checkaMNa(7)\let\rMN\cachedata\ifemptydata\relax\else\IfNVOETF{\rMN}{}{\num{\rMN}\%}\fi&%
				\checkaMNa(8)\let\rMN\cachedata\ifemptydata\relax\else\IfNVOETF{\rMN}{}{\num{\rMN} \euro}\fi&%
				\IfNVOETF{\aMN}{}{\num{\aMN} \euro}\expandafter\\\fi%
				\ifdefined\aMOa\rCa{\aMOa}&%
				\checkaMOa(4)\let\rMO\cachedata\ifemptydata\relax\else\IfNVOETF{\rMO}{}{\num{\rMO}\ts{}\aMOa(5)}\fi&%
				\checkaMOa(6)\let\rMO\cachedata\ifemptydata\relax\else\IfNVOETF{\rMO}{}{\num{\rMO}}\fi&%
				\checkaMOa(7)\let\rMO\cachedata\ifemptydata\relax\else\IfNVOETF{\rMO}{}{\num{\rMO}\%}\fi&%
				\checkaMOa(8)\let\rMO\cachedata\ifemptydata\relax\else\IfNVOETF{\rMO}{}{\num{\rMO} \euro}\fi&%
				\IfNVOETF{\aMO}{}{\num{\aMO} \euro}\expandafter\\\fi%
				\ifdefined\aMPa\rCa{\aMPa}&%
				\checkaMPa(4)\let\rMP\cachedata\ifemptydata\relax\else\IfNVOETF{\rMP}{}{\num{\rMP}\ts{}\aMPa(5)}\fi&%
				\checkaMPa(6)\let\rMP\cachedata\ifemptydata\relax\else\IfNVOETF{\rMP}{}{\num{\rMP}}\fi&%
				\checkaMPa(7)\let\rMP\cachedata\ifemptydata\relax\else\IfNVOETF{\rMP}{}{\num{\rMP}\%}\fi&%
				\checkaMPa(8)\let\rMP\cachedata\ifemptydata\relax\else\IfNVOETF{\rMP}{}{\num{\rMP} \euro}\fi&%
				\IfNVOETF{\aMP}{}{\num{\aMP} \euro}\expandafter\\\fi%
				\ifdefined\aMQa\rCa{\aMQa}&%
				\checkaMQa(4)\let\rMQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMQ}{}{\num{\rMQ}\ts{}\aMQa(5)}\fi&%
				\checkaMQa(6)\let\rMQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMQ}{}{\num{\rMQ}}\fi&%
				\checkaMQa(7)\let\rMQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMQ}{}{\num{\rMQ}\%}\fi&%
				\checkaMQa(8)\let\rMQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMQ}{}{\num{\rMQ} \euro}\fi&%
				\IfNVOETF{\aMQ}{}{\num{\aMQ} \euro}\expandafter\\\fi%
				\ifdefined\aMRa\rCa{\aMRa}&%
				\checkaMRa(4)\let\rMR\cachedata\ifemptydata\relax\else\IfNVOETF{\rMR}{}{\num{\rMR}\ts{}\aMRa(5)}\fi&%
				\checkaMRa(6)\let\rMR\cachedata\ifemptydata\relax\else\IfNVOETF{\rMR}{}{\num{\rMR}}\fi&%
				\checkaMRa(7)\let\rMR\cachedata\ifemptydata\relax\else\IfNVOETF{\rMR}{}{\num{\rMR}\%}\fi&%
				\checkaMRa(8)\let\rMR\cachedata\ifemptydata\relax\else\IfNVOETF{\rMR}{}{\num{\rMR} \euro}\fi&%
				\IfNVOETF{\aMR}{}{\num{\aMR} \euro}\expandafter\\\fi%
				\ifdefined\aMSa\rCa{\aMSa}&%
				\checkaMSa(4)\let\rMS\cachedata\ifemptydata\relax\else\IfNVOETF{\rMS}{}{\num{\rMS}\ts{}\aMSa(5)}\fi&%
				\checkaMSa(6)\let\rMS\cachedata\ifemptydata\relax\else\IfNVOETF{\rMS}{}{\num{\rMS}}\fi&%
				\checkaMSa(7)\let\rMS\cachedata\ifemptydata\relax\else\IfNVOETF{\rMS}{}{\num{\rMS}\%}\fi&%
				\checkaMSa(8)\let\rMS\cachedata\ifemptydata\relax\else\IfNVOETF{\rMS}{}{\num{\rMS} \euro}\fi&%
				\IfNVOETF{\aMS}{}{\num{\aMS} \euro}\expandafter\\\fi%
				\ifdefined\aMTa\rCa{\aMTa}&%
				\checkaMTa(4)\let\rMT\cachedata\ifemptydata\relax\else\IfNVOETF{\rMT}{}{\num{\rMT}\ts{}\aMTa(5)}\fi&%
				\checkaMTa(6)\let\rMT\cachedata\ifemptydata\relax\else\IfNVOETF{\rMT}{}{\num{\rMT}}\fi&%
				\checkaMTa(7)\let\rMT\cachedata\ifemptydata\relax\else\IfNVOETF{\rMT}{}{\num{\rMT}\%}\fi&%
				\checkaMTa(8)\let\rMT\cachedata\ifemptydata\relax\else\IfNVOETF{\rMT}{}{\num{\rMT} \euro}\fi&%
				\IfNVOETF{\aMT}{}{\num{\aMT} \euro}\expandafter\\\fi%
				\ifdefined\aMUa\rCa{\aMUa}&%
				\checkaMUa(4)\let\rMU\cachedata\ifemptydata\relax\else\IfNVOETF{\rMU}{}{\num{\rMU}\ts{}\aMUa(5)}\fi&%
				\checkaMUa(6)\let\rMU\cachedata\ifemptydata\relax\else\IfNVOETF{\rMU}{}{\num{\rMU}}\fi&%
				\checkaMUa(7)\let\rMU\cachedata\ifemptydata\relax\else\IfNVOETF{\rMU}{}{\num{\rMU}\%}\fi&%
				\checkaMUa(8)\let\rMU\cachedata\ifemptydata\relax\else\IfNVOETF{\rMU}{}{\num{\rMU} \euro}\fi&%
				\IfNVOETF{\aMU}{}{\num{\aMU} \euro}\expandafter\\\fi%
				\ifdefined\aMVa\rCa{\aMVa}&%
				\checkaMVa(4)\let\rMV\cachedata\ifemptydata\relax\else\IfNVOETF{\rMV}{}{\num{\rMV}\ts{}\aMVa(5)}\fi&%
				\checkaMVa(6)\let\rMV\cachedata\ifemptydata\relax\else\IfNVOETF{\rMV}{}{\num{\rMV}}\fi&%
				\checkaMVa(7)\let\rMV\cachedata\ifemptydata\relax\else\IfNVOETF{\rMV}{}{\num{\rMV}\%}\fi&%
				\checkaMVa(8)\let\rMV\cachedata\ifemptydata\relax\else\IfNVOETF{\rMV}{}{\num{\rMV} \euro}\fi&%
				\IfNVOETF{\aMV}{}{\num{\aMV} \euro}\expandafter\\\fi%
				\ifdefined\aMWa\rCa{\aMWa}&%
				\checkaMWa(4)\let\rMW\cachedata\ifemptydata\relax\else\IfNVOETF{\rMW}{}{\num{\rMW}\ts{}\aMWa(5)}\fi&%
				\checkaMWa(6)\let\rMW\cachedata\ifemptydata\relax\else\IfNVOETF{\rMW}{}{\num{\rMW}}\fi&%
				\checkaMWa(7)\let\rMW\cachedata\ifemptydata\relax\else\IfNVOETF{\rMW}{}{\num{\rMW}\%}\fi&%
				\checkaMWa(8)\let\rMW\cachedata\ifemptydata\relax\else\IfNVOETF{\rMW}{}{\num{\rMW} \euro}\fi&%
				\IfNVOETF{\aMW}{}{\num{\aMW} \euro}\expandafter\\\fi%
				\ifdefined\aMXa\rCa{\aMXa}&%
				\checkaMXa(4)\let\rMX\cachedata\ifemptydata\relax\else\IfNVOETF{\rMX}{}{\num{\rMX}\ts{}\aMXa(5)}\fi&%
				\checkaMXa(6)\let\rMX\cachedata\ifemptydata\relax\else\IfNVOETF{\rMX}{}{\num{\rMX}}\fi&%
				\checkaMXa(7)\let\rMX\cachedata\ifemptydata\relax\else\IfNVOETF{\rMX}{}{\num{\rMX}\%}\fi&%
				\checkaMXa(8)\let\rMX\cachedata\ifemptydata\relax\else\IfNVOETF{\rMX}{}{\num{\rMX} \euro}\fi&%
				\IfNVOETF{\aMX}{}{\num{\aMX} \euro}\expandafter\\\fi%
				\ifdefined\aMYa\rCa{\aMYa}&%
				\checkaMYa(4)\let\rMY\cachedata\ifemptydata\relax\else\IfNVOETF{\rMY}{}{\num{\rMY}\ts{}\aMYa(5)}\fi&%
				\checkaMYa(6)\let\rMY\cachedata\ifemptydata\relax\else\IfNVOETF{\rMY}{}{\num{\rMY}}\fi&%
				\checkaMYa(7)\let\rMY\cachedata\ifemptydata\relax\else\IfNVOETF{\rMY}{}{\num{\rMY}\%}\fi&%
				\checkaMYa(8)\let\rMY\cachedata\ifemptydata\relax\else\IfNVOETF{\rMY}{}{\num{\rMY} \euro}\fi&%
				\IfNVOETF{\aMY}{}{\num{\aMY} \euro}\expandafter\\\fi%	
				\ifdefined\aMZa\rCa{\aMZa}&%
				\checkaMZa(4)\let\rMZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMZ}{}{\num{\rMZ}\ts{}\aMZa(5)}\fi&%
				\checkaMZa(6)\let\rMZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMZ}{}{\num{\rMZ}}\fi&%
				\checkaMZa(7)\let\rMZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMZ}{}{\num{\rMZ}\%}\fi&%
				\checkaMZa(8)\let\rMZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rMZ}{}{\num{\rMZ} \euro}\fi&%
				\IfNVOETF{\aMZ}{}{\num{\aMZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aM} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aNAa%
			\captionof{table}{\large{\textsc{\aNCaption}}}\label{tbl:asset:N}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aNAa\rCa{\aNAa}&%
				\checkaNAa(4)\let\rNA\cachedata\ifemptydata\relax\else\IfNVOETF{\rNA}{}{\num{\rNA}\ts{}\aNAa(5)}\fi&%
				\checkaNAa(6)\let\rNA\cachedata\ifemptydata\relax\else\IfNVOETF{\rNA}{}{\num{\rNA}}\fi&%
				\checkaNAa(7)\let\rNA\cachedata\ifemptydata\relax\else\IfNVOETF{\rNA}{}{\num{\rNA}\%}\fi&%
				\checkaNAa(8)\let\rNA\cachedata\ifemptydata\relax\else\IfNVOETF{\rNA}{}{\num{\rNA} \euro}\fi&%
				\IfNVOETF{\aNA}{}{\num{\aNA} \euro}\expandafter\\\fi%
				\ifdefined\aNBa\rCa{\aNBa}&%
				\checkaNBa(4)\let\rNB\cachedata\ifemptydata\relax\else\IfNVOETF{\rNB}{}{\num{\rNB}\ts{}\aNBa(5)}\fi&%
				\checkaNBa(6)\let\rNB\cachedata\ifemptydata\relax\else\IfNVOETF{\rNB}{}{\num{\rNB}}\fi&%
				\checkaNBa(7)\let\rNB\cachedata\ifemptydata\relax\else\IfNVOETF{\rNB}{}{\num{\rNB}\%}\fi&%
				\checkaNBa(8)\let\rNB\cachedata\ifemptydata\relax\else\IfNVOETF{\rNB}{}{\num{\rNB} \euro}\fi&%
				\IfNVOETF{\aNB}{}{\num{\aNB} \euro}\expandafter\\\fi%
				\ifdefined\aNCa\rCa{\aNCa}&%
				\checkaNCa(4)\let\rNC\cachedata\ifemptydata\relax\else\IfNVOETF{\rNC}{}{\num{\rNC}\ts{}\aNCa(5)}\fi&%
				\checkaNCa(6)\let\rNC\cachedata\ifemptydata\relax\else\IfNVOETF{\rNC}{}{\num{\rNC}}\fi&%
				\checkaNCa(7)\let\rNC\cachedata\ifemptydata\relax\else\IfNVOETF{\rNC}{}{\num{\rNC}\%}\fi&%
				\checkaNCa(8)\let\rNC\cachedata\ifemptydata\relax\else\IfNVOETF{\rNC}{}{\num{\rNC} \euro}\fi&%
				\IfNVOETF{\aNC}{}{\num{\aNC} \euro}\expandafter\\\fi%
				\ifdefined\aNDa\rCa{\aNDa}&%
				\checkaNDa(4)\let\rND\cachedata\ifemptydata\relax\else\IfNVOETF{\rND}{}{\num{\rND}\ts{}\aNDa(5)}\fi&%
				\checkaNDa(6)\let\rND\cachedata\ifemptydata\relax\else\IfNVOETF{\rND}{}{\num{\rND}}\fi&%
				\checkaNDa(7)\let\rND\cachedata\ifemptydata\relax\else\IfNVOETF{\rND}{}{\num{\rND}\%}\fi&%
				\checkaNDa(8)\let\rND\cachedata\ifemptydata\relax\else\IfNVOETF{\rND}{}{\num{\rND} \euro}\fi&%
				\IfNVOETF{\aND}{}{\num{\aND} \euro}\expandafter\\\fi%
				\ifdefined\aNEa\rCa{\aNEa}&%
				\checkaNEa(4)\let\rNE\cachedata\ifemptydata\relax\else\IfNVOETF{\rNE}{}{\num{\rNE}\ts{}\aNEa(5)}\fi&%
				\checkaNEa(6)\let\rNE\cachedata\ifemptydata\relax\else\IfNVOETF{\rNE}{}{\num{\rNE}}\fi&%
				\checkaNEa(7)\let\rNE\cachedata\ifemptydata\relax\else\IfNVOETF{\rNE}{}{\num{\rNE}\%}\fi&%
				\checkaNEa(8)\let\rNE\cachedata\ifemptydata\relax\else\IfNVOETF{\rNE}{}{\num{\rNE} \euro}\fi&%
				\IfNVOETF{\aNE}{}{\num{\aNE} \euro}\expandafter\\\fi%
				\ifdefined\aNFa\rCa{\aNFa}&%
				\checkaNFa(4)\let\rNF\cachedata\ifemptydata\relax\else\IfNVOETF{\rNF}{}{\num{\rNF}\ts{}\aNFa(5)}\fi&%
				\checkaNFa(6)\let\rNF\cachedata\ifemptydata\relax\else\IfNVOETF{\rNF}{}{\num{\rNF}}\fi&%
				\checkaNFa(7)\let\rNF\cachedata\ifemptydata\relax\else\IfNVOETF{\rNF}{}{\num{\rNF}\%}\fi&%
				\checkaNFa(8)\let\rNF\cachedata\ifemptydata\relax\else\IfNVOETF{\rNF}{}{\num{\rNF} \euro}\fi&%
				\IfNVOETF{\aNF}{}{\num{\aNF} \euro}\expandafter\\\fi%
				\ifdefined\aNGa\rCa{\aNGa}&%
				\checkaNGa(4)\let\rNG\cachedata\ifemptydata\relax\else\IfNVOETF{\rNG}{}{\num{\rNG}\ts{}\aNGa(5)}\fi&%
				\checkaNGa(6)\let\rNG\cachedata\ifemptydata\relax\else\IfNVOETF{\rNG}{}{\num{\rNG}}\fi&%
				\checkaNGa(7)\let\rNG\cachedata\ifemptydata\relax\else\IfNVOETF{\rNG}{}{\num{\rNG}\%}\fi&%
				\checkaNGa(8)\let\rNG\cachedata\ifemptydata\relax\else\IfNVOETF{\rNG}{}{\num{\rNG} \euro}\fi&%
				\IfNVOETF{\aNG}{}{\num{\aNG} \euro}\expandafter\\\fi%
				\ifdefined\aNIa\rCa{\aNIa}&%
				\checkaNIa(4)\let\rNI\cachedata\ifemptydata\relax\else\IfNVOETF{\rNI}{}{\num{\rNI}\ts{}\aNIa(5)}\fi&%
				\checkaNIa(6)\let\rNI\cachedata\ifemptydata\relax\else\IfNVOETF{\rNI}{}{\num{\rNI}}\fi&%
				\checkaNIa(7)\let\rNI\cachedata\ifemptydata\relax\else\IfNVOETF{\rNI}{}{\num{\rNI}\%}\fi&%
				\checkaNIa(8)\let\rNI\cachedata\ifemptydata\relax\else\IfNVOETF{\rNI}{}{\num{\rNI} \euro}\fi&%
				\IfNVOETF{\aNI}{}{\num{\aNI} \euro}\expandafter\\\fi%
				\ifdefined\aNJa\rCa{\aNJa}&%
				\checkaNJa(4)\let\rNJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNJ}{}{\num{\rNJ}\ts{}\aNJa(5)}\fi&%
				\checkaNJa(6)\let\rNJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNJ}{}{\num{\rNJ}}\fi&%
				\checkaNJa(7)\let\rNJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNJ}{}{\num{\rNJ}\%}\fi&%
				\checkaNJa(8)\let\rNJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNJ}{}{\num{\rNJ} \euro}\fi&%
				\IfNVOETF{\aNJ}{}{\num{\aNJ} \euro}\expandafter\\\fi%
				\ifdefined\aNKa\rCa{\aNKa}&%
				\checkaNKa(4)\let\rNK\cachedata\ifemptydata\relax\else\IfNVOETF{\rNK}{}{\num{\rNK}\ts{}\aNKa(5)}\fi&%
				\checkaNKa(6)\let\rNK\cachedata\ifemptydata\relax\else\IfNVOETF{\rNK}{}{\num{\rNK}}\fi&%
				\checkaNKa(7)\let\rNK\cachedata\ifemptydata\relax\else\IfNVOETF{\rNK}{}{\num{\rNK}\%}\fi&%
				\checkaNKa(8)\let\rNK\cachedata\ifemptydata\relax\else\IfNVOETF{\rNK}{}{\num{\rNK} \euro}\fi&%
				\IfNVOETF{\aNK}{}{\num{\aNK} \euro}\expandafter\\\fi%
				\ifdefined\aNLa\rCa{\aNLa}&%
				\checkaNLa(4)\let\rNL\cachedata\ifemptydata\relax\else\IfNVOETF{\rNL}{}{\num{\rNL}\ts{}\aNLa(5)}\fi&%
				\checkaNLa(6)\let\rNL\cachedata\ifemptydata\relax\else\IfNVOETF{\rNL}{}{\num{\rNL}}\fi&%
				\checkaNLa(7)\let\rNL\cachedata\ifemptydata\relax\else\IfNVOETF{\rNL}{}{\num{\rNL}\%}\fi&%
				\checkaNLa(8)\let\rNL\cachedata\ifemptydata\relax\else\IfNVOETF{\rNL}{}{\num{\rNL} \euro}\fi&%
				\IfNVOETF{\aNL}{}{\num{\aNL} \euro}\expandafter\\\fi%
				\ifdefined\aNMa\rCa{\aNMa}&%
				\checkaNMa(4)\let\rNM\cachedata\ifemptydata\relax\else\IfNVOETF{\rNM}{}{\num{\rNM}\ts{}\aNMa(5)}\fi&%
				\checkaNMa(6)\let\rNM\cachedata\ifemptydata\relax\else\IfNVOETF{\rNM}{}{\num{\rNM}}\fi&%
				\checkaNMa(7)\let\rNM\cachedata\ifemptydata\relax\else\IfNVOETF{\rNM}{}{\num{\rNM}\%}\fi&%
				\checkaNMa(8)\let\rNM\cachedata\ifemptydata\relax\else\IfNVOETF{\rNM}{}{\num{\rNM} \euro}\fi&%
				\IfNVOETF{\aNM}{}{\num{\aNM} \euro}\expandafter\\\fi%
				\ifdefined\aNNa\rCa{\aNNa}&%
				\checkaNNa(4)\let\rNN\cachedata\ifemptydata\relax\else\IfNVOETF{\rNN}{}{\num{\rNN}\ts{}\aNNa(5)}\fi&%
				\checkaNNa(6)\let\rNN\cachedata\ifemptydata\relax\else\IfNVOETF{\rNN}{}{\num{\rNN}}\fi&%
				\checkaNNa(7)\let\rNN\cachedata\ifemptydata\relax\else\IfNVOETF{\rNN}{}{\num{\rNN}\%}\fi&%
				\checkaNNa(8)\let\rNN\cachedata\ifemptydata\relax\else\IfNVOETF{\rNN}{}{\num{\rNN} \euro}\fi&%
				\IfNVOETF{\aNN}{}{\num{\aNN} \euro}\expandafter\\\fi%
				\ifdefined\aNOa\rCa{\aNOa}&%
				\checkaNOa(4)\let\rNO\cachedata\ifemptydata\relax\else\IfNVOETF{\rNO}{}{\num{\rNO}\ts{}\aNOa(5)}\fi&%
				\checkaNOa(6)\let\rNO\cachedata\ifemptydata\relax\else\IfNVOETF{\rNO}{}{\num{\rNO}}\fi&%
				\checkaNOa(7)\let\rNO\cachedata\ifemptydata\relax\else\IfNVOETF{\rNO}{}{\num{\rNO}\%}\fi&%
				\checkaNOa(8)\let\rNO\cachedata\ifemptydata\relax\else\IfNVOETF{\rNO}{}{\num{\rNO} \euro}\fi&%
				\IfNVOETF{\aNO}{}{\num{\aNO} \euro}\expandafter\\\fi%
				\ifdefined\aNPa\rCa{\aNPa}&%
				\checkaNPa(4)\let\rNP\cachedata\ifemptydata\relax\else\IfNVOETF{\rNP}{}{\num{\rNP}\ts{}\aNPa(5)}\fi&%
				\checkaNPa(6)\let\rNP\cachedata\ifemptydata\relax\else\IfNVOETF{\rNP}{}{\num{\rNP}}\fi&%
				\checkaNPa(7)\let\rNP\cachedata\ifemptydata\relax\else\IfNVOETF{\rNP}{}{\num{\rNP}\%}\fi&%
				\checkaNPa(8)\let\rNP\cachedata\ifemptydata\relax\else\IfNVOETF{\rNP}{}{\num{\rNP} \euro}\fi&%
				\IfNVOETF{\aNP}{}{\num{\aNP} \euro}\expandafter\\\fi%
				\ifdefined\aNQa\rCa{\aNQa}&%
				\checkaNQa(4)\let\rNQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNQ}{}{\num{\rNQ}\ts{}\aNQa(5)}\fi&%
				\checkaNQa(6)\let\rNQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNQ}{}{\num{\rNQ}}\fi&%
				\checkaNQa(7)\let\rNQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNQ}{}{\num{\rNQ}\%}\fi&%
				\checkaNQa(8)\let\rNQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNQ}{}{\num{\rNQ} \euro}\fi&%
				\IfNVOETF{\aNQ}{}{\num{\aNQ} \euro}\expandafter\\\fi%
				\ifdefined\aNRa\rCa{\aNRa}&%
				\checkaNRa(4)\let\rNR\cachedata\ifemptydata\relax\else\IfNVOETF{\rNR}{}{\num{\rNR}\ts{}\aNRa(5)}\fi&%
				\checkaNRa(6)\let\rNR\cachedata\ifemptydata\relax\else\IfNVOETF{\rNR}{}{\num{\rNR}}\fi&%
				\checkaNRa(7)\let\rNR\cachedata\ifemptydata\relax\else\IfNVOETF{\rNR}{}{\num{\rNR}\%}\fi&%
				\checkaNRa(8)\let\rNR\cachedata\ifemptydata\relax\else\IfNVOETF{\rNR}{}{\num{\rNR} \euro}\fi&%
				\IfNVOETF{\aNR}{}{\num{\aNR} \euro}\expandafter\\\fi%
				\ifdefined\aNSa\rCa{\aNSa}&%
				\checkaNSa(4)\let\rNS\cachedata\ifemptydata\relax\else\IfNVOETF{\rNS}{}{\num{\rNS}\ts{}\aNSa(5)}\fi&%
				\checkaNSa(6)\let\rNS\cachedata\ifemptydata\relax\else\IfNVOETF{\rNS}{}{\num{\rNS}}\fi&%
				\checkaNSa(7)\let\rNS\cachedata\ifemptydata\relax\else\IfNVOETF{\rNS}{}{\num{\rNS}\%}\fi&%
				\checkaNSa(8)\let\rNS\cachedata\ifemptydata\relax\else\IfNVOETF{\rNS}{}{\num{\rNS} \euro}\fi&%
				\IfNVOETF{\aNS}{}{\num{\aNS} \euro}\expandafter\\\fi%
				\ifdefined\aNTa\rCa{\aNTa}&%
				\checkaNTa(4)\let\rNT\cachedata\ifemptydata\relax\else\IfNVOETF{\rNT}{}{\num{\rNT}\ts{}\aNTa(5)}\fi&%
				\checkaNTa(6)\let\rNT\cachedata\ifemptydata\relax\else\IfNVOETF{\rNT}{}{\num{\rNT}}\fi&%
				\checkaNTa(7)\let\rNT\cachedata\ifemptydata\relax\else\IfNVOETF{\rNT}{}{\num{\rNT}\%}\fi&%
				\checkaNTa(8)\let\rNT\cachedata\ifemptydata\relax\else\IfNVOETF{\rNT}{}{\num{\rNT} \euro}\fi&%
				\IfNVOETF{\aNT}{}{\num{\aNT} \euro}\expandafter\\\fi%
				\ifdefined\aNUa\rCa{\aNUa}&%
				\checkaNUa(4)\let\rNU\cachedata\ifemptydata\relax\else\IfNVOETF{\rNU}{}{\num{\rNU}\ts{}\aNUa(5)}\fi&%
				\checkaNUa(6)\let\rNU\cachedata\ifemptydata\relax\else\IfNVOETF{\rNU}{}{\num{\rNU}}\fi&%
				\checkaNUa(7)\let\rNU\cachedata\ifemptydata\relax\else\IfNVOETF{\rNU}{}{\num{\rNU}\%}\fi&%
				\checkaNUa(8)\let\rNU\cachedata\ifemptydata\relax\else\IfNVOETF{\rNU}{}{\num{\rNU} \euro}\fi&%
				\IfNVOETF{\aNU}{}{\num{\aNU} \euro}\expandafter\\\fi%
				\ifdefined\aNVa\rCa{\aNVa}&%
				\checkaNVa(4)\let\rNV\cachedata\ifemptydata\relax\else\IfNVOETF{\rNV}{}{\num{\rNV}\ts{}\aNVa(5)}\fi&%
				\checkaNVa(6)\let\rNV\cachedata\ifemptydata\relax\else\IfNVOETF{\rNV}{}{\num{\rNV}}\fi&%
				\checkaNVa(7)\let\rNV\cachedata\ifemptydata\relax\else\IfNVOETF{\rNV}{}{\num{\rNV}\%}\fi&%
				\checkaNVa(8)\let\rNV\cachedata\ifemptydata\relax\else\IfNVOETF{\rNV}{}{\num{\rNV} \euro}\fi&%
				\IfNVOETF{\aNV}{}{\num{\aNV} \euro}\expandafter\\\fi%
				\ifdefined\aNWa\rCa{\aNWa}&%
				\checkaNWa(4)\let\rNW\cachedata\ifemptydata\relax\else\IfNVOETF{\rNW}{}{\num{\rNW}\ts{}\aNWa(5)}\fi&%
				\checkaNWa(6)\let\rNW\cachedata\ifemptydata\relax\else\IfNVOETF{\rNW}{}{\num{\rNW}}\fi&%
				\checkaNWa(7)\let\rNW\cachedata\ifemptydata\relax\else\IfNVOETF{\rNW}{}{\num{\rNW}\%}\fi&%
				\checkaNWa(8)\let\rNW\cachedata\ifemptydata\relax\else\IfNVOETF{\rNW}{}{\num{\rNW} \euro}\fi&%
				\IfNVOETF{\aNW}{}{\num{\aNW} \euro}\expandafter\\\fi%
				\ifdefined\aNXa\rCa{\aNXa}&%
				\checkaNXa(4)\let\rNX\cachedata\ifemptydata\relax\else\IfNVOETF{\rNX}{}{\num{\rNX}\ts{}\aNXa(5)}\fi&%
				\checkaNXa(6)\let\rNX\cachedata\ifemptydata\relax\else\IfNVOETF{\rNX}{}{\num{\rNX}}\fi&%
				\checkaNXa(7)\let\rNX\cachedata\ifemptydata\relax\else\IfNVOETF{\rNX}{}{\num{\rNX}\%}\fi&%
				\checkaNXa(8)\let\rNX\cachedata\ifemptydata\relax\else\IfNVOETF{\rNX}{}{\num{\rNX} \euro}\fi&%
				\IfNVOETF{\aNX}{}{\num{\aNX} \euro}\expandafter\\\fi%
				\ifdefined\aNYa\rCa{\aNYa}&%
				\checkaNYa(4)\let\rNY\cachedata\ifemptydata\relax\else\IfNVOETF{\rNY}{}{\num{\rNY}\ts{}\aNYa(5)}\fi&%
				\checkaNYa(6)\let\rNY\cachedata\ifemptydata\relax\else\IfNVOETF{\rNY}{}{\num{\rNY}}\fi&%
				\checkaNYa(7)\let\rNY\cachedata\ifemptydata\relax\else\IfNVOETF{\rNY}{}{\num{\rNY}\%}\fi&%
				\checkaNYa(8)\let\rNY\cachedata\ifemptydata\relax\else\IfNVOETF{\rNY}{}{\num{\rNY} \euro}\fi&%
				\IfNVOETF{\aNY}{}{\num{\aNY} \euro}\expandafter\\\fi%	
				\ifdefined\aNZa\rCa{\aNZa}&%
				\checkaNZa(4)\let\rNZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNZ}{}{\num{\rNZ}\ts{}\aNZa(5)}\fi&%
				\checkaNZa(6)\let\rNZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNZ}{}{\num{\rNZ}}\fi&%
				\checkaNZa(7)\let\rNZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNZ}{}{\num{\rNZ}\%}\fi&%
				\checkaNZa(8)\let\rNZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rNZ}{}{\num{\rNZ} \euro}\fi&%
				\IfNVOETF{\aNZ}{}{\num{\aNZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aN} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aOAa%
			\captionof{table}{\large{\textsc{\aOCaption}}}\label{tbl:asset:O}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aOAa\rCa{\aOAa}&%
				\checkaOAa(4)\let\rOA\cachedata\ifemptydata\relax\else\IfNVOETF{\rOA}{}{\num{\rOA}\ts{}\aOAa(5)}\fi&%
				\checkaOAa(6)\let\rOA\cachedata\ifemptydata\relax\else\IfNVOETF{\rOA}{}{\num{\rOA}}\fi&%
				\checkaOAa(7)\let\rOA\cachedata\ifemptydata\relax\else\IfNVOETF{\rOA}{}{\num{\rOA}\%}\fi&%
				\checkaOAa(8)\let\rOA\cachedata\ifemptydata\relax\else\IfNVOETF{\rOA}{}{\num{\rOA} \euro}\fi&%
				\IfNVOETF{\aOA}{}{\num{\aOA} \euro}\expandafter\\\fi%
				\ifdefined\aOBa\rCa{\aOBa}&%
				\checkaOBa(4)\let\rOB\cachedata\ifemptydata\relax\else\IfNVOETF{\rOB}{}{\num{\rOB}\ts{}\aOBa(5)}\fi&%
				\checkaOBa(6)\let\rOB\cachedata\ifemptydata\relax\else\IfNVOETF{\rOB}{}{\num{\rOB}}\fi&%
				\checkaOBa(7)\let\rOB\cachedata\ifemptydata\relax\else\IfNVOETF{\rOB}{}{\num{\rOB}\%}\fi&%
				\checkaOBa(8)\let\rOB\cachedata\ifemptydata\relax\else\IfNVOETF{\rOB}{}{\num{\rOB} \euro}\fi&%
				\IfNVOETF{\aOB}{}{\num{\aOB} \euro}\expandafter\\\fi%
				\ifdefined\aOCa\rCa{\aOCa}&%
				\checkaOCa(4)\let\rOC\cachedata\ifemptydata\relax\else\IfNVOETF{\rOC}{}{\num{\rOC}\ts{}\aOCa(5)}\fi&%
				\checkaOCa(6)\let\rOC\cachedata\ifemptydata\relax\else\IfNVOETF{\rOC}{}{\num{\rOC}}\fi&%
				\checkaOCa(7)\let\rOC\cachedata\ifemptydata\relax\else\IfNVOETF{\rOC}{}{\num{\rOC}\%}\fi&%
				\checkaOCa(8)\let\rOC\cachedata\ifemptydata\relax\else\IfNVOETF{\rOC}{}{\num{\rOC} \euro}\fi&%
				\IfNVOETF{\aOC}{}{\num{\aOC} \euro}\expandafter\\\fi%
				\ifdefined\aODa\rCa{\aODa}&%
				\checkaODa(4)\let\rOD\cachedata\ifemptydata\relax\else\IfNVOETF{\rOD}{}{\num{\rOD}\ts{}\aODa(5)}\fi&%
				\checkaODa(6)\let\rOD\cachedata\ifemptydata\relax\else\IfNVOETF{\rOD}{}{\num{\rOD}}\fi&%
				\checkaODa(7)\let\rOD\cachedata\ifemptydata\relax\else\IfNVOETF{\rOD}{}{\num{\rOD}\%}\fi&%
				\checkaODa(8)\let\rOD\cachedata\ifemptydata\relax\else\IfNVOETF{\rOD}{}{\num{\rOD} \euro}\fi&%
				\IfNVOETF{\aOD}{}{\num{\aOD} \euro}\expandafter\\\fi%
				\ifdefined\aOEa\rCa{\aOEa}&%
				\checkaOEa(4)\let\rOE\cachedata\ifemptydata\relax\else\IfNVOETF{\rOE}{}{\num{\rOE}\ts{}\aOEa(5)}\fi&%
				\checkaOEa(6)\let\rOE\cachedata\ifemptydata\relax\else\IfNVOETF{\rOE}{}{\num{\rOE}}\fi&%
				\checkaOEa(7)\let\rOE\cachedata\ifemptydata\relax\else\IfNVOETF{\rOE}{}{\num{\rOE}\%}\fi&%
				\checkaOEa(8)\let\rOE\cachedata\ifemptydata\relax\else\IfNVOETF{\rOE}{}{\num{\rOE} \euro}\fi&%
				\IfNVOETF{\aOE}{}{\num{\aOE} \euro}\expandafter\\\fi%
				\ifdefined\aOFa\rCa{\aOFa}&%
				\checkaOFa(4)\let\rOF\cachedata\ifemptydata\relax\else\IfNVOETF{\rOF}{}{\num{\rOF}\ts{}\aOFa(5)}\fi&%
				\checkaOFa(6)\let\rOF\cachedata\ifemptydata\relax\else\IfNVOETF{\rOF}{}{\num{\rOF}}\fi&%
				\checkaOFa(7)\let\rOF\cachedata\ifemptydata\relax\else\IfNVOETF{\rOF}{}{\num{\rOF}\%}\fi&%
				\checkaOFa(8)\let\rOF\cachedata\ifemptydata\relax\else\IfNVOETF{\rOF}{}{\num{\rOF} \euro}\fi&%
				\IfNVOETF{\aOF}{}{\num{\aOF} \euro}\expandafter\\\fi%
				\ifdefined\aOGa\rCa{\aOGa}&%
				\checkaOGa(4)\let\rOG\cachedata\ifemptydata\relax\else\IfNVOETF{\rOG}{}{\num{\rOG}\ts{}\aOGa(5)}\fi&%
				\checkaOGa(6)\let\rOG\cachedata\ifemptydata\relax\else\IfNVOETF{\rOG}{}{\num{\rOG}}\fi&%
				\checkaOGa(7)\let\rOG\cachedata\ifemptydata\relax\else\IfNVOETF{\rOG}{}{\num{\rOG}\%}\fi&%
				\checkaOGa(8)\let\rOG\cachedata\ifemptydata\relax\else\IfNVOETF{\rOG}{}{\num{\rOG} \euro}\fi&%
				\IfNVOETF{\aOG}{}{\num{\aOG} \euro}\expandafter\\\fi%
				\ifdefined\aOIa\rCa{\aOIa}&%
				\checkaOIa(4)\let\rOI\cachedata\ifemptydata\relax\else\IfNVOETF{\rOI}{}{\num{\rOI}\ts{}\aOIa(5)}\fi&%
				\checkaOIa(6)\let\rOI\cachedata\ifemptydata\relax\else\IfNVOETF{\rOI}{}{\num{\rOI}}\fi&%
				\checkaOIa(7)\let\rOI\cachedata\ifemptydata\relax\else\IfNVOETF{\rOI}{}{\num{\rOI}\%}\fi&%
				\checkaOIa(8)\let\rOI\cachedata\ifemptydata\relax\else\IfNVOETF{\rOI}{}{\num{\rOI} \euro}\fi&%
				\IfNVOETF{\aOI}{}{\num{\aOI} \euro}\expandafter\\\fi%
				\ifdefined\aOJa\rCa{\aOJa}&%
				\checkaOJa(4)\let\rOJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOJ}{}{\num{\rOJ}\ts{}\aOJa(5)}\fi&%
				\checkaOJa(6)\let\rOJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOJ}{}{\num{\rOJ}}\fi&%
				\checkaOJa(7)\let\rOJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOJ}{}{\num{\rOJ}\%}\fi&%
				\checkaOJa(8)\let\rOJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOJ}{}{\num{\rOJ} \euro}\fi&%
				\IfNVOETF{\aOJ}{}{\num{\aOJ} \euro}\expandafter\\\fi%
				\ifdefined\aOKa\rCa{\aOKa}&%
				\checkaOKa(4)\let\rOK\cachedata\ifemptydata\relax\else\IfNVOETF{\rOK}{}{\num{\rOK}\ts{}\aOKa(5)}\fi&%
				\checkaOKa(6)\let\rOK\cachedata\ifemptydata\relax\else\IfNVOETF{\rOK}{}{\num{\rOK}}\fi&%
				\checkaOKa(7)\let\rOK\cachedata\ifemptydata\relax\else\IfNVOETF{\rOK}{}{\num{\rOK}\%}\fi&%
				\checkaOKa(8)\let\rOK\cachedata\ifemptydata\relax\else\IfNVOETF{\rOK}{}{\num{\rOK} \euro}\fi&%
				\IfNVOETF{\aOK}{}{\num{\aOK} \euro}\expandafter\\\fi%
				\ifdefined\aOLa\rCa{\aOLa}&%
				\checkaOLa(4)\let\rOL\cachedata\ifemptydata\relax\else\IfNVOETF{\rOL}{}{\num{\rOL}\ts{}\aOLa(5)}\fi&%
				\checkaOLa(6)\let\rOL\cachedata\ifemptydata\relax\else\IfNVOETF{\rOL}{}{\num{\rOL}}\fi&%
				\checkaOLa(7)\let\rOL\cachedata\ifemptydata\relax\else\IfNVOETF{\rOL}{}{\num{\rOL}\%}\fi&%
				\checkaOLa(8)\let\rOL\cachedata\ifemptydata\relax\else\IfNVOETF{\rOL}{}{\num{\rOL} \euro}\fi&%
				\IfNVOETF{\aOL}{}{\num{\aOL} \euro}\expandafter\\\fi%
				\ifdefined\aOMa\rCa{\aOMa}&%
				\checkaOMa(4)\let\rOM\cachedata\ifemptydata\relax\else\IfNVOETF{\rOM}{}{\num{\rOM}\ts{}\aOMa(5)}\fi&%
				\checkaOMa(6)\let\rOM\cachedata\ifemptydata\relax\else\IfNVOETF{\rOM}{}{\num{\rOM}}\fi&%
				\checkaOMa(7)\let\rOM\cachedata\ifemptydata\relax\else\IfNVOETF{\rOM}{}{\num{\rOM}\%}\fi&%
				\checkaOMa(8)\let\rOM\cachedata\ifemptydata\relax\else\IfNVOETF{\rOM}{}{\num{\rOM} \euro}\fi&%
				\IfNVOETF{\aOM}{}{\num{\aOM} \euro}\expandafter\\\fi%
				\ifdefined\aONa\rCa{\aONa}&%
				\checkaONa(4)\let\rON\cachedata\ifemptydata\relax\else\IfNVOETF{\rON}{}{\num{\rON}\ts{}\aONa(5)}\fi&%
				\checkaONa(6)\let\rON\cachedata\ifemptydata\relax\else\IfNVOETF{\rON}{}{\num{\rON}}\fi&%
				\checkaONa(7)\let\rON\cachedata\ifemptydata\relax\else\IfNVOETF{\rON}{}{\num{\rON}\%}\fi&%
				\checkaONa(8)\let\rON\cachedata\ifemptydata\relax\else\IfNVOETF{\rON}{}{\num{\rON} \euro}\fi&%
				\IfNVOETF{\aON}{}{\num{\aON} \euro}\expandafter\\\fi%
				\ifdefined\aOOa\rCa{\aOOa}&%
				\checkaOOa(4)\let\rOO\cachedata\ifemptydata\relax\else\IfNVOETF{\rOO}{}{\num{\rOO}\ts{}\aOOa(5)}\fi&%
				\checkaOOa(6)\let\rOO\cachedata\ifemptydata\relax\else\IfNVOETF{\rOO}{}{\num{\rOO}}\fi&%
				\checkaOOa(7)\let\rOO\cachedata\ifemptydata\relax\else\IfNVOETF{\rOO}{}{\num{\rOO}\%}\fi&%
				\checkaOOa(8)\let\rOO\cachedata\ifemptydata\relax\else\IfNVOETF{\rOO}{}{\num{\rOO} \euro}\fi&%
				\IfNVOETF{\aOO}{}{\num{\aOO} \euro}\expandafter\\\fi%
				\ifdefined\aOPa\rCa{\aOPa}&%
				\checkaOPa(4)\let\rOP\cachedata\ifemptydata\relax\else\IfNVOETF{\rOP}{}{\num{\rOP}\ts{}\aOPa(5)}\fi&%
				\checkaOPa(6)\let\rOP\cachedata\ifemptydata\relax\else\IfNVOETF{\rOP}{}{\num{\rOP}}\fi&%
				\checkaOPa(7)\let\rOP\cachedata\ifemptydata\relax\else\IfNVOETF{\rOP}{}{\num{\rOP}\%}\fi&%
				\checkaOPa(8)\let\rOP\cachedata\ifemptydata\relax\else\IfNVOETF{\rOP}{}{\num{\rOP} \euro}\fi&%
				\IfNVOETF{\aOP}{}{\num{\aOP} \euro}\expandafter\\\fi%
				\ifdefined\aOQa\rCa{\aOQa}&%
				\checkaOQa(4)\let\rOQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOQ}{}{\num{\rOQ}\ts{}\aOQa(5)}\fi&%
				\checkaOQa(6)\let\rOQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOQ}{}{\num{\rOQ}}\fi&%
				\checkaOQa(7)\let\rOQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOQ}{}{\num{\rOQ}\%}\fi&%
				\checkaOQa(8)\let\rOQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOQ}{}{\num{\rOQ} \euro}\fi&%
				\IfNVOETF{\aOQ}{}{\num{\aOQ} \euro}\expandafter\\\fi%
				\ifdefined\aORa\rCa{\aORa}&%
				\checkaORa(4)\let\rOR\cachedata\ifemptydata\relax\else\IfNVOETF{\rOR}{}{\num{\rOR}\ts{}\aORa(5)}\fi&%
				\checkaORa(6)\let\rOR\cachedata\ifemptydata\relax\else\IfNVOETF{\rOR}{}{\num{\rOR}}\fi&%
				\checkaORa(7)\let\rOR\cachedata\ifemptydata\relax\else\IfNVOETF{\rOR}{}{\num{\rOR}\%}\fi&%
				\checkaORa(8)\let\rOR\cachedata\ifemptydata\relax\else\IfNVOETF{\rOR}{}{\num{\rOR} \euro}\fi&%
				\IfNVOETF{\aOR}{}{\num{\aOR} \euro}\expandafter\\\fi%
				\ifdefined\aOSa\rCa{\aOSa}&%
				\checkaOSa(4)\let\rOS\cachedata\ifemptydata\relax\else\IfNVOETF{\rOS}{}{\num{\rOS}\ts{}\aOSa(5)}\fi&%
				\checkaOSa(6)\let\rOS\cachedata\ifemptydata\relax\else\IfNVOETF{\rOS}{}{\num{\rOS}}\fi&%
				\checkaOSa(7)\let\rOS\cachedata\ifemptydata\relax\else\IfNVOETF{\rOS}{}{\num{\rOS}\%}\fi&%
				\checkaOSa(8)\let\rOS\cachedata\ifemptydata\relax\else\IfNVOETF{\rOS}{}{\num{\rOS} \euro}\fi&%
				\IfNVOETF{\aOS}{}{\num{\aOS} \euro}\expandafter\\\fi%
				\ifdefined\aOTa\rCa{\aOTa}&%
				\checkaOTa(4)\let\rOT\cachedata\ifemptydata\relax\else\IfNVOETF{\rOT}{}{\num{\rOT}\ts{}\aOTa(5)}\fi&%
				\checkaOTa(6)\let\rOT\cachedata\ifemptydata\relax\else\IfNVOETF{\rOT}{}{\num{\rOT}}\fi&%
				\checkaOTa(7)\let\rOT\cachedata\ifemptydata\relax\else\IfNVOETF{\rOT}{}{\num{\rOT}\%}\fi&%
				\checkaOTa(8)\let\rOT\cachedata\ifemptydata\relax\else\IfNVOETF{\rOT}{}{\num{\rOT} \euro}\fi&%
				\IfNVOETF{\aOT}{}{\num{\aOT} \euro}\expandafter\\\fi%
				\ifdefined\aOUa\rCa{\aOUa}&%
				\checkaOUa(4)\let\rOU\cachedata\ifemptydata\relax\else\IfNVOETF{\rOU}{}{\num{\rOU}\ts{}\aOUa(5)}\fi&%
				\checkaOUa(6)\let\rOU\cachedata\ifemptydata\relax\else\IfNVOETF{\rOU}{}{\num{\rOU}}\fi&%
				\checkaOUa(7)\let\rOU\cachedata\ifemptydata\relax\else\IfNVOETF{\rOU}{}{\num{\rOU}\%}\fi&%
				\checkaOUa(8)\let\rOU\cachedata\ifemptydata\relax\else\IfNVOETF{\rOU}{}{\num{\rOU} \euro}\fi&%
				\IfNVOETF{\aOU}{}{\num{\aOU} \euro}\expandafter\\\fi%
				\ifdefined\aOVa\rCa{\aOVa}&%
				\checkaOVa(4)\let\rOV\cachedata\ifemptydata\relax\else\IfNVOETF{\rOV}{}{\num{\rOV}\ts{}\aOVa(5)}\fi&%
				\checkaOVa(6)\let\rOV\cachedata\ifemptydata\relax\else\IfNVOETF{\rOV}{}{\num{\rOV}}\fi&%
				\checkaOVa(7)\let\rOV\cachedata\ifemptydata\relax\else\IfNVOETF{\rOV}{}{\num{\rOV}\%}\fi&%
				\checkaOVa(8)\let\rOV\cachedata\ifemptydata\relax\else\IfNVOETF{\rOV}{}{\num{\rOV} \euro}\fi&%
				\IfNVOETF{\aOV}{}{\num{\aOV} \euro}\expandafter\\\fi%
				\ifdefined\aOWa\rCa{\aOWa}&%
				\checkaOWa(4)\let\rOW\cachedata\ifemptydata\relax\else\IfNVOETF{\rOW}{}{\num{\rOW}\ts{}\aOWa(5)}\fi&%
				\checkaOWa(6)\let\rOW\cachedata\ifemptydata\relax\else\IfNVOETF{\rOW}{}{\num{\rOW}}\fi&%
				\checkaOWa(7)\let\rOW\cachedata\ifemptydata\relax\else\IfNVOETF{\rOW}{}{\num{\rOW}\%}\fi&%
				\checkaOWa(8)\let\rOW\cachedata\ifemptydata\relax\else\IfNVOETF{\rOW}{}{\num{\rOW} \euro}\fi&%
				\IfNVOETF{\aOW}{}{\num{\aOW} \euro}\expandafter\\\fi%
				\ifdefined\aOXa\rCa{\aOXa}&%
				\checkaOXa(4)\let\rOX\cachedata\ifemptydata\relax\else\IfNVOETF{\rOX}{}{\num{\rOX}\ts{}\aOXa(5)}\fi&%
				\checkaOXa(6)\let\rOX\cachedata\ifemptydata\relax\else\IfNVOETF{\rOX}{}{\num{\rOX}}\fi&%
				\checkaOXa(7)\let\rOX\cachedata\ifemptydata\relax\else\IfNVOETF{\rOX}{}{\num{\rOX}\%}\fi&%
				\checkaOXa(8)\let\rOX\cachedata\ifemptydata\relax\else\IfNVOETF{\rOX}{}{\num{\rOX} \euro}\fi&%
				\IfNVOETF{\aOX}{}{\num{\aOX} \euro}\expandafter\\\fi%
				\ifdefined\aOYa\rCa{\aOYa}&%
				\checkaOYa(4)\let\rOY\cachedata\ifemptydata\relax\else\IfNVOETF{\rOY}{}{\num{\rOY}\ts{}\aOYa(5)}\fi&%
				\checkaOYa(6)\let\rOY\cachedata\ifemptydata\relax\else\IfNVOETF{\rOY}{}{\num{\rOY}}\fi&%
				\checkaOYa(7)\let\rOY\cachedata\ifemptydata\relax\else\IfNVOETF{\rOY}{}{\num{\rOY}\%}\fi&%
				\checkaOYa(8)\let\rOY\cachedata\ifemptydata\relax\else\IfNVOETF{\rOY}{}{\num{\rOY} \euro}\fi&%
				\IfNVOETF{\aOY}{}{\num{\aOY} \euro}\expandafter\\\fi%	
				\ifdefined\aOZa\rCa{\aOZa}&%
				\checkaOZa(4)\let\rOZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOZ}{}{\num{\rOZ}\ts{}\aOZa(5)}\fi&%
				\checkaOZa(6)\let\rOZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOZ}{}{\num{\rOZ}}\fi&%
				\checkaOZa(7)\let\rOZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOZ}{}{\num{\rOZ}\%}\fi&%
				\checkaOZa(8)\let\rOZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rOZ}{}{\num{\rOZ} \euro}\fi&%
				\IfNVOETF{\aOZ}{}{\num{\aOZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aO} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aPAa%
			\captionof{table}{\large{\textsc{\aPCaption}}}\label{tbl:asset:P}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aPAa\rCa{\aPAa}&%
				\checkaPAa(4)\let\rPA\cachedata\ifemptydata\relax\else\IfNVOETF{\rPA}{}{\num{\rPA}\ts{}\aPAa(5)}\fi&%
				\checkaPAa(6)\let\rPA\cachedata\ifemptydata\relax\else\IfNVOETF{\rPA}{}{\num{\rPA}}\fi&%
				\checkaPAa(7)\let\rPA\cachedata\ifemptydata\relax\else\IfNVOETF{\rPA}{}{\num{\rPA}\%}\fi&%
				\checkaPAa(8)\let\rPA\cachedata\ifemptydata\relax\else\IfNVOETF{\rPA}{}{\num{\rPA} \euro}\fi&%
				\IfNVOETF{\aPA}{}{\num{\aPA} \euro}\expandafter\\\fi%
				\ifdefined\aPBa\rCa{\aPBa}&%
				\checkaPBa(4)\let\rPB\cachedata\ifemptydata\relax\else\IfNVOETF{\rPB}{}{\num{\rPB}\ts{}\aPBa(5)}\fi&%
				\checkaPBa(6)\let\rPB\cachedata\ifemptydata\relax\else\IfNVOETF{\rPB}{}{\num{\rPB}}\fi&%
				\checkaPBa(7)\let\rPB\cachedata\ifemptydata\relax\else\IfNVOETF{\rPB}{}{\num{\rPB}\%}\fi&%
				\checkaPBa(8)\let\rPB\cachedata\ifemptydata\relax\else\IfNVOETF{\rPB}{}{\num{\rPB} \euro}\fi&%
				\IfNVOETF{\aPB}{}{\num{\aPB} \euro}\expandafter\\\fi%
				\ifdefined\aPCa\rCa{\aPCa}&%
				\checkaPCa(4)\let\rPC\cachedata\ifemptydata\relax\else\IfNVOETF{\rPC}{}{\num{\rPC}\ts{}\aPCa(5)}\fi&%
				\checkaPCa(6)\let\rPC\cachedata\ifemptydata\relax\else\IfNVOETF{\rPC}{}{\num{\rPC}}\fi&%
				\checkaPCa(7)\let\rPC\cachedata\ifemptydata\relax\else\IfNVOETF{\rPC}{}{\num{\rPC}\%}\fi&%
				\checkaPCa(8)\let\rPC\cachedata\ifemptydata\relax\else\IfNVOETF{\rPC}{}{\num{\rPC} \euro}\fi&%
				\IfNVOETF{\aPC}{}{\num{\aPC} \euro}\expandafter\\\fi%
				\ifdefined\aPDa\rCa{\aPDa}&%
				\checkaPDa(4)\let\rPD\cachedata\ifemptydata\relax\else\IfNVOETF{\rPD}{}{\num{\rPD}\ts{}\aPDa(5)}\fi&%
				\checkaPDa(6)\let\rPD\cachedata\ifemptydata\relax\else\IfNVOETF{\rPD}{}{\num{\rPD}}\fi&%
				\checkaPDa(7)\let\rPD\cachedata\ifemptydata\relax\else\IfNVOETF{\rPD}{}{\num{\rPD}\%}\fi&%
				\checkaPDa(8)\let\rPD\cachedata\ifemptydata\relax\else\IfNVOETF{\rPD}{}{\num{\rPD} \euro}\fi&%
				\IfNVOETF{\aPD}{}{\num{\aPD} \euro}\expandafter\\\fi%
				\ifdefined\aPEa\rCa{\aPEa}&%
				\checkaPEa(4)\let\rPE\cachedata\ifemptydata\relax\else\IfNVOETF{\rPE}{}{\num{\rPE}\ts{}\aPEa(5)}\fi&%
				\checkaPEa(6)\let\rPE\cachedata\ifemptydata\relax\else\IfNVOETF{\rPE}{}{\num{\rPE}}\fi&%
				\checkaPEa(7)\let\rPE\cachedata\ifemptydata\relax\else\IfNVOETF{\rPE}{}{\num{\rPE}\%}\fi&%
				\checkaPEa(8)\let\rPE\cachedata\ifemptydata\relax\else\IfNVOETF{\rPE}{}{\num{\rPE} \euro}\fi&%
				\IfNVOETF{\aPE}{}{\num{\aPE} \euro}\expandafter\\\fi%
				\ifdefined\aPFa\rCa{\aPFa}&%
				\checkaPFa(4)\let\rPF\cachedata\ifemptydata\relax\else\IfNVOETF{\rPF}{}{\num{\rPF}\ts{}\aPFa(5)}\fi&%
				\checkaPFa(6)\let\rPF\cachedata\ifemptydata\relax\else\IfNVOETF{\rPF}{}{\num{\rPF}}\fi&%
				\checkaPFa(7)\let\rPF\cachedata\ifemptydata\relax\else\IfNVOETF{\rPF}{}{\num{\rPF}\%}\fi&%
				\checkaPFa(8)\let\rPF\cachedata\ifemptydata\relax\else\IfNVOETF{\rPF}{}{\num{\rPF} \euro}\fi&%
				\IfNVOETF{\aPF}{}{\num{\aPF} \euro}\expandafter\\\fi%
				\ifdefined\aPGa\rCa{\aPGa}&%
				\checkaPGa(4)\let\rPG\cachedata\ifemptydata\relax\else\IfNVOETF{\rPG}{}{\num{\rPG}\ts{}\aPGa(5)}\fi&%
				\checkaPGa(6)\let\rPG\cachedata\ifemptydata\relax\else\IfNVOETF{\rPG}{}{\num{\rPG}}\fi&%
				\checkaPGa(7)\let\rPG\cachedata\ifemptydata\relax\else\IfNVOETF{\rPG}{}{\num{\rPG}\%}\fi&%
				\checkaPGa(8)\let\rPG\cachedata\ifemptydata\relax\else\IfNVOETF{\rPG}{}{\num{\rPG} \euro}\fi&%
				\IfNVOETF{\aPG}{}{\num{\aPG} \euro}\expandafter\\\fi%
				\ifdefined\aPIa\rCa{\aPIa}&%
				\checkaPIa(4)\let\rPI\cachedata\ifemptydata\relax\else\IfNVOETF{\rPI}{}{\num{\rPI}\ts{}\aPIa(5)}\fi&%
				\checkaPIa(6)\let\rPI\cachedata\ifemptydata\relax\else\IfNVOETF{\rPI}{}{\num{\rPI}}\fi&%
				\checkaPIa(7)\let\rPI\cachedata\ifemptydata\relax\else\IfNVOETF{\rPI}{}{\num{\rPI}\%}\fi&%
				\checkaPIa(8)\let\rPI\cachedata\ifemptydata\relax\else\IfNVOETF{\rPI}{}{\num{\rPI} \euro}\fi&%
				\IfNVOETF{\aPI}{}{\num{\aPI} \euro}\expandafter\\\fi%
				\ifdefined\aPJa\rCa{\aPJa}&%
				\checkaPJa(4)\let\rPJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPJ}{}{\num{\rPJ}\ts{}\aPJa(5)}\fi&%
				\checkaPJa(6)\let\rPJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPJ}{}{\num{\rPJ}}\fi&%
				\checkaPJa(7)\let\rPJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPJ}{}{\num{\rPJ}\%}\fi&%
				\checkaPJa(8)\let\rPJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPJ}{}{\num{\rPJ} \euro}\fi&%
				\IfNVOETF{\aPJ}{}{\num{\aPJ} \euro}\expandafter\\\fi%
				\ifdefined\aPKa\rCa{\aPKa}&%
				\checkaPKa(4)\let\rPK\cachedata\ifemptydata\relax\else\IfNVOETF{\rPK}{}{\num{\rPK}\ts{}\aPKa(5)}\fi&%
				\checkaPKa(6)\let\rPK\cachedata\ifemptydata\relax\else\IfNVOETF{\rPK}{}{\num{\rPK}}\fi&%
				\checkaPKa(7)\let\rPK\cachedata\ifemptydata\relax\else\IfNVOETF{\rPK}{}{\num{\rPK}\%}\fi&%
				\checkaPKa(8)\let\rPK\cachedata\ifemptydata\relax\else\IfNVOETF{\rPK}{}{\num{\rPK} \euro}\fi&%
				\IfNVOETF{\aPK}{}{\num{\aPK} \euro}\expandafter\\\fi%
				\ifdefined\aPLa\rCa{\aPLa}&%
				\checkaPLa(4)\let\rPL\cachedata\ifemptydata\relax\else\IfNVOETF{\rPL}{}{\num{\rPL}\ts{}\aPLa(5)}\fi&%
				\checkaPLa(6)\let\rPL\cachedata\ifemptydata\relax\else\IfNVOETF{\rPL}{}{\num{\rPL}}\fi&%
				\checkaPLa(7)\let\rPL\cachedata\ifemptydata\relax\else\IfNVOETF{\rPL}{}{\num{\rPL}\%}\fi&%
				\checkaPLa(8)\let\rPL\cachedata\ifemptydata\relax\else\IfNVOETF{\rPL}{}{\num{\rPL} \euro}\fi&%
				\IfNVOETF{\aPL}{}{\num{\aPL} \euro}\expandafter\\\fi%
				\ifdefined\aPMa\rCa{\aPMa}&%
				\checkaPMa(4)\let\rPM\cachedata\ifemptydata\relax\else\IfNVOETF{\rPM}{}{\num{\rPM}\ts{}\aPMa(5)}\fi&%
				\checkaPMa(6)\let\rPM\cachedata\ifemptydata\relax\else\IfNVOETF{\rPM}{}{\num{\rPM}}\fi&%
				\checkaPMa(7)\let\rPM\cachedata\ifemptydata\relax\else\IfNVOETF{\rPM}{}{\num{\rPM}\%}\fi&%
				\checkaPMa(8)\let\rPM\cachedata\ifemptydata\relax\else\IfNVOETF{\rPM}{}{\num{\rPM} \euro}\fi&%
				\IfNVOETF{\aPM}{}{\num{\aPM} \euro}\expandafter\\\fi%
				\ifdefined\aPNa\rCa{\aPNa}&%
				\checkaPNa(4)\let\rPN\cachedata\ifemptydata\relax\else\IfNVOETF{\rPN}{}{\num{\rPN}\ts{}\aPNa(5)}\fi&%
				\checkaPNa(6)\let\rPN\cachedata\ifemptydata\relax\else\IfNVOETF{\rPN}{}{\num{\rPN}}\fi&%
				\checkaPNa(7)\let\rPN\cachedata\ifemptydata\relax\else\IfNVOETF{\rPN}{}{\num{\rPN}\%}\fi&%
				\checkaPNa(8)\let\rPN\cachedata\ifemptydata\relax\else\IfNVOETF{\rPN}{}{\num{\rPN} \euro}\fi&%
				\IfNVOETF{\aPN}{}{\num{\aPN} \euro}\expandafter\\\fi%
				\ifdefined\aPOa\rCa{\aPOa}&%
				\checkaPOa(4)\let\rPO\cachedata\ifemptydata\relax\else\IfNVOETF{\rPO}{}{\num{\rPO}\ts{}\aPOa(5)}\fi&%
				\checkaPOa(6)\let\rPO\cachedata\ifemptydata\relax\else\IfNVOETF{\rPO}{}{\num{\rPO}}\fi&%
				\checkaPOa(7)\let\rPO\cachedata\ifemptydata\relax\else\IfNVOETF{\rPO}{}{\num{\rPO}\%}\fi&%
				\checkaPOa(8)\let\rPO\cachedata\ifemptydata\relax\else\IfNVOETF{\rPO}{}{\num{\rPO} \euro}\fi&%
				\IfNVOETF{\aPO}{}{\num{\aPO} \euro}\expandafter\\\fi%
				\ifdefined\aPPa\rCa{\aPPa}&%
				\checkaPPa(4)\let\rPP\cachedata\ifemptydata\relax\else\IfNVOETF{\rPP}{}{\num{\rPP}\ts{}\aPPa(5)}\fi&%
				\checkaPPa(6)\let\rPP\cachedata\ifemptydata\relax\else\IfNVOETF{\rPP}{}{\num{\rPP}}\fi&%
				\checkaPPa(7)\let\rPP\cachedata\ifemptydata\relax\else\IfNVOETF{\rPP}{}{\num{\rPP}\%}\fi&%
				\checkaPPa(8)\let\rPP\cachedata\ifemptydata\relax\else\IfNVOETF{\rPP}{}{\num{\rPP} \euro}\fi&%
				\IfNVOETF{\aPP}{}{\num{\aPP} \euro}\expandafter\\\fi%
				\ifdefined\aPQa\rCa{\aPQa}&%
				\checkaPQa(4)\let\rPQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPQ}{}{\num{\rPQ}\ts{}\aPQa(5)}\fi&%
				\checkaPQa(6)\let\rPQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPQ}{}{\num{\rPQ}}\fi&%
				\checkaPQa(7)\let\rPQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPQ}{}{\num{\rPQ}\%}\fi&%
				\checkaPQa(8)\let\rPQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPQ}{}{\num{\rPQ} \euro}\fi&%
				\IfNVOETF{\aPQ}{}{\num{\aPQ} \euro}\expandafter\\\fi%
				\ifdefined\aPRa\rCa{\aPRa}&%
				\checkaPRa(4)\let\rPR\cachedata\ifemptydata\relax\else\IfNVOETF{\rPR}{}{\num{\rPR}\ts{}\aPRa(5)}\fi&%
				\checkaPRa(6)\let\rPR\cachedata\ifemptydata\relax\else\IfNVOETF{\rPR}{}{\num{\rPR}}\fi&%
				\checkaPRa(7)\let\rPR\cachedata\ifemptydata\relax\else\IfNVOETF{\rPR}{}{\num{\rPR}\%}\fi&%
				\checkaPRa(8)\let\rPR\cachedata\ifemptydata\relax\else\IfNVOETF{\rPR}{}{\num{\rPR} \euro}\fi&%
				\IfNVOETF{\aPR}{}{\num{\aPR} \euro}\expandafter\\\fi%
				\ifdefined\aPSa\rCa{\aPSa}&%
				\checkaPSa(4)\let\rPS\cachedata\ifemptydata\relax\else\IfNVOETF{\rPS}{}{\num{\rPS}\ts{}\aPSa(5)}\fi&%
				\checkaPSa(6)\let\rPS\cachedata\ifemptydata\relax\else\IfNVOETF{\rPS}{}{\num{\rPS}}\fi&%
				\checkaPSa(7)\let\rPS\cachedata\ifemptydata\relax\else\IfNVOETF{\rPS}{}{\num{\rPS}\%}\fi&%
				\checkaPSa(8)\let\rPS\cachedata\ifemptydata\relax\else\IfNVOETF{\rPS}{}{\num{\rPS} \euro}\fi&%
				\IfNVOETF{\aPS}{}{\num{\aPS} \euro}\expandafter\\\fi%
				\ifdefined\aPTa\rCa{\aPTa}&%
				\checkaPTa(4)\let\rPT\cachedata\ifemptydata\relax\else\IfNVOETF{\rPT}{}{\num{\rPT}\ts{}\aPTa(5)}\fi&%
				\checkaPTa(6)\let\rPT\cachedata\ifemptydata\relax\else\IfNVOETF{\rPT}{}{\num{\rPT}}\fi&%
				\checkaPTa(7)\let\rPT\cachedata\ifemptydata\relax\else\IfNVOETF{\rPT}{}{\num{\rPT}\%}\fi&%
				\checkaPTa(8)\let\rPT\cachedata\ifemptydata\relax\else\IfNVOETF{\rPT}{}{\num{\rPT} \euro}\fi&%
				\IfNVOETF{\aPT}{}{\num{\aPT} \euro}\expandafter\\\fi%
				\ifdefined\aPUa\rCa{\aPUa}&%
				\checkaPUa(4)\let\rPU\cachedata\ifemptydata\relax\else\IfNVOETF{\rPU}{}{\num{\rPU}\ts{}\aPUa(5)}\fi&%
				\checkaPUa(6)\let\rPU\cachedata\ifemptydata\relax\else\IfNVOETF{\rPU}{}{\num{\rPU}}\fi&%
				\checkaPUa(7)\let\rPU\cachedata\ifemptydata\relax\else\IfNVOETF{\rPU}{}{\num{\rPU}\%}\fi&%
				\checkaPUa(8)\let\rPU\cachedata\ifemptydata\relax\else\IfNVOETF{\rPU}{}{\num{\rPU} \euro}\fi&%
				\IfNVOETF{\aPU}{}{\num{\aPU} \euro}\expandafter\\\fi%
				\ifdefined\aPVa\rCa{\aPVa}&%
				\checkaPVa(4)\let\rPV\cachedata\ifemptydata\relax\else\IfNVOETF{\rPV}{}{\num{\rPV}\ts{}\aPVa(5)}\fi&%
				\checkaPVa(6)\let\rPV\cachedata\ifemptydata\relax\else\IfNVOETF{\rPV}{}{\num{\rPV}}\fi&%
				\checkaPVa(7)\let\rPV\cachedata\ifemptydata\relax\else\IfNVOETF{\rPV}{}{\num{\rPV}\%}\fi&%
				\checkaPVa(8)\let\rPV\cachedata\ifemptydata\relax\else\IfNVOETF{\rPV}{}{\num{\rPV} \euro}\fi&%
				\IfNVOETF{\aPV}{}{\num{\aPV} \euro}\expandafter\\\fi%
				\ifdefined\aPWa\rCa{\aPWa}&%
				\checkaPWa(4)\let\rPW\cachedata\ifemptydata\relax\else\IfNVOETF{\rPW}{}{\num{\rPW}\ts{}\aPWa(5)}\fi&%
				\checkaPWa(6)\let\rPW\cachedata\ifemptydata\relax\else\IfNVOETF{\rPW}{}{\num{\rPW}}\fi&%
				\checkaPWa(7)\let\rPW\cachedata\ifemptydata\relax\else\IfNVOETF{\rPW}{}{\num{\rPW}\%}\fi&%
				\checkaPWa(8)\let\rPW\cachedata\ifemptydata\relax\else\IfNVOETF{\rPW}{}{\num{\rPW} \euro}\fi&%
				\IfNVOETF{\aPW}{}{\num{\aPW} \euro}\expandafter\\\fi%
				\ifdefined\aPXa\rCa{\aPXa}&%
				\checkaPXa(4)\let\rPX\cachedata\ifemptydata\relax\else\IfNVOETF{\rPX}{}{\num{\rPX}\ts{}\aPXa(5)}\fi&%
				\checkaPXa(6)\let\rPX\cachedata\ifemptydata\relax\else\IfNVOETF{\rPX}{}{\num{\rPX}}\fi&%
				\checkaPXa(7)\let\rPX\cachedata\ifemptydata\relax\else\IfNVOETF{\rPX}{}{\num{\rPX}\%}\fi&%
				\checkaPXa(8)\let\rPX\cachedata\ifemptydata\relax\else\IfNVOETF{\rPX}{}{\num{\rPX} \euro}\fi&%
				\IfNVOETF{\aPX}{}{\num{\aPX} \euro}\expandafter\\\fi%
				\ifdefined\aPYa\rCa{\aPYa}&%
				\checkaPYa(4)\let\rPY\cachedata\ifemptydata\relax\else\IfNVOETF{\rPY}{}{\num{\rPY}\ts{}\aPYa(5)}\fi&%
				\checkaPYa(6)\let\rPY\cachedata\ifemptydata\relax\else\IfNVOETF{\rPY}{}{\num{\rPY}}\fi&%
				\checkaPYa(7)\let\rPY\cachedata\ifemptydata\relax\else\IfNVOETF{\rPY}{}{\num{\rPY}\%}\fi&%
				\checkaPYa(8)\let\rPY\cachedata\ifemptydata\relax\else\IfNVOETF{\rPY}{}{\num{\rPY} \euro}\fi&%
				\IfNVOETF{\aPY}{}{\num{\aPY} \euro}\expandafter\\\fi%	
				\ifdefined\aPZa\rCa{\aPZa}&%
				\checkaPZa(4)\let\rPZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPZ}{}{\num{\rPZ}\ts{}\aPZa(5)}\fi&%
				\checkaPZa(6)\let\rPZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPZ}{}{\num{\rPZ}}\fi&%
				\checkaPZa(7)\let\rPZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPZ}{}{\num{\rPZ}\%}\fi&%
				\checkaPZa(8)\let\rPZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rPZ}{}{\num{\rPZ} \euro}\fi&%
				\IfNVOETF{\aPZ}{}{\num{\aPZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aP} \euro    \\%
			\end{tabularx} %
			\fi%		
		\end{center}%
%		\newpage%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aQAa%
			\captionof{table}{\large{\textsc{\aQCaption}}}\label{tbl:asset:Q}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aQAa\rCa{\aQAa}&%
				\checkaQAa(4)\let\rQA\cachedata\ifemptydata\relax\else\IfNVOETF{\rQA}{}{\num{\rQA}\ts{}\aQAa(5)}\fi&%
				\checkaQAa(6)\let\rQA\cachedata\ifemptydata\relax\else\IfNVOETF{\rQA}{}{\num{\rQA}}\fi&%
				\checkaQAa(7)\let\rQA\cachedata\ifemptydata\relax\else\IfNVOETF{\rQA}{}{\num{\rQA}\%}\fi&%
				\checkaQAa(8)\let\rQA\cachedata\ifemptydata\relax\else\IfNVOETF{\rQA}{}{\num{\rQA} \euro}\fi&%
				\IfNVOETF{\aQA}{}{\num{\aQA} \euro}\expandafter\\\fi%
				\ifdefined\aQBa\rCa{\aQBa}&%
				\checkaQBa(4)\let\rQB\cachedata\ifemptydata\relax\else\IfNVOETF{\rQB}{}{\num{\rQB}\ts{}\aQBa(5)}\fi&%
				\checkaQBa(6)\let\rQB\cachedata\ifemptydata\relax\else\IfNVOETF{\rQB}{}{\num{\rQB}}\fi&%
				\checkaQBa(7)\let\rQB\cachedata\ifemptydata\relax\else\IfNVOETF{\rQB}{}{\num{\rQB}\%}\fi&%
				\checkaQBa(8)\let\rQB\cachedata\ifemptydata\relax\else\IfNVOETF{\rQB}{}{\num{\rQB} \euro}\fi&%
				\IfNVOETF{\aQB}{}{\num{\aQB} \euro}\expandafter\\\fi%
				\ifdefined\aQCa\rCa{\aQCa}&%
				\checkaQCa(4)\let\rQC\cachedata\ifemptydata\relax\else\IfNVOETF{\rQC}{}{\num{\rQC}\ts{}\aQCa(5)}\fi&%
				\checkaQCa(6)\let\rQC\cachedata\ifemptydata\relax\else\IfNVOETF{\rQC}{}{\num{\rQC}}\fi&%
				\checkaQCa(7)\let\rQC\cachedata\ifemptydata\relax\else\IfNVOETF{\rQC}{}{\num{\rQC}\%}\fi&%
				\checkaQCa(8)\let\rQC\cachedata\ifemptydata\relax\else\IfNVOETF{\rQC}{}{\num{\rQC} \euro}\fi&%
				\IfNVOETF{\aQC}{}{\num{\aQC} \euro}\expandafter\\\fi%
				\ifdefined\aQDa\rCa{\aQDa}&%
				\checkaQDa(4)\let\rQD\cachedata\ifemptydata\relax\else\IfNVOETF{\rQD}{}{\num{\rQD}\ts{}\aQDa(5)}\fi&%
				\checkaQDa(6)\let\rQD\cachedata\ifemptydata\relax\else\IfNVOETF{\rQD}{}{\num{\rQD}}\fi&%
				\checkaQDa(7)\let\rQD\cachedata\ifemptydata\relax\else\IfNVOETF{\rQD}{}{\num{\rQD}\%}\fi&%
				\checkaQDa(8)\let\rQD\cachedata\ifemptydata\relax\else\IfNVOETF{\rQD}{}{\num{\rQD} \euro}\fi&%
				\IfNVOETF{\aQD}{}{\num{\aQD} \euro}\expandafter\\\fi%
				\ifdefined\aQEa\rCa{\aQEa}&%
				\checkaQEa(4)\let\rQE\cachedata\ifemptydata\relax\else\IfNVOETF{\rQE}{}{\num{\rQE}\ts{}\aQEa(5)}\fi&%
				\checkaQEa(6)\let\rQE\cachedata\ifemptydata\relax\else\IfNVOETF{\rQE}{}{\num{\rQE}}\fi&%
				\checkaQEa(7)\let\rQE\cachedata\ifemptydata\relax\else\IfNVOETF{\rQE}{}{\num{\rQE}\%}\fi&%
				\checkaQEa(8)\let\rQE\cachedata\ifemptydata\relax\else\IfNVOETF{\rQE}{}{\num{\rQE} \euro}\fi&%
				\IfNVOETF{\aQE}{}{\num{\aQE} \euro}\expandafter\\\fi%
				\ifdefined\aQFa\rCa{\aQFa}&%
				\checkaQFa(4)\let\rQF\cachedata\ifemptydata\relax\else\IfNVOETF{\rQF}{}{\num{\rQF}\ts{}\aQFa(5)}\fi&%
				\checkaQFa(6)\let\rQF\cachedata\ifemptydata\relax\else\IfNVOETF{\rQF}{}{\num{\rQF}}\fi&%
				\checkaQFa(7)\let\rQF\cachedata\ifemptydata\relax\else\IfNVOETF{\rQF}{}{\num{\rQF}\%}\fi&%
				\checkaQFa(8)\let\rQF\cachedata\ifemptydata\relax\else\IfNVOETF{\rQF}{}{\num{\rQF} \euro}\fi&%
				\IfNVOETF{\aQF}{}{\num{\aQF} \euro}\expandafter\\\fi%
				\ifdefined\aQGa\rCa{\aQGa}&%
				\checkaQGa(4)\let\rQG\cachedata\ifemptydata\relax\else\IfNVOETF{\rQG}{}{\num{\rQG}\ts{}\aQGa(5)}\fi&%
				\checkaQGa(6)\let\rQG\cachedata\ifemptydata\relax\else\IfNVOETF{\rQG}{}{\num{\rQG}}\fi&%
				\checkaQGa(7)\let\rQG\cachedata\ifemptydata\relax\else\IfNVOETF{\rQG}{}{\num{\rQG}\%}\fi&%
				\checkaQGa(8)\let\rQG\cachedata\ifemptydata\relax\else\IfNVOETF{\rQG}{}{\num{\rQG} \euro}\fi&%
				\IfNVOETF{\aQG}{}{\num{\aQG} \euro}\expandafter\\\fi%
				\ifdefined\aQIa\rCa{\aQIa}&%
				\checkaQIa(4)\let\rQI\cachedata\ifemptydata\relax\else\IfNVOETF{\rQI}{}{\num{\rQI}\ts{}\aQIa(5)}\fi&%
				\checkaQIa(6)\let\rQI\cachedata\ifemptydata\relax\else\IfNVOETF{\rQI}{}{\num{\rQI}}\fi&%
				\checkaQIa(7)\let\rQI\cachedata\ifemptydata\relax\else\IfNVOETF{\rQI}{}{\num{\rQI}\%}\fi&%
				\checkaQIa(8)\let\rQI\cachedata\ifemptydata\relax\else\IfNVOETF{\rQI}{}{\num{\rQI} \euro}\fi&%
				\IfNVOETF{\aQI}{}{\num{\aQI} \euro}\expandafter\\\fi%
				\ifdefined\aQJa\rCa{\aQJa}&%
				\checkaQJa(4)\let\rQJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQJ}{}{\num{\rQJ}\ts{}\aQJa(5)}\fi&%
				\checkaQJa(6)\let\rQJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQJ}{}{\num{\rQJ}}\fi&%
				\checkaQJa(7)\let\rQJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQJ}{}{\num{\rQJ}\%}\fi&%
				\checkaQJa(8)\let\rQJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQJ}{}{\num{\rQJ} \euro}\fi&%
				\IfNVOETF{\aQJ}{}{\num{\aQJ} \euro}\expandafter\\\fi%
				\ifdefined\aQKa\rCa{\aQKa}&%
				\checkaQKa(4)\let\rQK\cachedata\ifemptydata\relax\else\IfNVOETF{\rQK}{}{\num{\rQK}\ts{}\aQKa(5)}\fi&%
				\checkaQKa(6)\let\rQK\cachedata\ifemptydata\relax\else\IfNVOETF{\rQK}{}{\num{\rQK}}\fi&%
				\checkaQKa(7)\let\rQK\cachedata\ifemptydata\relax\else\IfNVOETF{\rQK}{}{\num{\rQK}\%}\fi&%
				\checkaQKa(8)\let\rQK\cachedata\ifemptydata\relax\else\IfNVOETF{\rQK}{}{\num{\rQK} \euro}\fi&%
				\IfNVOETF{\aQK}{}{\num{\aQK} \euro}\expandafter\\\fi%
				\ifdefined\aQLa\rCa{\aQLa}&%
				\checkaQLa(4)\let\rQL\cachedata\ifemptydata\relax\else\IfNVOETF{\rQL}{}{\num{\rQL}\ts{}\aQLa(5)}\fi&%
				\checkaQLa(6)\let\rQL\cachedata\ifemptydata\relax\else\IfNVOETF{\rQL}{}{\num{\rQL}}\fi&%
				\checkaQLa(7)\let\rQL\cachedata\ifemptydata\relax\else\IfNVOETF{\rQL}{}{\num{\rQL}\%}\fi&%
				\checkaQLa(8)\let\rQL\cachedata\ifemptydata\relax\else\IfNVOETF{\rQL}{}{\num{\rQL} \euro}\fi&%
				\IfNVOETF{\aQL}{}{\num{\aQL} \euro}\expandafter\\\fi%
				\ifdefined\aQMa\rCa{\aQMa}&%
				\checkaQMa(4)\let\rQM\cachedata\ifemptydata\relax\else\IfNVOETF{\rQM}{}{\num{\rQM}\ts{}\aQMa(5)}\fi&%
				\checkaQMa(6)\let\rQM\cachedata\ifemptydata\relax\else\IfNVOETF{\rQM}{}{\num{\rQM}}\fi&%
				\checkaQMa(7)\let\rQM\cachedata\ifemptydata\relax\else\IfNVOETF{\rQM}{}{\num{\rQM}\%}\fi&%
				\checkaQMa(8)\let\rQM\cachedata\ifemptydata\relax\else\IfNVOETF{\rQM}{}{\num{\rQM} \euro}\fi&%
				\IfNVOETF{\aQM}{}{\num{\aQM} \euro}\expandafter\\\fi%
				\ifdefined\aQNa\rCa{\aQNa}&%
				\checkaQNa(4)\let\rQN\cachedata\ifemptydata\relax\else\IfNVOETF{\rQN}{}{\num{\rQN}\ts{}\aQNa(5)}\fi&%
				\checkaQNa(6)\let\rQN\cachedata\ifemptydata\relax\else\IfNVOETF{\rQN}{}{\num{\rQN}}\fi&%
				\checkaQNa(7)\let\rQN\cachedata\ifemptydata\relax\else\IfNVOETF{\rQN}{}{\num{\rQN}\%}\fi&%
				\checkaQNa(8)\let\rQN\cachedata\ifemptydata\relax\else\IfNVOETF{\rQN}{}{\num{\rQN} \euro}\fi&%
				\IfNVOETF{\aQN}{}{\num{\aQN} \euro}\expandafter\\\fi%
				\ifdefined\aQOa\rCa{\aQOa}&%
				\checkaQOa(4)\let\rQO\cachedata\ifemptydata\relax\else\IfNVOETF{\rQO}{}{\num{\rQO}\ts{}\aQOa(5)}\fi&%
				\checkaQOa(6)\let\rQO\cachedata\ifemptydata\relax\else\IfNVOETF{\rQO}{}{\num{\rQO}}\fi&%
				\checkaQOa(7)\let\rQO\cachedata\ifemptydata\relax\else\IfNVOETF{\rQO}{}{\num{\rQO}\%}\fi&%
				\checkaQOa(8)\let\rQO\cachedata\ifemptydata\relax\else\IfNVOETF{\rQO}{}{\num{\rQO} \euro}\fi&%
				\IfNVOETF{\aQO}{}{\num{\aQO} \euro}\expandafter\\\fi%
				\ifdefined\aQPa\rCa{\aQPa}&%
				\checkaQPa(4)\let\rQP\cachedata\ifemptydata\relax\else\IfNVOETF{\rQP}{}{\num{\rQP}\ts{}\aQPa(5)}\fi&%
				\checkaQPa(6)\let\rQP\cachedata\ifemptydata\relax\else\IfNVOETF{\rQP}{}{\num{\rQP}}\fi&%
				\checkaQPa(7)\let\rQP\cachedata\ifemptydata\relax\else\IfNVOETF{\rQP}{}{\num{\rQP}\%}\fi&%
				\checkaQPa(8)\let\rQP\cachedata\ifemptydata\relax\else\IfNVOETF{\rQP}{}{\num{\rQP} \euro}\fi&%
				\IfNVOETF{\aQP}{}{\num{\aQP} \euro}\expandafter\\\fi%
				\ifdefined\aQQa\rCa{\aQQa}&%
				\checkaQQa(4)\let\rQQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQQ}{}{\num{\rQQ}\ts{}\aQQa(5)}\fi&%
				\checkaQQa(6)\let\rQQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQQ}{}{\num{\rQQ}}\fi&%
				\checkaQQa(7)\let\rQQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQQ}{}{\num{\rQQ}\%}\fi&%
				\checkaQQa(8)\let\rQQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQQ}{}{\num{\rQQ} \euro}\fi&%
				\IfNVOETF{\aQQ}{}{\num{\aQQ} \euro}\expandafter\\\fi%
				\ifdefined\aQRa\rCa{\aQRa}&%
				\checkaQRa(4)\let\rQR\cachedata\ifemptydata\relax\else\IfNVOETF{\rQR}{}{\num{\rQR}\ts{}\aQRa(5)}\fi&%
				\checkaQRa(6)\let\rQR\cachedata\ifemptydata\relax\else\IfNVOETF{\rQR}{}{\num{\rQR}}\fi&%
				\checkaQRa(7)\let\rQR\cachedata\ifemptydata\relax\else\IfNVOETF{\rQR}{}{\num{\rQR}\%}\fi&%
				\checkaQRa(8)\let\rQR\cachedata\ifemptydata\relax\else\IfNVOETF{\rQR}{}{\num{\rQR} \euro}\fi&%
				\IfNVOETF{\aQR}{}{\num{\aQR} \euro}\expandafter\\\fi%
				\ifdefined\aQSa\rCa{\aQSa}&%
				\checkaQSa(4)\let\rQS\cachedata\ifemptydata\relax\else\IfNVOETF{\rQS}{}{\num{\rQS}\ts{}\aQSa(5)}\fi&%
				\checkaQSa(6)\let\rQS\cachedata\ifemptydata\relax\else\IfNVOETF{\rQS}{}{\num{\rQS}}\fi&%
				\checkaQSa(7)\let\rQS\cachedata\ifemptydata\relax\else\IfNVOETF{\rQS}{}{\num{\rQS}\%}\fi&%
				\checkaQSa(8)\let\rQS\cachedata\ifemptydata\relax\else\IfNVOETF{\rQS}{}{\num{\rQS} \euro}\fi&%
				\IfNVOETF{\aQS}{}{\num{\aQS} \euro}\expandafter\\\fi%
				\ifdefined\aQTa\rCa{\aQTa}&%
				\checkaQTa(4)\let\rQT\cachedata\ifemptydata\relax\else\IfNVOETF{\rQT}{}{\num{\rQT}\ts{}\aQTa(5)}\fi&%
				\checkaQTa(6)\let\rQT\cachedata\ifemptydata\relax\else\IfNVOETF{\rQT}{}{\num{\rQT}}\fi&%
				\checkaQTa(7)\let\rQT\cachedata\ifemptydata\relax\else\IfNVOETF{\rQT}{}{\num{\rQT}\%}\fi&%
				\checkaQTa(8)\let\rQT\cachedata\ifemptydata\relax\else\IfNVOETF{\rQT}{}{\num{\rQT} \euro}\fi&%
				\IfNVOETF{\aQT}{}{\num{\aQT} \euro}\expandafter\\\fi%
				\ifdefined\aQUa\rCa{\aQUa}&%
				\checkaQUa(4)\let\rQU\cachedata\ifemptydata\relax\else\IfNVOETF{\rQU}{}{\num{\rQU}\ts{}\aQUa(5)}\fi&%
				\checkaQUa(6)\let\rQU\cachedata\ifemptydata\relax\else\IfNVOETF{\rQU}{}{\num{\rQU}}\fi&%
				\checkaQUa(7)\let\rQU\cachedata\ifemptydata\relax\else\IfNVOETF{\rQU}{}{\num{\rQU}\%}\fi&%
				\checkaQUa(8)\let\rQU\cachedata\ifemptydata\relax\else\IfNVOETF{\rQU}{}{\num{\rQU} \euro}\fi&%
				\IfNVOETF{\aQU}{}{\num{\aQU} \euro}\expandafter\\\fi%
				\ifdefined\aQVa\rCa{\aQVa}&%
				\checkaQVa(4)\let\rQV\cachedata\ifemptydata\relax\else\IfNVOETF{\rQV}{}{\num{\rQV}\ts{}\aQVa(5)}\fi&%
				\checkaQVa(6)\let\rQV\cachedata\ifemptydata\relax\else\IfNVOETF{\rQV}{}{\num{\rQV}}\fi&%
				\checkaQVa(7)\let\rQV\cachedata\ifemptydata\relax\else\IfNVOETF{\rQV}{}{\num{\rQV}\%}\fi&%
				\checkaQVa(8)\let\rQV\cachedata\ifemptydata\relax\else\IfNVOETF{\rQV}{}{\num{\rQV} \euro}\fi&%
				\IfNVOETF{\aQV}{}{\num{\aQV} \euro}\expandafter\\\fi%
				\ifdefined\aQWa\rCa{\aQWa}&%
				\checkaQWa(4)\let\rQW\cachedata\ifemptydata\relax\else\IfNVOETF{\rQW}{}{\num{\rQW}\ts{}\aQWa(5)}\fi&%
				\checkaQWa(6)\let\rQW\cachedata\ifemptydata\relax\else\IfNVOETF{\rQW}{}{\num{\rQW}}\fi&%
				\checkaQWa(7)\let\rQW\cachedata\ifemptydata\relax\else\IfNVOETF{\rQW}{}{\num{\rQW}\%}\fi&%
				\checkaQWa(8)\let\rQW\cachedata\ifemptydata\relax\else\IfNVOETF{\rQW}{}{\num{\rQW} \euro}\fi&%
				\IfNVOETF{\aQW}{}{\num{\aQW} \euro}\expandafter\\\fi%
				\ifdefined\aQXa\rCa{\aQXa}&%
				\checkaQXa(4)\let\rQX\cachedata\ifemptydata\relax\else\IfNVOETF{\rQX}{}{\num{\rQX}\ts{}\aQXa(5)}\fi&%
				\checkaQXa(6)\let\rQX\cachedata\ifemptydata\relax\else\IfNVOETF{\rQX}{}{\num{\rQX}}\fi&%
				\checkaQXa(7)\let\rQX\cachedata\ifemptydata\relax\else\IfNVOETF{\rQX}{}{\num{\rQX}\%}\fi&%
				\checkaQXa(8)\let\rQX\cachedata\ifemptydata\relax\else\IfNVOETF{\rQX}{}{\num{\rQX} \euro}\fi&%
				\IfNVOETF{\aQX}{}{\num{\aQX} \euro}\expandafter\\\fi%
				\ifdefined\aQYa\rCa{\aQYa}&%
				\checkaQYa(4)\let\rQY\cachedata\ifemptydata\relax\else\IfNVOETF{\rQY}{}{\num{\rQY}\ts{}\aQYa(5)}\fi&%
				\checkaQYa(6)\let\rQY\cachedata\ifemptydata\relax\else\IfNVOETF{\rQY}{}{\num{\rQY}}\fi&%
				\checkaQYa(7)\let\rQY\cachedata\ifemptydata\relax\else\IfNVOETF{\rQY}{}{\num{\rQY}\%}\fi&%
				\checkaQYa(8)\let\rQY\cachedata\ifemptydata\relax\else\IfNVOETF{\rQY}{}{\num{\rQY} \euro}\fi&%
				\IfNVOETF{\aQY}{}{\num{\aQY} \euro}\expandafter\\\fi%	
				\ifdefined\aQZa\rCa{\aQZa}&%
				\checkaQZa(4)\let\rQZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQZ}{}{\num{\rQZ}\ts{}\aQZa(5)}\fi&%
				\checkaQZa(6)\let\rQZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQZ}{}{\num{\rQZ}}\fi&%
				\checkaQZa(7)\let\rQZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQZ}{}{\num{\rQZ}\%}\fi&%
				\checkaQZa(8)\let\rQZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rQZ}{}{\num{\rQZ} \euro}\fi&%
				\IfNVOETF{\aQZ}{}{\num{\aQZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aQ} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aRAa%
			\captionof{table}{\large{\textsc{\aRCaption}}}\label{tbl:asset:R}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aRAa\rCa{\aRAa}&%
				\checkaRAa(4)\let\rRA\cachedata\ifemptydata\relax\else\IfNVOETF{\rRA}{}{\num{\rRA}\ts{}\aRAa(5)}\fi&%
				\checkaRAa(6)\let\rRA\cachedata\ifemptydata\relax\else\IfNVOETF{\rRA}{}{\num{\rRA}}\fi&%
				\checkaRAa(7)\let\rRA\cachedata\ifemptydata\relax\else\IfNVOETF{\rRA}{}{\num{\rRA}\%}\fi&%
				\checkaRAa(8)\let\rRA\cachedata\ifemptydata\relax\else\IfNVOETF{\rRA}{}{\num{\rRA} \euro}\fi&%
				\IfNVOETF{\aRA}{}{\num{\aRA} \euro}\expandafter\\\fi%
				\ifdefined\aRBa\rCa{\aRBa}&%
				\checkaRBa(4)\let\rRB\cachedata\ifemptydata\relax\else\IfNVOETF{\rRB}{}{\num{\rRB}\ts{}\aRBa(5)}\fi&%
				\checkaRBa(6)\let\rRB\cachedata\ifemptydata\relax\else\IfNVOETF{\rRB}{}{\num{\rRB}}\fi&%
				\checkaRBa(7)\let\rRB\cachedata\ifemptydata\relax\else\IfNVOETF{\rRB}{}{\num{\rRB}\%}\fi&%
				\checkaRBa(8)\let\rRB\cachedata\ifemptydata\relax\else\IfNVOETF{\rRB}{}{\num{\rRB} \euro}\fi&%
				\IfNVOETF{\aRB}{}{\num{\aRB} \euro}\expandafter\\\fi%
				\ifdefined\aRCa\rCa{\aRCa}&%
				\checkaRCa(4)\let\rRC\cachedata\ifemptydata\relax\else\IfNVOETF{\rRC}{}{\num{\rRC}\ts{}\aRCa(5)}\fi&%
				\checkaRCa(6)\let\rRC\cachedata\ifemptydata\relax\else\IfNVOETF{\rRC}{}{\num{\rRC}}\fi&%
				\checkaRCa(7)\let\rRC\cachedata\ifemptydata\relax\else\IfNVOETF{\rRC}{}{\num{\rRC}\%}\fi&%
				\checkaRCa(8)\let\rRC\cachedata\ifemptydata\relax\else\IfNVOETF{\rRC}{}{\num{\rRC} \euro}\fi&%
				\IfNVOETF{\aRC}{}{\num{\aRC} \euro}\expandafter\\\fi%
				\ifdefined\aRDa\rCa{\aRDa}&%
				\checkaRDa(4)\let\rRD\cachedata\ifemptydata\relax\else\IfNVOETF{\rRD}{}{\num{\rRD}\ts{}\aRDa(5)}\fi&%
				\checkaRDa(6)\let\rRD\cachedata\ifemptydata\relax\else\IfNVOETF{\rRD}{}{\num{\rRD}}\fi&%
				\checkaRDa(7)\let\rRD\cachedata\ifemptydata\relax\else\IfNVOETF{\rRD}{}{\num{\rRD}\%}\fi&%
				\checkaRDa(8)\let\rRD\cachedata\ifemptydata\relax\else\IfNVOETF{\rRD}{}{\num{\rRD} \euro}\fi&%
				\IfNVOETF{\aRD}{}{\num{\aRD} \euro}\expandafter\\\fi%
				\ifdefined\aREa\rCa{\aREa}&%
				\checkaREa(4)\let\rRE\cachedata\ifemptydata\relax\else\IfNVOETF{\rRE}{}{\num{\rRE}\ts{}\aREa(5)}\fi&%
				\checkaREa(6)\let\rRE\cachedata\ifemptydata\relax\else\IfNVOETF{\rRE}{}{\num{\rRE}}\fi&%
				\checkaREa(7)\let\rRE\cachedata\ifemptydata\relax\else\IfNVOETF{\rRE}{}{\num{\rRE}\%}\fi&%
				\checkaREa(8)\let\rRE\cachedata\ifemptydata\relax\else\IfNVOETF{\rRE}{}{\num{\rRE} \euro}\fi&%
				\IfNVOETF{\aRE}{}{\num{\aRE} \euro}\expandafter\\\fi%
				\ifdefined\aRFa\rCa{\aRFa}&%
				\checkaRFa(4)\let\rRF\cachedata\ifemptydata\relax\else\IfNVOETF{\rRF}{}{\num{\rRF}\ts{}\aRFa(5)}\fi&%
				\checkaRFa(6)\let\rRF\cachedata\ifemptydata\relax\else\IfNVOETF{\rRF}{}{\num{\rRF}}\fi&%
				\checkaRFa(7)\let\rRF\cachedata\ifemptydata\relax\else\IfNVOETF{\rRF}{}{\num{\rRF}\%}\fi&%
				\checkaRFa(8)\let\rRF\cachedata\ifemptydata\relax\else\IfNVOETF{\rRF}{}{\num{\rRF} \euro}\fi&%
				\IfNVOETF{\aRF}{}{\num{\aRF} \euro}\expandafter\\\fi%
				\ifdefined\aRGa\rCa{\aRGa}&%
				\checkaRGa(4)\let\rRG\cachedata\ifemptydata\relax\else\IfNVOETF{\rRG}{}{\num{\rRG}\ts{}\aRGa(5)}\fi&%
				\checkaRGa(6)\let\rRG\cachedata\ifemptydata\relax\else\IfNVOETF{\rRG}{}{\num{\rRG}}\fi&%
				\checkaRGa(7)\let\rRG\cachedata\ifemptydata\relax\else\IfNVOETF{\rRG}{}{\num{\rRG}\%}\fi&%
				\checkaRGa(8)\let\rRG\cachedata\ifemptydata\relax\else\IfNVOETF{\rRG}{}{\num{\rRG} \euro}\fi&%
				\IfNVOETF{\aRG}{}{\num{\aRG} \euro}\expandafter\\\fi%
				\ifdefined\aRIa\rCa{\aRIa}&%
				\checkaRIa(4)\let\rRI\cachedata\ifemptydata\relax\else\IfNVOETF{\rRI}{}{\num{\rRI}\ts{}\aRIa(5)}\fi&%
				\checkaRIa(6)\let\rRI\cachedata\ifemptydata\relax\else\IfNVOETF{\rRI}{}{\num{\rRI}}\fi&%
				\checkaRIa(7)\let\rRI\cachedata\ifemptydata\relax\else\IfNVOETF{\rRI}{}{\num{\rRI}\%}\fi&%
				\checkaRIa(8)\let\rRI\cachedata\ifemptydata\relax\else\IfNVOETF{\rRI}{}{\num{\rRI} \euro}\fi&%
				\IfNVOETF{\aRI}{}{\num{\aRI} \euro}\expandafter\\\fi%
				\ifdefined\aRJa\rCa{\aRJa}&%
				\checkaRJa(4)\let\rRJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRJ}{}{\num{\rRJ}\ts{}\aRJa(5)}\fi&%
				\checkaRJa(6)\let\rRJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRJ}{}{\num{\rRJ}}\fi&%
				\checkaRJa(7)\let\rRJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRJ}{}{\num{\rRJ}\%}\fi&%
				\checkaRJa(8)\let\rRJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRJ}{}{\num{\rRJ} \euro}\fi&%
				\IfNVOETF{\aRJ}{}{\num{\aRJ} \euro}\expandafter\\\fi%
				\ifdefined\aRKa\rCa{\aRKa}&%
				\checkaRKa(4)\let\rRK\cachedata\ifemptydata\relax\else\IfNVOETF{\rRK}{}{\num{\rRK}\ts{}\aRKa(5)}\fi&%
				\checkaRKa(6)\let\rRK\cachedata\ifemptydata\relax\else\IfNVOETF{\rRK}{}{\num{\rRK}}\fi&%
				\checkaRKa(7)\let\rRK\cachedata\ifemptydata\relax\else\IfNVOETF{\rRK}{}{\num{\rRK}\%}\fi&%
				\checkaRKa(8)\let\rRK\cachedata\ifemptydata\relax\else\IfNVOETF{\rRK}{}{\num{\rRK} \euro}\fi&%
				\IfNVOETF{\aRK}{}{\num{\aRK} \euro}\expandafter\\\fi%
				\ifdefined\aRLa\rCa{\aRLa}&%
				\checkaRLa(4)\let\rRL\cachedata\ifemptydata\relax\else\IfNVOETF{\rRL}{}{\num{\rRL}\ts{}\aRLa(5)}\fi&%
				\checkaRLa(6)\let\rRL\cachedata\ifemptydata\relax\else\IfNVOETF{\rRL}{}{\num{\rRL}}\fi&%
				\checkaRLa(7)\let\rRL\cachedata\ifemptydata\relax\else\IfNVOETF{\rRL}{}{\num{\rRL}\%}\fi&%
				\checkaRLa(8)\let\rRL\cachedata\ifemptydata\relax\else\IfNVOETF{\rRL}{}{\num{\rRL} \euro}\fi&%
				\IfNVOETF{\aRL}{}{\num{\aRL} \euro}\expandafter\\\fi%
				\ifdefined\aRMa\rCa{\aRMa}&%
				\checkaRMa(4)\let\rRM\cachedata\ifemptydata\relax\else\IfNVOETF{\rRM}{}{\num{\rRM}\ts{}\aRMa(5)}\fi&%
				\checkaRMa(6)\let\rRM\cachedata\ifemptydata\relax\else\IfNVOETF{\rRM}{}{\num{\rRM}}\fi&%
				\checkaRMa(7)\let\rRM\cachedata\ifemptydata\relax\else\IfNVOETF{\rRM}{}{\num{\rRM}\%}\fi&%
				\checkaRMa(8)\let\rRM\cachedata\ifemptydata\relax\else\IfNVOETF{\rRM}{}{\num{\rRM} \euro}\fi&%
				\IfNVOETF{\aRM}{}{\num{\aRM} \euro}\expandafter\\\fi%
				\ifdefined\aRNa\rCa{\aRNa}&%
				\checkaRNa(4)\let\rRN\cachedata\ifemptydata\relax\else\IfNVOETF{\rRN}{}{\num{\rRN}\ts{}\aRNa(5)}\fi&%
				\checkaRNa(6)\let\rRN\cachedata\ifemptydata\relax\else\IfNVOETF{\rRN}{}{\num{\rRN}}\fi&%
				\checkaRNa(7)\let\rRN\cachedata\ifemptydata\relax\else\IfNVOETF{\rRN}{}{\num{\rRN}\%}\fi&%
				\checkaRNa(8)\let\rRN\cachedata\ifemptydata\relax\else\IfNVOETF{\rRN}{}{\num{\rRN} \euro}\fi&%
				\IfNVOETF{\aRN}{}{\num{\aRN} \euro}\expandafter\\\fi%
				\ifdefined\aROa\rCa{\aROa}&%
				\checkaROa(4)\let\rRO\cachedata\ifemptydata\relax\else\IfNVOETF{\rRO}{}{\num{\rRO}\ts{}\aROa(5)}\fi&%
				\checkaROa(6)\let\rRO\cachedata\ifemptydata\relax\else\IfNVOETF{\rRO}{}{\num{\rRO}}\fi&%
				\checkaROa(7)\let\rRO\cachedata\ifemptydata\relax\else\IfNVOETF{\rRO}{}{\num{\rRO}\%}\fi&%
				\checkaROa(8)\let\rRO\cachedata\ifemptydata\relax\else\IfNVOETF{\rRO}{}{\num{\rRO} \euro}\fi&%
				\IfNVOETF{\aRO}{}{\num{\aRO} \euro}\expandafter\\\fi%
				\ifdefined\aRPa\rCa{\aRPa}&%
				\checkaRPa(4)\let\rRP\cachedata\ifemptydata\relax\else\IfNVOETF{\rRP}{}{\num{\rRP}\ts{}\aRPa(5)}\fi&%
				\checkaRPa(6)\let\rRP\cachedata\ifemptydata\relax\else\IfNVOETF{\rRP}{}{\num{\rRP}}\fi&%
				\checkaRPa(7)\let\rRP\cachedata\ifemptydata\relax\else\IfNVOETF{\rRP}{}{\num{\rRP}\%}\fi&%
				\checkaRPa(8)\let\rRP\cachedata\ifemptydata\relax\else\IfNVOETF{\rRP}{}{\num{\rRP} \euro}\fi&%
				\IfNVOETF{\aRP}{}{\num{\aRP} \euro}\expandafter\\\fi%
				\ifdefined\aRQa\rCa{\aRQa}&%
				\checkaRQa(4)\let\rRQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRQ}{}{\num{\rRQ}\ts{}\aRQa(5)}\fi&%
				\checkaRQa(6)\let\rRQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRQ}{}{\num{\rRQ}}\fi&%
				\checkaRQa(7)\let\rRQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRQ}{}{\num{\rRQ}\%}\fi&%
				\checkaRQa(8)\let\rRQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRQ}{}{\num{\rRQ} \euro}\fi&%
				\IfNVOETF{\aRQ}{}{\num{\aRQ} \euro}\expandafter\\\fi%
				\ifdefined\aRRa\rCa{\aRRa}&%
				\checkaRRa(4)\let\rRR\cachedata\ifemptydata\relax\else\IfNVOETF{\rRR}{}{\num{\rRR}\ts{}\aRRa(5)}\fi&%
				\checkaRRa(6)\let\rRR\cachedata\ifemptydata\relax\else\IfNVOETF{\rRR}{}{\num{\rRR}}\fi&%
				\checkaRRa(7)\let\rRR\cachedata\ifemptydata\relax\else\IfNVOETF{\rRR}{}{\num{\rRR}\%}\fi&%
				\checkaRRa(8)\let\rRR\cachedata\ifemptydata\relax\else\IfNVOETF{\rRR}{}{\num{\rRR} \euro}\fi&%
				\IfNVOETF{\aRR}{}{\num{\aRR} \euro}\expandafter\\\fi%
				\ifdefined\aRSa\rCa{\aRSa}&%
				\checkaRSa(4)\let\rRS\cachedata\ifemptydata\relax\else\IfNVOETF{\rRS}{}{\num{\rRS}\ts{}\aRSa(5)}\fi&%
				\checkaRSa(6)\let\rRS\cachedata\ifemptydata\relax\else\IfNVOETF{\rRS}{}{\num{\rRS}}\fi&%
				\checkaRSa(7)\let\rRS\cachedata\ifemptydata\relax\else\IfNVOETF{\rRS}{}{\num{\rRS}\%}\fi&%
				\checkaRSa(8)\let\rRS\cachedata\ifemptydata\relax\else\IfNVOETF{\rRS}{}{\num{\rRS} \euro}\fi&%
				\IfNVOETF{\aRS}{}{\num{\aRS} \euro}\expandafter\\\fi%
				\ifdefined\aRTa\rCa{\aRTa}&%
				\checkaRTa(4)\let\rRT\cachedata\ifemptydata\relax\else\IfNVOETF{\rRT}{}{\num{\rRT}\ts{}\aRTa(5)}\fi&%
				\checkaRTa(6)\let\rRT\cachedata\ifemptydata\relax\else\IfNVOETF{\rRT}{}{\num{\rRT}}\fi&%
				\checkaRTa(7)\let\rRT\cachedata\ifemptydata\relax\else\IfNVOETF{\rRT}{}{\num{\rRT}\%}\fi&%
				\checkaRTa(8)\let\rRT\cachedata\ifemptydata\relax\else\IfNVOETF{\rRT}{}{\num{\rRT} \euro}\fi&%
				\IfNVOETF{\aRT}{}{\num{\aRT} \euro}\expandafter\\\fi%
				\ifdefined\aRUa\rCa{\aRUa}&%
				\checkaRUa(4)\let\rRU\cachedata\ifemptydata\relax\else\IfNVOETF{\rRU}{}{\num{\rRU}\ts{}\aRUa(5)}\fi&%
				\checkaRUa(6)\let\rRU\cachedata\ifemptydata\relax\else\IfNVOETF{\rRU}{}{\num{\rRU}}\fi&%
				\checkaRUa(7)\let\rRU\cachedata\ifemptydata\relax\else\IfNVOETF{\rRU}{}{\num{\rRU}\%}\fi&%
				\checkaRUa(8)\let\rRU\cachedata\ifemptydata\relax\else\IfNVOETF{\rRU}{}{\num{\rRU} \euro}\fi&%
				\IfNVOETF{\aRU}{}{\num{\aRU} \euro}\expandafter\\\fi%
				\ifdefined\aRVa\rCa{\aRVa}&%
				\checkaRVa(4)\let\rRV\cachedata\ifemptydata\relax\else\IfNVOETF{\rRV}{}{\num{\rRV}\ts{}\aRVa(5)}\fi&%
				\checkaRVa(6)\let\rRV\cachedata\ifemptydata\relax\else\IfNVOETF{\rRV}{}{\num{\rRV}}\fi&%
				\checkaRVa(7)\let\rRV\cachedata\ifemptydata\relax\else\IfNVOETF{\rRV}{}{\num{\rRV}\%}\fi&%
				\checkaRVa(8)\let\rRV\cachedata\ifemptydata\relax\else\IfNVOETF{\rRV}{}{\num{\rRV} \euro}\fi&%
				\IfNVOETF{\aRV}{}{\num{\aRV} \euro}\expandafter\\\fi%
				\ifdefined\aRWa\rCa{\aRWa}&%
				\checkaRWa(4)\let\rRW\cachedata\ifemptydata\relax\else\IfNVOETF{\rRW}{}{\num{\rRW}\ts{}\aRWa(5)}\fi&%
				\checkaRWa(6)\let\rRW\cachedata\ifemptydata\relax\else\IfNVOETF{\rRW}{}{\num{\rRW}}\fi&%
				\checkaRWa(7)\let\rRW\cachedata\ifemptydata\relax\else\IfNVOETF{\rRW}{}{\num{\rRW}\%}\fi&%
				\checkaRWa(8)\let\rRW\cachedata\ifemptydata\relax\else\IfNVOETF{\rRW}{}{\num{\rRW} \euro}\fi&%
				\IfNVOETF{\aRW}{}{\num{\aRW} \euro}\expandafter\\\fi%
				\ifdefined\aRXa\rCa{\aRXa}&%
				\checkaRXa(4)\let\rRX\cachedata\ifemptydata\relax\else\IfNVOETF{\rRX}{}{\num{\rRX}\ts{}\aRXa(5)}\fi&%
				\checkaRXa(6)\let\rRX\cachedata\ifemptydata\relax\else\IfNVOETF{\rRX}{}{\num{\rRX}}\fi&%
				\checkaRXa(7)\let\rRX\cachedata\ifemptydata\relax\else\IfNVOETF{\rRX}{}{\num{\rRX}\%}\fi&%
				\checkaRXa(8)\let\rRX\cachedata\ifemptydata\relax\else\IfNVOETF{\rRX}{}{\num{\rRX} \euro}\fi&%
				\IfNVOETF{\aRX}{}{\num{\aRX} \euro}\expandafter\\\fi%
				\ifdefined\aRYa\rCa{\aRYa}&%
				\checkaRYa(4)\let\rRY\cachedata\ifemptydata\relax\else\IfNVOETF{\rRY}{}{\num{\rRY}\ts{}\aRYa(5)}\fi&%
				\checkaRYa(6)\let\rRY\cachedata\ifemptydata\relax\else\IfNVOETF{\rRY}{}{\num{\rRY}}\fi&%
				\checkaRYa(7)\let\rRY\cachedata\ifemptydata\relax\else\IfNVOETF{\rRY}{}{\num{\rRY}\%}\fi&%
				\checkaRYa(8)\let\rRY\cachedata\ifemptydata\relax\else\IfNVOETF{\rRY}{}{\num{\rRY} \euro}\fi&%
				\IfNVOETF{\aRY}{}{\num{\aRY} \euro}\expandafter\\\fi%	
				\ifdefined\aRZa\rCa{\aRZa}&%
				\checkaRZa(4)\let\rRZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRZ}{}{\num{\rRZ}\ts{}\aRZa(5)}\fi&%
				\checkaRZa(6)\let\rRZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRZ}{}{\num{\rRZ}}\fi&%
				\checkaRZa(7)\let\rRZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRZ}{}{\num{\rRZ}\%}\fi&%
				\checkaRZa(8)\let\rRZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rRZ}{}{\num{\rRZ} \euro}\fi&%
				\IfNVOETF{\aRZ}{}{\num{\aRZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aR} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aSAa%
			\captionof{table}{\large{\textsc{\aSCaption}}}\label{tbl:asset:S}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aSAa\rCa{\aSAa}&%
				\checkaSAa(4)\let\rSA\cachedata\ifemptydata\relax\else\IfNVOETF{\rSA}{}{\num{\rSA}\ts{}\aSAa(5)}\fi&%
				\checkaSAa(6)\let\rSA\cachedata\ifemptydata\relax\else\IfNVOETF{\rSA}{}{\num{\rSA}}\fi&%
				\checkaSAa(7)\let\rSA\cachedata\ifemptydata\relax\else\IfNVOETF{\rSA}{}{\num{\rSA}\%}\fi&%
				\checkaSAa(8)\let\rSA\cachedata\ifemptydata\relax\else\IfNVOETF{\rSA}{}{\num{\rSA} \euro}\fi&%
				\IfNVOETF{\aSA}{}{\num{\aSA} \euro}\expandafter\\\fi%
				\ifdefined\aSBa\rCa{\aSBa}&%
				\checkaSBa(4)\let\rSB\cachedata\ifemptydata\relax\else\IfNVOETF{\rSB}{}{\num{\rSB}\ts{}\aSBa(5)}\fi&%
				\checkaSBa(6)\let\rSB\cachedata\ifemptydata\relax\else\IfNVOETF{\rSB}{}{\num{\rSB}}\fi&%
				\checkaSBa(7)\let\rSB\cachedata\ifemptydata\relax\else\IfNVOETF{\rSB}{}{\num{\rSB}\%}\fi&%
				\checkaSBa(8)\let\rSB\cachedata\ifemptydata\relax\else\IfNVOETF{\rSB}{}{\num{\rSB} \euro}\fi&%
				\IfNVOETF{\aSB}{}{\num{\aSB} \euro}\expandafter\\\fi%
				\ifdefined\aSCa\rCa{\aSCa}&%
				\checkaSCa(4)\let\rSC\cachedata\ifemptydata\relax\else\IfNVOETF{\rSC}{}{\num{\rSC}\ts{}\aSCa(5)}\fi&%
				\checkaSCa(6)\let\rSC\cachedata\ifemptydata\relax\else\IfNVOETF{\rSC}{}{\num{\rSC}}\fi&%
				\checkaSCa(7)\let\rSC\cachedata\ifemptydata\relax\else\IfNVOETF{\rSC}{}{\num{\rSC}\%}\fi&%
				\checkaSCa(8)\let\rSC\cachedata\ifemptydata\relax\else\IfNVOETF{\rSC}{}{\num{\rSC} \euro}\fi&%
				\IfNVOETF{\aSC}{}{\num{\aSC} \euro}\expandafter\\\fi%
				\ifdefined\aSDa\rCa{\aSDa}&%
				\checkaSDa(4)\let\rSD\cachedata\ifemptydata\relax\else\IfNVOETF{\rSD}{}{\num{\rSD}\ts{}\aSDa(5)}\fi&%
				\checkaSDa(6)\let\rSD\cachedata\ifemptydata\relax\else\IfNVOETF{\rSD}{}{\num{\rSD}}\fi&%
				\checkaSDa(7)\let\rSD\cachedata\ifemptydata\relax\else\IfNVOETF{\rSD}{}{\num{\rSD}\%}\fi&%
				\checkaSDa(8)\let\rSD\cachedata\ifemptydata\relax\else\IfNVOETF{\rSD}{}{\num{\rSD} \euro}\fi&%
				\IfNVOETF{\aSD}{}{\num{\aSD} \euro}\expandafter\\\fi%
				\ifdefined\aSEa\rCa{\aSEa}&%
				\checkaSEa(4)\let\rSE\cachedata\ifemptydata\relax\else\IfNVOETF{\rSE}{}{\num{\rSE}\ts{}\aSEa(5)}\fi&%
				\checkaSEa(6)\let\rSE\cachedata\ifemptydata\relax\else\IfNVOETF{\rSE}{}{\num{\rSE}}\fi&%
				\checkaSEa(7)\let\rSE\cachedata\ifemptydata\relax\else\IfNVOETF{\rSE}{}{\num{\rSE}\%}\fi&%
				\checkaSEa(8)\let\rSE\cachedata\ifemptydata\relax\else\IfNVOETF{\rSE}{}{\num{\rSE} \euro}\fi&%
				\IfNVOETF{\aSE}{}{\num{\aSE} \euro}\expandafter\\\fi%
				\ifdefined\aSFa\rCa{\aSFa}&%
				\checkaSFa(4)\let\rSF\cachedata\ifemptydata\relax\else\IfNVOETF{\rSF}{}{\num{\rSF}\ts{}\aSFa(5)}\fi&%
				\checkaSFa(6)\let\rSF\cachedata\ifemptydata\relax\else\IfNVOETF{\rSF}{}{\num{\rSF}}\fi&%
				\checkaSFa(7)\let\rSF\cachedata\ifemptydata\relax\else\IfNVOETF{\rSF}{}{\num{\rSF}\%}\fi&%
				\checkaSFa(8)\let\rSF\cachedata\ifemptydata\relax\else\IfNVOETF{\rSF}{}{\num{\rSF} \euro}\fi&%
				\IfNVOETF{\aSF}{}{\num{\aSF} \euro}\expandafter\\\fi%
				\ifdefined\aSGa\rCa{\aSGa}&%
				\checkaSGa(4)\let\rSG\cachedata\ifemptydata\relax\else\IfNVOETF{\rSG}{}{\num{\rSG}\ts{}\aSGa(5)}\fi&%
				\checkaSGa(6)\let\rSG\cachedata\ifemptydata\relax\else\IfNVOETF{\rSG}{}{\num{\rSG}}\fi&%
				\checkaSGa(7)\let\rSG\cachedata\ifemptydata\relax\else\IfNVOETF{\rSG}{}{\num{\rSG}\%}\fi&%
				\checkaSGa(8)\let\rSG\cachedata\ifemptydata\relax\else\IfNVOETF{\rSG}{}{\num{\rSG} \euro}\fi&%
				\IfNVOETF{\aSG}{}{\num{\aSG} \euro}\expandafter\\\fi%
				\ifdefined\aSIa\rCa{\aSIa}&%
				\checkaSIa(4)\let\rSI\cachedata\ifemptydata\relax\else\IfNVOETF{\rSI}{}{\num{\rSI}\ts{}\aSIa(5)}\fi&%
				\checkaSIa(6)\let\rSI\cachedata\ifemptydata\relax\else\IfNVOETF{\rSI}{}{\num{\rSI}}\fi&%
				\checkaSIa(7)\let\rSI\cachedata\ifemptydata\relax\else\IfNVOETF{\rSI}{}{\num{\rSI}\%}\fi&%
				\checkaSIa(8)\let\rSI\cachedata\ifemptydata\relax\else\IfNVOETF{\rSI}{}{\num{\rSI} \euro}\fi&%
				\IfNVOETF{\aSI}{}{\num{\aSI} \euro}\expandafter\\\fi%
				\ifdefined\aSJa\rCa{\aSJa}&%
				\checkaSJa(4)\let\rSJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSJ}{}{\num{\rSJ}\ts{}\aSJa(5)}\fi&%
				\checkaSJa(6)\let\rSJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSJ}{}{\num{\rSJ}}\fi&%
				\checkaSJa(7)\let\rSJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSJ}{}{\num{\rSJ}\%}\fi&%
				\checkaSJa(8)\let\rSJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSJ}{}{\num{\rSJ} \euro}\fi&%
				\IfNVOETF{\aSJ}{}{\num{\aSJ} \euro}\expandafter\\\fi%
				\ifdefined\aSKa\rCa{\aSKa}&%
				\checkaSKa(4)\let\rSK\cachedata\ifemptydata\relax\else\IfNVOETF{\rSK}{}{\num{\rSK}\ts{}\aSKa(5)}\fi&%
				\checkaSKa(6)\let\rSK\cachedata\ifemptydata\relax\else\IfNVOETF{\rSK}{}{\num{\rSK}}\fi&%
				\checkaSKa(7)\let\rSK\cachedata\ifemptydata\relax\else\IfNVOETF{\rSK}{}{\num{\rSK}\%}\fi&%
				\checkaSKa(8)\let\rSK\cachedata\ifemptydata\relax\else\IfNVOETF{\rSK}{}{\num{\rSK} \euro}\fi&%
				\IfNVOETF{\aSK}{}{\num{\aSK} \euro}\expandafter\\\fi%
				\ifdefined\aSLa\rCa{\aSLa}&%
				\checkaSLa(4)\let\rSL\cachedata\ifemptydata\relax\else\IfNVOETF{\rSL}{}{\num{\rSL}\ts{}\aSLa(5)}\fi&%
				\checkaSLa(6)\let\rSL\cachedata\ifemptydata\relax\else\IfNVOETF{\rSL}{}{\num{\rSL}}\fi&%
				\checkaSLa(7)\let\rSL\cachedata\ifemptydata\relax\else\IfNVOETF{\rSL}{}{\num{\rSL}\%}\fi&%
				\checkaSLa(8)\let\rSL\cachedata\ifemptydata\relax\else\IfNVOETF{\rSL}{}{\num{\rSL} \euro}\fi&%
				\IfNVOETF{\aSL}{}{\num{\aSL} \euro}\expandafter\\\fi%
				\ifdefined\aSMa\rCa{\aSMa}&%
				\checkaSMa(4)\let\rSM\cachedata\ifemptydata\relax\else\IfNVOETF{\rSM}{}{\num{\rSM}\ts{}\aSMa(5)}\fi&%
				\checkaSMa(6)\let\rSM\cachedata\ifemptydata\relax\else\IfNVOETF{\rSM}{}{\num{\rSM}}\fi&%
				\checkaSMa(7)\let\rSM\cachedata\ifemptydata\relax\else\IfNVOETF{\rSM}{}{\num{\rSM}\%}\fi&%
				\checkaSMa(8)\let\rSM\cachedata\ifemptydata\relax\else\IfNVOETF{\rSM}{}{\num{\rSM} \euro}\fi&%
				\IfNVOETF{\aSM}{}{\num{\aSM} \euro}\expandafter\\\fi%
				\ifdefined\aSNa\rCa{\aSNa}&%
				\checkaSNa(4)\let\rSN\cachedata\ifemptydata\relax\else\IfNVOETF{\rSN}{}{\num{\rSN}\ts{}\aSNa(5)}\fi&%
				\checkaSNa(6)\let\rSN\cachedata\ifemptydata\relax\else\IfNVOETF{\rSN}{}{\num{\rSN}}\fi&%
				\checkaSNa(7)\let\rSN\cachedata\ifemptydata\relax\else\IfNVOETF{\rSN}{}{\num{\rSN}\%}\fi&%
				\checkaSNa(8)\let\rSN\cachedata\ifemptydata\relax\else\IfNVOETF{\rSN}{}{\num{\rSN} \euro}\fi&%
				\IfNVOETF{\aSN}{}{\num{\aSN} \euro}\expandafter\\\fi%
				\ifdefined\aSOa\rCa{\aSOa}&%
				\checkaSOa(4)\let\rSO\cachedata\ifemptydata\relax\else\IfNVOETF{\rSO}{}{\num{\rSO}\ts{}\aSOa(5)}\fi&%
				\checkaSOa(6)\let\rSO\cachedata\ifemptydata\relax\else\IfNVOETF{\rSO}{}{\num{\rSO}}\fi&%
				\checkaSOa(7)\let\rSO\cachedata\ifemptydata\relax\else\IfNVOETF{\rSO}{}{\num{\rSO}\%}\fi&%
				\checkaSOa(8)\let\rSO\cachedata\ifemptydata\relax\else\IfNVOETF{\rSO}{}{\num{\rSO} \euro}\fi&%
				\IfNVOETF{\aSO}{}{\num{\aSO} \euro}\expandafter\\\fi%
				\ifdefined\aSPa\rCa{\aSPa}&%
				\checkaSPa(4)\let\rSP\cachedata\ifemptydata\relax\else\IfNVOETF{\rSP}{}{\num{\rSP}\ts{}\aSPa(5)}\fi&%
				\checkaSPa(6)\let\rSP\cachedata\ifemptydata\relax\else\IfNVOETF{\rSP}{}{\num{\rSP}}\fi&%
				\checkaSPa(7)\let\rSP\cachedata\ifemptydata\relax\else\IfNVOETF{\rSP}{}{\num{\rSP}\%}\fi&%
				\checkaSPa(8)\let\rSP\cachedata\ifemptydata\relax\else\IfNVOETF{\rSP}{}{\num{\rSP} \euro}\fi&%
				\IfNVOETF{\aSP}{}{\num{\aSP} \euro}\expandafter\\\fi%
				\ifdefined\aSQa\rCa{\aSQa}&%
				\checkaSQa(4)\let\rSQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSQ}{}{\num{\rSQ}\ts{}\aSQa(5)}\fi&%
				\checkaSQa(6)\let\rSQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSQ}{}{\num{\rSQ}}\fi&%
				\checkaSQa(7)\let\rSQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSQ}{}{\num{\rSQ}\%}\fi&%
				\checkaSQa(8)\let\rSQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSQ}{}{\num{\rSQ} \euro}\fi&%
				\IfNVOETF{\aSQ}{}{\num{\aSQ} \euro}\expandafter\\\fi%
				\ifdefined\aSRa\rCa{\aSRa}&%
				\checkaSRa(4)\let\rSR\cachedata\ifemptydata\relax\else\IfNVOETF{\rSR}{}{\num{\rSR}\ts{}\aSRa(5)}\fi&%
				\checkaSRa(6)\let\rSR\cachedata\ifemptydata\relax\else\IfNVOETF{\rSR}{}{\num{\rSR}}\fi&%
				\checkaSRa(7)\let\rSR\cachedata\ifemptydata\relax\else\IfNVOETF{\rSR}{}{\num{\rSR}\%}\fi&%
				\checkaSRa(8)\let\rSR\cachedata\ifemptydata\relax\else\IfNVOETF{\rSR}{}{\num{\rSR} \euro}\fi&%
				\IfNVOETF{\aSR}{}{\num{\aSR} \euro}\expandafter\\\fi%
				\ifdefined\aSSa\rCa{\aSSa}&%
				\checkaSSa(4)\let\rSS\cachedata\ifemptydata\relax\else\IfNVOETF{\rSS}{}{\num{\rSS}\ts{}\aSSa(5)}\fi&%
				\checkaSSa(6)\let\rSS\cachedata\ifemptydata\relax\else\IfNVOETF{\rSS}{}{\num{\rSS}}\fi&%
				\checkaSSa(7)\let\rSS\cachedata\ifemptydata\relax\else\IfNVOETF{\rSS}{}{\num{\rSS}\%}\fi&%
				\checkaSSa(8)\let\rSS\cachedata\ifemptydata\relax\else\IfNVOETF{\rSS}{}{\num{\rSS} \euro}\fi&%
				\IfNVOETF{\aSS}{}{\num{\aSS} \euro}\expandafter\\\fi%
				\ifdefined\aSTa\rCa{\aSTa}&%
				\checkaSTa(4)\let\rST\cachedata\ifemptydata\relax\else\IfNVOETF{\rST}{}{\num{\rST}\ts{}\aSTa(5)}\fi&%
				\checkaSTa(6)\let\rST\cachedata\ifemptydata\relax\else\IfNVOETF{\rST}{}{\num{\rST}}\fi&%
				\checkaSTa(7)\let\rST\cachedata\ifemptydata\relax\else\IfNVOETF{\rST}{}{\num{\rST}\%}\fi&%
				\checkaSTa(8)\let\rST\cachedata\ifemptydata\relax\else\IfNVOETF{\rST}{}{\num{\rST} \euro}\fi&%
				\IfNVOETF{\aST}{}{\num{\aST} \euro}\expandafter\\\fi%
				\ifdefined\aSUa\rCa{\aSUa}&%
				\checkaSUa(4)\let\rSU\cachedata\ifemptydata\relax\else\IfNVOETF{\rSU}{}{\num{\rSU}\ts{}\aSUa(5)}\fi&%
				\checkaSUa(6)\let\rSU\cachedata\ifemptydata\relax\else\IfNVOETF{\rSU}{}{\num{\rSU}}\fi&%
				\checkaSUa(7)\let\rSU\cachedata\ifemptydata\relax\else\IfNVOETF{\rSU}{}{\num{\rSU}\%}\fi&%
				\checkaSUa(8)\let\rSU\cachedata\ifemptydata\relax\else\IfNVOETF{\rSU}{}{\num{\rSU} \euro}\fi&%
				\IfNVOETF{\aSU}{}{\num{\aSU} \euro}\expandafter\\\fi%
				\ifdefined\aSVa\rCa{\aSVa}&%
				\checkaSVa(4)\let\rSV\cachedata\ifemptydata\relax\else\IfNVOETF{\rSV}{}{\num{\rSV}\ts{}\aSVa(5)}\fi&%
				\checkaSVa(6)\let\rSV\cachedata\ifemptydata\relax\else\IfNVOETF{\rSV}{}{\num{\rSV}}\fi&%
				\checkaSVa(7)\let\rSV\cachedata\ifemptydata\relax\else\IfNVOETF{\rSV}{}{\num{\rSV}\%}\fi&%
				\checkaSVa(8)\let\rSV\cachedata\ifemptydata\relax\else\IfNVOETF{\rSV}{}{\num{\rSV} \euro}\fi&%
				\IfNVOETF{\aSV}{}{\num{\aSV} \euro}\expandafter\\\fi%
				\ifdefined\aSWa\rCa{\aSWa}&%
				\checkaSWa(4)\let\rSW\cachedata\ifemptydata\relax\else\IfNVOETF{\rSW}{}{\num{\rSW}\ts{}\aSWa(5)}\fi&%
				\checkaSWa(6)\let\rSW\cachedata\ifemptydata\relax\else\IfNVOETF{\rSW}{}{\num{\rSW}}\fi&%
				\checkaSWa(7)\let\rSW\cachedata\ifemptydata\relax\else\IfNVOETF{\rSW}{}{\num{\rSW}\%}\fi&%
				\checkaSWa(8)\let\rSW\cachedata\ifemptydata\relax\else\IfNVOETF{\rSW}{}{\num{\rSW} \euro}\fi&%
				\IfNVOETF{\aSW}{}{\num{\aSW} \euro}\expandafter\\\fi%
				\ifdefined\aSXa\rCa{\aSXa}&%
				\checkaSXa(4)\let\rSX\cachedata\ifemptydata\relax\else\IfNVOETF{\rSX}{}{\num{\rSX}\ts{}\aSXa(5)}\fi&%
				\checkaSXa(6)\let\rSX\cachedata\ifemptydata\relax\else\IfNVOETF{\rSX}{}{\num{\rSX}}\fi&%
				\checkaSXa(7)\let\rSX\cachedata\ifemptydata\relax\else\IfNVOETF{\rSX}{}{\num{\rSX}\%}\fi&%
				\checkaSXa(8)\let\rSX\cachedata\ifemptydata\relax\else\IfNVOETF{\rSX}{}{\num{\rSX} \euro}\fi&%
				\IfNVOETF{\aSX}{}{\num{\aSX} \euro}\expandafter\\\fi%
				\ifdefined\aSYa\rCa{\aSYa}&%
				\checkaSYa(4)\let\rSY\cachedata\ifemptydata\relax\else\IfNVOETF{\rSY}{}{\num{\rSY}\ts{}\aSYa(5)}\fi&%
				\checkaSYa(6)\let\rSY\cachedata\ifemptydata\relax\else\IfNVOETF{\rSY}{}{\num{\rSY}}\fi&%
				\checkaSYa(7)\let\rSY\cachedata\ifemptydata\relax\else\IfNVOETF{\rSY}{}{\num{\rSY}\%}\fi&%
				\checkaSYa(8)\let\rSY\cachedata\ifemptydata\relax\else\IfNVOETF{\rSY}{}{\num{\rSY} \euro}\fi&%
				\IfNVOETF{\aSY}{}{\num{\aSY} \euro}\expandafter\\\fi%	
				\ifdefined\aSZa\rCa{\aSZa}&%
				\checkaSZa(4)\let\rSZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSZ}{}{\num{\rSZ}\ts{}\aSZa(5)}\fi&%
				\checkaSZa(6)\let\rSZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSZ}{}{\num{\rSZ}}\fi&%
				\checkaSZa(7)\let\rSZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSZ}{}{\num{\rSZ}\%}\fi&%
				\checkaSZa(8)\let\rSZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rSZ}{}{\num{\rSZ} \euro}\fi&%
				\IfNVOETF{\aSZ}{}{\num{\aSZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aS} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aTAa%
			\captionof{table}{\large{\textsc{\aTCaption}}}\label{tbl:asset:T}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aTAa\rCa{\aTAa}&%
				\checkaTAa(4)\let\rTA\cachedata\ifemptydata\relax\else\IfNVOETF{\rTA}{}{\num{\rTA}\ts{}\aTAa(5)}\fi&%
				\checkaTAa(6)\let\rTA\cachedata\ifemptydata\relax\else\IfNVOETF{\rTA}{}{\num{\rTA}}\fi&%
				\checkaTAa(7)\let\rTA\cachedata\ifemptydata\relax\else\IfNVOETF{\rTA}{}{\num{\rTA}\%}\fi&%
				\checkaTAa(8)\let\rTA\cachedata\ifemptydata\relax\else\IfNVOETF{\rTA}{}{\num{\rTA} \euro}\fi&%
				\IfNVOETF{\aTA}{}{\num{\aTA} \euro}\expandafter\\\fi%
				\ifdefined\aTBa\rCa{\aTBa}&%
				\checkaTBa(4)\let\rTB\cachedata\ifemptydata\relax\else\IfNVOETF{\rTB}{}{\num{\rTB}\ts{}\aTBa(5)}\fi&%
				\checkaTBa(6)\let\rTB\cachedata\ifemptydata\relax\else\IfNVOETF{\rTB}{}{\num{\rTB}}\fi&%
				\checkaTBa(7)\let\rTB\cachedata\ifemptydata\relax\else\IfNVOETF{\rTB}{}{\num{\rTB}\%}\fi&%
				\checkaTBa(8)\let\rTB\cachedata\ifemptydata\relax\else\IfNVOETF{\rTB}{}{\num{\rTB} \euro}\fi&%
				\IfNVOETF{\aTB}{}{\num{\aTB} \euro}\expandafter\\\fi%
				\ifdefined\aTCa\rCa{\aTCa}&%
				\checkaTCa(4)\let\rTC\cachedata\ifemptydata\relax\else\IfNVOETF{\rTC}{}{\num{\rTC}\ts{}\aTCa(5)}\fi&%
				\checkaTCa(6)\let\rTC\cachedata\ifemptydata\relax\else\IfNVOETF{\rTC}{}{\num{\rTC}}\fi&%
				\checkaTCa(7)\let\rTC\cachedata\ifemptydata\relax\else\IfNVOETF{\rTC}{}{\num{\rTC}\%}\fi&%
				\checkaTCa(8)\let\rTC\cachedata\ifemptydata\relax\else\IfNVOETF{\rTC}{}{\num{\rTC} \euro}\fi&%
				\IfNVOETF{\aTC}{}{\num{\aTC} \euro}\expandafter\\\fi%
				\ifdefined\aTDa\rCa{\aTDa}&%
				\checkaTDa(4)\let\rTD\cachedata\ifemptydata\relax\else\IfNVOETF{\rTD}{}{\num{\rTD}\ts{}\aTDa(5)}\fi&%
				\checkaTDa(6)\let\rTD\cachedata\ifemptydata\relax\else\IfNVOETF{\rTD}{}{\num{\rTD}}\fi&%
				\checkaTDa(7)\let\rTD\cachedata\ifemptydata\relax\else\IfNVOETF{\rTD}{}{\num{\rTD}\%}\fi&%
				\checkaTDa(8)\let\rTD\cachedata\ifemptydata\relax\else\IfNVOETF{\rTD}{}{\num{\rTD} \euro}\fi&%
				\IfNVOETF{\aTD}{}{\num{\aTD} \euro}\expandafter\\\fi%
				\ifdefined\aTEa\rCa{\aTEa}&%
				\checkaTEa(4)\let\rTE\cachedata\ifemptydata\relax\else\IfNVOETF{\rTE}{}{\num{\rTE}\ts{}\aTEa(5)}\fi&%
				\checkaTEa(6)\let\rTE\cachedata\ifemptydata\relax\else\IfNVOETF{\rTE}{}{\num{\rTE}}\fi&%
				\checkaTEa(7)\let\rTE\cachedata\ifemptydata\relax\else\IfNVOETF{\rTE}{}{\num{\rTE}\%}\fi&%
				\checkaTEa(8)\let\rTE\cachedata\ifemptydata\relax\else\IfNVOETF{\rTE}{}{\num{\rTE} \euro}\fi&%
				\IfNVOETF{\aTE}{}{\num{\aTE} \euro}\expandafter\\\fi%
				\ifdefined\aTFa\rCa{\aTFa}&%
				\checkaTFa(4)\let\rTF\cachedata\ifemptydata\relax\else\IfNVOETF{\rTF}{}{\num{\rTF}\ts{}\aTFa(5)}\fi&%
				\checkaTFa(6)\let\rTF\cachedata\ifemptydata\relax\else\IfNVOETF{\rTF}{}{\num{\rTF}}\fi&%
				\checkaTFa(7)\let\rTF\cachedata\ifemptydata\relax\else\IfNVOETF{\rTF}{}{\num{\rTF}\%}\fi&%
				\checkaTFa(8)\let\rTF\cachedata\ifemptydata\relax\else\IfNVOETF{\rTF}{}{\num{\rTF} \euro}\fi&%
				\IfNVOETF{\aTF}{}{\num{\aTF} \euro}\expandafter\\\fi%
				\ifdefined\aTGa\rCa{\aTGa}&%
				\checkaTGa(4)\let\rTG\cachedata\ifemptydata\relax\else\IfNVOETF{\rTG}{}{\num{\rTG}\ts{}\aTGa(5)}\fi&%
				\checkaTGa(6)\let\rTG\cachedata\ifemptydata\relax\else\IfNVOETF{\rTG}{}{\num{\rTG}}\fi&%
				\checkaTGa(7)\let\rTG\cachedata\ifemptydata\relax\else\IfNVOETF{\rTG}{}{\num{\rTG}\%}\fi&%
				\checkaTGa(8)\let\rTG\cachedata\ifemptydata\relax\else\IfNVOETF{\rTG}{}{\num{\rTG} \euro}\fi&%
				\IfNVOETF{\aTG}{}{\num{\aTG} \euro}\expandafter\\\fi%
				\ifdefined\aTIa\rCa{\aTIa}&%
				\checkaTIa(4)\let\rTI\cachedata\ifemptydata\relax\else\IfNVOETF{\rTI}{}{\num{\rTI}\ts{}\aTIa(5)}\fi&%
				\checkaTIa(6)\let\rTI\cachedata\ifemptydata\relax\else\IfNVOETF{\rTI}{}{\num{\rTI}}\fi&%
				\checkaTIa(7)\let\rTI\cachedata\ifemptydata\relax\else\IfNVOETF{\rTI}{}{\num{\rTI}\%}\fi&%
				\checkaTIa(8)\let\rTI\cachedata\ifemptydata\relax\else\IfNVOETF{\rTI}{}{\num{\rTI} \euro}\fi&%
				\IfNVOETF{\aTI}{}{\num{\aTI} \euro}\expandafter\\\fi%
				\ifdefined\aTJa\rCa{\aTJa}&%
				\checkaTJa(4)\let\rTJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTJ}{}{\num{\rTJ}\ts{}\aTJa(5)}\fi&%
				\checkaTJa(6)\let\rTJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTJ}{}{\num{\rTJ}}\fi&%
				\checkaTJa(7)\let\rTJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTJ}{}{\num{\rTJ}\%}\fi&%
				\checkaTJa(8)\let\rTJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTJ}{}{\num{\rTJ} \euro}\fi&%
				\IfNVOETF{\aTJ}{}{\num{\aTJ} \euro}\expandafter\\\fi%
				\ifdefined\aTKa\rCa{\aTKa}&%
				\checkaTKa(4)\let\rTK\cachedata\ifemptydata\relax\else\IfNVOETF{\rTK}{}{\num{\rTK}\ts{}\aTKa(5)}\fi&%
				\checkaTKa(6)\let\rTK\cachedata\ifemptydata\relax\else\IfNVOETF{\rTK}{}{\num{\rTK}}\fi&%
				\checkaTKa(7)\let\rTK\cachedata\ifemptydata\relax\else\IfNVOETF{\rTK}{}{\num{\rTK}\%}\fi&%
				\checkaTKa(8)\let\rTK\cachedata\ifemptydata\relax\else\IfNVOETF{\rTK}{}{\num{\rTK} \euro}\fi&%
				\IfNVOETF{\aTK}{}{\num{\aTK} \euro}\expandafter\\\fi%
				\ifdefined\aTLa\rCa{\aTLa}&%
				\checkaTLa(4)\let\rTL\cachedata\ifemptydata\relax\else\IfNVOETF{\rTL}{}{\num{\rTL}\ts{}\aTLa(5)}\fi&%
				\checkaTLa(6)\let\rTL\cachedata\ifemptydata\relax\else\IfNVOETF{\rTL}{}{\num{\rTL}}\fi&%
				\checkaTLa(7)\let\rTL\cachedata\ifemptydata\relax\else\IfNVOETF{\rTL}{}{\num{\rTL}\%}\fi&%
				\checkaTLa(8)\let\rTL\cachedata\ifemptydata\relax\else\IfNVOETF{\rTL}{}{\num{\rTL} \euro}\fi&%
				\IfNVOETF{\aTL}{}{\num{\aTL} \euro}\expandafter\\\fi%
				\ifdefined\aTMa\rCa{\aTMa}&%
				\checkaTMa(4)\let\rTM\cachedata\ifemptydata\relax\else\IfNVOETF{\rTM}{}{\num{\rTM}\ts{}\aTMa(5)}\fi&%
				\checkaTMa(6)\let\rTM\cachedata\ifemptydata\relax\else\IfNVOETF{\rTM}{}{\num{\rTM}}\fi&%
				\checkaTMa(7)\let\rTM\cachedata\ifemptydata\relax\else\IfNVOETF{\rTM}{}{\num{\rTM}\%}\fi&%
				\checkaTMa(8)\let\rTM\cachedata\ifemptydata\relax\else\IfNVOETF{\rTM}{}{\num{\rTM} \euro}\fi&%
				\IfNVOETF{\aTM}{}{\num{\aTM} \euro}\expandafter\\\fi%
				\ifdefined\aTNa\rCa{\aTNa}&%
				\checkaTNa(4)\let\rTN\cachedata\ifemptydata\relax\else\IfNVOETF{\rTN}{}{\num{\rTN}\ts{}\aTNa(5)}\fi&%
				\checkaTNa(6)\let\rTN\cachedata\ifemptydata\relax\else\IfNVOETF{\rTN}{}{\num{\rTN}}\fi&%
				\checkaTNa(7)\let\rTN\cachedata\ifemptydata\relax\else\IfNVOETF{\rTN}{}{\num{\rTN}\%}\fi&%
				\checkaTNa(8)\let\rTN\cachedata\ifemptydata\relax\else\IfNVOETF{\rTN}{}{\num{\rTN} \euro}\fi&%
				\IfNVOETF{\aTN}{}{\num{\aTN} \euro}\expandafter\\\fi%
				\ifdefined\aTOa\rCa{\aTOa}&%
				\checkaTOa(4)\let\rTO\cachedata\ifemptydata\relax\else\IfNVOETF{\rTO}{}{\num{\rTO}\ts{}\aTOa(5)}\fi&%
				\checkaTOa(6)\let\rTO\cachedata\ifemptydata\relax\else\IfNVOETF{\rTO}{}{\num{\rTO}}\fi&%
				\checkaTOa(7)\let\rTO\cachedata\ifemptydata\relax\else\IfNVOETF{\rTO}{}{\num{\rTO}\%}\fi&%
				\checkaTOa(8)\let\rTO\cachedata\ifemptydata\relax\else\IfNVOETF{\rTO}{}{\num{\rTO} \euro}\fi&%
				\IfNVOETF{\aTO}{}{\num{\aTO} \euro}\expandafter\\\fi%
				\ifdefined\aTPa\rCa{\aTPa}&%
				\checkaTPa(4)\let\rTP\cachedata\ifemptydata\relax\else\IfNVOETF{\rTP}{}{\num{\rTP}\ts{}\aTPa(5)}\fi&%
				\checkaTPa(6)\let\rTP\cachedata\ifemptydata\relax\else\IfNVOETF{\rTP}{}{\num{\rTP}}\fi&%
				\checkaTPa(7)\let\rTP\cachedata\ifemptydata\relax\else\IfNVOETF{\rTP}{}{\num{\rTP}\%}\fi&%
				\checkaTPa(8)\let\rTP\cachedata\ifemptydata\relax\else\IfNVOETF{\rTP}{}{\num{\rTP} \euro}\fi&%
				\IfNVOETF{\aTP}{}{\num{\aTP} \euro}\expandafter\\\fi%
				\ifdefined\aTQa\rCa{\aTQa}&%
				\checkaTQa(4)\let\rTQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTQ}{}{\num{\rTQ}\ts{}\aTQa(5)}\fi&%
				\checkaTQa(6)\let\rTQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTQ}{}{\num{\rTQ}}\fi&%
				\checkaTQa(7)\let\rTQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTQ}{}{\num{\rTQ}\%}\fi&%
				\checkaTQa(8)\let\rTQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTQ}{}{\num{\rTQ} \euro}\fi&%
				\IfNVOETF{\aTQ}{}{\num{\aTQ} \euro}\expandafter\\\fi%
				\ifdefined\aTRa\rCa{\aTRa}&%
				\checkaTRa(4)\let\rTR\cachedata\ifemptydata\relax\else\IfNVOETF{\rTR}{}{\num{\rTR}\ts{}\aTRa(5)}\fi&%
				\checkaTRa(6)\let\rTR\cachedata\ifemptydata\relax\else\IfNVOETF{\rTR}{}{\num{\rTR}}\fi&%
				\checkaTRa(7)\let\rTR\cachedata\ifemptydata\relax\else\IfNVOETF{\rTR}{}{\num{\rTR}\%}\fi&%
				\checkaTRa(8)\let\rTR\cachedata\ifemptydata\relax\else\IfNVOETF{\rTR}{}{\num{\rTR} \euro}\fi&%
				\IfNVOETF{\aTR}{}{\num{\aTR} \euro}\expandafter\\\fi%
				\ifdefined\aTSa\rCa{\aTSa}&%
				\checkaTSa(4)\let\rTS\cachedata\ifemptydata\relax\else\IfNVOETF{\rTS}{}{\num{\rTS}\ts{}\aTSa(5)}\fi&%
				\checkaTSa(6)\let\rTS\cachedata\ifemptydata\relax\else\IfNVOETF{\rTS}{}{\num{\rTS}}\fi&%
				\checkaTSa(7)\let\rTS\cachedata\ifemptydata\relax\else\IfNVOETF{\rTS}{}{\num{\rTS}\%}\fi&%
				\checkaTSa(8)\let\rTS\cachedata\ifemptydata\relax\else\IfNVOETF{\rTS}{}{\num{\rTS} \euro}\fi&%
				\IfNVOETF{\aTS}{}{\num{\aTS} \euro}\expandafter\\\fi%
				\ifdefined\aTTa\rCa{\aTTa}&%
				\checkaTTa(4)\let\rTT\cachedata\ifemptydata\relax\else\IfNVOETF{\rTT}{}{\num{\rTT}\ts{}\aTTa(5)}\fi&%
				\checkaTTa(6)\let\rTT\cachedata\ifemptydata\relax\else\IfNVOETF{\rTT}{}{\num{\rTT}}\fi&%
				\checkaTTa(7)\let\rTT\cachedata\ifemptydata\relax\else\IfNVOETF{\rTT}{}{\num{\rTT}\%}\fi&%
				\checkaTTa(8)\let\rTT\cachedata\ifemptydata\relax\else\IfNVOETF{\rTT}{}{\num{\rTT} \euro}\fi&%
				\IfNVOETF{\aTT}{}{\num{\aTT} \euro}\expandafter\\\fi%
				\ifdefined\aTUa\rCa{\aTUa}&%
				\checkaTUa(4)\let\rTU\cachedata\ifemptydata\relax\else\IfNVOETF{\rTU}{}{\num{\rTU}\ts{}\aTUa(5)}\fi&%
				\checkaTUa(6)\let\rTU\cachedata\ifemptydata\relax\else\IfNVOETF{\rTU}{}{\num{\rTU}}\fi&%
				\checkaTUa(7)\let\rTU\cachedata\ifemptydata\relax\else\IfNVOETF{\rTU}{}{\num{\rTU}\%}\fi&%
				\checkaTUa(8)\let\rTU\cachedata\ifemptydata\relax\else\IfNVOETF{\rTU}{}{\num{\rTU} \euro}\fi&%
				\IfNVOETF{\aTU}{}{\num{\aTU} \euro}\expandafter\\\fi%
				\ifdefined\aTVa\rCa{\aTVa}&%
				\checkaTVa(4)\let\rTV\cachedata\ifemptydata\relax\else\IfNVOETF{\rTV}{}{\num{\rTV}\ts{}\aTVa(5)}\fi&%
				\checkaTVa(6)\let\rTV\cachedata\ifemptydata\relax\else\IfNVOETF{\rTV}{}{\num{\rTV}}\fi&%
				\checkaTVa(7)\let\rTV\cachedata\ifemptydata\relax\else\IfNVOETF{\rTV}{}{\num{\rTV}\%}\fi&%
				\checkaTVa(8)\let\rTV\cachedata\ifemptydata\relax\else\IfNVOETF{\rTV}{}{\num{\rTV} \euro}\fi&%
				\IfNVOETF{\aTV}{}{\num{\aTV} \euro}\expandafter\\\fi%
				\ifdefined\aTWa\rCa{\aTWa}&%
				\checkaTWa(4)\let\rTW\cachedata\ifemptydata\relax\else\IfNVOETF{\rTW}{}{\num{\rTW}\ts{}\aTWa(5)}\fi&%
				\checkaTWa(6)\let\rTW\cachedata\ifemptydata\relax\else\IfNVOETF{\rTW}{}{\num{\rTW}}\fi&%
				\checkaTWa(7)\let\rTW\cachedata\ifemptydata\relax\else\IfNVOETF{\rTW}{}{\num{\rTW}\%}\fi&%
				\checkaTWa(8)\let\rTW\cachedata\ifemptydata\relax\else\IfNVOETF{\rTW}{}{\num{\rTW} \euro}\fi&%
				\IfNVOETF{\aTW}{}{\num{\aTW} \euro}\expandafter\\\fi%
				\ifdefined\aTXa\rCa{\aTXa}&%
				\checkaTXa(4)\let\rTX\cachedata\ifemptydata\relax\else\IfNVOETF{\rTX}{}{\num{\rTX}\ts{}\aTXa(5)}\fi&%
				\checkaTXa(6)\let\rTX\cachedata\ifemptydata\relax\else\IfNVOETF{\rTX}{}{\num{\rTX}}\fi&%
				\checkaTXa(7)\let\rTX\cachedata\ifemptydata\relax\else\IfNVOETF{\rTX}{}{\num{\rTX}\%}\fi&%
				\checkaTXa(8)\let\rTX\cachedata\ifemptydata\relax\else\IfNVOETF{\rTX}{}{\num{\rTX} \euro}\fi&%
				\IfNVOETF{\aTX}{}{\num{\aTX} \euro}\expandafter\\\fi%
				\ifdefined\aTYa\rCa{\aTYa}&%
				\checkaTYa(4)\let\rTY\cachedata\ifemptydata\relax\else\IfNVOETF{\rTY}{}{\num{\rTY}\ts{}\aTYa(5)}\fi&%
				\checkaTYa(6)\let\rTY\cachedata\ifemptydata\relax\else\IfNVOETF{\rTY}{}{\num{\rTY}}\fi&%
				\checkaTYa(7)\let\rTY\cachedata\ifemptydata\relax\else\IfNVOETF{\rTY}{}{\num{\rTY}\%}\fi&%
				\checkaTYa(8)\let\rTY\cachedata\ifemptydata\relax\else\IfNVOETF{\rTY}{}{\num{\rTY} \euro}\fi&%
				\IfNVOETF{\aTY}{}{\num{\aTY} \euro}\expandafter\\\fi%	
				\ifdefined\aTZa\rCa{\aTZa}&%
				\checkaTZa(4)\let\rTZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTZ}{}{\num{\rTZ}\ts{}\aTZa(5)}\fi&%
				\checkaTZa(6)\let\rTZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTZ}{}{\num{\rTZ}}\fi&%
				\checkaTZa(7)\let\rTZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTZ}{}{\num{\rTZ}\%}\fi&%
				\checkaTZa(8)\let\rTZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rTZ}{}{\num{\rTZ} \euro}\fi&%
				\IfNVOETF{\aTZ}{}{\num{\aTZ} \euro}\expandafter\\\fi%
				\toprule%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aT} \euro    \\%
			\end{tabularx} %
			\fi%
		\end{center}%
%		\newpage%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aUAa%
			\captionof{table}{\large{\textsc{\aUCaption}}}\label{tbl:asset:U}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aUAa\rCa{\aUAa}&%
				\checkaUAa(4)\let\rUA\cachedata\ifemptydata\relax\else\IfNVOETF{\rUA}{}{\num{\rUA}\ts{}\aUAa(5)}\fi&%
				\checkaUAa(6)\let\rUA\cachedata\ifemptydata\relax\else\IfNVOETF{\rUA}{}{\num{\rUA}}\fi&%
				\checkaUAa(7)\let\rUA\cachedata\ifemptydata\relax\else\IfNVOETF{\rUA}{}{\num{\rUA}\%}\fi&%
				\checkaUAa(8)\let\rUA\cachedata\ifemptydata\relax\else\IfNVOETF{\rUA}{}{\num{\rUA} \euro}\fi&%
				\IfNVOETF{\aUA}{}{\num{\aUA} \euro}\expandafter\\\fi%
				\ifdefined\aUBa\rCa{\aUBa}&%
				\checkaUBa(4)\let\rUB\cachedata\ifemptydata\relax\else\IfNVOETF{\rUB}{}{\num{\rUB}\ts{}\aUBa(5)}\fi&%
				\checkaUBa(6)\let\rUB\cachedata\ifemptydata\relax\else\IfNVOETF{\rUB}{}{\num{\rUB}}\fi&%
				\checkaUBa(7)\let\rUB\cachedata\ifemptydata\relax\else\IfNVOETF{\rUB}{}{\num{\rUB}\%}\fi&%
				\checkaUBa(8)\let\rUB\cachedata\ifemptydata\relax\else\IfNVOETF{\rUB}{}{\num{\rUB} \euro}\fi&%
				\IfNVOETF{\aUB}{}{\num{\aUB} \euro}\expandafter\\\fi%
				\ifdefined\aUCa\rCa{\aUCa}&%
				\checkaUCa(4)\let\rUC\cachedata\ifemptydata\relax\else\IfNVOETF{\rUC}{}{\num{\rUC}\ts{}\aUCa(5)}\fi&%
				\checkaUCa(6)\let\rUC\cachedata\ifemptydata\relax\else\IfNVOETF{\rUC}{}{\num{\rUC}}\fi&%
				\checkaUCa(7)\let\rUC\cachedata\ifemptydata\relax\else\IfNVOETF{\rUC}{}{\num{\rUC}\%}\fi&%
				\checkaUCa(8)\let\rUC\cachedata\ifemptydata\relax\else\IfNVOETF{\rUC}{}{\num{\rUC} \euro}\fi&%
				\IfNVOETF{\aUC}{}{\num{\aUC} \euro}\expandafter\\\fi%
				\ifdefined\aUDa\rCa{\aUDa}&%
				\checkaUDa(4)\let\rUD\cachedata\ifemptydata\relax\else\IfNVOETF{\rUD}{}{\num{\rUD}\ts{}\aUDa(5)}\fi&%
				\checkaUDa(6)\let\rUD\cachedata\ifemptydata\relax\else\IfNVOETF{\rUD}{}{\num{\rUD}}\fi&%
				\checkaUDa(7)\let\rUD\cachedata\ifemptydata\relax\else\IfNVOETF{\rUD}{}{\num{\rUD}\%}\fi&%
				\checkaUDa(8)\let\rUD\cachedata\ifemptydata\relax\else\IfNVOETF{\rUD}{}{\num{\rUD} \euro}\fi&%
				\IfNVOETF{\aUD}{}{\num{\aUD} \euro}\expandafter\\\fi%
				\ifdefined\aUEa\rCa{\aUEa}&%
				\checkaUEa(4)\let\rUE\cachedata\ifemptydata\relax\else\IfNVOETF{\rUE}{}{\num{\rUE}\ts{}\aUEa(5)}\fi&%
				\checkaUEa(6)\let\rUE\cachedata\ifemptydata\relax\else\IfNVOETF{\rUE}{}{\num{\rUE}}\fi&%
				\checkaUEa(7)\let\rUE\cachedata\ifemptydata\relax\else\IfNVOETF{\rUE}{}{\num{\rUE}\%}\fi&%
				\checkaUEa(8)\let\rUE\cachedata\ifemptydata\relax\else\IfNVOETF{\rUE}{}{\num{\rUE} \euro}\fi&%
				\IfNVOETF{\aUE}{}{\num{\aUE} \euro}\expandafter\\\fi%
				\ifdefined\aUFa\rCa{\aUFa}&%
				\checkaUFa(4)\let\rUF\cachedata\ifemptydata\relax\else\IfNVOETF{\rUF}{}{\num{\rUF}\ts{}\aUFa(5)}\fi&%
				\checkaUFa(6)\let\rUF\cachedata\ifemptydata\relax\else\IfNVOETF{\rUF}{}{\num{\rUF}}\fi&%
				\checkaUFa(7)\let\rUF\cachedata\ifemptydata\relax\else\IfNVOETF{\rUF}{}{\num{\rUF}\%}\fi&%
				\checkaUFa(8)\let\rUF\cachedata\ifemptydata\relax\else\IfNVOETF{\rUF}{}{\num{\rUF} \euro}\fi&%
				\IfNVOETF{\aUF}{}{\num{\aUF} \euro}\expandafter\\\fi%
				\ifdefined\aUGa\rCa{\aUGa}&%
				\checkaUGa(4)\let\rUG\cachedata\ifemptydata\relax\else\IfNVOETF{\rUG}{}{\num{\rUG}\ts{}\aUGa(5)}\fi&%
				\checkaUGa(6)\let\rUG\cachedata\ifemptydata\relax\else\IfNVOETF{\rUG}{}{\num{\rUG}}\fi&%
				\checkaUGa(7)\let\rUG\cachedata\ifemptydata\relax\else\IfNVOETF{\rUG}{}{\num{\rUG}\%}\fi&%
				\checkaUGa(8)\let\rUG\cachedata\ifemptydata\relax\else\IfNVOETF{\rUG}{}{\num{\rUG} \euro}\fi&%
				\IfNVOETF{\aUG}{}{\num{\aUG} \euro}\expandafter\\\fi%
				\ifdefined\aUIa\rCa{\aUIa}&%
				\checkaUIa(4)\let\rUI\cachedata\ifemptydata\relax\else\IfNVOETF{\rUI}{}{\num{\rUI}\ts{}\aUIa(5)}\fi&%
				\checkaUIa(6)\let\rUI\cachedata\ifemptydata\relax\else\IfNVOETF{\rUI}{}{\num{\rUI}}\fi&%
				\checkaUIa(7)\let\rUI\cachedata\ifemptydata\relax\else\IfNVOETF{\rUI}{}{\num{\rUI}\%}\fi&%
				\checkaUIa(8)\let\rUI\cachedata\ifemptydata\relax\else\IfNVOETF{\rUI}{}{\num{\rUI} \euro}\fi&%
				\IfNVOETF{\aUI}{}{\num{\aUI} \euro}\expandafter\\\fi%
				\ifdefined\aUJa\rCa{\aUJa}&%
				\checkaUJa(4)\let\rUJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUJ}{}{\num{\rUJ}\ts{}\aUJa(5)}\fi&%
				\checkaUJa(6)\let\rUJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUJ}{}{\num{\rUJ}}\fi&%
				\checkaUJa(7)\let\rUJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUJ}{}{\num{\rUJ}\%}\fi&%
				\checkaUJa(8)\let\rUJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUJ}{}{\num{\rUJ} \euro}\fi&%
				\IfNVOETF{\aUJ}{}{\num{\aUJ} \euro}\expandafter\\\fi%
				\ifdefined\aUKa\rCa{\aUKa}&%
				\checkaUKa(4)\let\rUK\cachedata\ifemptydata\relax\else\IfNVOETF{\rUK}{}{\num{\rUK}\ts{}\aUKa(5)}\fi&%
				\checkaUKa(6)\let\rUK\cachedata\ifemptydata\relax\else\IfNVOETF{\rUK}{}{\num{\rUK}}\fi&%
				\checkaUKa(7)\let\rUK\cachedata\ifemptydata\relax\else\IfNVOETF{\rUK}{}{\num{\rUK}\%}\fi&%
				\checkaUKa(8)\let\rUK\cachedata\ifemptydata\relax\else\IfNVOETF{\rUK}{}{\num{\rUK} \euro}\fi&%
				\IfNVOETF{\aUK}{}{\num{\aUK} \euro}\expandafter\\\fi%
				\ifdefined\aULa\rCa{\aULa}&%
				\checkaULa(4)\let\rUL\cachedata\ifemptydata\relax\else\IfNVOETF{\rUL}{}{\num{\rUL}\ts{}\aULa(5)}\fi&%
				\checkaULa(6)\let\rUL\cachedata\ifemptydata\relax\else\IfNVOETF{\rUL}{}{\num{\rUL}}\fi&%
				\checkaULa(7)\let\rUL\cachedata\ifemptydata\relax\else\IfNVOETF{\rUL}{}{\num{\rUL}\%}\fi&%
				\checkaULa(8)\let\rUL\cachedata\ifemptydata\relax\else\IfNVOETF{\rUL}{}{\num{\rUL} \euro}\fi&%
				\IfNVOETF{\aUL}{}{\num{\aUL} \euro}\expandafter\\\fi%
				\ifdefined\aUMa\rCa{\aUMa}&%
				\checkaUMa(4)\let\rUM\cachedata\ifemptydata\relax\else\IfNVOETF{\rUM}{}{\num{\rUM}\ts{}\aUMa(5)}\fi&%
				\checkaUMa(6)\let\rUM\cachedata\ifemptydata\relax\else\IfNVOETF{\rUM}{}{\num{\rUM}}\fi&%
				\checkaUMa(7)\let\rUM\cachedata\ifemptydata\relax\else\IfNVOETF{\rUM}{}{\num{\rUM}\%}\fi&%
				\checkaUMa(8)\let\rUM\cachedata\ifemptydata\relax\else\IfNVOETF{\rUM}{}{\num{\rUM} \euro}\fi&%
				\IfNVOETF{\aUM}{}{\num{\aUM} \euro}\expandafter\\\fi%
				\ifdefined\aUNa\rCa{\aUNa}&%
				\checkaUNa(4)\let\rUN\cachedata\ifemptydata\relax\else\IfNVOETF{\rUN}{}{\num{\rUN}\ts{}\aUNa(5)}\fi&%
				\checkaUNa(6)\let\rUN\cachedata\ifemptydata\relax\else\IfNVOETF{\rUN}{}{\num{\rUN}}\fi&%
				\checkaUNa(7)\let\rUN\cachedata\ifemptydata\relax\else\IfNVOETF{\rUN}{}{\num{\rUN}\%}\fi&%
				\checkaUNa(8)\let\rUN\cachedata\ifemptydata\relax\else\IfNVOETF{\rUN}{}{\num{\rUN} \euro}\fi&%
				\IfNVOETF{\aUN}{}{\num{\aUN} \euro}\expandafter\\\fi%
				\ifdefined\aUOa\rCa{\aUOa}&%
				\checkaUOa(4)\let\rUO\cachedata\ifemptydata\relax\else\IfNVOETF{\rUO}{}{\num{\rUO}\ts{}\aUOa(5)}\fi&%
				\checkaUOa(6)\let\rUO\cachedata\ifemptydata\relax\else\IfNVOETF{\rUO}{}{\num{\rUO}}\fi&%
				\checkaUOa(7)\let\rUO\cachedata\ifemptydata\relax\else\IfNVOETF{\rUO}{}{\num{\rUO}\%}\fi&%
				\checkaUOa(8)\let\rUO\cachedata\ifemptydata\relax\else\IfNVOETF{\rUO}{}{\num{\rUO} \euro}\fi&%
				\IfNVOETF{\aUO}{}{\num{\aUO} \euro}\expandafter\\\fi%
				\ifdefined\aUPa\rCa{\aUPa}&%
				\checkaUPa(4)\let\rUP\cachedata\ifemptydata\relax\else\IfNVOETF{\rUP}{}{\num{\rUP}\ts{}\aUPa(5)}\fi&%
				\checkaUPa(6)\let\rUP\cachedata\ifemptydata\relax\else\IfNVOETF{\rUP}{}{\num{\rUP}}\fi&%
				\checkaUPa(7)\let\rUP\cachedata\ifemptydata\relax\else\IfNVOETF{\rUP}{}{\num{\rUP}\%}\fi&%
				\checkaUPa(8)\let\rUP\cachedata\ifemptydata\relax\else\IfNVOETF{\rUP}{}{\num{\rUP} \euro}\fi&%
				\IfNVOETF{\aUP}{}{\num{\aUP} \euro}\expandafter\\\fi%
				\ifdefined\aUQa\rCa{\aUQa}&%
				\checkaUQa(4)\let\rUQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUQ}{}{\num{\rUQ}\ts{}\aUQa(5)}\fi&%
				\checkaUQa(6)\let\rUQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUQ}{}{\num{\rUQ}}\fi&%
				\checkaUQa(7)\let\rUQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUQ}{}{\num{\rUQ}\%}\fi&%
				\checkaUQa(8)\let\rUQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUQ}{}{\num{\rUQ} \euro}\fi&%
				\IfNVOETF{\aUQ}{}{\num{\aUQ} \euro}\expandafter\\\fi%
				\ifdefined\aURa\rCa{\aURa}&%
				\checkaURa(4)\let\rUR\cachedata\ifemptydata\relax\else\IfNVOETF{\rUR}{}{\num{\rUR}\ts{}\aURa(5)}\fi&%
				\checkaURa(6)\let\rUR\cachedata\ifemptydata\relax\else\IfNVOETF{\rUR}{}{\num{\rUR}}\fi&%
				\checkaURa(7)\let\rUR\cachedata\ifemptydata\relax\else\IfNVOETF{\rUR}{}{\num{\rUR}\%}\fi&%
				\checkaURa(8)\let\rUR\cachedata\ifemptydata\relax\else\IfNVOETF{\rUR}{}{\num{\rUR} \euro}\fi&%
				\IfNVOETF{\aUR}{}{\num{\aUR} \euro}\expandafter\\\fi%
				\ifdefined\aUSa\rCa{\aUSa}&%
				\checkaUSa(4)\let\rUS\cachedata\ifemptydata\relax\else\IfNVOETF{\rUS}{}{\num{\rUS}\ts{}\aUSa(5)}\fi&%
				\checkaUSa(6)\let\rUS\cachedata\ifemptydata\relax\else\IfNVOETF{\rUS}{}{\num{\rUS}}\fi&%
				\checkaUSa(7)\let\rUS\cachedata\ifemptydata\relax\else\IfNVOETF{\rUS}{}{\num{\rUS}\%}\fi&%
				\checkaUSa(8)\let\rUS\cachedata\ifemptydata\relax\else\IfNVOETF{\rUS}{}{\num{\rUS} \euro}\fi&%
				\IfNVOETF{\aUS}{}{\num{\aUS} \euro}\expandafter\\\fi%
				\ifdefined\aUTa\rCa{\aUTa}&%
				\checkaUTa(4)\let\rUT\cachedata\ifemptydata\relax\else\IfNVOETF{\rUT}{}{\num{\rUT}\ts{}\aUTa(5)}\fi&%
				\checkaUTa(6)\let\rUT\cachedata\ifemptydata\relax\else\IfNVOETF{\rUT}{}{\num{\rUT}}\fi&%
				\checkaUTa(7)\let\rUT\cachedata\ifemptydata\relax\else\IfNVOETF{\rUT}{}{\num{\rUT}\%}\fi&%
				\checkaUTa(8)\let\rUT\cachedata\ifemptydata\relax\else\IfNVOETF{\rUT}{}{\num{\rUT} \euro}\fi&%
				\IfNVOETF{\aUT}{}{\num{\aUT} \euro}\expandafter\\\fi%
				\ifdefined\aUUa\rCa{\aUUa}&%
				\checkaUUa(4)\let\rUU\cachedata\ifemptydata\relax\else\IfNVOETF{\rUU}{}{\num{\rUU}\ts{}\aUUa(5)}\fi&%
				\checkaUUa(6)\let\rUU\cachedata\ifemptydata\relax\else\IfNVOETF{\rUU}{}{\num{\rUU}}\fi&%
				\checkaUUa(7)\let\rUU\cachedata\ifemptydata\relax\else\IfNVOETF{\rUU}{}{\num{\rUU}\%}\fi&%
				\checkaUUa(8)\let\rUU\cachedata\ifemptydata\relax\else\IfNVOETF{\rUU}{}{\num{\rUU} \euro}\fi&%
				\IfNVOETF{\aUU}{}{\num{\aUU} \euro}\expandafter\\\fi%
				\ifdefined\aUVa\rCa{\aUVa}&%
				\checkaUVa(4)\let\rUV\cachedata\ifemptydata\relax\else\IfNVOETF{\rUV}{}{\num{\rUV}\ts{}\aUVa(5)}\fi&%
				\checkaUVa(6)\let\rUV\cachedata\ifemptydata\relax\else\IfNVOETF{\rUV}{}{\num{\rUV}}\fi&%
				\checkaUVa(7)\let\rUV\cachedata\ifemptydata\relax\else\IfNVOETF{\rUV}{}{\num{\rUV}\%}\fi&%
				\checkaUVa(8)\let\rUV\cachedata\ifemptydata\relax\else\IfNVOETF{\rUV}{}{\num{\rUV} \euro}\fi&%
				\IfNVOETF{\aUV}{}{\num{\aUV} \euro}\expandafter\\\fi%
				\ifdefined\aUWa\rCa{\aUWa}&%
				\checkaUWa(4)\let\rUW\cachedata\ifemptydata\relax\else\IfNVOETF{\rUW}{}{\num{\rUW}\ts{}\aUWa(5)}\fi&%
				\checkaUWa(6)\let\rUW\cachedata\ifemptydata\relax\else\IfNVOETF{\rUW}{}{\num{\rUW}}\fi&%
				\checkaUWa(7)\let\rUW\cachedata\ifemptydata\relax\else\IfNVOETF{\rUW}{}{\num{\rUW}\%}\fi&%
				\checkaUWa(8)\let\rUW\cachedata\ifemptydata\relax\else\IfNVOETF{\rUW}{}{\num{\rUW} \euro}\fi&%
				\IfNVOETF{\aUW}{}{\num{\aUW} \euro}\expandafter\\\fi%
				\ifdefined\aUXa\rCa{\aUXa}&%
				\checkaUXa(4)\let\rUX\cachedata\ifemptydata\relax\else\IfNVOETF{\rUX}{}{\num{\rUX}\ts{}\aUXa(5)}\fi&%
				\checkaUXa(6)\let\rUX\cachedata\ifemptydata\relax\else\IfNVOETF{\rUX}{}{\num{\rUX}}\fi&%
				\checkaUXa(7)\let\rUX\cachedata\ifemptydata\relax\else\IfNVOETF{\rUX}{}{\num{\rUX}\%}\fi&%
				\checkaUXa(8)\let\rUX\cachedata\ifemptydata\relax\else\IfNVOETF{\rUX}{}{\num{\rUX} \euro}\fi&%
				\IfNVOETF{\aUX}{}{\num{\aUX} \euro}\expandafter\\\fi%
				\ifdefined\aUYa\rCa{\aUYa}&%
				\checkaUYa(4)\let\rUY\cachedata\ifemptydata\relax\else\IfNVOETF{\rUY}{}{\num{\rUY}\ts{}\aUYa(5)}\fi&%
				\checkaUYa(6)\let\rUY\cachedata\ifemptydata\relax\else\IfNVOETF{\rUY}{}{\num{\rUY}}\fi&%
				\checkaUYa(7)\let\rUY\cachedata\ifemptydata\relax\else\IfNVOETF{\rUY}{}{\num{\rUY}\%}\fi&%
				\checkaUYa(8)\let\rUY\cachedata\ifemptydata\relax\else\IfNVOETF{\rUY}{}{\num{\rUY} \euro}\fi&%
				\IfNVOETF{\aUY}{}{\num{\aUY} \euro}\expandafter\\\fi%	
				\ifdefined\aUZa\rCa{\aUZa}&%
				\checkaUZa(4)\let\rUZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUZ}{}{\num{\rUZ}\ts{}\aUZa(5)}\fi&%
				\checkaUZa(6)\let\rUZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUZ}{}{\num{\rUZ}}\fi&%
				\checkaUZa(7)\let\rUZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUZ}{}{\num{\rUZ}\%}\fi&%
				\checkaUZa(8)\let\rUZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rUZ}{}{\num{\rUZ} \euro}\fi&%
				\IfNVOETF{\aUZ}{}{\num{\aUZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aU} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aVAa%
			\captionof{table}{\large{\textsc{\aVCaption}}}\label{tbl:asset:V}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aVAa\rCa{\aVAa}&%
				\checkaVAa(4)\let\rVA\cachedata\ifemptydata\relax\else\IfNVOETF{\rVA}{}{\num{\rVA}\ts{}\aVAa(5)}\fi&%
				\checkaVAa(6)\let\rVA\cachedata\ifemptydata\relax\else\IfNVOETF{\rVA}{}{\num{\rVA}}\fi&%
				\checkaVAa(7)\let\rVA\cachedata\ifemptydata\relax\else\IfNVOETF{\rVA}{}{\num{\rVA}\%}\fi&%
				\checkaVAa(8)\let\rVA\cachedata\ifemptydata\relax\else\IfNVOETF{\rVA}{}{\num{\rVA} \euro}\fi&%
				\IfNVOETF{\aVA}{}{\num{\aVA} \euro}\expandafter\\\fi%
				\ifdefined\aVBa\rCa{\aVBa}&%
				\checkaVBa(4)\let\rVB\cachedata\ifemptydata\relax\else\IfNVOETF{\rVB}{}{\num{\rVB}\ts{}\aVBa(5)}\fi&%
				\checkaVBa(6)\let\rVB\cachedata\ifemptydata\relax\else\IfNVOETF{\rVB}{}{\num{\rVB}}\fi&%
				\checkaVBa(7)\let\rVB\cachedata\ifemptydata\relax\else\IfNVOETF{\rVB}{}{\num{\rVB}\%}\fi&%
				\checkaVBa(8)\let\rVB\cachedata\ifemptydata\relax\else\IfNVOETF{\rVB}{}{\num{\rVB} \euro}\fi&%
				\IfNVOETF{\aVB}{}{\num{\aVB} \euro}\expandafter\\\fi%
				\ifdefined\aVCa\rCa{\aVCa}&%
				\checkaVCa(4)\let\rVC\cachedata\ifemptydata\relax\else\IfNVOETF{\rVC}{}{\num{\rVC}\ts{}\aVCa(5)}\fi&%
				\checkaVCa(6)\let\rVC\cachedata\ifemptydata\relax\else\IfNVOETF{\rVC}{}{\num{\rVC}}\fi&%
				\checkaVCa(7)\let\rVC\cachedata\ifemptydata\relax\else\IfNVOETF{\rVC}{}{\num{\rVC}\%}\fi&%
				\checkaVCa(8)\let\rVC\cachedata\ifemptydata\relax\else\IfNVOETF{\rVC}{}{\num{\rVC} \euro}\fi&%
				\IfNVOETF{\aVC}{}{\num{\aVC} \euro}\expandafter\\\fi%
				\ifdefined\aVDa\rCa{\aVDa}&%
				\checkaVDa(4)\let\rVD\cachedata\ifemptydata\relax\else\IfNVOETF{\rVD}{}{\num{\rVD}\ts{}\aVDa(5)}\fi&%
				\checkaVDa(6)\let\rVD\cachedata\ifemptydata\relax\else\IfNVOETF{\rVD}{}{\num{\rVD}}\fi&%
				\checkaVDa(7)\let\rVD\cachedata\ifemptydata\relax\else\IfNVOETF{\rVD}{}{\num{\rVD}\%}\fi&%
				\checkaVDa(8)\let\rVD\cachedata\ifemptydata\relax\else\IfNVOETF{\rVD}{}{\num{\rVD} \euro}\fi&%
				\IfNVOETF{\aVD}{}{\num{\aVD} \euro}\expandafter\\\fi%
				\ifdefined\aVEa\rCa{\aVEa}&%
				\checkaVEa(4)\let\rVE\cachedata\ifemptydata\relax\else\IfNVOETF{\rVE}{}{\num{\rVE}\ts{}\aVEa(5)}\fi&%
				\checkaVEa(6)\let\rVE\cachedata\ifemptydata\relax\else\IfNVOETF{\rVE}{}{\num{\rVE}}\fi&%
				\checkaVEa(7)\let\rVE\cachedata\ifemptydata\relax\else\IfNVOETF{\rVE}{}{\num{\rVE}\%}\fi&%
				\checkaVEa(8)\let\rVE\cachedata\ifemptydata\relax\else\IfNVOETF{\rVE}{}{\num{\rVE} \euro}\fi&%
				\IfNVOETF{\aVE}{}{\num{\aVE} \euro}\expandafter\\\fi%
				\ifdefined\aVFa\rCa{\aVFa}&%
				\checkaVFa(4)\let\rVF\cachedata\ifemptydata\relax\else\IfNVOETF{\rVF}{}{\num{\rVF}\ts{}\aVFa(5)}\fi&%
				\checkaVFa(6)\let\rVF\cachedata\ifemptydata\relax\else\IfNVOETF{\rVF}{}{\num{\rVF}}\fi&%
				\checkaVFa(7)\let\rVF\cachedata\ifemptydata\relax\else\IfNVOETF{\rVF}{}{\num{\rVF}\%}\fi&%
				\checkaVFa(8)\let\rVF\cachedata\ifemptydata\relax\else\IfNVOETF{\rVF}{}{\num{\rVF} \euro}\fi&%
				\IfNVOETF{\aVF}{}{\num{\aVF} \euro}\expandafter\\\fi%
				\ifdefined\aVGa\rCa{\aVGa}&%
				\checkaVGa(4)\let\rVG\cachedata\ifemptydata\relax\else\IfNVOETF{\rVG}{}{\num{\rVG}\ts{}\aVGa(5)}\fi&%
				\checkaVGa(6)\let\rVG\cachedata\ifemptydata\relax\else\IfNVOETF{\rVG}{}{\num{\rVG}}\fi&%
				\checkaVGa(7)\let\rVG\cachedata\ifemptydata\relax\else\IfNVOETF{\rVG}{}{\num{\rVG}\%}\fi&%
				\checkaVGa(8)\let\rVG\cachedata\ifemptydata\relax\else\IfNVOETF{\rVG}{}{\num{\rVG} \euro}\fi&%
				\IfNVOETF{\aVG}{}{\num{\aVG} \euro}\expandafter\\\fi%
				\ifdefined\aVIa\rCa{\aVIa}&%
				\checkaVIa(4)\let\rVI\cachedata\ifemptydata\relax\else\IfNVOETF{\rVI}{}{\num{\rVI}\ts{}\aVIa(5)}\fi&%
				\checkaVIa(6)\let\rVI\cachedata\ifemptydata\relax\else\IfNVOETF{\rVI}{}{\num{\rVI}}\fi&%
				\checkaVIa(7)\let\rVI\cachedata\ifemptydata\relax\else\IfNVOETF{\rVI}{}{\num{\rVI}\%}\fi&%
				\checkaVIa(8)\let\rVI\cachedata\ifemptydata\relax\else\IfNVOETF{\rVI}{}{\num{\rVI} \euro}\fi&%
				\IfNVOETF{\aVI}{}{\num{\aVI} \euro}\expandafter\\\fi%
				\ifdefined\aVJa\rCa{\aVJa}&%
				\checkaVJa(4)\let\rVJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVJ}{}{\num{\rVJ}\ts{}\aVJa(5)}\fi&%
				\checkaVJa(6)\let\rVJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVJ}{}{\num{\rVJ}}\fi&%
				\checkaVJa(7)\let\rVJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVJ}{}{\num{\rVJ}\%}\fi&%
				\checkaVJa(8)\let\rVJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVJ}{}{\num{\rVJ} \euro}\fi&%
				\IfNVOETF{\aVJ}{}{\num{\aVJ} \euro}\expandafter\\\fi%
				\ifdefined\aVKa\rCa{\aVKa}&%
				\checkaVKa(4)\let\rVK\cachedata\ifemptydata\relax\else\IfNVOETF{\rVK}{}{\num{\rVK}\ts{}\aVKa(5)}\fi&%
				\checkaVKa(6)\let\rVK\cachedata\ifemptydata\relax\else\IfNVOETF{\rVK}{}{\num{\rVK}}\fi&%
				\checkaVKa(7)\let\rVK\cachedata\ifemptydata\relax\else\IfNVOETF{\rVK}{}{\num{\rVK}\%}\fi&%
				\checkaVKa(8)\let\rVK\cachedata\ifemptydata\relax\else\IfNVOETF{\rVK}{}{\num{\rVK} \euro}\fi&%
				\IfNVOETF{\aVK}{}{\num{\aVK} \euro}\expandafter\\\fi%
				\ifdefined\aVLa\rCa{\aVLa}&%
				\checkaVLa(4)\let\rVL\cachedata\ifemptydata\relax\else\IfNVOETF{\rVL}{}{\num{\rVL}\ts{}\aVLa(5)}\fi&%
				\checkaVLa(6)\let\rVL\cachedata\ifemptydata\relax\else\IfNVOETF{\rVL}{}{\num{\rVL}}\fi&%
				\checkaVLa(7)\let\rVL\cachedata\ifemptydata\relax\else\IfNVOETF{\rVL}{}{\num{\rVL}\%}\fi&%
				\checkaVLa(8)\let\rVL\cachedata\ifemptydata\relax\else\IfNVOETF{\rVL}{}{\num{\rVL} \euro}\fi&%
				\IfNVOETF{\aVL}{}{\num{\aVL} \euro}\expandafter\\\fi%
				\ifdefined\aVMa\rCa{\aVMa}&%
				\checkaVMa(4)\let\rVM\cachedata\ifemptydata\relax\else\IfNVOETF{\rVM}{}{\num{\rVM}\ts{}\aVMa(5)}\fi&%
				\checkaVMa(6)\let\rVM\cachedata\ifemptydata\relax\else\IfNVOETF{\rVM}{}{\num{\rVM}}\fi&%
				\checkaVMa(7)\let\rVM\cachedata\ifemptydata\relax\else\IfNVOETF{\rVM}{}{\num{\rVM}\%}\fi&%
				\checkaVMa(8)\let\rVM\cachedata\ifemptydata\relax\else\IfNVOETF{\rVM}{}{\num{\rVM} \euro}\fi&%
				\IfNVOETF{\aVM}{}{\num{\aVM} \euro}\expandafter\\\fi%
				\ifdefined\aVNa\rCa{\aVNa}&%
				\checkaVNa(4)\let\rVN\cachedata\ifemptydata\relax\else\IfNVOETF{\rVN}{}{\num{\rVN}\ts{}\aVNa(5)}\fi&%
				\checkaVNa(6)\let\rVN\cachedata\ifemptydata\relax\else\IfNVOETF{\rVN}{}{\num{\rVN}}\fi&%
				\checkaVNa(7)\let\rVN\cachedata\ifemptydata\relax\else\IfNVOETF{\rVN}{}{\num{\rVN}\%}\fi&%
				\checkaVNa(8)\let\rVN\cachedata\ifemptydata\relax\else\IfNVOETF{\rVN}{}{\num{\rVN} \euro}\fi&%
				\IfNVOETF{\aVN}{}{\num{\aVN} \euro}\expandafter\\\fi%
				\ifdefined\aVOa\rCa{\aVOa}&%
				\checkaVOa(4)\let\rVO\cachedata\ifemptydata\relax\else\IfNVOETF{\rVO}{}{\num{\rVO}\ts{}\aVOa(5)}\fi&%
				\checkaVOa(6)\let\rVO\cachedata\ifemptydata\relax\else\IfNVOETF{\rVO}{}{\num{\rVO}}\fi&%
				\checkaVOa(7)\let\rVO\cachedata\ifemptydata\relax\else\IfNVOETF{\rVO}{}{\num{\rVO}\%}\fi&%
				\checkaVOa(8)\let\rVO\cachedata\ifemptydata\relax\else\IfNVOETF{\rVO}{}{\num{\rVO} \euro}\fi&%
				\IfNVOETF{\aVO}{}{\num{\aVO} \euro}\expandafter\\\fi%
				\ifdefined\aVPa\rCa{\aVPa}&%
				\checkaVPa(4)\let\rVP\cachedata\ifemptydata\relax\else\IfNVOETF{\rVP}{}{\num{\rVP}\ts{}\aVPa(5)}\fi&%
				\checkaVPa(6)\let\rVP\cachedata\ifemptydata\relax\else\IfNVOETF{\rVP}{}{\num{\rVP}}\fi&%
				\checkaVPa(7)\let\rVP\cachedata\ifemptydata\relax\else\IfNVOETF{\rVP}{}{\num{\rVP}\%}\fi&%
				\checkaVPa(8)\let\rVP\cachedata\ifemptydata\relax\else\IfNVOETF{\rVP}{}{\num{\rVP} \euro}\fi&%
				\IfNVOETF{\aVP}{}{\num{\aVP} \euro}\expandafter\\\fi%
				\ifdefined\aVQa\rCa{\aVQa}&%
				\checkaVQa(4)\let\rVQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVQ}{}{\num{\rVQ}\ts{}\aVQa(5)}\fi&%
				\checkaVQa(6)\let\rVQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVQ}{}{\num{\rVQ}}\fi&%
				\checkaVQa(7)\let\rVQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVQ}{}{\num{\rVQ}\%}\fi&%
				\checkaVQa(8)\let\rVQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVQ}{}{\num{\rVQ} \euro}\fi&%
				\IfNVOETF{\aVQ}{}{\num{\aVQ} \euro}\expandafter\\\fi%
				\ifdefined\aVRa\rCa{\aVRa}&%
				\checkaVRa(4)\let\rVR\cachedata\ifemptydata\relax\else\IfNVOETF{\rVR}{}{\num{\rVR}\ts{}\aVRa(5)}\fi&%
				\checkaVRa(6)\let\rVR\cachedata\ifemptydata\relax\else\IfNVOETF{\rVR}{}{\num{\rVR}}\fi&%
				\checkaVRa(7)\let\rVR\cachedata\ifemptydata\relax\else\IfNVOETF{\rVR}{}{\num{\rVR}\%}\fi&%
				\checkaVRa(8)\let\rVR\cachedata\ifemptydata\relax\else\IfNVOETF{\rVR}{}{\num{\rVR} \euro}\fi&%
				\IfNVOETF{\aVR}{}{\num{\aVR} \euro}\expandafter\\\fi%
				\ifdefined\aVSa\rCa{\aVSa}&%
				\checkaVSa(4)\let\rVS\cachedata\ifemptydata\relax\else\IfNVOETF{\rVS}{}{\num{\rVS}\ts{}\aVSa(5)}\fi&%
				\checkaVSa(6)\let\rVS\cachedata\ifemptydata\relax\else\IfNVOETF{\rVS}{}{\num{\rVS}}\fi&%
				\checkaVSa(7)\let\rVS\cachedata\ifemptydata\relax\else\IfNVOETF{\rVS}{}{\num{\rVS}\%}\fi&%
				\checkaVSa(8)\let\rVS\cachedata\ifemptydata\relax\else\IfNVOETF{\rVS}{}{\num{\rVS} \euro}\fi&%
				\IfNVOETF{\aVS}{}{\num{\aVS} \euro}\expandafter\\\fi%
				\ifdefined\aVTa\rCa{\aVTa}&%
				\checkaVTa(4)\let\rVT\cachedata\ifemptydata\relax\else\IfNVOETF{\rVT}{}{\num{\rVT}\ts{}\aVTa(5)}\fi&%
				\checkaVTa(6)\let\rVT\cachedata\ifemptydata\relax\else\IfNVOETF{\rVT}{}{\num{\rVT}}\fi&%
				\checkaVTa(7)\let\rVT\cachedata\ifemptydata\relax\else\IfNVOETF{\rVT}{}{\num{\rVT}\%}\fi&%
				\checkaVTa(8)\let\rVT\cachedata\ifemptydata\relax\else\IfNVOETF{\rVT}{}{\num{\rVT} \euro}\fi&%
				\IfNVOETF{\aVT}{}{\num{\aVT} \euro}\expandafter\\\fi%
				\ifdefined\aVUa\rCa{\aVUa}&%
				\checkaVUa(4)\let\rVU\cachedata\ifemptydata\relax\else\IfNVOETF{\rVU}{}{\num{\rVU}\ts{}\aVUa(5)}\fi&%
				\checkaVUa(6)\let\rVU\cachedata\ifemptydata\relax\else\IfNVOETF{\rVU}{}{\num{\rVU}}\fi&%
				\checkaVUa(7)\let\rVU\cachedata\ifemptydata\relax\else\IfNVOETF{\rVU}{}{\num{\rVU}\%}\fi&%
				\checkaVUa(8)\let\rVU\cachedata\ifemptydata\relax\else\IfNVOETF{\rVU}{}{\num{\rVU} \euro}\fi&%
				\IfNVOETF{\aVU}{}{\num{\aVU} \euro}\expandafter\\\fi%
				\ifdefined\aVVa\rCa{\aVVa}&%
				\checkaVVa(4)\let\rVV\cachedata\ifemptydata\relax\else\IfNVOETF{\rVV}{}{\num{\rVV}\ts{}\aVVa(5)}\fi&%
				\checkaVVa(6)\let\rVV\cachedata\ifemptydata\relax\else\IfNVOETF{\rVV}{}{\num{\rVV}}\fi&%
				\checkaVVa(7)\let\rVV\cachedata\ifemptydata\relax\else\IfNVOETF{\rVV}{}{\num{\rVV}\%}\fi&%
				\checkaVVa(8)\let\rVV\cachedata\ifemptydata\relax\else\IfNVOETF{\rVV}{}{\num{\rVV} \euro}\fi&%
				\IfNVOETF{\aVV}{}{\num{\aVV} \euro}\expandafter\\\fi%
				\ifdefined\aVWa\rCa{\aVWa}&%
				\checkaVWa(4)\let\rVW\cachedata\ifemptydata\relax\else\IfNVOETF{\rVW}{}{\num{\rVW}\ts{}\aVWa(5)}\fi&%
				\checkaVWa(6)\let\rVW\cachedata\ifemptydata\relax\else\IfNVOETF{\rVW}{}{\num{\rVW}}\fi&%
				\checkaVWa(7)\let\rVW\cachedata\ifemptydata\relax\else\IfNVOETF{\rVW}{}{\num{\rVW}\%}\fi&%
				\checkaVWa(8)\let\rVW\cachedata\ifemptydata\relax\else\IfNVOETF{\rVW}{}{\num{\rVW} \euro}\fi&%
				\IfNVOETF{\aVW}{}{\num{\aVW} \euro}\expandafter\\\fi%
				\ifdefined\aVXa\rCa{\aVXa}&%
				\checkaVXa(4)\let\rVX\cachedata\ifemptydata\relax\else\IfNVOETF{\rVX}{}{\num{\rVX}\ts{}\aVXa(5)}\fi&%
				\checkaVXa(6)\let\rVX\cachedata\ifemptydata\relax\else\IfNVOETF{\rVX}{}{\num{\rVX}}\fi&%
				\checkaVXa(7)\let\rVX\cachedata\ifemptydata\relax\else\IfNVOETF{\rVX}{}{\num{\rVX}\%}\fi&%
				\checkaVXa(8)\let\rVX\cachedata\ifemptydata\relax\else\IfNVOETF{\rVX}{}{\num{\rVX} \euro}\fi&%
				\IfNVOETF{\aVX}{}{\num{\aVX} \euro}\expandafter\\\fi%
				\ifdefined\aVYa\rCa{\aVYa}&%
				\checkaVYa(4)\let\rVY\cachedata\ifemptydata\relax\else\IfNVOETF{\rVY}{}{\num{\rVY}\ts{}\aVYa(5)}\fi&%
				\checkaVYa(6)\let\rVY\cachedata\ifemptydata\relax\else\IfNVOETF{\rVY}{}{\num{\rVY}}\fi&%
				\checkaVYa(7)\let\rVY\cachedata\ifemptydata\relax\else\IfNVOETF{\rVY}{}{\num{\rVY}\%}\fi&%
				\checkaVYa(8)\let\rVY\cachedata\ifemptydata\relax\else\IfNVOETF{\rVY}{}{\num{\rVY} \euro}\fi&%
				\IfNVOETF{\aVY}{}{\num{\aVY} \euro}\expandafter\\\fi%	
				\ifdefined\aVZa\rCa{\aVZa}&%
				\checkaVZa(4)\let\rVZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVZ}{}{\num{\rVZ}\ts{}\aVZa(5)}\fi&%
				\checkaVZa(6)\let\rVZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVZ}{}{\num{\rVZ}}\fi&%
				\checkaVZa(7)\let\rVZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVZ}{}{\num{\rVZ}\%}\fi&%
				\checkaVZa(8)\let\rVZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rVZ}{}{\num{\rVZ} \euro}\fi&%
				\IfNVOETF{\aVZ}{}{\num{\aVZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aV} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aWAa%
			\captionof{table}{\large{\textsc{\aWCaption}}}\label{tbl:asset:W}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\ifdefined\aWAa\rCa{\aWAa}&%
				\checkaWAa(4)\let\rWA\cachedata\ifemptydata\relax\else\IfNVOETF{\rWA}{}{\num{\rWA}\ts{}\aWAa(5)}\fi&%
				\checkaWAa(6)\let\rWA\cachedata\ifemptydata\relax\else\IfNVOETF{\rWA}{}{\num{\rWA}}\fi&%
				\checkaWAa(7)\let\rWA\cachedata\ifemptydata\relax\else\IfNVOETF{\rWA}{}{\num{\rWA}\%}\fi&%
				\checkaWAa(8)\let\rWA\cachedata\ifemptydata\relax\else\IfNVOETF{\rWA}{}{\num{\rWA} \euro}\fi&%
				\IfNVOETF{\aWA}{}{\num{\aWA} \euro}\expandafter\\\fi%
				\ifdefined\aWBa\rCa{\aWBa}&%
				\checkaWBa(4)\let\rWB\cachedata\ifemptydata\relax\else\IfNVOETF{\rWB}{}{\num{\rWB}\ts{}\aWBa(5)}\fi&%
				\checkaWBa(6)\let\rWB\cachedata\ifemptydata\relax\else\IfNVOETF{\rWB}{}{\num{\rWB}}\fi&%
				\checkaWBa(7)\let\rWB\cachedata\ifemptydata\relax\else\IfNVOETF{\rWB}{}{\num{\rWB}\%}\fi&%
				\checkaWBa(8)\let\rWB\cachedata\ifemptydata\relax\else\IfNVOETF{\rWB}{}{\num{\rWB} \euro}\fi&%
				\IfNVOETF{\aWB}{}{\num{\aWB} \euro}\expandafter\\\fi%
				\ifdefined\aWCa\rCa{\aWCa}&%
				\checkaWCa(4)\let\rWC\cachedata\ifemptydata\relax\else\IfNVOETF{\rWC}{}{\num{\rWC}\ts{}\aWCa(5)}\fi&%
				\checkaWCa(6)\let\rWC\cachedata\ifemptydata\relax\else\IfNVOETF{\rWC}{}{\num{\rWC}}\fi&%
				\checkaWCa(7)\let\rWC\cachedata\ifemptydata\relax\else\IfNVOETF{\rWC}{}{\num{\rWC}\%}\fi&%
				\checkaWCa(8)\let\rWC\cachedata\ifemptydata\relax\else\IfNVOETF{\rWC}{}{\num{\rWC} \euro}\fi&%
				\IfNVOETF{\aWC}{}{\num{\aWC} \euro}\expandafter\\\fi%
				\ifdefined\aWDa\rCa{\aWDa}&%
				\checkaWDa(4)\let\rWD\cachedata\ifemptydata\relax\else\IfNVOETF{\rWD}{}{\num{\rWD}\ts{}\aWDa(5)}\fi&%
				\checkaWDa(6)\let\rWD\cachedata\ifemptydata\relax\else\IfNVOETF{\rWD}{}{\num{\rWD}}\fi&%
				\checkaWDa(7)\let\rWD\cachedata\ifemptydata\relax\else\IfNVOETF{\rWD}{}{\num{\rWD}\%}\fi&%
				\checkaWDa(8)\let\rWD\cachedata\ifemptydata\relax\else\IfNVOETF{\rWD}{}{\num{\rWD} \euro}\fi&%
				\IfNVOETF{\aWD}{}{\num{\aWD} \euro}\expandafter\\\fi%
				\ifdefined\aWEa\rCa{\aWEa}&%
				\checkaWEa(4)\let\rWE\cachedata\ifemptydata\relax\else\IfNVOETF{\rWE}{}{\num{\rWE}\ts{}\aWEa(5)}\fi&%
				\checkaWEa(6)\let\rWE\cachedata\ifemptydata\relax\else\IfNVOETF{\rWE}{}{\num{\rWE}}\fi&%
				\checkaWEa(7)\let\rWE\cachedata\ifemptydata\relax\else\IfNVOETF{\rWE}{}{\num{\rWE}\%}\fi&%
				\checkaWEa(8)\let\rWE\cachedata\ifemptydata\relax\else\IfNVOETF{\rWE}{}{\num{\rWE} \euro}\fi&%
				\IfNVOETF{\aWE}{}{\num{\aWE} \euro}\expandafter\\\fi%
				\ifdefined\aWFa\rCa{\aWFa}&%
				\checkaWFa(4)\let\rWF\cachedata\ifemptydata\relax\else\IfNVOETF{\rWF}{}{\num{\rWF}\ts{}\aWFa(5)}\fi&%
				\checkaWFa(6)\let\rWF\cachedata\ifemptydata\relax\else\IfNVOETF{\rWF}{}{\num{\rWF}}\fi&%
				\checkaWFa(7)\let\rWF\cachedata\ifemptydata\relax\else\IfNVOETF{\rWF}{}{\num{\rWF}\%}\fi&%
				\checkaWFa(8)\let\rWF\cachedata\ifemptydata\relax\else\IfNVOETF{\rWF}{}{\num{\rWF} \euro}\fi&%
				\IfNVOETF{\aWF}{}{\num{\aWF} \euro}\expandafter\\\fi%
				\ifdefined\aWGa\rCa{\aWGa}&%
				\checkaWGa(4)\let\rWG\cachedata\ifemptydata\relax\else\IfNVOETF{\rWG}{}{\num{\rWG}\ts{}\aWGa(5)}\fi&%
				\checkaWGa(6)\let\rWG\cachedata\ifemptydata\relax\else\IfNVOETF{\rWG}{}{\num{\rWG}}\fi&%
				\checkaWGa(7)\let\rWG\cachedata\ifemptydata\relax\else\IfNVOETF{\rWG}{}{\num{\rWG}\%}\fi&%
				\checkaWGa(8)\let\rWG\cachedata\ifemptydata\relax\else\IfNVOETF{\rWG}{}{\num{\rWG} \euro}\fi&%
				\IfNVOETF{\aWG}{}{\num{\aWG} \euro}\expandafter\\\fi%
				\ifdefined\aWIa\rCa{\aWIa}&%
				\checkaWIa(4)\let\rWI\cachedata\ifemptydata\relax\else\IfNVOETF{\rWI}{}{\num{\rWI}\ts{}\aWIa(5)}\fi&%
				\checkaWIa(6)\let\rWI\cachedata\ifemptydata\relax\else\IfNVOETF{\rWI}{}{\num{\rWI}}\fi&%
				\checkaWIa(7)\let\rWI\cachedata\ifemptydata\relax\else\IfNVOETF{\rWI}{}{\num{\rWI}\%}\fi&%
				\checkaWIa(8)\let\rWI\cachedata\ifemptydata\relax\else\IfNVOETF{\rWI}{}{\num{\rWI} \euro}\fi&%
				\IfNVOETF{\aWI}{}{\num{\aWI} \euro}\expandafter\\\fi%
				\ifdefined\aWJa\rCa{\aWJa}&%
				\checkaWJa(4)\let\rWJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWJ}{}{\num{\rWJ}\ts{}\aWJa(5)}\fi&%
				\checkaWJa(6)\let\rWJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWJ}{}{\num{\rWJ}}\fi&%
				\checkaWJa(7)\let\rWJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWJ}{}{\num{\rWJ}\%}\fi&%
				\checkaWJa(8)\let\rWJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWJ}{}{\num{\rWJ} \euro}\fi&%
				\IfNVOETF{\aWJ}{}{\num{\aWJ} \euro}\expandafter\\\fi%
				\ifdefined\aWKa\rCa{\aWKa}&%
				\checkaWKa(4)\let\rWK\cachedata\ifemptydata\relax\else\IfNVOETF{\rWK}{}{\num{\rWK}\ts{}\aWKa(5)}\fi&%
				\checkaWKa(6)\let\rWK\cachedata\ifemptydata\relax\else\IfNVOETF{\rWK}{}{\num{\rWK}}\fi&%
				\checkaWKa(7)\let\rWK\cachedata\ifemptydata\relax\else\IfNVOETF{\rWK}{}{\num{\rWK}\%}\fi&%
				\checkaWKa(8)\let\rWK\cachedata\ifemptydata\relax\else\IfNVOETF{\rWK}{}{\num{\rWK} \euro}\fi&%
				\IfNVOETF{\aWK}{}{\num{\aWK} \euro}\expandafter\\\fi%
				\ifdefined\aWLa\rCa{\aWLa}&%
				\checkaWLa(4)\let\rWL\cachedata\ifemptydata\relax\else\IfNVOETF{\rWL}{}{\num{\rWL}\ts{}\aWLa(5)}\fi&%
				\checkaWLa(6)\let\rWL\cachedata\ifemptydata\relax\else\IfNVOETF{\rWL}{}{\num{\rWL}}\fi&%
				\checkaWLa(7)\let\rWL\cachedata\ifemptydata\relax\else\IfNVOETF{\rWL}{}{\num{\rWL}\%}\fi&%
				\checkaWLa(8)\let\rWL\cachedata\ifemptydata\relax\else\IfNVOETF{\rWL}{}{\num{\rWL} \euro}\fi&%
				\IfNVOETF{\aWL}{}{\num{\aWL} \euro}\expandafter\\\fi%
				\ifdefined\aWMa\rCa{\aWMa}&%
				\checkaWMa(4)\let\rWM\cachedata\ifemptydata\relax\else\IfNVOETF{\rWM}{}{\num{\rWM}\ts{}\aWMa(5)}\fi&%
				\checkaWMa(6)\let\rWM\cachedata\ifemptydata\relax\else\IfNVOETF{\rWM}{}{\num{\rWM}}\fi&%
				\checkaWMa(7)\let\rWM\cachedata\ifemptydata\relax\else\IfNVOETF{\rWM}{}{\num{\rWM}\%}\fi&%
				\checkaWMa(8)\let\rWM\cachedata\ifemptydata\relax\else\IfNVOETF{\rWM}{}{\num{\rWM} \euro}\fi&%
				\IfNVOETF{\aWM}{}{\num{\aWM} \euro}\expandafter\\\fi%
				\ifdefined\aWNa\rCa{\aWNa}&%
				\checkaWNa(4)\let\rWN\cachedata\ifemptydata\relax\else\IfNVOETF{\rWN}{}{\num{\rWN}\ts{}\aWNa(5)}\fi&%
				\checkaWNa(6)\let\rWN\cachedata\ifemptydata\relax\else\IfNVOETF{\rWN}{}{\num{\rWN}}\fi&%
				\checkaWNa(7)\let\rWN\cachedata\ifemptydata\relax\else\IfNVOETF{\rWN}{}{\num{\rWN}\%}\fi&%
				\checkaWNa(8)\let\rWN\cachedata\ifemptydata\relax\else\IfNVOETF{\rWN}{}{\num{\rWN} \euro}\fi&%
				\IfNVOETF{\aWN}{}{\num{\aWN} \euro}\expandafter\\\fi%
				\ifdefined\aWOa\rCa{\aWOa}&%
				\checkaWOa(4)\let\rWO\cachedata\ifemptydata\relax\else\IfNVOETF{\rWO}{}{\num{\rWO}\ts{}\aWOa(5)}\fi&%
				\checkaWOa(6)\let\rWO\cachedata\ifemptydata\relax\else\IfNVOETF{\rWO}{}{\num{\rWO}}\fi&%
				\checkaWOa(7)\let\rWO\cachedata\ifemptydata\relax\else\IfNVOETF{\rWO}{}{\num{\rWO}\%}\fi&%
				\checkaWOa(8)\let\rWO\cachedata\ifemptydata\relax\else\IfNVOETF{\rWO}{}{\num{\rWO} \euro}\fi&%
				\IfNVOETF{\aWO}{}{\num{\aWO} \euro}\expandafter\\\fi%
				\ifdefined\aWPa\rCa{\aWPa}&%
				\checkaWPa(4)\let\rWP\cachedata\ifemptydata\relax\else\IfNVOETF{\rWP}{}{\num{\rWP}\ts{}\aWPa(5)}\fi&%
				\checkaWPa(6)\let\rWP\cachedata\ifemptydata\relax\else\IfNVOETF{\rWP}{}{\num{\rWP}}\fi&%
				\checkaWPa(7)\let\rWP\cachedata\ifemptydata\relax\else\IfNVOETF{\rWP}{}{\num{\rWP}\%}\fi&%
				\checkaWPa(8)\let\rWP\cachedata\ifemptydata\relax\else\IfNVOETF{\rWP}{}{\num{\rWP} \euro}\fi&%
				\IfNVOETF{\aWP}{}{\num{\aWP} \euro}\expandafter\\\fi%
				\ifdefined\aWQa\rCa{\aWQa}&%
				\checkaWQa(4)\let\rWQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWQ}{}{\num{\rWQ}\ts{}\aWQa(5)}\fi&%
				\checkaWQa(6)\let\rWQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWQ}{}{\num{\rWQ}}\fi&%
				\checkaWQa(7)\let\rWQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWQ}{}{\num{\rWQ}\%}\fi&%
				\checkaWQa(8)\let\rWQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWQ}{}{\num{\rWQ} \euro}\fi&%
				\IfNVOETF{\aWQ}{}{\num{\aWQ} \euro}\expandafter\\\fi%
				\ifdefined\aWRa\rCa{\aWRa}&%
				\checkaWRa(4)\let\rWR\cachedata\ifemptydata\relax\else\IfNVOETF{\rWR}{}{\num{\rWR}\ts{}\aWRa(5)}\fi&%
				\checkaWRa(6)\let\rWR\cachedata\ifemptydata\relax\else\IfNVOETF{\rWR}{}{\num{\rWR}}\fi&%
				\checkaWRa(7)\let\rWR\cachedata\ifemptydata\relax\else\IfNVOETF{\rWR}{}{\num{\rWR}\%}\fi&%
				\checkaWRa(8)\let\rWR\cachedata\ifemptydata\relax\else\IfNVOETF{\rWR}{}{\num{\rWR} \euro}\fi&%
				\IfNVOETF{\aWR}{}{\num{\aWR} \euro}\expandafter\\\fi%
				\ifdefined\aWSa\rCa{\aWSa}&%
				\checkaWSa(4)\let\rWS\cachedata\ifemptydata\relax\else\IfNVOETF{\rWS}{}{\num{\rWS}\ts{}\aWSa(5)}\fi&%
				\checkaWSa(6)\let\rWS\cachedata\ifemptydata\relax\else\IfNVOETF{\rWS}{}{\num{\rWS}}\fi&%
				\checkaWSa(7)\let\rWS\cachedata\ifemptydata\relax\else\IfNVOETF{\rWS}{}{\num{\rWS}\%}\fi&%
				\checkaWSa(8)\let\rWS\cachedata\ifemptydata\relax\else\IfNVOETF{\rWS}{}{\num{\rWS} \euro}\fi&%
				\IfNVOETF{\aWS}{}{\num{\aWS} \euro}\expandafter\\\fi%
				\ifdefined\aWTa\rCa{\aWTa}&%
				\checkaWTa(4)\let\rWT\cachedata\ifemptydata\relax\else\IfNVOETF{\rWT}{}{\num{\rWT}\ts{}\aWTa(5)}\fi&%
				\checkaWTa(6)\let\rWT\cachedata\ifemptydata\relax\else\IfNVOETF{\rWT}{}{\num{\rWT}}\fi&%
				\checkaWTa(7)\let\rWT\cachedata\ifemptydata\relax\else\IfNVOETF{\rWT}{}{\num{\rWT}\%}\fi&%
				\checkaWTa(8)\let\rWT\cachedata\ifemptydata\relax\else\IfNVOETF{\rWT}{}{\num{\rWT} \euro}\fi&%
				\IfNVOETF{\aWT}{}{\num{\aWT} \euro}\expandafter\\\fi%
				\ifdefined\aWUa\rCa{\aWUa}&%
				\checkaWUa(4)\let\rWU\cachedata\ifemptydata\relax\else\IfNVOETF{\rWU}{}{\num{\rWU}\ts{}\aWUa(5)}\fi&%
				\checkaWUa(6)\let\rWU\cachedata\ifemptydata\relax\else\IfNVOETF{\rWU}{}{\num{\rWU}}\fi&%
				\checkaWUa(7)\let\rWU\cachedata\ifemptydata\relax\else\IfNVOETF{\rWU}{}{\num{\rWU}\%}\fi&%
				\checkaWUa(8)\let\rWU\cachedata\ifemptydata\relax\else\IfNVOETF{\rWU}{}{\num{\rWU} \euro}\fi&%
				\IfNVOETF{\aWU}{}{\num{\aWU} \euro}\expandafter\\\fi%
				\ifdefined\aWVa\rCa{\aWVa}&%
				\checkaWVa(4)\let\rWV\cachedata\ifemptydata\relax\else\IfNVOETF{\rWV}{}{\num{\rWV}\ts{}\aWVa(5)}\fi&%
				\checkaWVa(6)\let\rWV\cachedata\ifemptydata\relax\else\IfNVOETF{\rWV}{}{\num{\rWV}}\fi&%
				\checkaWVa(7)\let\rWV\cachedata\ifemptydata\relax\else\IfNVOETF{\rWV}{}{\num{\rWV}\%}\fi&%
				\checkaWVa(8)\let\rWV\cachedata\ifemptydata\relax\else\IfNVOETF{\rWV}{}{\num{\rWV} \euro}\fi&%
				\IfNVOETF{\aWV}{}{\num{\aWV} \euro}\expandafter\\\fi%
				\ifdefined\aWWa\rCa{\aWWa}&%
				\checkaWWa(4)\let\rWW\cachedata\ifemptydata\relax\else\IfNVOETF{\rWW}{}{\num{\rWW}\ts{}\aWWa(5)}\fi&%
				\checkaWWa(6)\let\rWW\cachedata\ifemptydata\relax\else\IfNVOETF{\rWW}{}{\num{\rWW}}\fi&%
				\checkaWWa(7)\let\rWW\cachedata\ifemptydata\relax\else\IfNVOETF{\rWW}{}{\num{\rWW}\%}\fi&%
				\checkaWWa(8)\let\rWW\cachedata\ifemptydata\relax\else\IfNVOETF{\rWW}{}{\num{\rWW} \euro}\fi&%
				\IfNVOETF{\aWW}{}{\num{\aWW} \euro}\expandafter\\\fi%
				\ifdefined\aWXa\rCa{\aWXa}&%
				\checkaWXa(4)\let\rWX\cachedata\ifemptydata\relax\else\IfNVOETF{\rWX}{}{\num{\rWX}\ts{}\aWXa(5)}\fi&%
				\checkaWXa(6)\let\rWX\cachedata\ifemptydata\relax\else\IfNVOETF{\rWX}{}{\num{\rWX}}\fi&%
				\checkaWXa(7)\let\rWX\cachedata\ifemptydata\relax\else\IfNVOETF{\rWX}{}{\num{\rWX}\%}\fi&%
				\checkaWXa(8)\let\rWX\cachedata\ifemptydata\relax\else\IfNVOETF{\rWX}{}{\num{\rWX} \euro}\fi&%
				\IfNVOETF{\aWX}{}{\num{\aWX} \euro}\expandafter\\\fi%
				\ifdefined\aWYa\rCa{\aWYa}&%
				\checkaWYa(4)\let\rWY\cachedata\ifemptydata\relax\else\IfNVOETF{\rWY}{}{\num{\rWY}\ts{}\aWYa(5)}\fi&%
				\checkaWYa(6)\let\rWY\cachedata\ifemptydata\relax\else\IfNVOETF{\rWY}{}{\num{\rWY}}\fi&%
				\checkaWYa(7)\let\rWY\cachedata\ifemptydata\relax\else\IfNVOETF{\rWY}{}{\num{\rWY}\%}\fi&%
				\checkaWYa(8)\let\rWY\cachedata\ifemptydata\relax\else\IfNVOETF{\rWY}{}{\num{\rWY} \euro}\fi&%
				\IfNVOETF{\aWY}{}{\num{\aWY} \euro}\expandafter\\\fi%	
				\ifdefined\aWZa\rCa{\aWZa}&%
				\checkaWZa(4)\let\rWZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWZ}{}{\num{\rWZ}\ts{}\aWZa(5)}\fi&%
				\checkaWZa(6)\let\rWZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWZ}{}{\num{\rWZ}}\fi&%
				\checkaWZa(7)\let\rWZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWZ}{}{\num{\rWZ}\%}\fi&%
				\checkaWZa(8)\let\rWZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rWZ}{}{\num{\rWZ} \euro}\fi&%
				\IfNVOETF{\aWZ}{}{\num{\aWZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aW} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aXAa%
			\captionof{table}{\large{\textsc{\aXCaption}}}\label{tbl:asset:X}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aXAa\rCa{\aXAa}&%
				\checkaXAa(4)\let\rXA\cachedata\ifemptydata\relax\else\IfNVOETF{\rXA}{}{\num{\rXA}\ts{}\aXAa(5)}\fi&%
				\checkaXAa(6)\let\rXA\cachedata\ifemptydata\relax\else\IfNVOETF{\rXA}{}{\num{\rXA}}\fi&%
				\checkaXAa(7)\let\rXA\cachedata\ifemptydata\relax\else\IfNVOETF{\rXA}{}{\num{\rXA}\%}\fi&%
				\checkaXAa(8)\let\rXA\cachedata\ifemptydata\relax\else\IfNVOETF{\rXA}{}{\num{\rXA} \euro}\fi&%
				\IfNVOETF{\aXA}{}{\num{\aXA} \euro}\expandafter\\\fi%
				\ifdefined\aXBa\rCa{\aXBa}&%
				\checkaXBa(4)\let\rXB\cachedata\ifemptydata\relax\else\IfNVOETF{\rXB}{}{\num{\rXB}\ts{}\aXBa(5)}\fi&%
				\checkaXBa(6)\let\rXB\cachedata\ifemptydata\relax\else\IfNVOETF{\rXB}{}{\num{\rXB}}\fi&%
				\checkaXBa(7)\let\rXB\cachedata\ifemptydata\relax\else\IfNVOETF{\rXB}{}{\num{\rXB}\%}\fi&%
				\checkaXBa(8)\let\rXB\cachedata\ifemptydata\relax\else\IfNVOETF{\rXB}{}{\num{\rXB} \euro}\fi&%
				\IfNVOETF{\aXB}{}{\num{\aXB} \euro}\expandafter\\\fi%
				\ifdefined\aXCa\rCa{\aXCa}&%
				\checkaXCa(4)\let\rXC\cachedata\ifemptydata\relax\else\IfNVOETF{\rXC}{}{\num{\rXC}\ts{}\aXCa(5)}\fi&%
				\checkaXCa(6)\let\rXC\cachedata\ifemptydata\relax\else\IfNVOETF{\rXC}{}{\num{\rXC}}\fi&%
				\checkaXCa(7)\let\rXC\cachedata\ifemptydata\relax\else\IfNVOETF{\rXC}{}{\num{\rXC}\%}\fi&%
				\checkaXCa(8)\let\rXC\cachedata\ifemptydata\relax\else\IfNVOETF{\rXC}{}{\num{\rXC} \euro}\fi&%
				\IfNVOETF{\aXC}{}{\num{\aXC} \euro}\expandafter\\\fi%
				\ifdefined\aXDa\rCa{\aXDa}&%
				\checkaXDa(4)\let\rXD\cachedata\ifemptydata\relax\else\IfNVOETF{\rXD}{}{\num{\rXD}\ts{}\aXDa(5)}\fi&%
				\checkaXDa(6)\let\rXD\cachedata\ifemptydata\relax\else\IfNVOETF{\rXD}{}{\num{\rXD}}\fi&%
				\checkaXDa(7)\let\rXD\cachedata\ifemptydata\relax\else\IfNVOETF{\rXD}{}{\num{\rXD}\%}\fi&%
				\checkaXDa(8)\let\rXD\cachedata\ifemptydata\relax\else\IfNVOETF{\rXD}{}{\num{\rXD} \euro}\fi&%
				\IfNVOETF{\aXD}{}{\num{\aXD} \euro}\expandafter\\\fi%
				\ifdefined\aXEa\rCa{\aXEa}&%
				\checkaXEa(4)\let\rXE\cachedata\ifemptydata\relax\else\IfNVOETF{\rXE}{}{\num{\rXE}\ts{}\aXEa(5)}\fi&%
				\checkaXEa(6)\let\rXE\cachedata\ifemptydata\relax\else\IfNVOETF{\rXE}{}{\num{\rXE}}\fi&%
				\checkaXEa(7)\let\rXE\cachedata\ifemptydata\relax\else\IfNVOETF{\rXE}{}{\num{\rXE}\%}\fi&%
				\checkaXEa(8)\let\rXE\cachedata\ifemptydata\relax\else\IfNVOETF{\rXE}{}{\num{\rXE} \euro}\fi&%
				\IfNVOETF{\aXE}{}{\num{\aXE} \euro}\expandafter\\\fi%
				\ifdefined\aXFa\rCa{\aXFa}&%
				\checkaXFa(4)\let\rXF\cachedata\ifemptydata\relax\else\IfNVOETF{\rXF}{}{\num{\rXF}\ts{}\aXFa(5)}\fi&%
				\checkaXFa(6)\let\rXF\cachedata\ifemptydata\relax\else\IfNVOETF{\rXF}{}{\num{\rXF}}\fi&%
				\checkaXFa(7)\let\rXF\cachedata\ifemptydata\relax\else\IfNVOETF{\rXF}{}{\num{\rXF}\%}\fi&%
				\checkaXFa(8)\let\rXF\cachedata\ifemptydata\relax\else\IfNVOETF{\rXF}{}{\num{\rXF} \euro}\fi&%
				\IfNVOETF{\aXF}{}{\num{\aXF} \euro}\expandafter\\\fi%
				\ifdefined\aXGa\rCa{\aXGa}&%
				\checkaXGa(4)\let\rXG\cachedata\ifemptydata\relax\else\IfNVOETF{\rXG}{}{\num{\rXG}\ts{}\aXGa(5)}\fi&%
				\checkaXGa(6)\let\rXG\cachedata\ifemptydata\relax\else\IfNVOETF{\rXG}{}{\num{\rXG}}\fi&%
				\checkaXGa(7)\let\rXG\cachedata\ifemptydata\relax\else\IfNVOETF{\rXG}{}{\num{\rXG}\%}\fi&%
				\checkaXGa(8)\let\rXG\cachedata\ifemptydata\relax\else\IfNVOETF{\rXG}{}{\num{\rXG} \euro}\fi&%
				\IfNVOETF{\aXG}{}{\num{\aXG} \euro}\expandafter\\\fi%
				\ifdefined\aXIa\rCa{\aXIa}&%
				\checkaXIa(4)\let\rXI\cachedata\ifemptydata\relax\else\IfNVOETF{\rXI}{}{\num{\rXI}\ts{}\aXIa(5)}\fi&%
				\checkaXIa(6)\let\rXI\cachedata\ifemptydata\relax\else\IfNVOETF{\rXI}{}{\num{\rXI}}\fi&%
				\checkaXIa(7)\let\rXI\cachedata\ifemptydata\relax\else\IfNVOETF{\rXI}{}{\num{\rXI}\%}\fi&%
				\checkaXIa(8)\let\rXI\cachedata\ifemptydata\relax\else\IfNVOETF{\rXI}{}{\num{\rXI} \euro}\fi&%
				\IfNVOETF{\aXI}{}{\num{\aXI} \euro}\expandafter\\\fi%
				\ifdefined\aXJa\rCa{\aXJa}&%
				\checkaXJa(4)\let\rXJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXJ}{}{\num{\rXJ}\ts{}\aXJa(5)}\fi&%
				\checkaXJa(6)\let\rXJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXJ}{}{\num{\rXJ}}\fi&%
				\checkaXJa(7)\let\rXJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXJ}{}{\num{\rXJ}\%}\fi&%
				\checkaXJa(8)\let\rXJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXJ}{}{\num{\rXJ} \euro}\fi&%
				\IfNVOETF{\aXJ}{}{\num{\aXJ} \euro}\expandafter\\\fi%
				\ifdefined\aXKa\rCa{\aXKa}&%
				\checkaXKa(4)\let\rXK\cachedata\ifemptydata\relax\else\IfNVOETF{\rXK}{}{\num{\rXK}\ts{}\aXKa(5)}\fi&%
				\checkaXKa(6)\let\rXK\cachedata\ifemptydata\relax\else\IfNVOETF{\rXK}{}{\num{\rXK}}\fi&%
				\checkaXKa(7)\let\rXK\cachedata\ifemptydata\relax\else\IfNVOETF{\rXK}{}{\num{\rXK}\%}\fi&%
				\checkaXKa(8)\let\rXK\cachedata\ifemptydata\relax\else\IfNVOETF{\rXK}{}{\num{\rXK} \euro}\fi&%
				\IfNVOETF{\aXK}{}{\num{\aXK} \euro}\expandafter\\\fi%
				\ifdefined\aXLa\rCa{\aXLa}&%
				\checkaXLa(4)\let\rXL\cachedata\ifemptydata\relax\else\IfNVOETF{\rXL}{}{\num{\rXL}\ts{}\aXLa(5)}\fi&%
				\checkaXLa(6)\let\rXL\cachedata\ifemptydata\relax\else\IfNVOETF{\rXL}{}{\num{\rXL}}\fi&%
				\checkaXLa(7)\let\rXL\cachedata\ifemptydata\relax\else\IfNVOETF{\rXL}{}{\num{\rXL}\%}\fi&%
				\checkaXLa(8)\let\rXL\cachedata\ifemptydata\relax\else\IfNVOETF{\rXL}{}{\num{\rXL} \euro}\fi&%
				\IfNVOETF{\aXL}{}{\num{\aXL} \euro}\expandafter\\\fi%
				\ifdefined\aXMa\rCa{\aXMa}&%
				\checkaXMa(4)\let\rXM\cachedata\ifemptydata\relax\else\IfNVOETF{\rXM}{}{\num{\rXM}\ts{}\aXMa(5)}\fi&%
				\checkaXMa(6)\let\rXM\cachedata\ifemptydata\relax\else\IfNVOETF{\rXM}{}{\num{\rXM}}\fi&%
				\checkaXMa(7)\let\rXM\cachedata\ifemptydata\relax\else\IfNVOETF{\rXM}{}{\num{\rXM}\%}\fi&%
				\checkaXMa(8)\let\rXM\cachedata\ifemptydata\relax\else\IfNVOETF{\rXM}{}{\num{\rXM} \euro}\fi&%
				\IfNVOETF{\aXM}{}{\num{\aXM} \euro}\expandafter\\\fi%
				\ifdefined\aXNa\rCa{\aXNa}&%
				\checkaXNa(4)\let\rXN\cachedata\ifemptydata\relax\else\IfNVOETF{\rXN}{}{\num{\rXN}\ts{}\aXNa(5)}\fi&%
				\checkaXNa(6)\let\rXN\cachedata\ifemptydata\relax\else\IfNVOETF{\rXN}{}{\num{\rXN}}\fi&%
				\checkaXNa(7)\let\rXN\cachedata\ifemptydata\relax\else\IfNVOETF{\rXN}{}{\num{\rXN}\%}\fi&%
				\checkaXNa(8)\let\rXN\cachedata\ifemptydata\relax\else\IfNVOETF{\rXN}{}{\num{\rXN} \euro}\fi&%
				\IfNVOETF{\aXN}{}{\num{\aXN} \euro}\expandafter\\\fi%
				\ifdefined\aXOa\rCa{\aXOa}&%
				\checkaXOa(4)\let\rXO\cachedata\ifemptydata\relax\else\IfNVOETF{\rXO}{}{\num{\rXO}\ts{}\aXOa(5)}\fi&%
				\checkaXOa(6)\let\rXO\cachedata\ifemptydata\relax\else\IfNVOETF{\rXO}{}{\num{\rXO}}\fi&%
				\checkaXOa(7)\let\rXO\cachedata\ifemptydata\relax\else\IfNVOETF{\rXO}{}{\num{\rXO}\%}\fi&%
				\checkaXOa(8)\let\rXO\cachedata\ifemptydata\relax\else\IfNVOETF{\rXO}{}{\num{\rXO} \euro}\fi&%
				\IfNVOETF{\aXO}{}{\num{\aXO} \euro}\expandafter\\\fi%
				\ifdefined\aXPa\rCa{\aXPa}&%
				\checkaXPa(4)\let\rXP\cachedata\ifemptydata\relax\else\IfNVOETF{\rXP}{}{\num{\rXP}\ts{}\aXPa(5)}\fi&%
				\checkaXPa(6)\let\rXP\cachedata\ifemptydata\relax\else\IfNVOETF{\rXP}{}{\num{\rXP}}\fi&%
				\checkaXPa(7)\let\rXP\cachedata\ifemptydata\relax\else\IfNVOETF{\rXP}{}{\num{\rXP}\%}\fi&%
				\checkaXPa(8)\let\rXP\cachedata\ifemptydata\relax\else\IfNVOETF{\rXP}{}{\num{\rXP} \euro}\fi&%
				\IfNVOETF{\aXP}{}{\num{\aXP} \euro}\expandafter\\\fi%
				\ifdefined\aXQa\rCa{\aXQa}&%
				\checkaXQa(4)\let\rXQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXQ}{}{\num{\rXQ}\ts{}\aXQa(5)}\fi&%
				\checkaXQa(6)\let\rXQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXQ}{}{\num{\rXQ}}\fi&%
				\checkaXQa(7)\let\rXQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXQ}{}{\num{\rXQ}\%}\fi&%
				\checkaXQa(8)\let\rXQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXQ}{}{\num{\rXQ} \euro}\fi&%
				\IfNVOETF{\aXQ}{}{\num{\aXQ} \euro}\expandafter\\\fi%
				\ifdefined\aXRa\rCa{\aXRa}&%
				\checkaXRa(4)\let\rXR\cachedata\ifemptydata\relax\else\IfNVOETF{\rXR}{}{\num{\rXR}\ts{}\aXRa(5)}\fi&%
				\checkaXRa(6)\let\rXR\cachedata\ifemptydata\relax\else\IfNVOETF{\rXR}{}{\num{\rXR}}\fi&%
				\checkaXRa(7)\let\rXR\cachedata\ifemptydata\relax\else\IfNVOETF{\rXR}{}{\num{\rXR}\%}\fi&%
				\checkaXRa(8)\let\rXR\cachedata\ifemptydata\relax\else\IfNVOETF{\rXR}{}{\num{\rXR} \euro}\fi&%
				\IfNVOETF{\aXR}{}{\num{\aXR} \euro}\expandafter\\\fi%
				\ifdefined\aXSa\rCa{\aXSa}&%
				\checkaXSa(4)\let\rXS\cachedata\ifemptydata\relax\else\IfNVOETF{\rXS}{}{\num{\rXS}\ts{}\aXSa(5)}\fi&%
				\checkaXSa(6)\let\rXS\cachedata\ifemptydata\relax\else\IfNVOETF{\rXS}{}{\num{\rXS}}\fi&%
				\checkaXSa(7)\let\rXS\cachedata\ifemptydata\relax\else\IfNVOETF{\rXS}{}{\num{\rXS}\%}\fi&%
				\checkaXSa(8)\let\rXS\cachedata\ifemptydata\relax\else\IfNVOETF{\rXS}{}{\num{\rXS} \euro}\fi&%
				\IfNVOETF{\aXS}{}{\num{\aXS} \euro}\expandafter\\\fi%
				\ifdefined\aXTa\rCa{\aXTa}&%
				\checkaXTa(4)\let\rXT\cachedata\ifemptydata\relax\else\IfNVOETF{\rXT}{}{\num{\rXT}\ts{}\aXTa(5)}\fi&%
				\checkaXTa(6)\let\rXT\cachedata\ifemptydata\relax\else\IfNVOETF{\rXT}{}{\num{\rXT}}\fi&%
				\checkaXTa(7)\let\rXT\cachedata\ifemptydata\relax\else\IfNVOETF{\rXT}{}{\num{\rXT}\%}\fi&%
				\checkaXTa(8)\let\rXT\cachedata\ifemptydata\relax\else\IfNVOETF{\rXT}{}{\num{\rXT} \euro}\fi&%
				\IfNVOETF{\aXT}{}{\num{\aXT} \euro}\expandafter\\\fi%
				\ifdefined\aXUa\rCa{\aXUa}&%
				\checkaXUa(4)\let\rXU\cachedata\ifemptydata\relax\else\IfNVOETF{\rXU}{}{\num{\rXU}\ts{}\aXUa(5)}\fi&%
				\checkaXUa(6)\let\rXU\cachedata\ifemptydata\relax\else\IfNVOETF{\rXU}{}{\num{\rXU}}\fi&%
				\checkaXUa(7)\let\rXU\cachedata\ifemptydata\relax\else\IfNVOETF{\rXU}{}{\num{\rXU}\%}\fi&%
				\checkaXUa(8)\let\rXU\cachedata\ifemptydata\relax\else\IfNVOETF{\rXU}{}{\num{\rXU} \euro}\fi&%
				\IfNVOETF{\aXU}{}{\num{\aXU} \euro}\expandafter\\\fi%
				\ifdefined\aXVa\rCa{\aXVa}&%
				\checkaXVa(4)\let\rXV\cachedata\ifemptydata\relax\else\IfNVOETF{\rXV}{}{\num{\rXV}\ts{}\aXVa(5)}\fi&%
				\checkaXVa(6)\let\rXV\cachedata\ifemptydata\relax\else\IfNVOETF{\rXV}{}{\num{\rXV}}\fi&%
				\checkaXVa(7)\let\rXV\cachedata\ifemptydata\relax\else\IfNVOETF{\rXV}{}{\num{\rXV}\%}\fi&%
				\checkaXVa(8)\let\rXV\cachedata\ifemptydata\relax\else\IfNVOETF{\rXV}{}{\num{\rXV} \euro}\fi&%
				\IfNVOETF{\aXV}{}{\num{\aXV} \euro}\expandafter\\\fi%
				\ifdefined\aXWa\rCa{\aXWa}&%
				\checkaXWa(4)\let\rXW\cachedata\ifemptydata\relax\else\IfNVOETF{\rXW}{}{\num{\rXW}\ts{}\aXWa(5)}\fi&%
				\checkaXWa(6)\let\rXW\cachedata\ifemptydata\relax\else\IfNVOETF{\rXW}{}{\num{\rXW}}\fi&%
				\checkaXWa(7)\let\rXW\cachedata\ifemptydata\relax\else\IfNVOETF{\rXW}{}{\num{\rXW}\%}\fi&%
				\checkaXWa(8)\let\rXW\cachedata\ifemptydata\relax\else\IfNVOETF{\rXW}{}{\num{\rXW} \euro}\fi&%
				\IfNVOETF{\aXW}{}{\num{\aXW} \euro}\expandafter\\\fi%
				\ifdefined\aXXa\rCa{\aXXa}&%
				\checkaXXa(4)\let\rXX\cachedata\ifemptydata\relax\else\IfNVOETF{\rXX}{}{\num{\rXX}\ts{}\aXXa(5)}\fi&%
				\checkaXXa(6)\let\rXX\cachedata\ifemptydata\relax\else\IfNVOETF{\rXX}{}{\num{\rXX}}\fi&%
				\checkaXXa(7)\let\rXX\cachedata\ifemptydata\relax\else\IfNVOETF{\rXX}{}{\num{\rXX}\%}\fi&%
				\checkaXXa(8)\let\rXX\cachedata\ifemptydata\relax\else\IfNVOETF{\rXX}{}{\num{\rXX} \euro}\fi&%
				\IfNVOETF{\aXX}{}{\num{\aXX} \euro}\expandafter\\\fi%
				\ifdefined\aXYa\rCa{\aXYa}&%
				\checkaXYa(4)\let\rXY\cachedata\ifemptydata\relax\else\IfNVOETF{\rXY}{}{\num{\rXY}\ts{}\aXYa(5)}\fi&%
				\checkaXYa(6)\let\rXY\cachedata\ifemptydata\relax\else\IfNVOETF{\rXY}{}{\num{\rXY}}\fi&%
				\checkaXYa(7)\let\rXY\cachedata\ifemptydata\relax\else\IfNVOETF{\rXY}{}{\num{\rXY}\%}\fi&%
				\checkaXYa(8)\let\rXY\cachedata\ifemptydata\relax\else\IfNVOETF{\rXY}{}{\num{\rXY} \euro}\fi&%
				\IfNVOETF{\aXY}{}{\num{\aXY} \euro}\expandafter\\\fi%	
				\ifdefined\aXZa\rCa{\aXZa}&%
				\checkaXZa(4)\let\rXZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXZ}{}{\num{\rXZ}\ts{}\aXZa(5)}\fi&%
				\checkaXZa(6)\let\rXZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXZ}{}{\num{\rXZ}}\fi&%
				\checkaXZa(7)\let\rXZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXZ}{}{\num{\rXZ}\%}\fi&%
				\checkaXZa(8)\let\rXZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rXZ}{}{\num{\rXZ} \euro}\fi&%
				\IfNVOETF{\aXZ}{}{\num{\aXZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aX} \euro    \\%
			\end{tabularx} %
			\fi%
		\end{center}%
%		\newpage%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\ifdefined\aYAa%
			\captionof{table}{\large{\textsc{\aYCaption}}}\label{tbl:asset:Y}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aYAa\rCa{\aYAa}&%
				\checkaYAa(4)\let\rYA\cachedata\ifemptydata\relax\else\IfNVOETF{\rYA}{}{\num{\rYA}\ts{}\aYAa(5)}\fi&%
				\checkaYAa(6)\let\rYA\cachedata\ifemptydata\relax\else\IfNVOETF{\rYA}{}{\num{\rYA}}\fi&%
				\checkaYAa(7)\let\rYA\cachedata\ifemptydata\relax\else\IfNVOETF{\rYA}{}{\num{\rYA}\%}\fi&%
				\checkaYAa(8)\let\rYA\cachedata\ifemptydata\relax\else\IfNVOETF{\rYA}{}{\num{\rYA} \euro}\fi&%
				\IfNVOETF{\aYA}{}{\num{\aYA} \euro}\expandafter\\\fi%
				\ifdefined\aYBa\rCa{\aYBa}&%
				\checkaYBa(4)\let\rYB\cachedata\ifemptydata\relax\else\IfNVOETF{\rYB}{}{\num{\rYB}\ts{}\aYBa(5)}\fi&%
				\checkaYBa(6)\let\rYB\cachedata\ifemptydata\relax\else\IfNVOETF{\rYB}{}{\num{\rYB}}\fi&%
				\checkaYBa(7)\let\rYB\cachedata\ifemptydata\relax\else\IfNVOETF{\rYB}{}{\num{\rYB}\%}\fi&%
				\checkaYBa(8)\let\rYB\cachedata\ifemptydata\relax\else\IfNVOETF{\rYB}{}{\num{\rYB} \euro}\fi&%
				\IfNVOETF{\aYB}{}{\num{\aYB} \euro}\expandafter\\\fi%
				\ifdefined\aYCa\rCa{\aYCa}&%
				\checkaYCa(4)\let\rYC\cachedata\ifemptydata\relax\else\IfNVOETF{\rYC}{}{\num{\rYC}\ts{}\aYCa(5)}\fi&%
				\checkaYCa(6)\let\rYC\cachedata\ifemptydata\relax\else\IfNVOETF{\rYC}{}{\num{\rYC}}\fi&%
				\checkaYCa(7)\let\rYC\cachedata\ifemptydata\relax\else\IfNVOETF{\rYC}{}{\num{\rYC}\%}\fi&%
				\checkaYCa(8)\let\rYC\cachedata\ifemptydata\relax\else\IfNVOETF{\rYC}{}{\num{\rYC} \euro}\fi&%
				\IfNVOETF{\aYC}{}{\num{\aYC} \euro}\expandafter\\\fi%
				\ifdefined\aYDa\rCa{\aYDa}&%
				\checkaYDa(4)\let\rYD\cachedata\ifemptydata\relax\else\IfNVOETF{\rYD}{}{\num{\rYD}\ts{}\aYDa(5)}\fi&%
				\checkaYDa(6)\let\rYD\cachedata\ifemptydata\relax\else\IfNVOETF{\rYD}{}{\num{\rYD}}\fi&%
				\checkaYDa(7)\let\rYD\cachedata\ifemptydata\relax\else\IfNVOETF{\rYD}{}{\num{\rYD}\%}\fi&%
				\checkaYDa(8)\let\rYD\cachedata\ifemptydata\relax\else\IfNVOETF{\rYD}{}{\num{\rYD} \euro}\fi&%
				\IfNVOETF{\aYD}{}{\num{\aYD} \euro}\expandafter\\\fi%
				\ifdefined\aYEa\rCa{\aYEa}&%
				\checkaYEa(4)\let\rYE\cachedata\ifemptydata\relax\else\IfNVOETF{\rYE}{}{\num{\rYE}\ts{}\aYEa(5)}\fi&%
				\checkaYEa(6)\let\rYE\cachedata\ifemptydata\relax\else\IfNVOETF{\rYE}{}{\num{\rYE}}\fi&%
				\checkaYEa(7)\let\rYE\cachedata\ifemptydata\relax\else\IfNVOETF{\rYE}{}{\num{\rYE}\%}\fi&%
				\checkaYEa(8)\let\rYE\cachedata\ifemptydata\relax\else\IfNVOETF{\rYE}{}{\num{\rYE} \euro}\fi&%
				\IfNVOETF{\aYE}{}{\num{\aYE} \euro}\expandafter\\\fi%
				\ifdefined\aYFa\rCa{\aYFa}&%
				\checkaYFa(4)\let\rYF\cachedata\ifemptydata\relax\else\IfNVOETF{\rYF}{}{\num{\rYF}\ts{}\aYFa(5)}\fi&%
				\checkaYFa(6)\let\rYF\cachedata\ifemptydata\relax\else\IfNVOETF{\rYF}{}{\num{\rYF}}\fi&%
				\checkaYFa(7)\let\rYF\cachedata\ifemptydata\relax\else\IfNVOETF{\rYF}{}{\num{\rYF}\%}\fi&%
				\checkaYFa(8)\let\rYF\cachedata\ifemptydata\relax\else\IfNVOETF{\rYF}{}{\num{\rYF} \euro}\fi&%
				\IfNVOETF{\aYF}{}{\num{\aYF} \euro}\expandafter\\\fi%
				\ifdefined\aYGa\rCa{\aYGa}&%
				\checkaYGa(4)\let\rYG\cachedata\ifemptydata\relax\else\IfNVOETF{\rYG}{}{\num{\rYG}\ts{}\aYGa(5)}\fi&%
				\checkaYGa(6)\let\rYG\cachedata\ifemptydata\relax\else\IfNVOETF{\rYG}{}{\num{\rYG}}\fi&%
				\checkaYGa(7)\let\rYG\cachedata\ifemptydata\relax\else\IfNVOETF{\rYG}{}{\num{\rYG}\%}\fi&%
				\checkaYGa(8)\let\rYG\cachedata\ifemptydata\relax\else\IfNVOETF{\rYG}{}{\num{\rYG} \euro}\fi&%
				\IfNVOETF{\aYG}{}{\num{\aYG} \euro}\expandafter\\\fi%
				\ifdefined\aYIa\rCa{\aYIa}&%
				\checkaYIa(4)\let\rYI\cachedata\ifemptydata\relax\else\IfNVOETF{\rYI}{}{\num{\rYI}\ts{}\aYIa(5)}\fi&%
				\checkaYIa(6)\let\rYI\cachedata\ifemptydata\relax\else\IfNVOETF{\rYI}{}{\num{\rYI}}\fi&%
				\checkaYIa(7)\let\rYI\cachedata\ifemptydata\relax\else\IfNVOETF{\rYI}{}{\num{\rYI}\%}\fi&%
				\checkaYIa(8)\let\rYI\cachedata\ifemptydata\relax\else\IfNVOETF{\rYI}{}{\num{\rYI} \euro}\fi&%
				\IfNVOETF{\aYI}{}{\num{\aYI} \euro}\expandafter\\\fi%
				\ifdefined\aYJa\rCa{\aYJa}&%
				\checkaYJa(4)\let\rYJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYJ}{}{\num{\rYJ}\ts{}\aYJa(5)}\fi&%
				\checkaYJa(6)\let\rYJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYJ}{}{\num{\rYJ}}\fi&%
				\checkaYJa(7)\let\rYJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYJ}{}{\num{\rYJ}\%}\fi&%
				\checkaYJa(8)\let\rYJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYJ}{}{\num{\rYJ} \euro}\fi&%
				\IfNVOETF{\aYJ}{}{\num{\aYJ} \euro}\expandafter\\\fi%
				\ifdefined\aYKa\rCa{\aYKa}&%
				\checkaYKa(4)\let\rYK\cachedata\ifemptydata\relax\else\IfNVOETF{\rYK}{}{\num{\rYK}\ts{}\aYKa(5)}\fi&%
				\checkaYKa(6)\let\rYK\cachedata\ifemptydata\relax\else\IfNVOETF{\rYK}{}{\num{\rYK}}\fi&%
				\checkaYKa(7)\let\rYK\cachedata\ifemptydata\relax\else\IfNVOETF{\rYK}{}{\num{\rYK}\%}\fi&%
				\checkaYKa(8)\let\rYK\cachedata\ifemptydata\relax\else\IfNVOETF{\rYK}{}{\num{\rYK} \euro}\fi&%
				\IfNVOETF{\aYK}{}{\num{\aYK} \euro}\expandafter\\\fi%
				\ifdefined\aYLa\rCa{\aYLa}&%
				\checkaYLa(4)\let\rYL\cachedata\ifemptydata\relax\else\IfNVOETF{\rYL}{}{\num{\rYL}\ts{}\aYLa(5)}\fi&%
				\checkaYLa(6)\let\rYL\cachedata\ifemptydata\relax\else\IfNVOETF{\rYL}{}{\num{\rYL}}\fi&%
				\checkaYLa(7)\let\rYL\cachedata\ifemptydata\relax\else\IfNVOETF{\rYL}{}{\num{\rYL}\%}\fi&%
				\checkaYLa(8)\let\rYL\cachedata\ifemptydata\relax\else\IfNVOETF{\rYL}{}{\num{\rYL} \euro}\fi&%
				\IfNVOETF{\aYL}{}{\num{\aYL} \euro}\expandafter\\\fi%
				\ifdefined\aYMa\rCa{\aYMa}&%
				\checkaYMa(4)\let\rYM\cachedata\ifemptydata\relax\else\IfNVOETF{\rYM}{}{\num{\rYM}\ts{}\aYMa(5)}\fi&%
				\checkaYMa(6)\let\rYM\cachedata\ifemptydata\relax\else\IfNVOETF{\rYM}{}{\num{\rYM}}\fi&%
				\checkaYMa(7)\let\rYM\cachedata\ifemptydata\relax\else\IfNVOETF{\rYM}{}{\num{\rYM}\%}\fi&%
				\checkaYMa(8)\let\rYM\cachedata\ifemptydata\relax\else\IfNVOETF{\rYM}{}{\num{\rYM} \euro}\fi&%
				\IfNVOETF{\aYM}{}{\num{\aYM} \euro}\expandafter\\\fi%
				\ifdefined\aYNa\rCa{\aYNa}&%
				\checkaYNa(4)\let\rYN\cachedata\ifemptydata\relax\else\IfNVOETF{\rYN}{}{\num{\rYN}\ts{}\aYNa(5)}\fi&%
				\checkaYNa(6)\let\rYN\cachedata\ifemptydata\relax\else\IfNVOETF{\rYN}{}{\num{\rYN}}\fi&%
				\checkaYNa(7)\let\rYN\cachedata\ifemptydata\relax\else\IfNVOETF{\rYN}{}{\num{\rYN}\%}\fi&%
				\checkaYNa(8)\let\rYN\cachedata\ifemptydata\relax\else\IfNVOETF{\rYN}{}{\num{\rYN} \euro}\fi&%
				\IfNVOETF{\aYN}{}{\num{\aYN} \euro}\expandafter\\\fi%
				\ifdefined\aYOa\rCa{\aYOa}&%
				\checkaYOa(4)\let\rYO\cachedata\ifemptydata\relax\else\IfNVOETF{\rYO}{}{\num{\rYO}\ts{}\aYOa(5)}\fi&%
				\checkaYOa(6)\let\rYO\cachedata\ifemptydata\relax\else\IfNVOETF{\rYO}{}{\num{\rYO}}\fi&%
				\checkaYOa(7)\let\rYO\cachedata\ifemptydata\relax\else\IfNVOETF{\rYO}{}{\num{\rYO}\%}\fi&%
				\checkaYOa(8)\let\rYO\cachedata\ifemptydata\relax\else\IfNVOETF{\rYO}{}{\num{\rYO} \euro}\fi&%
				\IfNVOETF{\aYO}{}{\num{\aYO} \euro}\expandafter\\\fi%
				\ifdefined\aYPa\rCa{\aYPa}&%
				\checkaYPa(4)\let\rYP\cachedata\ifemptydata\relax\else\IfNVOETF{\rYP}{}{\num{\rYP}\ts{}\aYPa(5)}\fi&%
				\checkaYPa(6)\let\rYP\cachedata\ifemptydata\relax\else\IfNVOETF{\rYP}{}{\num{\rYP}}\fi&%
				\checkaYPa(7)\let\rYP\cachedata\ifemptydata\relax\else\IfNVOETF{\rYP}{}{\num{\rYP}\%}\fi&%
				\checkaYPa(8)\let\rYP\cachedata\ifemptydata\relax\else\IfNVOETF{\rYP}{}{\num{\rYP} \euro}\fi&%
				\IfNVOETF{\aYP}{}{\num{\aYP} \euro}\expandafter\\\fi%
				\ifdefined\aYQa\rCa{\aYQa}&%
				\checkaYQa(4)\let\rYQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYQ}{}{\num{\rYQ}\ts{}\aYQa(5)}\fi&%
				\checkaYQa(6)\let\rYQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYQ}{}{\num{\rYQ}}\fi&%
				\checkaYQa(7)\let\rYQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYQ}{}{\num{\rYQ}\%}\fi&%
				\checkaYQa(8)\let\rYQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYQ}{}{\num{\rYQ} \euro}\fi&%
				\IfNVOETF{\aYQ}{}{\num{\aYQ} \euro}\expandafter\\\fi%
				\ifdefined\aYRa\rCa{\aYRa}&%
				\checkaYRa(4)\let\rYR\cachedata\ifemptydata\relax\else\IfNVOETF{\rYR}{}{\num{\rYR}\ts{}\aYRa(5)}\fi&%
				\checkaYRa(6)\let\rYR\cachedata\ifemptydata\relax\else\IfNVOETF{\rYR}{}{\num{\rYR}}\fi&%
				\checkaYRa(7)\let\rYR\cachedata\ifemptydata\relax\else\IfNVOETF{\rYR}{}{\num{\rYR}\%}\fi&%
				\checkaYRa(8)\let\rYR\cachedata\ifemptydata\relax\else\IfNVOETF{\rYR}{}{\num{\rYR} \euro}\fi&%
				\IfNVOETF{\aYR}{}{\num{\aYR} \euro}\expandafter\\\fi%
				\ifdefined\aYSa\rCa{\aYSa}&%
				\checkaYSa(4)\let\rYS\cachedata\ifemptydata\relax\else\IfNVOETF{\rYS}{}{\num{\rYS}\ts{}\aYSa(5)}\fi&%
				\checkaYSa(6)\let\rYS\cachedata\ifemptydata\relax\else\IfNVOETF{\rYS}{}{\num{\rYS}}\fi&%
				\checkaYSa(7)\let\rYS\cachedata\ifemptydata\relax\else\IfNVOETF{\rYS}{}{\num{\rYS}\%}\fi&%
				\checkaYSa(8)\let\rYS\cachedata\ifemptydata\relax\else\IfNVOETF{\rYS}{}{\num{\rYS} \euro}\fi&%
				\IfNVOETF{\aYS}{}{\num{\aYS} \euro}\expandafter\\\fi%
				\ifdefined\aYTa\rCa{\aYTa}&%
				\checkaYTa(4)\let\rYT\cachedata\ifemptydata\relax\else\IfNVOETF{\rYT}{}{\num{\rYT}\ts{}\aYTa(5)}\fi&%
				\checkaYTa(6)\let\rYT\cachedata\ifemptydata\relax\else\IfNVOETF{\rYT}{}{\num{\rYT}}\fi&%
				\checkaYTa(7)\let\rYT\cachedata\ifemptydata\relax\else\IfNVOETF{\rYT}{}{\num{\rYT}\%}\fi&%
				\checkaYTa(8)\let\rYT\cachedata\ifemptydata\relax\else\IfNVOETF{\rYT}{}{\num{\rYT} \euro}\fi&%
				\IfNVOETF{\aYT}{}{\num{\aYT} \euro}\expandafter\\\fi%
				\ifdefined\aYUa\rCa{\aYUa}&%
				\checkaYUa(4)\let\rYU\cachedata\ifemptydata\relax\else\IfNVOETF{\rYU}{}{\num{\rYU}\ts{}\aYUa(5)}\fi&%
				\checkaYUa(6)\let\rYU\cachedata\ifemptydata\relax\else\IfNVOETF{\rYU}{}{\num{\rYU}}\fi&%
				\checkaYUa(7)\let\rYU\cachedata\ifemptydata\relax\else\IfNVOETF{\rYU}{}{\num{\rYU}\%}\fi&%
				\checkaYUa(8)\let\rYU\cachedata\ifemptydata\relax\else\IfNVOETF{\rYU}{}{\num{\rYU} \euro}\fi&%
				\IfNVOETF{\aYU}{}{\num{\aYU} \euro}\expandafter\\\fi%
				\ifdefined\aYVa\rCa{\aYVa}&%
				\checkaYVa(4)\let\rYV\cachedata\ifemptydata\relax\else\IfNVOETF{\rYV}{}{\num{\rYV}\ts{}\aYVa(5)}\fi&%
				\checkaYVa(6)\let\rYV\cachedata\ifemptydata\relax\else\IfNVOETF{\rYV}{}{\num{\rYV}}\fi&%
				\checkaYVa(7)\let\rYV\cachedata\ifemptydata\relax\else\IfNVOETF{\rYV}{}{\num{\rYV}\%}\fi&%
				\checkaYVa(8)\let\rYV\cachedata\ifemptydata\relax\else\IfNVOETF{\rYV}{}{\num{\rYV} \euro}\fi&%
				\IfNVOETF{\aYV}{}{\num{\aYV} \euro}\expandafter\\\fi%
				\ifdefined\aYWa\rCa{\aYWa}&%
				\checkaYWa(4)\let\rYW\cachedata\ifemptydata\relax\else\IfNVOETF{\rYW}{}{\num{\rYW}\ts{}\aYWa(5)}\fi&%
				\checkaYWa(6)\let\rYW\cachedata\ifemptydata\relax\else\IfNVOETF{\rYW}{}{\num{\rYW}}\fi&%
				\checkaYWa(7)\let\rYW\cachedata\ifemptydata\relax\else\IfNVOETF{\rYW}{}{\num{\rYW}\%}\fi&%
				\checkaYWa(8)\let\rYW\cachedata\ifemptydata\relax\else\IfNVOETF{\rYW}{}{\num{\rYW} \euro}\fi&%
				\IfNVOETF{\aYW}{}{\num{\aYW} \euro}\expandafter\\\fi%
				\ifdefined\aYXa\rCa{\aYXa}&%
				\checkaYXa(4)\let\rYX\cachedata\ifemptydata\relax\else\IfNVOETF{\rYX}{}{\num{\rYX}\ts{}\aYXa(5)}\fi&%
				\checkaYXa(6)\let\rYX\cachedata\ifemptydata\relax\else\IfNVOETF{\rYX}{}{\num{\rYX}}\fi&%
				\checkaYXa(7)\let\rYX\cachedata\ifemptydata\relax\else\IfNVOETF{\rYX}{}{\num{\rYX}\%}\fi&%
				\checkaYXa(8)\let\rYX\cachedata\ifemptydata\relax\else\IfNVOETF{\rYX}{}{\num{\rYX} \euro}\fi&%
				\IfNVOETF{\aYX}{}{\num{\aYX} \euro}\expandafter\\\fi%
				\ifdefined\aYYa\rCa{\aYYa}&%
				\checkaYYa(4)\let\rYY\cachedata\ifemptydata\relax\else\IfNVOETF{\rYY}{}{\num{\rYY}\ts{}\aYYa(5)}\fi&%
				\checkaYYa(6)\let\rYY\cachedata\ifemptydata\relax\else\IfNVOETF{\rYY}{}{\num{\rYY}}\fi&%
				\checkaYYa(7)\let\rYY\cachedata\ifemptydata\relax\else\IfNVOETF{\rYY}{}{\num{\rYY}\%}\fi&%
				\checkaYYa(8)\let\rYY\cachedata\ifemptydata\relax\else\IfNVOETF{\rYY}{}{\num{\rYY} \euro}\fi&%
				\IfNVOETF{\aYY}{}{\num{\aYY} \euro}\expandafter\\\fi%	
				\ifdefined\aYZa\rCa{\aYZa}&%
				\checkaYZa(4)\let\rYZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYZ}{}{\num{\rYZ}\ts{}\aYZa(5)}\fi&%
				\checkaYZa(6)\let\rYZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYZ}{}{\num{\rYZ}}\fi&%
				\checkaYZa(7)\let\rYZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYZ}{}{\num{\rYZ}\%}\fi&%
				\checkaYZa(8)\let\rYZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rYZ}{}{\num{\rYZ} \euro}\fi&%
				\IfNVOETF{\aYZ}{}{\num{\aYZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aY} \euro    \\%
			\end{tabularx} %
			\fi%
			\ifdefined\aZAa%
			\captionof{table}{\large{\textsc{\aZCaption}}}\label{tbl:asset:Z}%
			\begin{tabularx}{\textwidth}{\assetTableColDef}%
				\assetTableColLabels%
				\toprule%
				\ifdefined\aZAa\rCa{\aZAa}&%
				\checkaZAa(4)\let\rZA\cachedata\ifemptydata\relax\else\IfNVOETF{\rZA}{}{\num{\rZA}\ts{}\aZAa(5)}\fi&%
				\checkaZAa(6)\let\rZA\cachedata\ifemptydata\relax\else\IfNVOETF{\rZA}{}{\num{\rZA}}\fi&%
				\checkaZAa(7)\let\rZA\cachedata\ifemptydata\relax\else\IfNVOETF{\rZA}{}{\num{\rZA}\%}\fi&%
				\checkaZAa(8)\let\rZA\cachedata\ifemptydata\relax\else\IfNVOETF{\rZA}{}{\num{\rZA} \euro}\fi&%
				\IfNVOETF{\aZA}{}{\num{\aZA} \euro}\expandafter\\\fi%
				\ifdefined\aZBa\rCa{\aZBa}&%
				\checkaZBa(4)\let\rZB\cachedata\ifemptydata\relax\else\IfNVOETF{\rZB}{}{\num{\rZB}\ts{}\aZBa(5)}\fi&%
				\checkaZBa(6)\let\rZB\cachedata\ifemptydata\relax\else\IfNVOETF{\rZB}{}{\num{\rZB}}\fi&%
				\checkaZBa(7)\let\rZB\cachedata\ifemptydata\relax\else\IfNVOETF{\rZB}{}{\num{\rZB}\%}\fi&%
				\checkaZBa(8)\let\rZB\cachedata\ifemptydata\relax\else\IfNVOETF{\rZB}{}{\num{\rZB} \euro}\fi&%
				\IfNVOETF{\aZB}{}{\num{\aZB} \euro}\expandafter\\\fi%
				\ifdefined\aZCa\rCa{\aZCa}&%
				\checkaZCa(4)\let\rZC\cachedata\ifemptydata\relax\else\IfNVOETF{\rZC}{}{\num{\rZC}\ts{}\aZCa(5)}\fi&%
				\checkaZCa(6)\let\rZC\cachedata\ifemptydata\relax\else\IfNVOETF{\rZC}{}{\num{\rZC}}\fi&%
				\checkaZCa(7)\let\rZC\cachedata\ifemptydata\relax\else\IfNVOETF{\rZC}{}{\num{\rZC}\%}\fi&%
				\checkaZCa(8)\let\rZC\cachedata\ifemptydata\relax\else\IfNVOETF{\rZC}{}{\num{\rZC} \euro}\fi&%
				\IfNVOETF{\aZC}{}{\num{\aZC} \euro}\expandafter\\\fi%
				\ifdefined\aZDa\rCa{\aZDa}&%
				\checkaZDa(4)\let\rZD\cachedata\ifemptydata\relax\else\IfNVOETF{\rZD}{}{\num{\rZD}\ts{}\aZDa(5)}\fi&%
				\checkaZDa(6)\let\rZD\cachedata\ifemptydata\relax\else\IfNVOETF{\rZD}{}{\num{\rZD}}\fi&%
				\checkaZDa(7)\let\rZD\cachedata\ifemptydata\relax\else\IfNVOETF{\rZD}{}{\num{\rZD}\%}\fi&%
				\checkaZDa(8)\let\rZD\cachedata\ifemptydata\relax\else\IfNVOETF{\rZD}{}{\num{\rZD} \euro}\fi&%
				\IfNVOETF{\aZD}{}{\num{\aZD} \euro}\expandafter\\\fi%
				\ifdefined\aZEa\rCa{\aZEa}&%
				\checkaZEa(4)\let\rZE\cachedata\ifemptydata\relax\else\IfNVOETF{\rZE}{}{\num{\rZE}\ts{}\aZEa(5)}\fi&%
				\checkaZEa(6)\let\rZE\cachedata\ifemptydata\relax\else\IfNVOETF{\rZE}{}{\num{\rZE}}\fi&%
				\checkaZEa(7)\let\rZE\cachedata\ifemptydata\relax\else\IfNVOETF{\rZE}{}{\num{\rZE}\%}\fi&%
				\checkaZEa(8)\let\rZE\cachedata\ifemptydata\relax\else\IfNVOETF{\rZE}{}{\num{\rZE} \euro}\fi&%
				\IfNVOETF{\aZE}{}{\num{\aZE} \euro}\expandafter\\\fi%
				\ifdefined\aZFa\rCa{\aZFa}&%
				\checkaZFa(4)\let\rZF\cachedata\ifemptydata\relax\else\IfNVOETF{\rZF}{}{\num{\rZF}\ts{}\aZFa(5)}\fi&%
				\checkaZFa(6)\let\rZF\cachedata\ifemptydata\relax\else\IfNVOETF{\rZF}{}{\num{\rZF}}\fi&%
				\checkaZFa(7)\let\rZF\cachedata\ifemptydata\relax\else\IfNVOETF{\rZF}{}{\num{\rZF}\%}\fi&%
				\checkaZFa(8)\let\rZF\cachedata\ifemptydata\relax\else\IfNVOETF{\rZF}{}{\num{\rZF} \euro}\fi&%
				\IfNVOETF{\aZF}{}{\num{\aZF} \euro}\expandafter\\\fi%
				\ifdefined\aZGa\rCa{\aZGa}&%
				\checkaZGa(4)\let\rZG\cachedata\ifemptydata\relax\else\IfNVOETF{\rZG}{}{\num{\rZG}\ts{}\aZGa(5)}\fi&%
				\checkaZGa(6)\let\rZG\cachedata\ifemptydata\relax\else\IfNVOETF{\rZG}{}{\num{\rZG}}\fi&%
				\checkaZGa(7)\let\rZG\cachedata\ifemptydata\relax\else\IfNVOETF{\rZG}{}{\num{\rZG}\%}\fi&%
				\checkaZGa(8)\let\rZG\cachedata\ifemptydata\relax\else\IfNVOETF{\rZG}{}{\num{\rZG} \euro}\fi&%
				\IfNVOETF{\aZG}{}{\num{\aZG} \euro}\expandafter\\\fi%
				\ifdefined\aZIa\rCa{\aZIa}&%
				\checkaZIa(4)\let\rZI\cachedata\ifemptydata\relax\else\IfNVOETF{\rZI}{}{\num{\rZI}\ts{}\aZIa(5)}\fi&%
				\checkaZIa(6)\let\rZI\cachedata\ifemptydata\relax\else\IfNVOETF{\rZI}{}{\num{\rZI}}\fi&%
				\checkaZIa(7)\let\rZI\cachedata\ifemptydata\relax\else\IfNVOETF{\rZI}{}{\num{\rZI}\%}\fi&%
				\checkaZIa(8)\let\rZI\cachedata\ifemptydata\relax\else\IfNVOETF{\rZI}{}{\num{\rZI} \euro}\fi&%
				\IfNVOETF{\aZI}{}{\num{\aZI} \euro}\expandafter\\\fi%
				\ifdefined\aZJa\rCa{\aZJa}&%
				\checkaZJa(4)\let\rZJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZJ}{}{\num{\rZJ}\ts{}\aZJa(5)}\fi&%
				\checkaZJa(6)\let\rZJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZJ}{}{\num{\rZJ}}\fi&%
				\checkaZJa(7)\let\rZJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZJ}{}{\num{\rZJ}\%}\fi&%
				\checkaZJa(8)\let\rZJ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZJ}{}{\num{\rZJ} \euro}\fi&%
				\IfNVOETF{\aZJ}{}{\num{\aZJ} \euro}\expandafter\\\fi%
				\ifdefined\aZKa\rCa{\aZKa}&%
				\checkaZKa(4)\let\rZK\cachedata\ifemptydata\relax\else\IfNVOETF{\rZK}{}{\num{\rZK}\ts{}\aZKa(5)}\fi&%
				\checkaZKa(6)\let\rZK\cachedata\ifemptydata\relax\else\IfNVOETF{\rZK}{}{\num{\rZK}}\fi&%
				\checkaZKa(7)\let\rZK\cachedata\ifemptydata\relax\else\IfNVOETF{\rZK}{}{\num{\rZK}\%}\fi&%
				\checkaZKa(8)\let\rZK\cachedata\ifemptydata\relax\else\IfNVOETF{\rZK}{}{\num{\rZK} \euro}\fi&%
				\IfNVOETF{\aZK}{}{\num{\aZK} \euro}\expandafter\\\fi%
				\ifdefined\aZLa\rCa{\aZLa}&%
				\checkaZLa(4)\let\rZL\cachedata\ifemptydata\relax\else\IfNVOETF{\rZL}{}{\num{\rZL}\ts{}\aZLa(5)}\fi&%
				\checkaZLa(6)\let\rZL\cachedata\ifemptydata\relax\else\IfNVOETF{\rZL}{}{\num{\rZL}}\fi&%
				\checkaZLa(7)\let\rZL\cachedata\ifemptydata\relax\else\IfNVOETF{\rZL}{}{\num{\rZL}\%}\fi&%
				\checkaZLa(8)\let\rZL\cachedata\ifemptydata\relax\else\IfNVOETF{\rZL}{}{\num{\rZL} \euro}\fi&%
				\IfNVOETF{\aZL}{}{\num{\aZL} \euro}\expandafter\\\fi%
				\ifdefined\aZMa\rCa{\aZMa}&%
				\checkaZMa(4)\let\rZM\cachedata\ifemptydata\relax\else\IfNVOETF{\rZM}{}{\num{\rZM}\ts{}\aZMa(5)}\fi&%
				\checkaZMa(6)\let\rZM\cachedata\ifemptydata\relax\else\IfNVOETF{\rZM}{}{\num{\rZM}}\fi&%
				\checkaZMa(7)\let\rZM\cachedata\ifemptydata\relax\else\IfNVOETF{\rZM}{}{\num{\rZM}\%}\fi&%
				\checkaZMa(8)\let\rZM\cachedata\ifemptydata\relax\else\IfNVOETF{\rZM}{}{\num{\rZM} \euro}\fi&%
				\IfNVOETF{\aZM}{}{\num{\aZM} \euro}\expandafter\\\fi%
				\ifdefined\aZNa\rCa{\aZNa}&%
				\checkaZNa(4)\let\rZN\cachedata\ifemptydata\relax\else\IfNVOETF{\rZN}{}{\num{\rZN}\ts{}\aZNa(5)}\fi&%
				\checkaZNa(6)\let\rZN\cachedata\ifemptydata\relax\else\IfNVOETF{\rZN}{}{\num{\rZN}}\fi&%
				\checkaZNa(7)\let\rZN\cachedata\ifemptydata\relax\else\IfNVOETF{\rZN}{}{\num{\rZN}\%}\fi&%
				\checkaZNa(8)\let\rZN\cachedata\ifemptydata\relax\else\IfNVOETF{\rZN}{}{\num{\rZN} \euro}\fi&%
				\IfNVOETF{\aZN}{}{\num{\aZN} \euro}\expandafter\\\fi%
				\ifdefined\aZOa\rCa{\aZOa}&%
				\checkaZOa(4)\let\rZO\cachedata\ifemptydata\relax\else\IfNVOETF{\rZO}{}{\num{\rZO}\ts{}\aZOa(5)}\fi&%
				\checkaZOa(6)\let\rZO\cachedata\ifemptydata\relax\else\IfNVOETF{\rZO}{}{\num{\rZO}}\fi&%
				\checkaZOa(7)\let\rZO\cachedata\ifemptydata\relax\else\IfNVOETF{\rZO}{}{\num{\rZO}\%}\fi&%
				\checkaZOa(8)\let\rZO\cachedata\ifemptydata\relax\else\IfNVOETF{\rZO}{}{\num{\rZO} \euro}\fi&%
				\IfNVOETF{\aZO}{}{\num{\aZO} \euro}\expandafter\\\fi%
				\ifdefined\aZPa\rCa{\aZPa}&%
				\checkaZPa(4)\let\rZP\cachedata\ifemptydata\relax\else\IfNVOETF{\rZP}{}{\num{\rZP}\ts{}\aZPa(5)}\fi&%
				\checkaZPa(6)\let\rZP\cachedata\ifemptydata\relax\else\IfNVOETF{\rZP}{}{\num{\rZP}}\fi&%
				\checkaZPa(7)\let\rZP\cachedata\ifemptydata\relax\else\IfNVOETF{\rZP}{}{\num{\rZP}\%}\fi&%
				\checkaZPa(8)\let\rZP\cachedata\ifemptydata\relax\else\IfNVOETF{\rZP}{}{\num{\rZP} \euro}\fi&%
				\IfNVOETF{\aZP}{}{\num{\aZP} \euro}\expandafter\\\fi%
				\ifdefined\aZQa\rCa{\aZQa}&%
				\checkaZQa(4)\let\rZQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZQ}{}{\num{\rZQ}\ts{}\aZQa(5)}\fi&%
				\checkaZQa(6)\let\rZQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZQ}{}{\num{\rZQ}}\fi&%
				\checkaZQa(7)\let\rZQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZQ}{}{\num{\rZQ}\%}\fi&%
				\checkaZQa(8)\let\rZQ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZQ}{}{\num{\rZQ} \euro}\fi&%
				\IfNVOETF{\aZQ}{}{\num{\aZQ} \euro}\expandafter\\\fi%
				\ifdefined\aZRa\rCa{\aZRa}&%
				\checkaZRa(4)\let\rZR\cachedata\ifemptydata\relax\else\IfNVOETF{\rZR}{}{\num{\rZR}\ts{}\aZRa(5)}\fi&%
				\checkaZRa(6)\let\rZR\cachedata\ifemptydata\relax\else\IfNVOETF{\rZR}{}{\num{\rZR}}\fi&%
				\checkaZRa(7)\let\rZR\cachedata\ifemptydata\relax\else\IfNVOETF{\rZR}{}{\num{\rZR}\%}\fi&%
				\checkaZRa(8)\let\rZR\cachedata\ifemptydata\relax\else\IfNVOETF{\rZR}{}{\num{\rZR} \euro}\fi&%
				\IfNVOETF{\aZR}{}{\num{\aZR} \euro}\expandafter\\\fi%
				\ifdefined\aZSa\rCa{\aZSa}&%
				\checkaZSa(4)\let\rZS\cachedata\ifemptydata\relax\else\IfNVOETF{\rZS}{}{\num{\rZS}\ts{}\aZSa(5)}\fi&%
				\checkaZSa(6)\let\rZS\cachedata\ifemptydata\relax\else\IfNVOETF{\rZS}{}{\num{\rZS}}\fi&%
				\checkaZSa(7)\let\rZS\cachedata\ifemptydata\relax\else\IfNVOETF{\rZS}{}{\num{\rZS}\%}\fi&%
				\checkaZSa(8)\let\rZS\cachedata\ifemptydata\relax\else\IfNVOETF{\rZS}{}{\num{\rZS} \euro}\fi&%
				\IfNVOETF{\aZS}{}{\num{\aZS} \euro}\expandafter\\\fi%
				\ifdefined\aZTa\rCa{\aZTa}&%
				\checkaZTa(4)\let\rZT\cachedata\ifemptydata\relax\else\IfNVOETF{\rZT}{}{\num{\rZT}\ts{}\aZTa(5)}\fi&%
				\checkaZTa(6)\let\rZT\cachedata\ifemptydata\relax\else\IfNVOETF{\rZT}{}{\num{\rZT}}\fi&%
				\checkaZTa(7)\let\rZT\cachedata\ifemptydata\relax\else\IfNVOETF{\rZT}{}{\num{\rZT}\%}\fi&%
				\checkaZTa(8)\let\rZT\cachedata\ifemptydata\relax\else\IfNVOETF{\rZT}{}{\num{\rZT} \euro}\fi&%
				\IfNVOETF{\aZT}{}{\num{\aZT} \euro}\expandafter\\\fi%
				\ifdefined\aZUa\rCa{\aZUa}&%
				\checkaZUa(4)\let\rZU\cachedata\ifemptydata\relax\else\IfNVOETF{\rZU}{}{\num{\rZU}\ts{}\aZUa(5)}\fi&%
				\checkaZUa(6)\let\rZU\cachedata\ifemptydata\relax\else\IfNVOETF{\rZU}{}{\num{\rZU}}\fi&%
				\checkaZUa(7)\let\rZU\cachedata\ifemptydata\relax\else\IfNVOETF{\rZU}{}{\num{\rZU}\%}\fi&%
				\checkaZUa(8)\let\rZU\cachedata\ifemptydata\relax\else\IfNVOETF{\rZU}{}{\num{\rZU} \euro}\fi&%
				\IfNVOETF{\aZU}{}{\num{\aZU} \euro}\expandafter\\\fi%
				\ifdefined\aZVa\rCa{\aZVa}&%
				\checkaZVa(4)\let\rZV\cachedata\ifemptydata\relax\else\IfNVOETF{\rZV}{}{\num{\rZV}\ts{}\aZVa(5)}\fi&%
				\checkaZVa(6)\let\rZV\cachedata\ifemptydata\relax\else\IfNVOETF{\rZV}{}{\num{\rZV}}\fi&%
				\checkaZVa(7)\let\rZV\cachedata\ifemptydata\relax\else\IfNVOETF{\rZV}{}{\num{\rZV}\%}\fi&%
				\checkaZVa(8)\let\rZV\cachedata\ifemptydata\relax\else\IfNVOETF{\rZV}{}{\num{\rZV} \euro}\fi&%
				\IfNVOETF{\aZV}{}{\num{\aZV} \euro}\expandafter\\\fi%
				\ifdefined\aZWa\rCa{\aZWa}&%
				\checkaZWa(4)\let\rZW\cachedata\ifemptydata\relax\else\IfNVOETF{\rZW}{}{\num{\rZW}\ts{}\aZWa(5)}\fi&%
				\checkaZWa(6)\let\rZW\cachedata\ifemptydata\relax\else\IfNVOETF{\rZW}{}{\num{\rZW}}\fi&%
				\checkaZWa(7)\let\rZW\cachedata\ifemptydata\relax\else\IfNVOETF{\rZW}{}{\num{\rZW}\%}\fi&%
				\checkaZWa(8)\let\rZW\cachedata\ifemptydata\relax\else\IfNVOETF{\rZW}{}{\num{\rZW} \euro}\fi&%
				\IfNVOETF{\aZW}{}{\num{\aZW} \euro}\expandafter\\\fi%
				\ifdefined\aZXa\rCa{\aZXa}&%
				\checkaZXa(4)\let\rZX\cachedata\ifemptydata\relax\else\IfNVOETF{\rZX}{}{\num{\rZX}\ts{}\aZXa(5)}\fi&%
				\checkaZXa(6)\let\rZX\cachedata\ifemptydata\relax\else\IfNVOETF{\rZX}{}{\num{\rZX}}\fi&%
				\checkaZXa(7)\let\rZX\cachedata\ifemptydata\relax\else\IfNVOETF{\rZX}{}{\num{\rZX}\%}\fi&%
				\checkaZXa(8)\let\rZX\cachedata\ifemptydata\relax\else\IfNVOETF{\rZX}{}{\num{\rZX} \euro}\fi&%
				\IfNVOETF{\aZX}{}{\num{\aZX} \euro}\expandafter\\\fi%
				\ifdefined\aZYa\rCa{\aZYa}&%
				\checkaZYa(4)\let\rZY\cachedata\ifemptydata\relax\else\IfNVOETF{\rZY}{}{\num{\rZY}\ts{}\aZYa(5)}\fi&%
				\checkaZYa(6)\let\rZY\cachedata\ifemptydata\relax\else\IfNVOETF{\rZY}{}{\num{\rZY}}\fi&%
				\checkaZYa(7)\let\rZY\cachedata\ifemptydata\relax\else\IfNVOETF{\rZY}{}{\num{\rZY}\%}\fi&%
				\checkaZYa(8)\let\rZY\cachedata\ifemptydata\relax\else\IfNVOETF{\rZY}{}{\num{\rZY} \euro}\fi&%
				\IfNVOETF{\aZY}{}{\num{\aZY} \euro}\expandafter\\\fi%	
				\ifdefined\aZZa\rCa{\aZZa}&%
				\checkaZZa(4)\let\rZZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZZ}{}{\num{\rZZ}\ts{}\aZZa(5)}\fi&%
				\checkaZZa(6)\let\rZZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZZ}{}{\num{\rZZ}}\fi&%
				\checkaZZa(7)\let\rZZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZZ}{}{\num{\rZZ}\%}\fi&%
				\checkaZZa(8)\let\rZZ\cachedata\ifemptydata\relax\else\IfNVOETF{\rZZ}{}{\num{\rZZ} \euro}\fi&%
				\IfNVOETF{\aZZ}{}{\num{\aZZ} \euro}\expandafter\\\fi%
				\bottomrule%
				\assetSum        &       &       &       &        &      &       & \num{\aZ} \euro    \\%
			\end{tabularx} %
			\fi%
		\end{center}%
	}%
	\renewcommand{\assetTableMain}{%
		\begin{center}%
			\normalsize\renewcommand{\arraystretch}{1.2} %
			\captionof*{table}{{\textsc{\assetTableCaption}}}%
			\begin{tabularx}{\textwidth}{L{0.80}R{0.20}} %
				\textbf{\assetCategorie}                                          &  \assetSumSub                  \\ %
				\toprule%
				\ifdefined\aAAa \aACaption\ (\assetTableLabel\ \ref{tbl:asset:A}) & \num{\aA} \euro \expandafter\\\fi%
				\ifdefined\aBAa \aBCaption\ (\assetTableLabel\ \ref{tbl:asset:B}) & \num{\aB} \euro \expandafter\\\fi%
				\ifdefined\aCAa \aCCaption\ (\assetTableLabel\ \ref{tbl:asset:C}) & \num{\aC} \euro \expandafter\\\fi%
				\ifdefined\aDAa \aDCaption\ (\assetTableLabel\ \ref{tbl:asset:D}) & \num{\aD} \euro \expandafter\\\fi%
				\ifdefined\aEAa \aECaption\ (\assetTableLabel\ \ref{tbl:asset:E}) & \num{\aE} \euro \expandafter\\\fi%
				\ifdefined\aFAa \aFCaption\ (\assetTableLabel\ \ref{tbl:asset:F}) & \num{\aF} \euro \expandafter\\\fi%
				\ifdefined\aGAa \aGCaption\ (\assetTableLabel\ \ref{tbl:asset:G}) & \num{\aG} \euro \expandafter\\\fi%
				\ifdefined\aHAa \aHCaption\ (\assetTableLabel\ \ref{tbl:asset:H}) & \num{\aH} \euro \expandafter\\\fi%
				\ifdefined\aIAa \aICaption\ (\assetTableLabel\ \ref{tbl:asset:I}) & \num{\aI} \euro \expandafter\\\fi%
				\ifdefined\aJAa \aJCaption\ (\assetTableLabel\ \ref{tbl:asset:J}) & \num{\aJ} \euro \expandafter\\\fi%
				\ifdefined\aKAa \aKCaption\ (\assetTableLabel\ \ref{tbl:asset:K}) & \num{\aK} \euro \expandafter\\\fi%
				\ifdefined\aLAa \aLCaption\ (\assetTableLabel\ \ref{tbl:asset:L}) & \num{\aL} \euro \expandafter\\\fi%
				\ifdefined\aMAa \aMCaption\ (\assetTableLabel\ \ref{tbl:asset:M}) & \num{\aM} \euro \expandafter\\\fi%
				\ifdefined\aNAa \aNCaption\ (\assetTableLabel\ \ref{tbl:asset:N}) & \num{\aN} \euro \expandafter\\\fi%
				\ifdefined\aOAa \aOCaption\ (\assetTableLabel\ \ref{tbl:asset:O}) & \num{\aO} \euro \expandafter\\\fi%
				\ifdefined\aPAa \aPCaption\ (\assetTableLabel\ \ref{tbl:asset:P}) & \num{\aP} \euro \expandafter\\\fi%
				\ifdefined\aQAa \aQCaption\ (\assetTableLabel\ \ref{tbl:asset:Q}) & \num{\aQ} \euro \expandafter\\\fi%
				\ifdefined\aRAa \aRCaption\ (\assetTableLabel\ \ref{tbl:asset:R}) & \num{\aR} \euro \expandafter\\\fi%
				\ifdefined\aSAa \aSCaption\ (\assetTableLabel\ \ref{tbl:asset:S}) & \num{\aS} \euro \expandafter\\\fi%
				\ifdefined\aTAa \aTCaption\ (\assetTableLabel\ \ref{tbl:asset:T}) & \num{\aT} \euro \expandafter\\\fi%
				\ifdefined\aUAa \aUCaption\ (\assetTableLabel\ \ref{tbl:asset:U}) & \num{\aU} \euro \expandafter\\\fi%
				\ifdefined\aVAa \aVCaption\ (\assetTableLabel\ \ref{tbl:asset:V}) & \num{\aV} \euro \expandafter\\\fi%
				\ifdefined\aWAa \aWCaption\ (\assetTableLabel\ \ref{tbl:asset:W}) & \num{\aW} \euro \expandafter\\\fi%
				\ifdefined\aXAa \aXCaption\ (\assetTableLabel\ \ref{tbl:asset:X}) & \num{\aX} \euro \expandafter\\\fi%
				\ifdefined\aYAa \aYCaption\ (\assetTableLabel\ \ref{tbl:asset:Y}) & \num{\aY} \euro \expandafter\\\fi%
				\ifdefined\aZAa \aZCaption\ (\assetTableLabel\ \ref{tbl:asset:Z}) & \num{\aZ} \euro \expandafter\\\fi%
				\bottomrule%
				\assetSum                                               & \num{\asset} \euro%
			\end{tabularx} %
		\end{center}%
	}%
\fi%
