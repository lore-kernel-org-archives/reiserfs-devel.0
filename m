From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Overwritten files
Date: Wed, 17 Apr 2002 10:29:27 -0600
Message-ID: <20020417162927.GL20464@turbolinux.com>
References: <20020416105325.2a854a19.ikkeswar@dds.nl> <1018978845.1035.5.camel@lappix> <20020417171507.74184f14.stefan.janecek@jku.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020417171507.74184f14.stefan.janecek@jku.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Janecek <stefan.janecek@jku.at>
Cc: reiserfs-list@namesys.com

On Apr 17, 2002  17:15 +0200, Stefan Janecek wrote:
> Heinz-Josef Claes <hjclaes@web.de> wrote:
> > do you boot the box sometimes with windows? I had a similar problem on a
> > laptop with windows 98 and linux (with ext2). Sometimes, windows seem to
> > overwrite the first partition and write onto the next one. This happend
> > two times in half a year. In my case, the linux installation was no
> > bootable any more.
> 
> This problem really seems to exist even though rather rarely... 
> I encountered it twice in about four years on a box running windows 98 - 
> both times it crashed while writing a rather large file, after reboot
> it seemed to have written on the linux partition located behind the windows
> partition.

This may be a result of the partition table not being updated properly.
Windows does some strange things with the partition tables, so updating
them under Linux may not mean that Windows thinks the partitions are the
same size.

It is also possible that you have hibernation support enabled for
Windows.  This is often a file mapped by blocknumber on the disk, so
even if you partition your disk, the hibernation code (in the BIOS)
will write wherever it thinks it should.  You need to disable the
hibernation and then re-enable it under Windows in order to have a
new hibernation file created.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

