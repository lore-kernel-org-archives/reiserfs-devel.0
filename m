From: Russell Coker <bofh@coker.com.au>
Subject: Fwd: Re: [reiserfs-list] Reiserfs with Samba vs NetApp Filer
Date: Fri, 11 Oct 2002 20:30:49 +0200
Message-ID: <200210112030.49400.bofh@coker.com.au>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, 11 Oct 2002 12:40, Lars Marowsky-Bree wrote:
> > BTW, Hans, what you would recommand : LVM or EVMS ?
>
> With 2.4, go with LVM1. The jury is still out whether the successor will be
> EVMS or LVM2 in 2.5/2.6, but I personally have decided to quite like EVMS.

My opinion based on playing with LVM1 in a vain attempt at getting it to work
and on reading the code in a vain attempt at fixing the bugs that stopped it
working for me is that LVM1 is not something I would trust my data with.

Something that operates like LVM is complex, runs at a low level, has
potantial to be seriously destructive, and needs to be fixable with minimal
tools.

My opinion of the quality of LVM1 is that it is not adequate to serve such
needs for me.  Therefore I have just avoided using such functionality!

One of the main programmers on LVM2 is someone who I have a lot of respect
for, and he has assured me that he will fix the deficiencies in LVM1.  While
I trust him a lot LVM1 left me with such a bad impression that I would feel
happier using anything that's not LVM.

EVMS seems to be done right all the way, and seems to be a product that I can
trust.  However I have not read the code yet...

--
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

