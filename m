From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Thu, 3 Jul 2003 22:10:03 +0400
Message-ID: <200307032210.03901.vitaly@namesys.com>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

> > Actually in-memory data only are conserned here, they are not written to
> > disk and read again, trey all the time in the memory and just a part of
> > them will be written to disk at the end of fscking.
>
> Uhhh, I've observed a lot of writes to otherwise idle disks while running
> reiserfsck.  I had assumed that it was reiserfsck doing those writes,
> although I haven't attached strace to be sure.  When reiserfsck says
> various things are "deleted" in pass0, has it not modified something on
> the disk at that time?

Yes, fsck does these writes but these corruptions happen with in-memory 
data, not those which are written to disk. 

If you check you RAM and find no problems could you run 
    debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
and make it available for downloading. I will take it (file will contain reiserfs
metadata) and debug it locally. (At the beginning of the next week already as 
I will not work these few days).

-- 
Thanks,
Vitaly Fertman
