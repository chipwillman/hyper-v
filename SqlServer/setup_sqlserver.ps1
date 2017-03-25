iwr https://chocolatey.org/install.ps1 | iex

cinst -y mssql2014express-defaultinstance
cinst -y totalcommander
cinst -y nscp

# load all nsclient functions
# set nrpe password
# allow arguments = 1