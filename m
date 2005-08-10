From: David Masover <ninja@slaphack.com>
Subject: Re: Distributions with out-of-the-box Reiser4 support?
Date: Wed, 10 Aug 2005 16:15:00 -0500
Message-ID: <42FA6E54.5090200@slaphack.com>
References: <194f6255050810094849b3164e@mail.gmail.com> <b14e81f005081010125d5a6fa4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f005081010125d5a6fa4@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

michael chang wrote:
> On 8/10/05, Clemens Eisserer <linuxhippy@gmail.com> wrote:
> 
>>I hope this questions hasn't been asked too often (since it seems to
>>be a perfect example for this), but I'm not too long on this list and
>>for what I've seen it hasn't ... so please don't kill me ;-)
> 
> 
> Nonsense... I haven't seen it yet... but I think it's _supposed_ to be
> on the site somewhere.
> 
> 
>>Does anybody know a number of distrbibutions which support reiser4 out
>>of the box (installer, grub, reiserfs4-utils, ...)?
>>Is opensuse planned to include reiser4?
> 
> 
> Not sure; although IIRC, many distros plan to support it in the
> _future_.  Apparently, that's why Hans is trying to hard to get it
> into the vanilla kernel -- so distros can support it.  There should be
> a Gentoo Live CD that supports it...

There is.  Not an official one, but it supports all kinds of
"experimental" stuff.  The ones I noticed are reiser4 and dmraid,
because that's what I needed.  But then, I roll my own network bootable
Gentoo installs.

I don't like how bloated Knoppix has gotten, or how spartan RIP and the
various official and unofficial Gentoo LiveCD are.  I'd like a livecd in
the 100-150 meg range, with support for any kind of weird install I want
to do (top of the list is a new kernel with Reiser4 and dmraid, and
support for booting the "CD" off the network), amd64 support, and decent
web browsing -- links with no jpeg support doesn't count.

If enough people want this, I can have an image in the next couple
weeks.  Otherwise, I'll keep it to myself, and give you scripts/howtos
on how to bootstrap your way there with an existing livecd.

> I believe at the moment Reiser4 root partitions are unsupported, so
> you are advised to use another filesystem for storing other files,
> especially /boot.  [Some versions of GRUB support Reiser4, but there
> have been issues; others don't; there's supposed to be a patch for
> GRUB in order to support Reiser4, etc. etc.]

I think it would be more productive to take some lessons from LinuxBIOS
and replace Grub with a Linux-based solution.  I'm thinking lilo (which
does support reiser4, right?), an initrd or early-userspace, a little
curses app, and kexec support.  That way, our "bootloader" would
instantly support anything Linux does.

Does anyone know of a project to do this already?

> Does Lindows support Reiser4 roots?

Don't count on it.

>>For now I am using Fedora but since a long time I feel uncomfortable
>>with their use-what-we-tell-you policy, they tell me to use ext3 or
>>gnome for example and if I want to make a different choice a get
>>anything but not a perfect installation.
> 
> 
> Consider using ReiserFS 3.6 in the meantime; and use either Debian or
> Ubantu [or stick with FC, if you need to].  Former gives you more
> control; I haven't used the latter but I hear it's rather popular.
> Gentoo has also been suggested -- but I don't know how it works or
> anything.  I believe the consensus for most users is "while it's
> there, root/boot support isn't in yet, and there could be unsolved
> bugs, so use it to debug, or wait" or something.  Iunno.  *shrugs*

Debian is rock-solid, and stuff often moves from Ubuntu into Debian's
unstable fork.  Both Debian and Ubuntu use Apt, which I've found to be
almost as flexible as Portage, but it uses binary packages, meaning you
can type "apt-get install mozilla" and come back in five minutes and
it's there.

Also, both Debian and Ubuntu are probably relatively easy to install,
though probably not with Reiser4.

Gentoo compiles everything from scratch, which is both good and bad.
It's good because theoretically, you can apply global optimizations like
"-mach=athlon-xp" that would speed up your system dramatically -- but,
it's not really that much faster, and the "bad" is, it takes forever to
install something.  "apt-get install mozilla" could take five minutes or
less, depending on the speed of your machine and network connection, but
"emerge mozilla" is probably going to take at least half an hour.

