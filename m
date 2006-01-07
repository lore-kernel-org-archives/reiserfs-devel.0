From: David Masover <ninja@slaphack.com>
Subject: Re: Space lost?
Date: Sat, 07 Jan 2006 14:25:56 -0600
Message-ID: <43C023D4.7080300@slaphack.com>
References: <43BF4857.8070901@eriberto.pro.br> <3405.66.131.16.74.1136610974.squirrel@x2a.org> <43BF92DB.5010409@slaphack.com> <43BFC0EF.9080901@eriberto.pro.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43BFC0EF.9080901@eriberto.pro.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eriberto <eriberto@eriberto.pro.br>
Cc: reiserfs-list@namesys.com

Eriberto wrote:
> Hello David. Thanks for your reply!
> 
> David Masover escreveu:
> 
>> In other words, those 604 KB are things like the magic number, so
>>
>> utilities like "file" can guess what FS it is, or what type of file if
>> it's an image, and mostly things like the journal and the amount of
>> space it takes to represent one empty folder.
>>  
>>
> Ok. I am intrigued with a fact: the ext3 uses 14 MB (14.935 KB) when
> formatting the same partition. Is this a magic number too? It is very
> large!

So would 604 KB.  The magic number is going to be less than 1KB, it's
going to be measured in at most tens of bytes.

There's more to it than that, though.

> As the Reiser4, ext3 uses 5% of space to administration by super
> user. However this 5% are inserted in the patition use (the 14 MB as 604
> KB are out of patition). For that I know, the journal is in the
> partition too. When I format a partition, immediately after the df
> command shows a amount used. This is the journal. Or not?

Could be.  Anyway, the 14 megs ext3 uses are almost certainly
_including_ the magic number, but are not _entirely_ the magic number,
there's a lot of structural stuff in there too.

>> And btw, if you put exactly 100KB on your disk, split into 1KB files,
>> you're probably going to notice your disk usage going up by more than
>> exactly 100KB.  How much it goes up by is going to be roughly equivalent
>> to how much space it takes to store the name of each 1KB file.
>>
>> Here's another interesting experiment:  Take a directory tree of lots of
>> small files.  Gentoo's /usr/portage is a good example.  Copy it to ext3,
>> XFS, reiserfs, and Reiser4, then run "du -s" on each copy.  I can almost
>> guarentee that Reiser4's is going to be significantly smaller, enough to
>> show up on even "du -sh".  Smaller by tens of megabytes, at least.
>>  
>>
> I heard to say that Reiser adapt the size of the block to the size of
> each file. Is true this?

Sort of.

v3 did something called "tail packing", where the tail end of a file, if
it didn't use a whole block, would be packed into...  somewhere else, I
think the actual directory tree.  You'd end up with a lot of tails
packed together, which wasn't fast, but it meant you weren't wasting a
whole block on the end of a file, or on files which are themeslves less
than a block.

Reiser4 does something similar.  It delays writing files until it has
to.  Until then, even in RAM, files are taking up full blocks, just like
in ext2/3.  But when it's time to commit, all the files are shoved as
far to the left as they will go, and then the whole thing is written out
to disk, almost as if it was a single file.

I think that after files get to a certain size, Reiser tries to align
them to blocks, rather than packing them as above.  I'm not sure what
that size is.  Also, as far as I know, this packing multiple files into
a single block only happens on flush, and maybe with the repacker, if
that ever gets finished.

So, it doesn't adapt the size of the block to the size of the file, but
it does allow multiple files to be inside a single block.

>> So you really shouldn't complain about your lost 604 KB.
>>
>>  
>>
> I need to understand how this works to be able to explain to my pupils.

I see.  You probably want a more precise answer than I can give, then.
I'm not on the Namesys team, I'm just a fan.  Someone will probably
correct me if I've gotten something blatently wrong, though.

