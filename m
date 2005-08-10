From: David Masover <ninja@slaphack.com>
Subject: Re: Distributions with out-of-the-box Reiser4 support?
Date: Wed, 10 Aug 2005 17:12:01 -0500
Message-ID: <42FA7BB1.1080801@slaphack.com>
References: <194f6255050810094849b3164e@mail.gmail.com>	 <b14e81f005081010125d5a6fa4@mail.gmail.com>	 <42FA6E54.5090200@slaphack.com> <b14e81f00508101434444027d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00508101434444027d6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

michael chang wrote:
> On 8/10/05, David Masover <ninja@slaphack.com> wrote:
> 
>>michael chang wrote:
>>
>>>On 8/10/05, Clemens Eisserer <linuxhippy@gmail.com> wrote:
>>>Not sure; although IIRC, many distros plan to support it in the
>>>_future_.  Apparently, that's why Hans is trying to hard to get it
>>>into the vanilla kernel -- so distros can support it.  There should be
>>>a Gentoo Live CD that supports it...
>>
>>There is.  Not an official one, but it supports all kinds of
>>"experimental" stuff.  The ones I noticed are reiser4 and dmraid,
>>because that's what I needed.  But then, I roll my own network bootable
>>Gentoo installs.
>>
>>I don't like how bloated Knoppix has gotten, or how spartan RIP and the
>>various official and unofficial Gentoo LiveCD are.  I'd like a livecd in
>>the 100-150 meg range, with support for any kind of weird install I want
>>to do (top of the list is a new kernel with Reiser4 and dmraid, and
>>support for booting the "CD" off the network), amd64 support, and decent
>>web browsing -- links with no jpeg support doesn't count.
>>
>>If enough people want this, I can have an image in the next couple
>>weeks.  Otherwise, I'll keep it to myself, and give you scripts/howtos
>>on how to bootstrap your way there with an existing livecd.
> 
> 
> This would be nice -- if you get it done, either way, please send me a
> copy.  Although it'd be interesting what kind of an install you do
> (LFS, Gentoo, Debian, Ubantu, etc.).  I know the way Knoppix does it's
> CD installs is weird -- Parted apparently didn't like the way it's
> "ext2" partitions were [-- were they even ext2 at all?].
> 
> 
>>>I believe at the moment Reiser4 root partitions are unsupported, so
>>>you are advised to use another filesystem for storing other files,
>>>especially /boot.  [Some versions of GRUB support Reiser4, but there
>>>have been issues; others don't; there's supposed to be a patch for
>>>GRUB in order to support Reiser4, etc. etc.]
>>
>>I think it would be more productive to take some lessons from LinuxBIOS
>>and replace Grub with a Linux-based solution.  I'm thinking lilo (which
>>does support reiser4, right?), an initrd or early-userspace, a little
>>curses app, and kexec support.  That way, our "bootloader" would
>>instantly support anything Linux does.
>>
>>Does anyone know of a project to do this already?
> 
> 
> If memory serves me right, GRUB is the newer one -- and supports
> dynamic boot configuration; at the expense of it having to know about
> all filesystems it boots from.

Yes, I know.  I love being able to hit "c" at the boot menu to drop to a
commandline and manually pick a kernel.  But, see below.

> LILO has to be reinstalled every
> single time you add or remove a kernel, move a partition, resize a
> partition, etc. etc.; because it hard links to the kernel images.  In

Not a big deal at all.  Just add "lilo" to your install script.  You do
have one, don't you?

With a stock kernel, for me, it's always been "make bzImage modules
modules_install && mount /boot && cp arch/x86_64/boot/bzImage /boot &&
(initrd stuff here, on some machines) && umount /boot && reboot".  I
don't think adding a "lilo" in there really changes much, it just makes
it a little bit harder to boot an old kernel -- but not at all impossible.

I also like how Lilo can have a boot menu (entirely preconfigured, but
it's there) that only shows up if you hold a key during boot (think it's
alt).  Grub, you usually have to have the menu show up, then pick a
default within a timeout, and 99% of my boots, I want the default.  It
really annoys me that my BIOS, and everything else in my system with a
BIOS (bootable network cards, fake RAID controllers, and so on), plus
grub, all insist on waiting 5-10 seconds in case I'll press a certain
key to enter their setup menu.  It takes me longer to get through POST
and GRUB than it does for XP to un-Hibernate.  I wish everything did
what Lilo did -- just let me hold a key, so that if I don't hold that
key, it doesn't waste time waiting for me to press it.

> this case, I'd rather stick with GRUB, and be forced to put /boot on a
> 10-15 MB ext2 partition.

But, you might want more than that.  For instance, the RIP PXE rescue
system (for booting off a network) can easily be intsalled locally as a
GRUB menu option, but the ramdisk is 28 megs -- and that's without the
kernel.

Here's why I would want Lilo:

Linux now has something called "kexec", which is like an "exec" call for
the kernel.  It was designed for LinuxBIOS, a port of Linux to actually
replace the BIOS.  That's right -- you flash your BIOS to a kernel.  On
boards that support it, you boot faster and can boot off any device
Linux supports.  (On the ones that don't support it, if you try to flash
them, you'll be unbootable and you'll have to get an RMA on the board.)

I'm thinking, for those of us who don't want to actually try LinuxBIOS,
and for whom GRUB is too limiting, maybe lilo should be used to boot a
Linux, which can then use the main Reiser4 partition (and floppies, USB
drives, even loop-mounted files) to "boot" from.  You'd use the old
kernel to boot the new one, then if it works, you upgrade the
"bootloader" kernel.

