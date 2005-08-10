From: michael chang <thenewme91@gmail.com>
Subject: Re: Distributions with out-of-the-box Reiser4 support?
Date: Wed, 10 Aug 2005 17:34:11 -0400
Message-ID: <b14e81f00508101434444027d6@mail.gmail.com>
References: <194f6255050810094849b3164e@mail.gmail.com>
	 <b14e81f005081010125d5a6fa4@mail.gmail.com>
	 <42FA6E54.5090200@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FA6E54.5090200@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On 8/10/05, David Masover <ninja@slaphack.com> wrote:
> michael chang wrote:
> > On 8/10/05, Clemens Eisserer <linuxhippy@gmail.com> wrote:
> > Not sure; although IIRC, many distros plan to support it in the
> > _future_.  Apparently, that's why Hans is trying to hard to get it
> > into the vanilla kernel -- so distros can support it.  There should be
> > a Gentoo Live CD that supports it...
>=20
> There is.  Not an official one, but it supports all kinds of
> "experimental" stuff.  The ones I noticed are reiser4 and dmraid,
> because that's what I needed.  But then, I roll my own network bootable
> Gentoo installs.
>=20
> I don't like how bloated Knoppix has gotten, or how spartan RIP and the
> various official and unofficial Gentoo LiveCD are.  I'd like a livecd in
> the 100-150 meg range, with support for any kind of weird install I want
> to do (top of the list is a new kernel with Reiser4 and dmraid, and
> support for booting the "CD" off the network), amd64 support, and decent
> web browsing -- links with no jpeg support doesn't count.
>=20
> If enough people want this, I can have an image in the next couple
> weeks.  Otherwise, I'll keep it to myself, and give you scripts/howtos
> on how to bootstrap your way there with an existing livecd.

This would be nice -- if you get it done, either way, please send me a
copy.  Although it'd be interesting what kind of an install you do
(LFS, Gentoo, Debian, Ubantu, etc.).  I know the way Knoppix does it's
CD installs is weird -- Parted apparently didn't like the way it's
"ext2" partitions were [-- were they even ext2 at all?].

> > I believe at the moment Reiser4 root partitions are unsupported, so
> > you are advised to use another filesystem for storing other files,
> > especially /boot.  [Some versions of GRUB support Reiser4, but there
> > have been issues; others don't; there's supposed to be a patch for
> > GRUB in order to support Reiser4, etc. etc.]
>=20
> I think it would be more productive to take some lessons from LinuxBIOS
> and replace Grub with a Linux-based solution.  I'm thinking lilo (which
> does support reiser4, right?), an initrd or early-userspace, a little
> curses app, and kexec support.  That way, our "bootloader" would
> instantly support anything Linux does.
>=20
> Does anyone know of a project to do this already?

If memory serves me right, GRUB is the newer one -- and supports
dynamic boot configuration; at the expense of it having to know about
all filesystems it boots from.  LILO has to be reinstalled every
single time you add or remove a kernel, move a partition, resize a
partition, etc. etc.; because it hard links to the kernel images.  In
this case, I'd rather stick with GRUB, and be forced to put /boot on a
10-15 MB ext2 partition.

> Debian is rock-solid, and stuff often moves from Ubuntu into Debian's
> unstable fork.  Both Debian and Ubuntu use Apt, which I've found to be
> almost as flexible as Portage, but it uses binary packages, meaning you
> can type "apt-get install mozilla" and come back in five minutes and
> it's there.
>=20
> Also, both Debian and Ubuntu are probably relatively easy to install,
> though probably not with Reiser4.

Well, debian's latest installer, debian-installer, [sarge] can bring
you into a partition manager if you wish to install on a ReiserFS
[3.6], XFS, ext2, ext3, or various other partitions; or you can let it
autopartition (-- I haven't tried this, and have no intent on doing
so, because I handle my partitions somewhat oddly).  If you want
Reiser4, it seems like you have to get the mkfs tools onto a ISO or
boot image or something, as well as put in a Reiser4 kernel, and then
mkfs and mount the root partitions normally.  If you've installed it
once before with a different filesystem, it shouldn't be too hard to
figure out where debian-installer wants you to mount your Reiser4
partition however...

That said, root Reiser4s aren't support atm, afaik.

> Gentoo compiles everything from scratch, which is both good and bad.

> It's also nice to compile everything from scratch, because you can set
> system-wide defaults for compile-time features (USE flags), such as
> GNOME/KDE support.  You can get a fully loaded desktop, or you can trim
> much of the fat off.  A simple 'USE=3D"-gnome -kde"' helps a lot.

If you want to go through the trouble, there is a mechanism you can
use to compile your own packages in debian -- I believe you can use
"apt-get source <packagename>" as a regular user to build "optimized"
copies of most of the packages on Debian -- or you can do an install
from source, and it will install in /usr/local or whatever, and
because of the way paths are setup, it will "override" your package.=20
[That can be confusing for dependencies though... although FC's RPM
madness is worse IIRC.]

> I haven't actually used Ubuntu, but I hear it's more up-to-date and
> generally slicker to use than Debian, although it does favor simplicity
> over choice -- meaning that they have an officially supported web
> browser, and they don't give you any others.  But, I don't actually know
> that, it's all just what I've heard.  Generally, it's easier to get
> new/cool stuff like xorg+nvidia working on Ubuntu.

I haven't tried Ubantu myself, but apparently people've been raving
about it -- they say that Ubantu listens to it's users (as opposed to
Debian? I'm not sure...) and that there is a risk for package
interoperability concerns (similar to the .rpm issue, but that's
another issue entirely).  I myself may take a look at it -- I've
ordered one of their free CDs myself.  *shrugs*

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
