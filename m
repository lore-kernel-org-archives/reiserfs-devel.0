From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 13:21:12 +0400
Message-ID: <20030710092112.GA837@namesys.com>
References: <20030710052931.GA17957@namesys.com> <Pine.LNX.4.30.0307100851120.26018-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0307100851120.26018-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 09:30:46AM +0200, Szakacsits Szabolcs wrote:
> > > I've noticed very long "hangs" using reiserfs and they were always at
> > > ftruncate(2). I made a comparision between different filesystems. SuSE 8.2
> > Yes, this is known "feature".
> OK, I've searched all relevant archives, namesys web pages and found
> nothing relevant.
In fact there were sevaral discussions on our mailing list about this.

> > Speeds up large holes creation in ~ 1000 times
> How long does it take for you the above dd command _and_ how fast is your
> CPU?

angband:/mnt # time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
1+0 records in
1+0 records out

real    0m19.205s
user    0m0.000s
sys     0m7.130s

This is on Athlon MP-1700+ (I have dual system). The system is all IDE.
This is still kind of long, but it is better than it was ;)
Actually I expected it to be much faster, I guess I need to take a look why
it still eats this much time.

> > (on 4k blocksize)
> AFAIK, reiserfs supports only 4 kB blocksizes. At least the
> 'man mkreiserfs' said always so.

may be you just have old reiserfsprogs version.
There are support for variable blocksizes in 2.5, and there is separate
patch for 2.4

> The problem is when one uses it on reiserfs. For the users it "hangs". E.g.
> in the above case creating a metadata only clone takes 2-3 sec for all the
> other filesystems and 15 minutes for reiserfs.
> So apparently my only chance is to document the issue and detect if the fs
> is reiserfs and warn the user it will take a very long time (unless kernel
> is at least 2.4.22 and your speed up works).

Yes, this seems adequate.

Thank you.

Bye,
    Oleg
