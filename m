From: Christer Weinigel <christer@weinigel.se>
Subject: Re: Reiser4. BEST FILESYSTEM EVER - Christer Weinigel
Date: 09 Apr 2007 03:24:24 +0200
Message-ID: <m3odlye3w7.fsf@zoo.weinigel.se>
References: <46157B5B.5000602@gmail.com>
	<1175817921.18400.1183285196@webmail.messagingengine.com>
	<461592FB.5060507@zytor.com>
	<1175819681.20754.1183287946@webmail.messagingengine.com>
	<461596DE.2020802@zytor.com>
	<1175823288.25662.1183293506@webmail.messagingengine.com>
	<4615C780.5040407@zytor.com>
	<1175833931.8916.1183307802@webmail.messagingengine.com>
	<20070407191715.GG3510@csclub.uwaterloo.ca>
	<1175993097.32498.1183512070@webmail.messagingengine.com>
	<m3zm5jebad.fsf@zoo.weinigel.se>
	<1176069053.31062.1183584012@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1176069053.31062.1183584012@webmail.messagingengine.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johnrobertbanks@fastmail.fm
Cc: Christer Weinigel <christer@weinigel.se>, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

[linux-kernel trimmed from the Cc list]

johnrobertbanks@fastmail.fm writes:

> [lots of drivel with lots of capital letters elided]
> [a totally confused mess of responses to at least three different mails]

Wow.  You are absolutely amazing.  But, oh, well.

> By the way: Did I thank you "delightful" people for the "pleasant"
> welcome to the linux-kernel mailing list?

You are so welcome.  *grin*

> > So the two bonnie benchmarks with lzo and gzip are
> > totally meaningless for any real life usages.
> 
> YOU (yes, the one with no experience and next to NO knowledge on the
> subject) claim that because bonnie++ writes files that are mostly zeros,
> the results are meaningless. It should be mentioned that bonnie++ writes
> files that are mostly zero for all the filesystems compared. So the
> results are meaningful, contrary to would you claim.

Ok, lets take this really slowly so that you may understand.

Compression in the file system can be useful, there is no doubt about
that, but you have to be aware of the tradeoffs.

First of all, very few people have any use for storing files
consisting of just zeroes.  Trying to make any decision based on a
file systems ability to compress zeroes is just plain dumb.

Bonnie++ assumes that the data it writes will end up being written to
disk and not be compressed.  Right now it allocates a buffer which is
filled with zeroes and half a dozen bytes that the beginning of the
buffer are filled in with some random data.  So to make the bonnie
runs have any meaning on any compressed file systems you really want
to be able to choose what data it writes to disk.  If you modified
bonnie to do multiple test runs, one with zeroes, another one with
some easily compressed data such as a syslog, some not so easily
compressed data such as the contents of /bin/bash and some
uncompressible data such as from /dev/urandom that would be a lot
better benchmark.  

Then you have to be aware of the cost of that compression.  First of
all, it is going to use some CPU, so measuring the CPU load during the
benchmark is a good start.  Another thing with compression is that it
requires you to keep both some compressed and the uncompressed data in
RAM at the same time, so the memory pressure will increase.  This is
harder to measure and quantify.  Finally, since the CPU has to get
involved at compressing and decompressing the data doing this will
pull both the uncompressed and compressed data into the CPU cache and
may evict data from the cache that other processes would have found
useful.  This cache pollution is even harder to measure.  And none of
these costs make any difference for benchmarks run on a lightly loaded
system, but may make a difference in real life on any system that
tries to do something useful at the same time.

Then you have to consider your use cases.  As I said in my previous
mail, for my only space constrained disk, I store a lot of large flac
encoded CD images.  That data is basically uncompressible, so
compression buys me nothing, it just costs me a lot of extra CPU to
try to compress uncompressible data.  In addition, each CD image is a
quite large too, about 300MByte for a full size album, so whatever
savings I can get though the tail merging that Reiser4 (and Reiser3)
does is marginal for my use case.

Other use cases might have a lot to gain from compression.

> ALSO YOU IGNORE examples offered by others, on lkml, which contradict
> your assertion: FOR EXAMPLE:
> 
> > I see the same thing with my nightly scripts that do syslog
> > analysis, last year I trimmed 2 hours from the nightly run by
> > processing compressed files instead of uncompressed ones (after I
> > did this I configured it to compress the files as they are rolled,
> > but rolling every 5 min the compression takes <20 seconds, so the
> > compression is < 30 min)
> 
> David has said that compressing the logs takes
> 
> 24 x 12 x 20 secs = 5,760 secs = 1.6 hours of CPU time (over the day)
> 
> but he saves 2 hours of CPU time on the daily syslog analysis.
> 
> For a total (minimum) saving of 24 minutes.

So lets look at the syslog case then.  First of all, lets compress my
syslog with gzip:

    gzip -c /var/log/messages >whole.gz

    du -h /var/log/messages whole.gz
    532K    messages
    64K     whole.gz

Unfortunately, this compressed format isn't very efficient for some
use cases, lets say that I want to read the last 10 lines of the
syslog.  On a normal uncompressed file system I can just seek to the
end of the file, read the last block and get those 10 lines (or if the
last block didn't have 10 lines, I can try the block before that).
But with a compressed file, I have to uncompress the whole file and
throw away 531 kBytes at the begining of the file to do that.  So a
file system that wants to give the user efficient random access to a
files can't compress the whole file as done above.  It has to make
some tradeoffs to make random access practically usable.  Most
compressing file systems do that by splitting the file into fixed
chunks which are compressed independently of each other.  So lets
simulate that by splitting the file into 4k chunks and compressing
those separately and then combining them together:

    split -b 4096 /var/log/messages chunks
    gzip chunks*
    cat chunks*.gz >combined.gz

    du -h combined.gz
    120K    combined.gz

The reason for the loss of compression is that the chunk based
compression can't reuse knowledge across chunks.  It's possible to
mitigate this by increasing the chunks size:

    84K     combined-16368-chunk-size.gz
    72K     combined-65536-chunk-size.gz

once again that has a downside, the bigger the chunks, the more data
will be uncompressed unneccesarily when doing random accesses in the
file.

So the syslog example you are quoting above does not tell you how well
reiser4 will do on that specific use case.  A lot of the benefit in
David's example comes from knowing that he wants to process the file
as a whole and doesn't need random access.  So having application
specific knowledge and doing the compression outside of the file
system is what gives him that gain.

Of course, it may also be that the convenience of having transparent
compression in the file system is more worth more than the 50% benefit
in size from having to compress the syslog manually.  That depends.

> but he saves 2 hours of CPU time on the daily syslog analysis.

And no, he spends 1.6 hours of CPU time (maybe, some IO wait is
probaby included in that number) to save 2 hours of runtime (mostly IO
wait I assume).  So it seems that the disk is the bottle neck in his
case.  On a slightly different system CPU might be the bottle neck
because the same machine has to do a lot of processing at the same
time, so that it's better to skip the compression.  Once again, it
depends.

What I'm trying to get at here is that yes, compression can be useful,
but it is usese dependent, and it's impossible to catch all the
nuances of all use cases in one single number, especially an extremely
artificial number such as a bonnie++ run with files mostly consisting
of zeroes.

You can foam at the mouth and post the same meaningless, benchmark
figures over and over again and yell even louder, but that still don't
make them relevant.  It's not reiser4 that is the problem, but the way
you try to present reiser4 as the best thing since sliced bread.

To misquote Scott Adams: I'm not anti-Reiser4, I'm anti-idiot.  

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
