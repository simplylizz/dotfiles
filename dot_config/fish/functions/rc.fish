function rc --wraps=rg --description 'alias rc=rg --color always'
  rg --color always $argv;
end
