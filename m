From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: "file" command on a reiserfs filesystem
Date: Wed, 3 Apr 2002 20:28:59 +0400
Message-ID: <15531.11723.687664.547488@laputa.namesys.com>
References: <Pine.LNX.4.44.0204030956440.8574-100000@sparrow.websense.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0204030956440.8574-100000@sparrow.websense.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: William Stearns <wstearns@pobox.com>
Cc: ML-reiserfs <reiserfs-list@namesys.com>, Andreas Dilger <adilger@turbolabs.com>

William Stearns writes:
 > Good day, all,
 > 	When I use the file command on a file that contains an ext2/ext3 
 > filesystem, the file command returns:
 > 
 > [wstearns@sparrow test-resize]$ ls -al emptyfs.ext3.100
 > -rw-------    1 wstearns wstearns 104857600 Apr  2 13:57 emptyfs.ext3.100
 > [wstearns@sparrow test-resize]$ file emptyfs.ext3.100
 > emptyfs.ext3.100: Linux rev 1.0 ext3 filesystem data
 > 
 > 	The signature comes from Andreas Dilger's contribution to 
 > /usr/share/magic:
 > 
 > # ext2/ext3 filesystems - Andreas Dilger <adilger@turbolabs.com>
 > 0x438   leshort         0xEF53          Linux
 > >0x44c  lelong          x               rev %d
 > >0x43e  leshort         x               \b.%d
 > >0x45c  lelong          ^0x0000004      ext2 filesystem data
 > >>0x43a leshort         ^0x0000001      (mounted or unclean)
 > >0x45c  lelong          &0x0000004      ext3 filesystem data
 > >>0x460 lelong          &0x0000004      (needs journal recovery)
 > >0x43a  leshort         &0x0000002      (errors)
 > >0x460  lelong          &0x0000001      (compressed)
 > #>0x460 lelong          &0x0000002      (filetype)
 > #>0x464 lelong          &0x0000001      (sparse_super)
 > >0x464  lelong          &0x0000002      (large files)
 > 
 > 	Running file on a reiserfs file returns:
 > 
 > [wstearns@sparrow test-resize]$ file emptyfs.reiser.100  
 > emptyfs.reiser.100: ASCII text, with no line terminators
 > 
 > 	Is there a similar signature that could identify a reiserfs file?
 > 	The files I ran this on can be found at 

It definitely is somewhere. You can try to search archives for this
mailing list. It required recompiling file(1) through, because reiserfs
signature is at 16k offset and by default file(1) didn't look that
far. But probably things changed since then.

 > http://www.stearns.org/mkrootfs/
 > 	Cheers,

Nikita.

 > 	- Bill
 > 
 > ---------------------------------------------------------------------------
 >         "A 'No' uttered from deepest conviction is better and greater
 > than a 'Yes' merely uttered to please, or what is worse, to avoid
 > trouble."
 >         -- Mahatma Ghandi
 > From: Adrian Bunk <bunk@fs.tum.de>
 > --------------------------------------------------------------------------
 > William Stearns (wstearns@pobox.com).  Mason, Buildkernel, named2hosts, 
 > and ipfwadm2ipchains are at:                        http://www.stearns.org
 > --------------------------------------------------------------------------
 > 
