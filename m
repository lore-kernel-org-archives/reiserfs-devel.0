From: Spam <spam@tnonline.net>
Subject: Re: reiser4 for windows
Date: Wed, 8 Dec 2004 02:40:10 +0100
Message-ID: <965622991.20041208024010@tnonline.net>
References: <20041207060730.GA1344@zg.cz> <1102408162.12503.25.camel@localhost>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1102408162.12503.25.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>


> On Mon, 2004-12-06 at 22:07 -0800, Jiri Klouda wrote:
>> > Also, is it a given that reiser4 for windows would work without help
>> > from MS?  I've just never seen a third-party filesystem driver for
>> > windows.  You'd think that at least one other filesystem, one of the
>> > Linux/BSD/etc ones, would have done this, if it was feasable.

  Aren't there? Isn't there various compression systems, not to
  mention PGP disk? Maybe it is not the same thing...
>>=20
>> You might be onto something here. I am pretty sure my company would
>> pay quite a lot for a working, fast and elegant implementation of=20
>> symbolic links on windows. Either as a new filesystem or as an addition
>> onto ntfs. We currently use one such addition and not very usable and
>> uses a catalog of symlinks that can easily get corrupted.

  Yes, NTFS only has hard links, not symlinks =3D(. I have myself been
  wanting to use symlinks a lot.
>>=20
>> Having reiser4 on Windows or even ext2, would be a huge thing.
> a real implementation of ext2 for windows exists.. i had it once in
> vmware.. but i cant remember the name
>>=20
>> > All this leaves me with the distinct impression that it'd be cheaper to
>> > buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
>> > using reiser4.  Steam and others refuse to install on network drives,
>> > Windows probably will not boot off a network drive, but I imagine that
>> > fixing these would be easier than porting a filesystem.

  Will disk access over LAN really be anything close to as fast as a
  real local harddisk, especially if you have to run over Samba? Oh,
  just noticed you said this in the next paragraph =3D).

  Windows can be run from a network drive. Steam, on the other hand
  prevents network drives for the same reason it has CD checks. It is
  all about preventing users from running copies.
 =20
>>=20
>> Unfortunatelly even with very fast ethernet connections and network
>> appliance with CIFS access, we still don't get the performance of a
>> local filesystem. Plus, you don't want to really give write access=20
>> over network, that slows down anything when you get into hundreds of
>> clients. And we really cannot pay for so many network applicances to
>> make this scalable proposition.
>>=20
>> I wish we could just drop Windows as a platform, but as long as there
>> are customers, there will be need to support them as well... :(

  It is easy to say these things. But really, for lots of applications
  and uses there is only MacOSX that can compete. Linux has yet a far
  way to go when it comes to normal desktop and workstation usage.
  Hardcore and relatively skillful users have no problems with Linux
  as a desktop environment, but the "gray mass" does. KDE and Gnome
  are improving fast though =3D). Anyway, that is another discussion not
  really for this forum.

  ~S
>>=20
>> -Jiri
>>=20
=B4

--=20

