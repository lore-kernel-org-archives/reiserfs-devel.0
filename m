From: Antonio <tritemio@gmail.com>
Subject: Re: reiserfs corruption
Date: Thu, 26 Jan 2006 15:58:41 +0100
Message-ID: <5486cca80601260658o33bdc9f3n@mail.gmail.com>
References: <5486cca80601260249n6bb98418v@mail.gmail.com>
	 <1138282968.6313.113.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1138282968.6313.113.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

2006/1/26, Vladimir V. Saveliev <vs@namesys.com>:
[cut]
> > The first time I ran "reisefsck --rebuidl-tree" and corrected all the
> > errors. After few day I had again those errors, so I thinked that my
> > HD was at the end of his life. However I have another debian system on
> > the same disk that works without problems.
>
> is it on reiserfs?
> would you, please, show output of
> fdisk -l /dev/hda

No, the only reiserfs partition is hda9 which is the root partition of
one of the two debian systems I have on this machine.

As you requested:
# fdisk -l /dev/hda

Disk /dev/hda: 60.0 GB, 60022480896 bytes
255 heads, 63 sectors/track, 7297 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1               1         382     3068383+   7  HPFS/NTFS
/dev/hda2   *         383         393       88357+  83  Linux
/dev/hda3             394        1122     5855692+  83  Linux
/dev/hda4            1123        7297    49600687+   5  Extended
/dev/hda5            1123        1851     5855661   83  Linux
/dev/hda6            1852        1915      514048+  82  Linux swap / Solari=
s
/dev/hda7            1916        5562    29294496   83  Linux
/dev/hda8            5563        6413     6835626   83  Linux
/dev/hda9   *        6414        7297     7100698+  83  Linux

> Would you, please, downgrade to 2.6.14 (or whatever kernel you used
> before 2.6.15.1) and see whether the problem comes up.

Yes. I'm yet running the standard debian etch kernel 2.6.12. No
problem so far (~ 1 hour), but it's too early too say if this resolved
the problem. Even with the 2.6.15.1 kernel the system worked for days
before having problems.

I'll update you the situation as far as I get an error or otherwise tomorro=
w.

Thanks for the reply.

Best Regards,

  ~ Antonio
