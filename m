From: Chris Worley <chrisw@lnxi.com>
Subject: Re: 2GB limit won't go away
Date: Sun, 9 Jun 2002 18:55:26 +0000 (UTC)
Message-ID: <1023754229.4654.1831.camel@xserver>
References: <1023708533.4654.301.camel@xserver> 
	<20020609183534.GC14168@turbolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020609183534.GC14168@turbolinux.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

It's new files I'm trying to create.  Am I missing something... such as
LVM underneath is screwing something up?  I just want to add to my
existing partition, and not create new partitions.

Thanks,

Chris

On Sun, 2002-06-09 at 12:35, Andreas Dilger wrote:
> On Jun 10, 2002  05:28 -0600, Chris Worley wrote:
> > I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1
> > (using 3.5.x disk format...ReiserFS version 3.6.25) atop
>    ^^^^^^^^^^^^^^^^^^^^^^^
> 
> It is my understanding that you cannot use >2GB files with 3.5 disk
> format.  The only way to "upgrade" is to backup restore.  If you
> mount with the "conv" mount option, you apparently will be able to
> create _new_ files in the 3.6 format (i.e. they can be > 2GB), but
> existing files cannot grow past 2GB.
> 
> You could "solve" this problem by doing something like:
> 
> tar cf - /home | tar xf - -C /tmp
> rm -r /home/*
> mv /tmp/home/* /home/*
> rmdir /tmp/home
> 
> Which will re-create all of your files with the 3.6 format "inodes"
> and get rid of your old format inodes.  You have to be careful if
> you do this, because you run the risk of accidentally deleting all
> of your files if you do the wrong thing.  If you have enough free
> space in another partition, you may as well just format it with
> 3.6 format and copy everything over and delete the old partition.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/
> 


