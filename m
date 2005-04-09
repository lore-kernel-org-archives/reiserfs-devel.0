From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: Protect/Backup Encrypted FS
Date: Fri, 8 Apr 2005 19:48:33 -0700
Message-ID: <f18a8d9805040819486c96f11c@mail.gmail.com>
References: <200504051448.55893.shakim@bluebottle.com>
	 <200504091156.28552.shakim@bluebottle.com>
	 <42573D9E.1050308@nauticom.net>
Reply-To: Bedros Hanounik <2bedros@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_89_21388658.1113014913816"
Return-path: <reiserfs-list-return-23818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42573D9E.1050308@nauticom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Chester R. Hosey" <chosey@nauticom.net>
Cc: Shannon <shakim@bluebottle.com>, reiserfs-list@namesys.com

------=_Part_89_21388658.1113014913816
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I have a very similar problem;

Assume that I created an ecnrypted partition using reiserfs. I know I can=
=20
access the partition after a regular boot, but what if I used LiveCD?

What data (and where it's stored) I need in order to access that partition=
=20
using knoppix LiveCD for example.=20

I wanted to have an encrypted partition, but my problem is I don't know how=
=20
to findthe encryption keys and save them in a safe place. Just in case the=
=20
system die and I don't have a recent backup.
=20
-Bedros


On Apr 8, 2005 7:27 PM, Chester R. Hosey <chosey@nauticom.net> wrote:
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> What configuration? I'm not really sure what you're asking, which means
> that it's difficult to formulate an answer. People on this list are
> generally very willing to help, but their ability to help is limited by
> how much information you give about what you're looking to do.
>=20
> As far as backing up a partition and restoring that backup, use tar. GNU
> tar (which is almost certainly the default on GNU/Linux systems) is
> quite full-featured and should be able to serve your needs.
>=20
> If you're asking how to inform a GNU/Linux system about partitions you
> want to have mounted, you're probably looking for the /etc/fstab file.
> Try "man fstab" to see the manual page, and examine your current
> /etc/fstab to see what partitions the operating system knows about (with
> respect to filesystem type, where to mount by default, whether to mount
> on boot, etc.).
>=20
> If this hasn't provided you with the information you need to find an
> answer, perhaps you could try a bit more specifically. Describe the
> situation in which you find yourself, and what you hope to be able to
> do. Bonus points are awarded if it's a question specific to ReiserFS, as
> this is the topic of this list.
>=20
>=20
> Shannon wrote:
> | I haven't received a reply to this, so I'm going to be more specific:
> |
> | When you create an encrypted partition, where is this configuration
> stored?
> |
> | On Tue, 5 Apr 2005 02:48 pm, Shannon wrote:
> |
> |>/ 10GB Reiser
> |>/home 40GB Reiser encrypted FS
> |>/swap 300mb
> |>
> |>
> |>As per the harddrive configuration, if my / partition becomes corrupted=
=20
> or
> |>if I choose to install a fresh copy of SuSe9.2 Pro over / and remount
> |>/home, what do need to backup or how do I backup the files needed to
> |>restore the encrypted partition /home
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.0 (MingW32)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>=20
> iD8DBQFCVz2erDBoMHxfhXwRAmJrAJ98d6Ia3pcrMwNn4He610fBWtX/EQCgvFCv
> mbT2w8dPxAi5otfpTWzbBOM=3D
> =3DXq6Q
> -----END PGP SIGNATURE-----
>

------=_Part_89_21388658.1113014913816
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I have a very similar problem;<br>

<br>

Assume that I created an ecnrypted partition using reiserfs. I know I
can access the partition after a regular boot, but what if I used
LiveCD?<br>

<br>

What data (and where it's stored) I need in order to access that partition =
using knoppix LiveCD for example. <br>

<br>

I wanted to have an encrypted partition, but my problem is I don't know
how to findthe encryption keys and save them in a safe place. Just in
case the system die and I don't have a recent backup.<br>
<span class=3D"sg">
<br>
-Bedros<br>
<br>
</span><br><div><span class=3D"gmail_quote">On Apr 8, 2005 7:27 PM, <b clas=
s=3D"gmail_sendername">Chester R. Hosey</b> &lt;<a href=3D"mailto:chosey@na=
uticom.net">chosey@nauticom.net</a>&gt; wrote:</span><blockquote class=3D"g=
mail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt=
 0pt 0pt 0.8ex; padding-left: 1ex;">-----BEGIN PGP SIGNED MESSAGE-----<br>H=
ash: SHA1<br><br>What configuration? I'm not really sure what you're asking=
, which means<br>that it's difficult to formulate an answer. People on this=
 list are<br>generally very willing to help, but their ability to help is l=
imited by<br>how much information you give about what you're looking to do.=
<br><br>As far as backing up a partition and restoring that backup, use tar=
. GNU<br>tar (which is almost certainly the default on GNU/Linux systems) i=
s<br>quite full-featured and should be able to serve your needs.<br><br>If =
you're asking how to inform a GNU/Linux system about partitions you<br>want=
 to have mounted, you're probably looking for the /etc/fstab file.<br>Try &=
quot;man fstab&quot; to see the manual page, and examine your current<br>/e=
tc/fstab to see what partitions the operating system knows about (with<br>r=
espect to filesystem type, where to mount by default, whether to mount<br>o=
n boot, etc.).<br><br>If this hasn't provided you with the information you =
need to find an<br>answer, perhaps you could try a bit more specifically. D=
escribe the<br>situation in which you find yourself, and what you hope to b=
e able to<br>do. Bonus points are awarded if it's a question specific to Re=
iserFS, as<br>this is the topic of this list.<br><br><br>Shannon wrote:<br>=
| I haven't received a reply to this, so I'm going to be more specific:<br>=
|<br>| When you create an encrypted partition, where is this configuration<=
br>stored?<br>|<br>| On Tue, 5 Apr 2005 02:48 pm, Shannon wrote:<br>|<br>|&=
gt;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 10GB&nbsp;&nbsp;&nbsp;&nbsp;Reiser<br>|&gt;/home 40GB&nbsp;&nbsp;&nbsp;&n=
bsp;Reiser encrypted FS<br>|&gt;/swap 300mb<br>|&gt;<br>|&gt;<br>|&gt;As pe=
r the harddrive configuration, if my / partition becomes corrupted or<br>|&=
gt;if I choose to install a fresh copy of SuSe9.2 Pro over / and remount<br=
>|&gt;/home, what do need to backup or how do I backup the files needed to<=
br>|&gt;restore the encrypted partition /home<br><br>-----BEGIN PGP SIGNATU=
RE-----<br>Version: GnuPG v1.4.0 (MingW32)<br>Comment: Using GnuPG with Thu=
nderbird - <a href=3D"http://enigmail.mozdev.org">http://enigmail.mozdev.or=
g</a><br><br>iD8DBQFCVz2erDBoMHxfhXwRAmJrAJ98d6Ia3pcrMwNn4He610fBWtX/EQCgvF=
Cv<br>mbT2w8dPxAi5otfpTWzbBOM=3D<br>=3DXq6Q<br>-----END PGP SIGNATURE-----<=
br></blockquote></div><br>
------=_Part_89_21388658.1113014913816--
