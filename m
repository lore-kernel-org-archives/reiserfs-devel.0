From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Can't mount after mkfs -b 8192
Date: Fri, 04 Jun 2004 12:49:35 +0400
Message-ID: <1086338975.31416.54.camel@tribesman.namesys.com>
References: <40BF9993.5060409@dgreaves.com>
	 <200406041006.30278.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406041006.30278.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2004-06-04 at 12:06, Christian Mayrhuber wrote:
> On Thursday 03 June 2004 23:35, David Greaves wrote:
> > Help :)
> >
> > This seems odd...
> >
> > Kernel 2.6.6
> > progsreiserfs 0.3.0.4-3
> >
> > I have a raid5 array in an LVM2 VG with a 600Gb LV defined.
> > If I make a reiserfs with a block size of 8192 it won't mount.
> 

reiserfs does not support blocksize > page size. Does ext2 do that?
Please send your /proc/cpuinfo

> I'm almost sure that reiserfs supports a blocksize of 4096, only.
> 

