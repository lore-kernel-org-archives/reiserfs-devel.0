From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Question on Reiser4 regarding power failures
Date: Thu, 25 Nov 2004 18:18:21 +0100
Message-ID: <200411251818.21228.christian.mayrhuber@gmx.net>
References: <200411251637.28047.bernhard.prell@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22568-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411251637.28047.bernhard.prell@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 25 November 2004 16:37, Bernhard Prell wrote:
> Hello everybody,
> 
> I have a simple question about Reiser4. I already tried to find the answer 
in 
> http://www.namesys.com/v4/v4.html but I'm not completly sure if I understood 
> everything :-)
> 
> *Background:
> I 'm administrating about 20 computers. The installed Linux/Reiser is quite 
> old: SuSE Linux with kernel 2.4.7(SMP) (dmesg tells me reiser 3.5.x disk 
> format, ReiserFS version 3.6.25).
> 
> Obviously people often pull the plug without cleanly shutting down the 
> systems, because maybe twice per month I have to setup a system again 
because 
> it doesn't want to boot anymore. The reason is always a somehow corrupted 
> root-filesystem. Sometimes reiserfsck can repair it, sometimes not because 
of 
> I/O-read-errors. If that's the case I also have a look at the disk with 
> "smartctl -t short /dev/hda" and it also reports read-errors. Then I usually 
> do a "dd if=/dev/zero of=/dev/hda", repartition, reformat, setup the system 
> from a tar file and everything is fine again (smartctl doesn't report 
> read-errors anymore).
> 
> *Now my question, you may have guessed it:
> Will the corruption caused by partially written sectors or other problems 
> caused by _power failures_ be still a problem under reiser4 or are they gone 
> forever because of the "atomic transactions" (at least in theory)?
> (That would mean that reiserfsck is only existing to repair problems caused 
by 
> bugs in reiser4...)
> 
> Sorry if this has been asked before, I tried to find an answer in the 
> list-archive.

I'd suggest to do the following for pull the plug scenarios on productive
systems with reiserfs:

1) Disable write caching for ide drives with "hdparm -W 0 /dev/hdX"
   This is the most important thing to do.
2) Always try to use the newest version of reiserfsck. The older, the more
   bugs.
3) Convert your filesystem to the newer 3.6 disk format using
   the "conv" mount option once. The 3.5 disk format is very old and
   has some limitations.
4) If you want to prevent data corruption and not just filesystem
   corruption, use a recent 2.6.x kernel which incoporates Chris Mason's
   data logging patches.
   Alternatively you could use a newer SuSE which has the data logging
   patches in the 2.4 kernel series, too. Maybe the installation of a
   a newer 2.4.x kernel rpm from ftp.suse.com will work for you.

As reiser4 is atomic in it's operations it should protect your data even more 
than ext3/reiserfs with the data=journal mount option, unless you don't have
write cache for ide drives enabled. Reiser4 is still beta.

Since 2.6.9 the write barrier patches are in the kernel. These should
protect better from data loss with disks that have write caching enabled.
The only two filesystems supporting write barrier are ext3 with the mount
option "barrier=1" and reiserfs with the mount option "barrier=flush".

-- 
lg, Chris

