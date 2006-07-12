From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Wed, 12 Jul 2006 12:06:58 -0400
Message-ID: <44B51E22.2040508@suse.com>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>	 <1152257397.13211.43.camel@ipso.snappymail.ca>	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <1152306272.13211.62.camel@ipso.snappymail.ca> <44AED01C.60601@namesys.com> <44AFFD50.8070905@suse.com> <44B44856.5070409@suse.com> <44B48BC0.2000608@namesys.com> <44B48E32.5080307@suse.com> <44B4B051.90809@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B4B051.90809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Jan Kara <jack@suse.cz>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeffrey Mahoney wrote:
> 
>> Hans Reiser wrote:
>>
>>> You make this way too complicated because you are trying to be way too
>>> perfect.  If you scan 3 bitmap blocks and find nothing, stop trying to
>>> size match.
>>
>> Agreed on the trying too hard..
> 
> What about the actual algorithm suggested?


"Worked" really just meant I made the initial window scanning/tracking
code work and experimented with several ways of organizing it. I focused
on memory usage at first and my results forced me to abandon it. More on
that below. I didn't get as far as modifying the allocator to use this
code. The initial idea was to keep track of the largest window available
within a bitmap. Since any write could split a window, that necessitates
tracking all the windows for each bitmap. Once we have that tracking, we
can make smarter decisions involving placement and reservation windows
if we so desired. Another advantage of maintaining a separate tree
outside of the bitmap is that the reiserfs_in_journal() check can go
away. When blocks are freed, we can make the journal responsible for
freeing them in the window tree, so that the view of the bitmap is
always "current." The window tree could be built on the first read of
the bitmap, just like the bitmap metadata is generated now when the
dynamic bitmap patches are applied.

Seems like a good idea so far, except that the memory cost is
unreasonable. I tried several ways of organizing the data, but none were
small enough to be usable. The basic idea is a tree sorted by window
size. My first attempt used lists of windows of a particular size,
sorted by position. The memory usage was horrendous. On a worst-case
scenario of 16k 1-bit windows, memory usage was just under 400k/bitmap
on a 64-bit system.

The second attempt still used the tree but used arrays of shorts to
track the beginning of each window. The worst case memory usage is
approximately 16k/bitmap if kept trimmed, but that involves quite a bit
of overhead. The kernel has no realloc and every bit allocation/free
would involve an allocation/copy/free cycle to occur which isn't exactly
nice.

The next incarnation managed the arrays in chunks, so that the array is
expanded by n blocks when space was required. Shrinks would occur when
the usage meant there was ~ 1.25 chunks free. The performance problems
of using the arrays still existed though. I guess in contrast with
scanning the bitmap blocks themselves, it's not so bad.

Unfortunately, this means that up to ~64M of RAM is pinned when used on
a 500 GB file system. I suppose that since the data is only a summary of
what is on disk and is easily regenerated, it would be possible to make
the cache shrinkable and regenerated when needed. When the cache is
shrunk, we could keep the largest window as part of the bitmap metadata
structure and regenerate it to update it.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEtR4hLPWxlyuTD7IRAp0pAKCejAb+AlMWnCa/zaZcEEYON2PIAgCff3u5
9zDTmuFS2BKZ/tA1SBuorD4=
=xDS+
-----END PGP SIGNATURE-----
