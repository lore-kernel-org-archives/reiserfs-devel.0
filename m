From: Yury Umanets <umka@namesys.com>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 17:14:20 +0300
Message-ID: <1082124859.22432.2.camel@firefly>
References: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Alan Chu <alanchu@MIT.EDU>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org

On Fri, 2004-04-16 at 17:06, Szakacsits Szabolcs wrote:
> On Fri, 16 Apr 2004, Yury Umanets wrote:
> 
> > One more thing. Is it common case, that resizier errors happen on Gento?
> 
> Hmmm, seems to be a good point. Alan had Gentoo. On the QTParted forums
> people mention Gentoo. SystemRescueCD (http://www.sysresccd.org), the most
> popular LiveCD for partition handling is Gentoo based ... 

It is quite possible, that Gentoo guys have modified progsreiserfs a
little bit like Debian guys did some time ago on stock reiserfsprogs.
And then there was lots of errors with bitmap, as bit working functions
was incorrectly modified.

Can this explain lots of errors on Gentoo?

> 
> Look what I've found right now:
>     
> 	http://www.sysresccd.org/forums/viewtopic.php?t=294
> 
>   "Why is it that with and only with System Rescue CD, if I format a
>    partition as reiserfs, then copy some data from another resierfs
>    partition to that newly formatted partition and then unmount the
>    partition and run fsck on it, errors are found that need fixing?"
> 
> 	Szaka
Also they might modify kernel code...

-- 
umka

