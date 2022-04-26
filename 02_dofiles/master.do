********************************************************************************
* Nombre: Downloads and cleans CSES data
* Autor: Rodrigo Fernández Caba
********************************************************************************

global projectdir "C:/Users/Rodrigo/Desktop/CSES-data-to-long-format"
global sevenzip_location "C:\Program Files\7-Zip\7zG.exe"

cd "$projectdir"

do ./git_config.do "CSES-data-to-long-format"

do ./git_push.do "functionality to download and unzip added"


* Downloads the file specified in filename
cd "$projectdir/01_raw/"
local filename cses5_stata
copy "https://cses.org/wp-content/uploads/2022/02/`filename'.zip" "`filename'.zip", replace
shell "$sevenzip_location" x ./`filename'.zip -y
*shell "$sevenzip_location" e -y `filename'
erase `filename'.zip 
di "." _cont  // displays a dot for each file
cd "$projectdir"

use ./01_raw/cses5.dta, clear

