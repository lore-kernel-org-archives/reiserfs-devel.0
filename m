From: Russell Coker <russell@coker.com.au>
Subject: Re: ReiserFS problems
Date: Thu, 7 Aug 2003 23:24:55 +1000
Message-ID: <200308072324.55305.russell@coker.com.au>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <3F324CEF.4070608@namesys.com>
Reply-To: russell@coker.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F324CEF.4070608@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com

On Thu, 7 Aug 2003 22:58, Hans Reiser wrote:
> Oleg Drokin wrote:
> >So basically speaking you do not want to run rebuild-tree operation on the
> >FS that contains files with reiserfs metadata embedded in them in clear.
> >This is also explained in our FAQ.
>
> if you compress these files, then you will be okay.  You would almost
> always want to compress them.....

Moderately fast desktop machines can gzip compress data at 10MB/s, the fastest 
available machines could probably manage almost 20MB/s.

4 years ago IDE drives were routinely delivering 30MB/s, now they can now do 
40MB/s or more, the fastest SCSI drives can do 70MB/s, and RAID arrays can do 
more.

Compressing data will significantly decrease linear write speed.

gzip decompression can proceed at ~100MB/s on a moderately fast desktop 
machine, so provided that you are not running out of CPU power and you are 
not using a high-end RAID setup it won't be much of a bottleneck, and could 
actually increase read speed for linear access.

Compressing data with gzip prevents non-linear access (IE running fsck type 
programs).

If you want to maintain an image for ghost-installs of new machines then gzip 
compressed file system images will probably be useful.  For every other case 
where having a file system image is desired you would not want compression.

The problem with fsck being too agressive has a long history.  The HPFS DLL 
for CHKDSK.EXE in OS/2 when run in level 3 was known for recovering files 
from a recently formatted file system.  It seems that the IBM file-system 
people weren't smart enough to come up with the type of ideas that Rogier can 
come up with in seconds.  ;)

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

