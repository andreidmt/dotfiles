function far -a searchVal -a newVal -d "~> Find And Replace"
  set -l current_dir (pwd) 

  echo-head "find: rg $searchVal -l" "dir: $current_dir" 
  
  set -l files (rg $searchVal -l)
  set -l filesCount (echo $files | tr " " \\n | wc -l)

  echo -e Files matching: $filesCount

  echo-head "replace: sed -i 's/$searchVal/$newVal/g' filename" 



end