It's also bad because packages tend to be more centrallized -- because
that's how compiles are.  You don't have separate packages for the X
libs, for instance, meaning that you have to build a whole X server,
even if it's a headless machine that you only want support for ssh X
forwarding on.

It's also nice to compile everything from scratch, because you can set
system-wide defaults for compile-time features (USE flags), such as
GNOME/KDE support.  You can get a fully loaded desktop, or you can trim
much of the fat off.  A simple 'USE="-gnome -kde"' helps a lot.

Gentoo has, I feel, a much more evolved rc/init system than Debian.  It
still uses /etc/init.d, but instead of /etc/rc.d, startup scripts are
linked into folders in /etc/runlevels.  The system is entirely based on
dependencies, meaning it can launch many services in parallel (not by
default) -- a real plus if some of them are network-bound or generally
sluggish -- and it's easier to add/remove startup apps, and create new
ones.  On Debian, there's a tool to manage links in /etc/rc.d, but you
still have to specify the order manually, which is why most services are
turned on by default.  On Gentoo, you have to enable sshd manually, but
it's just a matter of "rc-update add sshd default".

Gentoo is also the hardest to install.  There's no installer, just a
text-mode web browser on the CD so you can read an installation guide as
you enter commands.  In other words, the install process is entirely
manual.  Both good and bad -- good, because you'll learn lots of things
about Linux, the commandline, and things like fstab and fdisk/cfdisk,
all of which is helpful later if you need to do some rescue work.  Bad,
because the learning curve is practically vertical.

This also means that if you can find a boot CD -- just about any boot
CD, doesn't have to be Gentoo-specific -- that supports Reiser4, then
Gentoo supports Reiser4, because you generally have to compile your own
kernel.  It can do some of that for you, but there's ample opportunity
to patch support in, or even to just choose an MM kernel.  But then,
this is sort of true of other distros, just that on, say, Debian, you
usually want the official CDs, so you get their installers.  On Gentoo,
tar+chroot is the installer.

I haven't actually used Ubuntu, but I hear it's more up-to-date and
generally slicker to use than Debian, although it does favor simplicity
over choice -- meaning that they have an officially supported web
browser, and they don't give you any others.  But, I don't actually know
that, it's all just what I've heard.  Generally, it's easier to get
new/cool stuff like xorg+nvidia working on Ubuntu.

I use Gentoo, but I recommend Debian/Ubuntu to anyone who doesn't have a
good reason for using Gentoo.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQvpuVHgHNmZLgCUhAQJMCQ/7BE4MEwFPEk/qydxtGGFHGk83z3fNEeSi
CdgDI6szTFlFfpOCF4DxNrNsULBflRAOVyNLEjkNnut2cqOuEcbFbd4xy4cXWzWW
yQrlwm9wHJSs8swhsBzqzRDI6wgD6d4MohsnQv2xvfxOXzHdmY8QVE/Tetn5cazh
Ilu1RhJXNfadMaASHxlOKp4LuasUgCiYEkgoNwDwPSIAhVGdCxaRPKT/CuHkzj9C
RJBedK2BrukzTjSg9cp4juJuGlov6o72VE6GeitLY4j7xLBVSXC4zHX78JgVumYT
7fT/ks4ic9caDi9AIMFHDLmgSeYTdpJkBJP6jsTUJPw7Ou7egKtLWkwG0tnU03Js
vVZ2gGX7OhQDHM74lIXalMr3gJI/YoFt1dZE9029OFv+25dT/qf8ntaeZr+CZdXE
5pbJAcYRv9Qc/CSLIPgxxtQ/e495GjLZuvJwYiSV1kZUcAy9wWeQ9yolPj9s0owj
h36Ur2LKXniQC+qaR8KHQ9xmSagJGAtMt9yHj9h1woVeUbrYy3qYekV7BP8CVdBu
h77ntn+bH3wgSYPt57WwvJbvFBV5AXRgUAJfCd3Jbzee5Vxm6jTOutXcHsDx9BMf
A1axBtv7NhOEvMBAGF1cf3qYYUSP5KKgVxwsjlNx4R24nxCzMGAGggfLbR4qXxEg
tQHsrcokh4A=
=LjEy
-----END PGP SIGNATURE-----
