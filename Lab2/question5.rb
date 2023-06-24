/hello/ =~ 'hello' # => 0

/love | hate/ =~ 'love' # => 0
/love | hate/ =~ 'hate' # => 0

/colou?r/ =~ 'color' # => 0
/colou?r/ =~ 'colour' # => 0

/gr[ae]y/ =~ 'gray' # => 0
/gr[ae]y/ =~ 'grey' # => 0

/b[aeiou]bble/ =~ 'babble' # => 0
/b[aeiou]bble/ =~ 'bebble' # => 0

/go*gle/ =~ 'ggle' # => 0
/go*gle/ =~ 'goggle' # => 2

/go+gle/ =~ 'gogle' # => 0
/go+gle/ =~ 'google' # => 0

/g(oo)+gle/ =~ 'google' # => 0
/g(oo)+gle/ =~ 'goooogle' # => 0

/x{3}/ =~ 'xxx' # => 0
/x{3}/ =~ 'xxxx' # => 0

/x{6,10}/ =~ 'xxxxxx' # => 0
/x{6,10}/ =~ 'xxxxxxx' # => 0

/w/ =~ 'weather' # => 0
/w/ =~ 'watermelon' # => 0

/\w/ =~ 'ABC' # => 0
/\w/ =~ '123' # => 0

/d/ =~ 'dainty' # => 0
/d/ =~ 'dazzle' # => 0

/\d/ =~ '408' # => 0
/\d/ =~ '650' # => 0

/\d{5}/ =~ '01234' # => 0
/\d{5}/ =~ '567890' # => 0

/\d+(\.\d\d)?/ =~ '1.23' # => 0
/\d+(\.\d\d)?/ =~ '777' # => 0

/hello\d+/ =~ 'hello1' # => 0
/hello\d+/ =~ 'hello234' # => 0

/sh[^io]t/ =~ 'shrt' # => 0
/sh[^io]t/ =~ 'shut' # => 0

/^ruby/ =~ 'rubyonrails' # => 0
/^ruby/ =~ 'rubylicense' # => 0

/ruby$/ =~ 'hi ruby' # => 3
/ruby$/ =~ 'bye ruby' # => 4

/^ruby$/ =~ 'ruby' # => 0