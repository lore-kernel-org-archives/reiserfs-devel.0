From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 14:01:11 +0400
Message-ID: <20030710100111.GA825@namesys.com>
References: <20030710092112.GA837@namesys.com> <Pine.LNX.4.30.0307101001150.26018-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0307101001150.26018-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 10:17:40AM +0200, Szakacsits Szabolcs wrote:
> > angband:/mnt # time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> > 1+0 records in
> > 1+0 records out
> > real    0m19.205s
> > user    0m0.000s
> > sys     0m7.130s
> Interesting. For me, the real and the system time was always [almost] the
> same.

May be this is because when system time was very big, the difference looked like a noise? ;)

> > > > (on 4k blocksize)
> > > AFAIK, reiserfs supports only 4 kB blocksizes. At least the
> > > 'man mkreiserfs' said always so.
> > may be you just have old reiserfsprogs version.
> Yes, I have whatever the latest distros ship. Right now I could check out
> only Red Hat 9 and SuSE 8.2, they both have 3.6.4. The latest reiserfsprogs
> is 3.6.8.

Actually 3.6.4 has support for blocksizes other than 4k, this is controlled by
-b switch of mkreiserfs (run it without arguments and it will tell you)
man page on mkreiserfs (in SuSE 8.2 at least) have it listed too.

> > There are support for variable blocksizes in 2.5, and there is separate
> > patch for 2.4
> Cool. The max 4 kB block size was a long time common deficiency of the main
> Linux filesystems.

The 4k blocksize is not FS limit, this is VFS limit related to the fact that
buffer size cannot be bigger than PAGE_SIZE. PAGE_SIZE is 4k on x86,
but it is bigger on some other architectures (e.g. 8k on alphas).
Also there is an effort by William Lee Irwin III to create "clustered page cache"
or something like that (the patchset is named pgcl-something) for 2.5 kernels,
that one allows to cluster several physical pages into one logical, that will
allow to use blocksizes other than hardware PAGE_SIZE, too.

Bye,
    Oleg
