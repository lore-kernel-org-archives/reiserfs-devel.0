From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 10:17:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0307101001150.26018-100000@divine.city.tvnet.hu>
References: <20030710092112.GA837@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030710092112.GA837@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


On Thu, 10 Jul 2003, Oleg Drokin wrote:
>
> angband:/mnt # time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> 1+0 records in
> 1+0 records out
>
> real    0m19.205s
> user    0m0.000s
> sys     0m7.130s

Interesting. For me, the real and the system time was always [almost] the
same.

> This is on Athlon MP-1700+ (I have dual system). The system is all IDE.
> This is still kind of long, but it is better than it was ;)
> Actually I expected it to be much faster, I guess I need to take a look why
> it still eats this much time.
>
> > > (on 4k blocksize)
> > AFAIK, reiserfs supports only 4 kB blocksizes. At least the
> > 'man mkreiserfs' said always so.
>
> may be you just have old reiserfsprogs version.

Yes, I have whatever the latest distros ship. Right now I could check out
only Red Hat 9 and SuSE 8.2, they both have 3.6.4. The latest reiserfsprogs
is 3.6.8.

> There are support for variable blocksizes in 2.5, and there is separate
> patch for 2.4

Cool. The max 4 kB block size was a long time common deficiency of the main
Linux filesystems.

Cheers,

	Szaka

