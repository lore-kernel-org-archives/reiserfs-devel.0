From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: missing files?
Date: Mon, 7 Feb 2005 18:38:00 +0300
Message-ID: <200502071838.00396.vitaly@namesys.com>
References: <1107318853.18354.214122527@webmail.messagingengine.com> <200502041433.27112.vitaly@namesys.com> <1107621069.13887.214400623@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107621069.13887.214400623@webmail.messagingengine.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Styer <michael@styer.net>
Cc: reiserfs-list@namesys.com

On Saturday 05 February 2005 19:31, Michael Styer wrote:
> On Fri, 4 Feb 2005, Vitaly Fertman said:
> > so what I do not understand is why reiserfsck does not report any
> > problem to you. Which reiserfsprogs do you have? have you 'umount &
> > mount ro' or 'remount,ro', btw? reiser4 does not do 'remount,ro'
> > properly yet. have you run fsck.reiser4 on umounted fs?
>
> Hmm. I did 'remount,ro', actually; didn't realize that it wouldn't work
> with reiser4. I have version 1.0.3 of the Gentoo reiser4progs package;
> fsck.reiser4, mkfs.reiser4 and debugfs.reiser4 all report version 1.0.3.
> I concluded that fsck.reiser4 wasn't reporting problems just on the
> basis of the lack of problems noted in the /var/log/messages output on
> boot, but I hadn't run it manually.
>
> OK. So I killed everything that was keeping /usr busy and unmounted it.
> I ran debugfs.reiser4 on /dev/hdb1 unmounted. Then I mounted the
> partition ( 'mount -t reiser 4 -o ro,noatime /dev/hdb1 /usr' ). Now
> debugfs.reiser4 dies with this output:
>
>     Fatal: Can't read master super block. Error: Can't open
>     reiser4 on /usr
>
> and fsck.reiser4 says this:
>
>     Fatal: Can't read master superblock. Fatal: Failed to open the
>     reiser4 backup. Fatal: Cannot open the FileSysten on (/usr).
>
>     1 fatal corruptions were detected in SuperBlock. Run with --build-sb
>     option to fix them.

what version of reiser4progs have you created this fs with? 
it looks like the version 1.0.3 cannot open the fs due to some 
changes in the format.

> I have the output of my first debugfs run if that would be helpful. I'll
> put it up for download on the same IP with the filename of
> mas.devhdb1_unmounted.bz2. I'm going to reboot so that you can get that
> file (this is my webserver as well...).

ok

> Regarding the output of fsck.reiser4, it suggests to run fsck.reiser4
> --build-sb. What's that going to do to my filesystem? Am I likely to
> lose the contents (i.e. is it like reformatting) or will it fix the
> structure without causing data loss? At the minute it seems I still have
> access to the filesystem, so I could tar everything up now before
> rebuilding the superblock if doing so would mean losing that data.

backups are never useless.

> Do you have any suggestions or advice as to what I should do from here?

it depends on the reiser4progs version you created the fs with.
if it was 1.0.2, you can just run 'fsck.reiser4 --build-sb <device>', 
of the 1.0.3 version, it will add reiser4 backup info properly.

if nothing has been changed on the fs since mas.devhdb1_unmounted.bz2
was created, you will get 2 fs corruptions that can be fixed with 
'fsck.reiser4 --build-fs <device>' only. about 90 leaves will be cut off
the tree and will be inserted leaf-by-leaf and after that not inserted 
item-by-item.

btw, it is possible to run 
	fsck.reiser4 --build-sb --build-fs <device>
to fix it all together. 

> Thanks very much for your help; I appreciate your taking the time to
> help me out with this.
>
> Michael
>
> PS: I've included the list address again in case this discussion might
> be helpful to anyone else.

-- 
Thanks,
Vitaly Fertman

