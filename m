From: David Masover <ninja@slaphack.com>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled
 fs, looks stable to me...)
Date: Wed, 09 Aug 2006 12:14:59 -0400
Message-ID: <44DA0A03.2000509@slaphack.com>
References: <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local> <44D773D6.4020504@slaphack.com> <20060808095658.GA6834@hermes.uziel.local> <44D95E26.8040309@slaphack.com> <20060809072216.GB13915@hermes.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060809072216.GB13915@hermes.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Christian Trefzer wrote:
> On Wed, Aug 09, 2006 at 12:01:42AM -0400, David Masover wrote:
>> A warning isn't good?  Would you rather it be an error?
> Of course not. It merely appears inconsistent to offer a root fs choice
> that may cause severe problems at bootup time.
> 
> When I went to install my first SuSE (brand-new 6.1 at that time) I
> looked up the huge printed manual: what are my options? OK there weren't
> many at the time ; ) But there was the >1023cyl problem, being a careful
> guy I opted for a separate /boot at the start of the disk, for example.
> Better safe than sorry.

Right.

> Now say I carefully weigh different aspects of different
> solutions, only to find out that my decision was "not so good" and will
> possibly cause problems _unless_ I play around with strange mount
> options that _disable_ some of the features supporting my decision.

Right, except you can still use a separate /boot to isolate those 
problems.  I bet Reiser4 makes this easier, by the way -- it could make 
the root dir and anything in /boot be much simpler.  I seem to remember 
that Grub couldn't deal with tail packing in ReiserFS, for one...

> Knowing trouble lies ahead of course is better than just running into it
> : )

If it's avoidable, yes.  Otherwise, depends.  If you had a terminal 
illness, would you rather know about it, or would you rather just drop 
dead one day?  Not an easy question...

Ok, never mind, that's irrelevant.

>> Some people would like to test Grub's XFS support...
> Sure thing. But those might not want to do this on their production
> machine, anyway, and test something more bleeding-edge than what distros
> ship at the time. Presuming there is ongoing development, that is.

Hmm, well, I like to be able to choose bleeding-edge from the same 
install disk as I choose production.  It means I only need the one 
install disk, and I can pick and choose which bleeding-edge features I 
want; everything else will go as smoothly as the production install.

>> It's not necessarily broken, just potentially unreliable, and
>> difficult to work with (you have to set arcane mount options or
>> somesuch).  Same for ReiserFS3, by the way.
> All that, especially "unreliable", is not something your average user is
> likely to accept.
[...]
> So what a
> distro installer wants to do is remove all the options from anything but
> "expert mode" that might cause the slightest hickup.

Expert mode is overkill, though, especially for this.  If you want to 
shield the user from absolutely everything that could possibly go wrong, 
that means you can't let the user do ANYTHING.  After all, it's easy 
enough to wipe out their Windows partition, and all they get is a warning...

I mean, such an "uber-newbie" mode would be nice, but it's not anything 
that any install system, including Windows and OS X, has ever done.  The 
only way we've come close is preinstalling, which would be the best way 
to get Linux into the hands of users, by the way.

>> Really, while Grub is useful, it's a rather large duplication-of-code
>> effort.  XOSL is even moreso, especially considering it doesn't
>> support Linux or multiboot natively -- it must boot Grub or Lilo in
>> order to run Linux or HURD.  Why aren't we using kexec for this
>> already?
> This is way beyond my knowledge, sorry. But I like kexec a lot, just
> wonder how to get to the point where kexec can be used _without_ linux
> up and running already...

We can't, but "linux up and running" doesn't take much more time than 
Grub or XOSL, if we're talking about some minimal initrd/initramfs 
situation.  For instance, LinuxBIOS+kexec would be an order of magnitude 
faster than anything else, because LinuxBIOS can already be faster than 
a standard PC BIOS anyway, and this lets you skip a bootloader as well.

It would also give you the option of not runnning kexec if the first 
kernel booted was the right version to run a particular distro.  For 
instance, I might boot straight into my Gentoo, but kexec a boot CD, an 
Ubuntu, or a Windows.

The nice thing that this would give us over Grub and others is the 
ability to boot off any device Linux supports, as well as have true 
scriptability at boot time (menu.lst doesn't really count).  Imagine this:

A cheap, lightweight laptop, without a working hard drive, but with a 
small amount of flash memory and a fast wireless card.  Linux loads off 
the flash, which includes OpenVPN, keys and all, and sets up a VPN 
connection, then mounts an NFS root over the VPN.  A quick check of 
/boot can either tell it that the contents of the flash drive are the 
most recent version -- or, if they aren't, the flash drive gets updated, 
then we kexec the new kernel and start over.  Saves us a reboot.

It's basically a diskless thin client that works from any open wireless 
access point, although it does wreak havoc on whatever bandwidth you 
give it.  Alternatively, if you're only using it in one area, you could 
set it up with WPA keys instead of OpenVPN, although the VPN does do 
other nice things as well, like compression.

>> It's called "backup and restore."  Or did you have a different idea
>> for how to convert an existing installation to another root FS, or do
>> a fresh installation without nuking your partitions anyway?
> Well, there is convertfs, fsconvert (which i.e. _is_ backup&restore),
> parted, etc. There are ways, some are safe, most are not. But I am
> afraid we have gone way OT by now.

That we have, but that's OK.  This isn't the xcode-list...

> But how do you explain to a
> linux newbie: use ext2|3 for / due to bootloader issues _or_ something
> funky, yet with funkyness partly turned off for bootloader
> compatibility, _or_ use a tiny ext2 /boot and feel free to fsck&mount as
> you damn please.

I explain the second option, and it's really not that hard.  Most Linux 
setups need at least two partitions anyway -- root and swap.  Adding a 
/boot really isn't such a big deal.

> Most people just don't care anyway, and those who do will want to know
> why. And telling them that otherwise it won't work (without extra care)
> yields the question, "why not?", and you might _not_ want to try
> explaining the entire situation from within the installer help text. Or
> maybe that would be the way to go? Who knows how much people actually
> read in the end, before they just quit - worrying, deciding, or even
> installing the thing at all.

I would put as much in the installer help as makes sense -- except, as 
at least a few installers are designed to work with an Internet 
connection, I'd also give them a web browser to play with during the 
install.  If they really want details, we can always give them the URL 
of this thread...

Anyway, you're right, most people won't care.  Most who do will trust me 
when I say "I've always done it this way, it's not a big deal, and it 
guarantees stuff will just work.  Any other way, you have to be careful 
-- it will probably work, but maybe not."  And beyond that, they're 
going to want to read this thread, and will grumble about the stupidity 
of it all, but will be forced to live with it.

> And now, go easy on me! This was never intended as a debate of colliding
> opinions - call it brainstorming : )

I don't go easy on anyone, but don't take it personally -- remember, 
brainstorming...
