From: Eriberto <eriberto@eriberto.pro.br>
Subject: Re: Space lost?
Date: Sat, 07 Jan 2006 11:23:59 -0200
Message-ID: <43BFC0EF.9080901@eriberto.pro.br>
References: <43BF4857.8070901@eriberto.pro.br> <3405.66.131.16.74.1136610974.squirrel@x2a.org> <43BF92DB.5010409@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43BF92DB.5010409@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello David. Thanks for your reply!

David Masover escreveu:

> In other words, those 604 KB are things like the magic number, so
>
>utilities like "file" can guess what FS it is, or what type of file if
>it's an image, and mostly things like the journal and the amount of
>space it takes to represent one empty folder.
>  
>
Ok. I am intrigued with a fact: the ext3 uses 14 MB (14.935 KB) when 
formatting the same partition. Is this a magic number too? It is very 
large! As the Reiser4, ext3 uses 5% of space to administration by super 
user. However this 5% are inserted in the patition use (the 14 MB as 604 
KB are out of patition). For that I know, the journal is in the 
partition too. When I format a partition, immediately after the df 
command shows a amount used. This is the journal. Or not?

>And btw, if you put exactly 100KB on your disk, split into 1KB files,
>you're probably going to notice your disk usage going up by more than
>exactly 100KB.  How much it goes up by is going to be roughly equivalent
>to how much space it takes to store the name of each 1KB file.
>
>Here's another interesting experiment:  Take a directory tree of lots of
>small files.  Gentoo's /usr/portage is a good example.  Copy it to ext3,
>XFS, reiserfs, and Reiser4, then run "du -s" on each copy.  I can almost
>guarentee that Reiser4's is going to be significantly smaller, enough to
>show up on even "du -sh".  Smaller by tens of megabytes, at least.
>  
>
I heard to say that Reiser adapt the size of the block to the size of 
each file. Is true this?

>So you really shouldn't complain about your lost 604 KB.
>
>  
>
I need to understand how this works to be able to explain to my pupils.

Thanks in advance!


