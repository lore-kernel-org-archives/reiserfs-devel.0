From: Oleg Drokin <green@namesys.com>
Subject: Re: 2GB limit won't go away
Date: Sun, 9 Jun 2002 23:16:08 +0400
Message-ID: <20020609231608.B8386@namesys.com>
References: <1023708533.4654.301.camel@xserver> <20020609183534.GC14168@turbolinux.com> <1023754229.4654.1831.camel@xserver>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1023754229.4654.1831.camel@xserver>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

Hello!

   The easiest way for you to go is to boot of rescue CD/diskette
   and then mount your root as -o conv
   (btw, SuSE 7.3 does not come with reiserfsprogs-3.x.0j-1)
   Or if you do not use initrd during your normal boot, you can
   issue 'lilo -R "linux rootfsflags=conv"' command and reboot.
   replace linux with your usual lilo target if needed.
   Flags that are passed from /etc/fstab are only applied to rootfs on
   remount and you cannot convert fs on remount.

Bye,
    Oleg   
On Mon, Jun 10, 2002 at 06:10:28PM -0600, Chris Worley wrote:
> It's new files I'm trying to create.  Am I missing something... such as
> LVM underneath is screwing something up?  I just want to add to my
> existing partition, and not create new partitions.
> 
> Thanks,
> 
> Chris
> 
> On Sun, 2002-06-09 at 12:35, Andreas Dilger wrote:
> > On Jun 10, 2002  05:28 -0600, Chris Worley wrote:
> > > I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1
> > > (using 3.5.x disk format...ReiserFS version 3.6.25) atop
> >    ^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > It is my understanding that you cannot use >2GB files with 3.5 disk
> > format.  The only way to "upgrade" is to backup restore.  If you
> > mount with the "conv" mount option, you apparently will be able to
> > create _new_ files in the 3.6 format (i.e. they can be > 2GB), but
> > existing files cannot grow past 2GB.
> > 
> > You could "solve" this problem by doing something like:
> > 
> > tar cf - /home | tar xf - -C /tmp
> > rm -r /home/*
> > mv /tmp/home/* /home/*
> > rmdir /tmp/home
> > 
> > Which will re-create all of your files with the 3.6 format "inodes"
> > and get rid of your old format inodes.  You have to be careful if
> > you do this, because you run the risk of accidentally deleting all
> > of your files if you do the wrong thing.  If you have enough free
> > space in another partition, you may as well just format it with
> > 3.6 format and copy everything over and delete the old partition.
> > 
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> > http://sourceforge.net/projects/ext2resize/
> > 
> 
> 
