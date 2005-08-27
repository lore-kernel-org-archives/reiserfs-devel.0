From: michael chang <thenewme91@gmail.com>
Subject: Re: what if I touch a reiser4 partition and ...
Date: Sat, 27 Aug 2005 15:44:48 -0400
Message-ID: <b14e81f00508271244da1d0bb@mail.gmail.com>
References: <2b973fa605082622442afd3040@mail.gmail.com>
	 <4310106C.2060401@slaphack.com>
	 <b14e81f0050827062337363c44@mail.gmail.com>
	 <43109B47.9000706@slaphack.com> <4310A093.4070306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4310A093.4070306@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: David Masover <ninja@slaphack.com>, =?ISO-8859-1?Q?Miguel_Ernesto_P=E9rez_Cabrera?= <solohayuno@gmail.com>, reiserfs-list@namesys.com

On 8/27/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
>=20
> David Masover wrote:
> > michael chang wrote:
> >>On 8/27/05, David Masover <ninja@slaphack.com> wrote:
> >>
> >>>And last I checked, reiser4 doesn't have a resizer -- not even a way t=
o
> >>>grow the FS.  So your correct course of action would probably have bee=
n
> >>>to back everything up, resize hdd5, mkfs, and then restore.  If you
> >>
> >>Yet. AFAIK, as soon as someone funds namesys a few millions or
> >>whatever, they'll write one.  After vanilla inclusion, and from what
> >>it seems, the online repacker.
> >
> > Online repacker would make it possible to shrink the FS online.  But I
> > don't see why we can't *already* grow the FS, even offline.  You don't
> > need a repacker for that.
>=20
> Afaik, if any of disk partitions is mounted - re-partition-ing takes effe=
ct only up on reboot.
> Therefore, being able to grow mounted filesystem does not gain you too mu=
ch.

So what if I have to resize my partition offline?  I'd be willing to
accept that (as a consumer), provided that there's a way to make
static binaries of said resizer and fit them on a floppy.  (I'd, of
course, boot Linux via another floppy, or on a disk image on a FAT
partition or something...)  Similar to the NTFS resize tools.

I'd even settle for that at the moment.  I can't switch to Reiser4
until I have some form of resizing or repacking, even if offline.

I've found online resizing and repacking to be a pain; it's usually
much safer to do it offline anyways.  Regardless of whether the tools
allow otherwise.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
