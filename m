From: Hans Reiser <reiser@namesys.com>
Subject: Re: Performance question
Date: Mon, 06 May 2002 15:06:51 +0400
Message-ID: <3CD663CB.20703@namesys.com>
References: <200205051420.g45EKKo02315@linux1.futureware.at> <20020505190739.A13452@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Philipp G?hring <p.guehring@futureware.at>, reiserfs-list@namesys.com

glob is implemented by the shell not the filesystem.  This is not for 
good reason, it just is.  We could write something for you to do it in 
the filesystem and it would be faster.  Is your need for speed critical 
enough to justify writing something special for it?

Hans


Oleg Drokin wrote:

>Hello!
>
>On Sun, May 05, 2002 at 04:20:13PM +0200, Philipp G?hring wrote:
>
>  
>
>>Let's say I have a directory with 100.000 files in it.
>>The filenames look like
>>name1_name2_name3_id
>>So I have
>>001_41052_50125_1
>>001_63216_1212_1
>>I have to create a search engine, that serves for example the 4th Block of 10 
>>files that match the query "001_*_1212_1". The how query would result to 100 
>>files, that are spread across the directory.
>>Now my question:
>>Is it faster with ReiserFS to do a bsd_glob("001_*_1212_1") first, which 
>>should result to about 100 entries, and then take the entries 40 to 49 from 
>>the resulting array? 
>>(Is ReiserFS able to directly return 100 files out of 100000 with the 
>>globbing function, or is it an iteration over all files in the directory?)
>>    
>>
>
>*glob functions are implemented by various library functions, that do full
>readdir scans at least once, I believe.
>
>  
>
>>Or should I do 2 opendir-readdir loops, one to read over the first 39 
>>results, that I do not need, and the second one to geht the results 40 to 49?
>>    
>>
>
>In fact I do not see why do you need to do 2 opendir-readdir loops.
>One loop should be enough.
>You just compare each filename returned against your query and and if it matched
>remember it in separate list. So at the end of readdir loop you have a list of
>all names in a directory that match your query. And you can apply any additional
>check in place just not to remember unnecesary files.
>
>  
>
>>The problem here is that I have to readdir about 50000 files (40000 to get 
>>through the unneeded results, and 10000 to get the 10 results i need)
>>But on the other hand, I do not have to remember 100 files, from which I only 
>>need 10.
>>    
>>
>
>I am completely missing the idea on where these numbers are from. Can you
>explain in more details.
>
>  
>
>>If ReiserFS has to iterate over 100000 files (the whole directory) to do a 
>>"001_*_1212_1" glob, because the binary tree only speeds up known files, but 
>>not patterns, then opendir-readdir should be faster, I guess.
>>    
>>
>
>Binary tree is only helps when you know filename, I believe. You calculate
>a hash and out of that hash you can quickly find desired location.
>You you come up with a hash that places all filenames like your one near one,
>this will help, then.
>
>  
>
>>Another option would be to use subdirectories like
>>name1/name2/name3/id
>>So the glob would be "001/*/1212/1", which should be faster, anyway.
>>But on the other hand, I would have to do a lot more directory management, 
>>creating and deleting directories ...
>>And implementing an opendir-readdir search through "001/*/1212/1" will be 
>>more work too.
>>    
>>
>
>Readdir would require less iterations through 001/*, because number of
>entries will be only 100 as you described above.
>You get all these 100 entries and then loop 100 times trying to open
>001/${next_name}/1212/1 and deciding whenever you need this file or not.
>(If it exists of course, or you might get -ENOENT and proceed to next
>directory).
>Also deleting directories would be an overkill.
>I think this might be faster in many circumfstances.
>Also what you've descrived looks very like to what squid does. And squid people
>went to reiserfs-raw interface and are quite happy with it.
>
>
>Bye,
>    Oleg
>
>
>  
>



