From: johnrobertbanks@fastmail.fm
Subject: Re: COMPILING AND CONFIGURING A NEW KERNEL.
Date: Fri, 06 Apr 2007 18:26:45 -0700
Message-ID: <1175909205.905.1183425104@webmail.messagingengine.com>
References: <46157B5B.5000602@gmail.com>
   <1175817921.18400.1183285196@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964865AbXDGB0r@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1175817921.18400.1183285196@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: johnrobertbanks@fastmail.fm, Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

This is a reply to an email that I accidentally deleted.

COMPILING AND CONFIGURING A NEW KERNEL.

Download a recent kernel from http://www.kernel.org/
I will use the kernel linux-2.6.20.tar.bz2

You will have to change details of the following to suit your purposes.

Save it in /usr/src/
# mv linux-2.6.20.tar.bz2 /usr/src/

Unzip the kernel package
# tar -jxf linux-2.6.20.tar.bz2

Copy the original kernel configuration file (that came with your distro=
)
to .config
# cp /boot/config-2.6.20 /usr/src/linux-2.6.20/.config

Look at the available kernel building options
# make help

Run oldconfig to update the original kernel config to a current config
# make oldconfig

Use menuconfig (or xconfig or gconfig) to make any further changes
# make menuconfig

YOU SHOULD compile all the drivers necessary to boot your system, into
the kernel (ie, such drivers should not be built as modules).

This way you will NOT need an initrd file.

Use rpm-pkg to create a Red Hat RPM kernel package.
# make rpm-pkg

Went built, the RPM package is put in
/usr/src/packages/RPMS/*your*architecture*

# cd /usr/src/packages/RPMS/x86_64

Install the package (you may have to un-install previous installs)
# rpm -i kernel-2.6.20-1.x86_64.rpm

Use deb-pkg to create a Debian .deb kernel package.
# make deb-pkg

Went built, the .deb package is put in /usr/src/
# cd /usr/src/

Install the package (you may have to un-install previous installs)
# dpkg --install linux-2.6.20_2.6.20_amd64.deb

If you were unable to determine which drivers you need (to boot), then
you will need an initrd file. To build it use the command
# mkinitrd -o /boot/initrd-2.6.20

IF YOU ARE CUSTOMIZING YOUR KERNEL, YOU SHOULD PUT IN THE EFFORT TO
BUILD A KERNEL THAT DOES NOT NEED AN INITRD FILE.

------------------------------------------------------

Now you need to configure your kernel. Using GRUB you need to change th=
e
menu.lst file.

# emacs /boot/grub/menu.lst &

The grub entry that you boot with will look something like:

###Don't change this comment - YaST2 identifier: Original name: linux##=
#
title SUSE LINUX 10.0
    root (hd0,2)
    kernel /boot/vmlinuz root=3D/dev/hda3 resume=3D/dev/hda5 vga=3D0x31=
7
    video=3Dvesafb:nomtrr splash=3Dsilent
    initrd /boot/initrd

Leave the old boot entry so you can boot it if things go wrong with the
new kernel.
Cut and paste a copy of it above the old one. Then adjust the copy for
the new kernel.

###Don't change this comment - YaST2 identifier: Original name: linux##=
#
title MY NEW KERNEL
    root (hd0,2)
    kernel /boot/linux-2.6.20 root=3D/dev/hda3 resume=3D/dev/hda5 vga=3D=
0x317
    video=3Dvesafb:nomtrr splash=3Dsilent

Of course, you don't need a initrd entry as you have compiled in all th=
e
vital drivers,... right?
If you could not determine the vital drivers and needed to build an
initrd file, then you need an entry, like

    initrd /boot/initrd-2.6.20

------------------------------------------------------

If your new kernel is destined to have the same name as the old one, yo=
u
need to do something about it (unless you do not mind the old one being
overwritten).

Use your favorite text editor to change the top level Makefile
# emacs /usr/src/linux-2.6.20/Makefile &

change the line=20
EXTRAVERSION
to=20
EXTRAVERSION =3D something

This will change the name of the new kernel to linux-2.6.20-something

Your /boot/grub/menu.lst entry will now look something like:

###Don't change this comment - YaST2 identifier: Original name: linux##=
#
title MY NEW KERNEL
    root (hd0,2)
    kernel /boot/linux-2.6.20-something root=3D/dev/hda3 resume=3D/dev/=
hda5
    vga=3D0x317 video=3Dvesafb:nomtrr splash=3Dsilent

and perhaps an entry

    initrd /boot/initrd-2.6.20-something

------------------------------------------------------

Now reboot and choose the "MY NEW KERNEL" entry from the GRUB boot menu=
,
and see how you went.


------------------------------------------------------


On Thu, 05 Apr 2007 17:05:21 -0700, johnrobertbanks@fastmail.fm said:
> Hi Ignatich,
>=20
> After seeing the following benchmarks at=20
>=20
> http://linuxhelp.150m.com/resources/fs-benchmarks.htm and
> http://m.domaindlx.com/LinuxHelp/resources/fs-benchmarks.htm
>=20
> The Reiser4 benchmarks are so good, I have decided to try the Reiser4
> filesystem.
>=20
> .-------------------------.
> | FILESYSTEM | TIME |DISK |
> | TYPE       |(secs)|USAGE|
> .-------------------------.
> |REISER4 lzo | 1938 | 278 |
> |REISER4 gzip| 2295 | 213 |
> |REISER4     | 3462 | 692 |
> |EXT2        | 4092 | 816 |
> |JFS         | 4225 | 806 |
> |EXT4        | 4408 | 816 |
> |EXT3        | 4421 | 816 |
> |XFS         | 4625 | 779 |
> |REISER3     | 6178 | 793 |
> |FAT32       |12342 | 988 |
> |NTFS-3g     |10414 | 772 |
> .-------------------------.
>=20
> Column one measures the time taken to complete the bonnie++ benchmark=
ing
> test (run with the parameters bonnie++ -n128:128k:0)
>=20
> Column two, Disk Usage: measures the amount of disk used to store 655=
MB
> of raw data (which was 3 different copies of the Linux kernel sources=
).
>=20
> Anyway, I have patched the 2.6.20 kernel and have a partition formatt=
ed
> with Reiser4.
>=20
> However, I am having trouble getting LILO or GRUB working (with
> Reiser4).
>=20
> Could you guys who know all about this, help me, or point me to some
> help.
>=20
> Thanks a lot, John.
>=20
>=20
> On Fri, 06 Apr 2007 02:42:35 +0400, "Ignatich" <ignatich@gmail.com>
> said:
> > While trying to find the cause of problems with reiser4 in recent=20
> > kernels I came across this.
> >=20
> > Incomplete write handling seem to be missing from reiser4_write_ext=
ent()=20
> > thanks to reiser4-temp-fix.patch. Strangely, there is a patch by Ed=
ward=20
> > Shishkin that should address that issue, but it is missing from -mm=
=20
> > tree. Please check.
> >=20
> >     Max
> >=20
> --=20
>  =20
>   johnrobertbanks@fastmail.fm
>=20
> --=20
> http://www.fastmail.fm - And now for something completely different=85
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--=20
 =20
  johnrobertbanks@fastmail.fm

--=20
http://www.fastmail.fm - mmm... Fastmail...
