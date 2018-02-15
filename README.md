# CerisicBeamer
This template provides a class definition, to create a beamer presentation with the CERISIC layout. It also provides high level options to easily configure your presentation.

## Getting Started

To get started, download the template as a zip file, and compile the _example.tex_ file inside the template folder.

## Installation (optional)


## Usage
### General class options
french, english

The default value of the language is **french**. If you set the language to **english** it will automatically 

#### Example(s):
* \documentclass[french]{CERISICBeamer}
* \documentclass[english]{CERISICBeamer}

### Command \setup[] options

* hook: Sets the value of the LaTeX hook. There is no default value. The **hook** value can be _AtBeginPart_ or _AtBeginSection_ or _AtBeginSubsection_. If the value is set to _AtBeginPart_, each time a _\part{<Part title>}_ command is encountered a new frame will be created with <Part title> on the frame. If the value is set to _AtBeginSection_, a new frame will be created each time a _\part{<Part title>}_ and a _\section{<Section title>} command is encountered. Same behaviour for _AtBeginSubsection_.
	Example: hook=AtBeginPart

* tocname: Sets the name of the table of content. This name will be repeated in the frametitle each time a hook is encounterd. Default value is _Sommaire_ in _french_ and _Outline_ in _english_. If you don't want this name to appear on each hook frame, just set it's value to _{}_ (empty brackets).
	Example: tocname={Contents}

* timeduration: Sets the duration of the presentation stopwatch (in minutes). The stop watch will be defined only if this value is set. There is no default value.
	Example: timeduration=20

* timeinterval: Set the stopwatch refresh interval (in seconds). Default value is 10 seconds.
	Example: timeinterval=10

* timedeath: If this options is set to _1_, the presentation will be automatically closed when 110% of _timeduration_ is reached. If it set to _0_ it will not be cloased. Default value is 0.
	Example: timedeath = 1

* timewarningfirst: Sets the apparition of the first warning. This value is set in % (of _timeduration_). When this value is reached the stopwatch will turn red. Default value is 80%.
	Example: timewarningfirst=80

* timewarningsecond: Sets the apparition of the first warning. This value is set in % (of _timeduration_). When this value is reached the stopwatch will turn red on yellow background. Default value is 95%.
	Example: timewarningsecond=95

* resetatpages: Sets the frame number when the stopwatch must be refreshed. Default value is 2.
	Example: resetatpages=3

#### Example(s):

\setup[hook=AtBeginPart,
	   timeduration=10,
	   timeinterval=1]

\setup[hook=AtBeginSection,
	   tocname={},
	   timeduration=10,
	   timeinterval=1]



### Command **\titleframe** options
* title : Sets the title of the presentation. Usually your project's full title.
	* Example: title = {Title of the presentation}

* titlealign : Sets the alignment of the title. Values can be _flushleft_, _center_ or _flushright_. Default value is _flushright_.
	* Example: titlealign = {center}

* subtitle : Sets the subtitle of the presentation. Usually your project's name (or acronym)
	* Example: subtitle = {Subtitle}

* industrialpartner : Sets your industrial partner's logo. If you use several options (like _industrialpartner_, _scientificpartner_ and _fundingsponsor_) we recommend to define the _height_ of the image instead of the _width_.
	* Example: industrialpartner = {\includegraphics[height=0.25\textwidth]{./img/CERISIC_logo.png}}

* scientificpartner : Sets your scientific partner's logo. If you use several options (like _industrialpartner_, _scientificpartner_ and _fundingsponsor_) we recommend to define the _height_ of the image instead of the _width_.
	* Example: scientificpartner = {\includegraphics[height=0.25\textwidth]{./img/CERISIC_logo.png}}

* fundingsponsor : Sets your funding sponsor's logo. If you use several options (like _industrialpartner_, _scientificpartner_ and _fundingsponsor_) we recommend to define the _height_ of the image instead of the _width_.
	* Example: fundingsponsor = {\includegraphics[height=0.25\textwidth]{./img/CERISIC_logo.png}}

* tutortitle : Sets the the tutor title. This option has no default value, so if not defined, this field will dissapear from the titleframe.
	* Example: tutortitle = {\textbf{Promoter:}}

* tutor : Sets the the tutor(s) name(s). This option has no default value, so if not defined, this field will dissapear from the titleframe.
	* Example: tutor = {J. Doe}

* authortitle: Sets the the author title. This option has no default value, so if not defined, this field will dissapear from the titleframe.
	* Example: authortitle = {\textbf{Author:}}

* author : Sets the the author(s) name(s). This option has no default value, so if not defined, this field will dissapear from the titleframe. Since these options (_tutortitle_, _tutor_, _auhtortitle_ and _author_) are defined in minipages, it might be required to equilibrate your minipages. Especially if you have a different number of tutors than author. To do so just add line breaks (\\\\) and insecable spaces (~).
	* Example: author = {John Doe\\~}

* date : Sets the date.
	* Example: date = {18/02/2018}

#### Example(s):
\titleframe[title={\Large{\bf Title of the presentation}},
			titlealign=flushright,
			subtitle=\normalsize{Subtitle},
			scientificpartner = {\includegraphics[height=0.25\textwidth]{./img/CERISIC_logo.png}},
			industrialpartner = {\includegraphics[height=0.25\textwidth]{./img/CERISIC_logo.png}},
			fundingsponsor = {\includegraphics[height=0.25\textwidth]{./img/CERISIC_logo.png}},
			tutortitle = {\textbf{Promoter:}},
			tutor = {John Doe},
			authortitle = {\textbf{Author:}},
			author = {John Doe\\~},
			date=\today]

### Command **\finalframe** options

If the language (in general options) is set to **french** the **\finalframe** command will automatically create a frame with the text "Merci de votre attention". If the language is set to **english** the displayed text will be "Thank you for your attention". If you want to set the text manually, just add the option **text** and write your text inside the brackets.

* text = Sets the text to be displayed on the final slide. 
	* Example: text={Questions?}

#### Example(s):

* \finalframe
* \finalframe[text={Questions?}]


## License
This project is licensed under the GPLv3 License - see the LICENSE file for details