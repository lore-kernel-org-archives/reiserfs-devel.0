From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 16:06:26 +0200 (MEST)
Message-ID: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org>
References: <1082121192.7920.19.camel@firefly>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1082121192.7920.19.camel@firefly>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <yury@clusterfs.com>
Cc: Alan Chu <alanchu@MIT.EDU>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org


On Fri, 16 Apr 2004, Yury Umanets wrote:

> One more thing. Is it common case, that resizier errors happen on Gento?

Hmmm, seems to be a good point. Alan had Gentoo. On the QTParted forums
people mention Gentoo. SystemRescueCD (http://www.sysresccd.org), the most
popular LiveCD for partition handling is Gentoo based ... 

Look what I've found right now:
    
	http://www.sysresccd.org/forums/viewtopic.php?t=294

  "Why is it that with and only with System Rescue CD, if I format a
   partition as reiserfs, then copy some data from another resierfs
   partition to that newly formatted partition and then unmount the
   partition and run fsck on it, errors are found that need fixing?"

	Szaka