There are kludges to get a lot of functionality out of GRUB, and even
graphical bootloaders like XOSL, but almost all of them force you to
have more than one bootloader, and to chainload them -- possibly in
quite a long chain.  Plus, there's no guarentee that you'll get one that
supports the media you want -- sure, SmartBootManager supports ATAPI
CD-ROM drives now, but does it support USB drives?

All the more reason, Hans, to have bitmaps not be preloaded on mount --
in a situation like this, you want a Reiser4 partition for maybe 5
seconds or less most of the time, but my partition takes 15-20 seconds
unless I use "dont_load_bitmap" from an initrd.

>>Debian is rock-solid, and stuff often moves from Ubuntu into Debian's
>>unstable fork.  Both Debian and Ubuntu use Apt, which I've found to be
>>almost as flexible as Portage, but it uses binary packages, meaning you
>>can type "apt-get install mozilla" and come back in five minutes and
>>it's there.
>>
>>Also, both Debian and Ubuntu are probably relatively easy to install,
>>though probably not with Reiser4.
> 
> 
> Well, debian's latest installer, debian-installer, [sarge] can bring
> you into a partition manager if you wish to install on a ReiserFS
> [3.6], XFS, ext2, ext3, or various other partitions; or you can let it
> autopartition (-- I haven't tried this, and have no intent on doing
> so, because I handle my partitions somewhat oddly).  If you want
> Reiser4, it seems like you have to get the mkfs tools onto a ISO or
> boot image or something, as well as put in a Reiser4 kernel, and then
> mkfs and mount the root partitions normally.

Still not fun, especially considering that if you're like me, you make
mistakes on your first install, and your second -- some days, it may be
my fifth install that's the one I keep.

> That said, root Reiser4s aren't support atm, afaik.

They are, if you can deal with manually creating/mounting them (not
using the debian-installer partitioner), and compiling a custom kernel
somehow during the install (before you reboot) -- Debian usually uses
precompiled kernels.

>>Gentoo compiles everything from scratch, which is both good and bad.
> 
> 
>>It's also nice to compile everything from scratch, because you can set
>>system-wide defaults for compile-time features (USE flags), such as
>>GNOME/KDE support.  You can get a fully loaded desktop, or you can trim
>>much of the fat off.  A simple 'USE="-gnome -kde"' helps a lot.
> 
> 
> If you want to go through the trouble, there is a mechanism you can
> use to compile your own packages in debian -- I believe you can use
> "apt-get source <packagename>" as a regular user to build "optimized"
> copies of most of the packages on Debian -- or you can do an install
> from source, and it will install in /usr/local or whatever, and
> because of the way paths are setup, it will "override" your package. 
> [That can be confusing for dependencies though... although FC's RPM
> madness is worse IIRC.]

It's nowhere near "emerge" on Gentoo.  For one thing, you can't easily
set system-wide CFLAGS, and there's really no equivalent of USE flags,
at least until we as a species figure out how to use a decent bytecode
for everything, and compile-time optimization/configuration becomes a
thing of the past.

>>I haven't actually used Ubuntu, but I hear it's more up-to-date and
>>generally slicker to use than Debian, although it does favor simplicity
>>over choice -- meaning that they have an officially supported web
>>browser, and they don't give you any others.  But, I don't actually know
>>that, it's all just what I've heard.  Generally, it's easier to get
>>new/cool stuff like xorg+nvidia working on Ubuntu.
> 
> 
> I haven't tried Ubantu myself, but apparently people've been raving
> about it -- they say that Ubantu listens to it's users (as opposed to
> Debian? I'm not sure...)

Sounds about right.  Debian seems to hate their users, and Gentoo is
very helpful to users, if the users read documentation first.  You have
to sound educated on whatever you're askind for help about or you'll
likely be ignored.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQvp7sXgHNmZLgCUhAQJM/Q/+PgOVjMmumOPoBgKhaYLkQ7TAXr1b/ZYM
gojYolRQ7oRNku3mG4HdX6TIaNruQJj9NXd9kqKGL595lu5Pq3cIA5WAfyVKwdMy
GVwtG2ZzGZG8IAqUPZ99StU9wz7G8fwOIx96+gqZPN/nTxJ2WznTWD355dZF50r9
Q8hQpdzK7qD9+JMt86gYAtg2oePEHSv1hQtfRKmWq8eOHCMPCC0HKP0VpKEms0V8
pPxY3RQIJCNDtXs7bNL0Isgr/WjxJi+58UQcA1Wjp/F2l8Ka89TYqBy44Kz5sF5Q
3A0OoO26P1+sQ6AtOWxfese6UQ9E/MiYAWJ+Lh7g/GwUv/5YZ3Xn4EkiVnaVM1lZ
zlasAenhshMx/x2O5doiDGXnU0SdG3YUrqIhdukP6RNYMuBYFDrLV2KsgZ91U1IV
EdzuyPAqdS6gZce9akqtaROGKzESTbp+Q1RZcVRSQk32YZVJ2V10r1GEf1+/CE1H
2Ja9L58mRZ7JFxm7iFpHtJ0A3Fnnb/NAIwTHGbwrgEDAL6qUMM6DW+n60RRjF5t0
tWRtskB4wnzdLbPXzbQyZVpx18XMP8v90LmA+x9rDp7hXZb9v0dxUrGzfaNhDZQR
vR9/xiCKlWaSTxYIFL4W+Bf45hLEYwKjLHLfF2hfbhkf/jPJHE63OZByyCPy8diS
5htsiR0iACI=
=RCQN
-----END PGP SIGNATURE-----
