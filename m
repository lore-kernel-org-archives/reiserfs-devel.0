From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 19:44:55 +0400
Message-ID: <20030710154455.GI825@namesys.com>
References: <20030710100111.GA825@namesys.com> <Pine.LNX.4.30.0307101516350.26018-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0307101516350.26018-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 04:01:13PM +0200, Szakacsits Szabolcs wrote:

> > May be this is because when system time was very big, the difference
> > looked like a noise? ;)
> You can decide yourself,
> PIII/666:  0.00s  usr,  917.83s sys   923.72s real,  99% CPU
> Xeon/1.7:  0.00s  usr,  862.79s sys,  865.13s real,  99% CPU

Well, there is some difference. May be it can be explained by different drives, different
partitioning and stuff like that.

> > > Yes, I have whatever the latest distros ship. Right now I could check out
> > > only Red Hat 9 and SuSE 8.2, they both have 3.6.4. The latest reiserfsprogs
> > > is 3.6.8.
> > Actually 3.6.4 has support for blocksizes other than 4k, this is
> > controlled by -b switch of mkreiserfs (run it without arguments and it
> > will tell you) man page on mkreiserfs (in SuSE 8.2 at least) have it
> > listed too.
> Both SuSE 8.2 and Red Hat 9 mkreiserfs manual say:
>        -b | --block-size N
>               N is block size in bytes. 4096 only for now.

Ah, the safety measure ;)

> > The 4k blocksize is not FS limit, this is VFS limit related to the fact
> > that buffer size cannot be bigger than PAGE_SIZE.
> Yes but people aren't really interested in this. FreeBSD uses 8 kB for at
> least about 6 years by default and NTFS max 64 kB for a decade (frequently
> used in benchmarks and when high performance is needed and make sense).

Sigh, so we are all doomed.

> If today I take a stock kernel, which main Linux filesystems support bigger
> than 4 kB block size? None.

iso9660 fs have pretty big blocksize, I think. Too bad you can only read from it ;)

Bye,
    Oleg
