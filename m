From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Can't mount after mkfs -b 8192
Date: Fri, 4 Jun 2004 10:06:30 +0200
Message-ID: <200406041006.30278.christian.mayrhuber@gmx.net>
References: <40BF9993.5060409@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40BF9993.5060409@dgreaves.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 03 June 2004 23:35, David Greaves wrote:
> Help :)
>
> This seems odd...
>
> Kernel 2.6.6
> progsreiserfs 0.3.0.4-3
>
> I have a raid5 array in an LVM2 VG with a 600Gb LV defined.
> If I make a reiserfs with a block size of 8192 it won't mount.

I'm almost sure that reiserfs supports a blocksize of 4096, only.


-- 
lg, Chris
