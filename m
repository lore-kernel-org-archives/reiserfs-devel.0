From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Wed, 09 Sep 2015 16:16:17 +0300
Message-ID: <1441804577.3968.2.camel@gmail.com>
References: <55E470E0.2070304@gmail.com>
	 <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	 <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
	 <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-al6YAqTbt5G/jaqt2i3i"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=T7HORSJQlcXlIna4SmH8QXK/T5TsBUHoAdlHsx1zTPo=;
        b=ZrpglvWLYmhRBlQkFtcLBgl+CYcvSFwTTErVBeCbtf4wXma13FSOtfSvHSwyiph0eg
         ibmrqFw5w45sY2gHRuB0rzggXSP14h1j5DGPmYsE6xY+FjYPwwTXhZ5N5REJUDaCVlvJ
         dTQefYrFegIyrlBCfEF+kWYDG0fr7KnXwDJcc4qJ1FWCNNR8IFqxgYavR7VX4J4QjCLf
         IV7kA8ql2vjUPR8Varj7GmCql9RkAy1pwjtxtYoNkDsdXji9pN7VAiOF/85YpbMDMXg1
         D15EH3Gmtr9qbN4sFpnaojnaBghhPvclC1nTNLhoiVmlulpAk1ZZRDeXhpOlkdImq6/L
         C56Q==
In-Reply-To: <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose.r.r@metztli.com>, Edward Shishkin <edward.shishkin@gmail.com>
Cc: milan.buska@gmail.com, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


--=-al6YAqTbt5G/jaqt2i3i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-09 at 00:54 -0700, Jose R R wrote:
> Scratch my previous issue, Ed. It is *not* related to your new
> Reiser4
> software release 4.0.1 module nor reiser4progs.
>=20
> My usual development environment is a modified non-systemd Debian Sid
> (unstable) on a Reiser4 root partition. The kernels built won't boot
> in *that* particular instance due to a least one other additional
> issue:
> target filesystem does not have requested /sbin/init

Could you please elaborate? I'm getting the exact same oops with "new"
reiser4 (did not have a chance to investigate it, so just fell back to
the old kernel for the meantime).

--=20
Ivan Shapovalov / intelfx /

>=20
> However, I tried one of my recently built reiser4-patched kernels
> into
> a systemd Debian Sid -- also running on reiser4 root partition -- and
> the system booted and behaved as you predicted.
>=20
> < https://pbs.twimg.com/media/COccj66UAAA7mfp.png:large >
>=20
> Sorry about that, Ed. It's my fault for only testing in the build
> environment (although I had not had an issue with reiser4 builds
> until
> this kernel 4.x and new 4.0.1 software combination change).
>=20
> On Tue, Sep 8, 2015 at 4:20 PM, Milan Bu=C5=A1ka <milan.buska@gmail.com>
> wrote:
> > Hi all.
> >=20
> > I'm not an expert but I think that the error happened during kernel
> > compilation.
> > I have compiled into the kernel filesystem reiser4 directly into
> > the kernel,
> > not as modules and yet I have no problems. This is a record of my
> > boot.
> >=20
> > Loading Linux 4.1.6-reiser4 ...
> > early console in decompress_kernel
> >=20
> > Decompressing Linux... Parsing ELF... done.
> > Booting the kernel.
> > INIT: version 2.88 booting
> > The system is coming up.  Please wait.
> > *******************************************************************
> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > *******************************************************************
> >=20
> > Fscking the /dev/sda2 block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will check the consistency of the Reiser4 FileSystem.
> > ***** fsck.reiser4 started at Wed Sep  9 00:31:06 2015
> > Reiser4 fs was detected on /dev/sda2.
> > Master super block (16):
> > magic:          ReIsEr4
> > blksize:        4096
> > format:         0x0 (format40)
> > uuid:           631c2925-dca7-41be-b40c-46e7b2052e28
> > label:          SYSTEM-ROOT
> >=20
> > Format super block (17):
> > plugin:         format40
> > description:    Disk-format plugin.
> > version:        1
> > magic:          ReIsEr40FoRmAt
> > mkfs id:        0x6129d214
> > flushes:        0
> > blocks:         27000832
> > free blocks:    26270124
> > root block:     118355
> > tail policy:    0x2 (smart)
> > next oid:       0x86a7b6
> > file count:     170068
> > tree height:    5
> > key policy:     LARGE
> >=20
> >=20
> > CHECKING THE STORAGE TREE
> >         Read nodes 269426
> >         Nodes left in the tree 269426
> >                 Leaves of them 265060, Twigs of them 4257
> >         Time interval: Wed Sep  9 00:31:06 2015 - Wed Sep  9
> > 00:31:22 2015
> > CHECKING EXTENT REGIONS.
> >         Read twigs 4257
> >         Time interval: Wed Sep  9 00:31:22 2015 - Wed Sep  9
> > 00:31:22 2015
> > CHECKING THE SEMANTIC TREE
> >         Found 171872 objects (some could be encountered more then
> > once).
> >         Time interval: Wed Sep  9 00:31:22 2015 - Wed Sep  9
> > 00:31:25 2015
> > ***** fsck.reiser4 finished at Wed Sep  9 00:31:25 2015
> > Closing fs...done
> >=20
> > FS is consistent.
> >=20
> > hostname: ishi
> > font: ter-v16n
> > keyboard: us
> > INIT: Entering runlevel: 2
> > starting services: sysklogd lo net firewall crond gpm dbus
> >=20
> > Version reiser4progs:
> > $ /sbin/fsck.reiser4 --version
> > /sbin/fsck.reiser4 1.1.0
> > Format release: 4.0.1
> > Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> > reiser4progs/COPYING.
> >=20
> > $ uname -a
> > Linux ishi 4.1.6-reiser4 #1 SMP Tue Sep 1 17:44:08 CEST 2015 x86_64
> > Intel(R)
> > Core(TM) i5-3570K CPU @ 3.40GHz GenuineIntel GNU/Linux
> >=20
> > I also recommend checking with such parameters and patches
> > reiser4progs is
> > compiled on Debian. See the debian / rules.
> >=20
> > Greeting
> >=20
> > Milan
> >=20
>=20
> I appreciate your input Milan, thank you.
>=20
> I usually build a reiser4 module in Debian and make sure that
> initramfs-tools are aware of it during kernel installation by editing
> /etc/initramfs-tools/modules, adding directive: reiser4
> Otherwise, reiser4 module will not be included in the initrd and the
> system will not boot.
>=20
> Thank you all.
>=20
>=20
> Best Professional Regards.
>=20
>=20



--=-al6YAqTbt5G/jaqt2i3i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlXwMSEACgkQxUKljSIMAnDK+gD8CNydqqjb90TUdojYoikosKS5
nEBErqD3gMR/YWThuxoBANWIFdtfOox0yjaliR3PTB+aHXu0iGmy+Uee7zAVn/2z
=r+mS
-----END PGP SIGNATURE-----

--=-al6YAqTbt5G/jaqt2i3i--

