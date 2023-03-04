### Exercise:

Digital clock -

Write a shell script that will output the time and run continuously as a clock. 

### Command:
```
#!/bin/bash

while true
do
  clear
  echo $(date +%T)
  sleep 1s
done
```

Explanation -
* while --> to run a loop that outputs continuously
* clear --> clears the last output from the terminal
* echo $(date +%T) --> prints only the time from the date time output
* sleep 1s --> takes a 1s break before running the loop again

### Exercise:

Word-frequency in US Declaration of Independence -

Write a single pipeline that will output (both to stdout and to a file called usdechistogram.txt) the top 10 words, by frequency (and ignoring case) in the US Declaration of Independence, along with the number of times each occurs.
```
https://web.math.princeton.edu/~perezgiz/usdec.txt
```

### Command: 
```
wget -qO - https://web.math.princeton.edu/~perezgiz/usdec.txt | tr -s '[:punct:][:space:]]' '\n' | sort | uniq -c -i | sort -n | tail | tee usdechistogram.txt
```

Explanation -
* wget -qO url --> get data from url and display on stdout
* tr -s '[:punct:][:space:]]' '\n' --> replace punctuation and whitespace with a newline character
* sort --> sort all the words alphabetically so its easy to sqaush and find unique count
* uniq -c -i --> returns the count of word after sqaushing and ignores case
* sort -n --> sorts by number
* tail --> returns the last 10 lines
* tee filename --> redirects output to both display and file
