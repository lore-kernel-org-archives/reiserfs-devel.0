From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 for windows
Date: Tue, 07 Dec 2004 22:38:08 -0600
Message-ID: <41B68530.7090807@slaphack.com>
References: <20041207060730.GA1344@zg.cz> <1102408162.12503.25.camel@localhost> <965622991.20041208024010@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <965622991.20041208024010@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Spam <spam@tnonline.net>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Spam wrote:
|>On Mon, 2004-12-06 at 22:07 -0800, Jiri Klouda wrote:
|>
|>>>Also, is it a given that reiser4 for windows would work without help
|>>>from MS?  I've just never seen a third-party filesystem driver for
|>>>windows.  You'd think that at least one other filesystem, one of the
|>>>Linux/BSD/etc ones, would have done this, if it was feasable.
|
|
|   Aren't there? Isn't there various compression systems, not to
|   mention PGP disk? Maybe it is not the same thing...

Not exactly.  Is there an XFS for Windows?  What about JFS?  What about
Minix?  Sure, some filesystems have apps that allow access, but I don't
think I've seen one that provides an actual filesystem driver (not
plugin).  I do occasionally hear of them, though.
|
|>>You might be onto something here. I am pretty sure my company would
|>>pay quite a lot for a working, fast and elegant implementation of
|>>symbolic links on windows. Either as a new filesystem or as an addition
|>>onto ntfs. We currently use one such addition and not very usable and
|>>uses a catalog of symlinks that can easily get corrupted.
|
|
|   Yes, NTFS only has hard links, not symlinks =(. I have myself been
|   wanting to use symlinks a lot.
|
|>>Having reiser4 on Windows or even ext2, would be a huge thing.
|>
|>a real implementation of ext2 for windows exists.. i had it once in
|>vmware.. but i cant remember the name
|>
|>>>All this leaves me with the distinct impression that it'd be cheaper to
|>>>buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
|>>>using reiser4.  Steam and others refuse to install on network drives,
|>>>Windows probably will not boot off a network drive, but I imagine that
|>>>fixing these would be easier than porting a filesystem.
|
|
|   Will disk access over LAN really be anything close to as fast as a
|   real local harddisk, especially if you have to run over Samba? Oh,
|   just noticed you said this in the next paragraph =).

Depends.  Some networks are faster than hard disks.  Also, there's
Lustre, if there's ever an open source fork.

|   Windows can be run from a network drive. Steam, on the other hand
|   prevents network drives for the same reason it has CD checks. It is
|   all about preventing users from running copies.

Well, yes, only it's a stupid measure.  Their main copy protection is
that Steam connects to the Internet whenever it can, so users cannot
_run_ multiple copies.

This is the right approach, but any solution still needs to support apps
which use the wrong approach.  Still, programs have been fooled before
by things like clonecd and an emulation drive.


|>>Unfortunatelly even with very fast ethernet connections and network
|>>appliance with CIFS access, we still don't get the performance of a
|>>local filesystem. Plus, you don't want to really give write access
|>>over network, that slows down anything when you get into hundreds of
|>>clients. And we really cannot pay for so many network applicances to
|>>make this scalable proposition.
|>>
|>>I wish we could just drop Windows as a platform, but as long as there
|>>are customers, there will be need to support them as well... :(
|
|
|   It is easy to say these things. But really, for lots of applications
|   and uses there is only MacOSX that can compete. Linux has yet a far
|   way to go when it comes to normal desktop and workstation usage.
|   Hardcore and relatively skillful users have no problems with Linux
|   as a desktop environment, but the "gray mass" does. KDE and Gnome
|   are improving fast though =). Anyway, that is another discussion not
|   really for this forum.

My mother uses Linux.  My mother did not know what Windows was until I
explained it to her.

It is for another forum, but in reality, the only reason to use Windows
is applications that don't work well under Wine and have no viable
substitutes.  For most people, this is a problem of perception.  The
only things I have real problems with are exotic hardware (which most
people can afford to not buy) and games, and the hardware is something I
have as many problems with Windows as anything else.  (The X-Port won't
work on anything other than Windows 98 or Windows ME.)

This is relevent to reiser4, in a way.  The problem is not that Linux
has a way to go when it comes to normal desktop/workstation usage.  The
problem is that it isn't better enough for most people to switch.  Why
do you think nobody uses MacOSX?

The momentum has to be broken by something really cool, the way Halo
made the Xbox popular.  If Steam moved exclusively to Linux, then
virtually all gamers would either follow or dual-boot, definitely in
time for Half-Life 3.

Why is this relevant to this forum?  Because the same problem exists for
Reiser4.  Metadata bugs aside, it isn't "better enough" yet.  It needs a
killer app.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQbaFL3gHNmZLgCUhAQKIeQ/7BxR7s4zG2SRIwLo5kME6W1c1lqQlt74V
vvNYnS1i5rv/cL4jKP37z5IZwzN1Jbv6Sp7oEwTro6L1x0zffFK6wvWtaRHL616A
WSV8KsZ3M6seRiggLcYW3vR5jTUdo7tm06dQCpD9pvFg8H4oWWbysfsW2NA9nb1l
XoOpRXaczPle9pQX/N49Tumpthht8VW7Ii53zrdDWUHO4Dn5TXyLPmcG0F/8+SUQ
DS5FJvlyiJX6suSz5o8EtIJz706I9+WkWoYjGIOP/UnOCijJTB6UUz/V6kYzdMGN
gwm0OGklF4p6qoWIsbljqFoeYk9eQb9NWgwZdlRPYVN/s9QOtQPB9WZNKA7y5hvn
0GQgDOMgegIbFUVkWr8rB4F3aFBObFspOmJJmYGLQrMimHjH/yH9pSiN3QsrJ3NI
ymwQi8rtV59yrSpIQMPnjcSKNoLGOvriNRjxU6O6UtkAWeDf0pliMqa8aUwRjOs8
Q5shosCengxWAGr4/rLpRGlE1133dhV4ySxY+nsqSA7iFKOKCUn1xRJeDQGn8uin
uctZHcLiYBoxIB9pDvnqN0OzxIZQ9obmsoB0nbB2+X/QHz1hv+QarYvwEVbClyaR
Neadu1KlPBGpECnXszbSK6nMxH036gPQONkwy3HPr4S64cSR7qxewZ3b7Jz3+S6H
OBHFDmzA/RQ=
=N1Ci
-----END PGP SIGNATURE-----
