From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: new data logging patches available
Date: Fri, 9 May 2003 08:37:22 +0200
Message-ID: <200305090837.22969.christian.mayrhuber@gmx.net>
References: <1052400138.14612.483.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052400138.14612.483.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Donnerstag, 8. Mai 2003 15:22 schrieb Chris Mason:

> These include Oleg Drokin's merge with 2.4.21-rc1 (thanks Oleg!), and
> they no longer change fs/super.c:sync_supers().  I believe things are
> now clean enough for me to start submitting for 2.4.22-pre once it
> starts.
This is great news!

>
> 03-relocation-8.diff is also updated, I believe it will fix the bug
> where md reports the device is busy during reboot.  It has not been
> tested on a box with a software raid root device, so please handle with
> care.
Yes, relocation-8 fixes the MD root device issue. /dev/md0 can switch to
read only mode and do a shutdown afterwards.

I can't tell if there are some data issues which it, because I've only
booted this kernel once. For the moment it looks good.

PS: I've applied all patches from 02- to 10-
-- 
lg, Chris


