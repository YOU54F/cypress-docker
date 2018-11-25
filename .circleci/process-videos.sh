for f in cypress/videos/*.mp4; do

  trimmed_filename=$(echo $f | sed 's#.*/##' )       
  list_of_files = list_of_files + trimmed_filename
  done

echo $list_of_files