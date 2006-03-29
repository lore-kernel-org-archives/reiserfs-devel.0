From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Wed, 29 Mar 2006 08:16:55 +0200
Message-ID: <442A2657.1090408@free.fr>
References: <44206D3C.7050504@free.fr>	<4420FFA2.1090908@namesys.com>	<44219CC2.3060405@free.fr>	<44219FA8.2050606@namesys.com>	<44299A35.50800@free.fr> <20060328224945.0A258134@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060328224945.0A258134@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Philippe_Gramoull=E9?= <philippe@gramoulle.com>, reiserfs-list@namesys.com

Le 29.03.2006 00:49, Philippe Gramoull=E9 a =E9crit :
> Hello Laurent,
>=20
> On Tue, 28 Mar 2006 22:19:01 +0200
> Laurent Riffard <laurent.riffard@free.fr> wrote:
>=20
>   | These FS are quite similars. Now guess what ? I filled these FS with
>   |  dd.
>   |=20
>   | Original FS
>   | =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   | # sync
>   | # time dd if=3D/dev/zero of=3Dtoto bs=3D1M count=3D150
>   | 103+0 enregistrements lus.
>   | 102+0 enregistrements =E9crits.
>   | Command exited with non-zero status 1
>=20
> Well, at least on my system , such a command exits with a 0 status

Oops ! I trimmed a line when I cut'n'paste. dd exits with the
message "Aucun espace disponible sur le p=E9riph=E9rique" which means
"No space left on device".

> Also, not a single of your posts in this thread has this error except thi=
s one
> and the one below

Yes I somewhat changed my test. On the previous test, I dd'd 100M to
the FS.

As the original FS and its copy have different free space, writing
100M on each FS results in 3M free versus 30M free. I did this test
and I it takes about 2'20" versus 15". But I feared that one objects
"It's  because you have less free space on the first FS".

So I found more conclusive to write 150M and thus to fill up the 2 FS.

>   | 0.00user 2.94system 3:32.18elapsed 1%CPU (0avgtext+0avgdata
>   | 0maxresident)k
>   | # time sync
>   | 0inputs+0outputs (0major+279minor)pagefaults 0swaps
>   | 0.00user 0.01system 0:00.18elapsed 6%CPU (0avgtext+0avgdata
>   | 0maxresident)k
>   | 0inputs+0outputs (0major+191minor)pagefaults 0swaps
>   |=20
>   | Copy FS
>   | =3D=3D=3D=3D=3D=3D=3D
>   | # sync
>   | # time dd if=3D/dev/zero of=3Dtoto bs=3D1M count=3D150
>   | dd: =E9criture de `toto': Aucun espace disponible sur le p=E9riph=E9r=
ique
>   | 132+0 enregistrements lus.
>   | 131+0 enregistrements =E9crits.
>   | Command exited with non-zero status 1
>=20
> Here, i can understand the "exited with non-zero status 1" as
> "Aucun espace disponible sur le p=E9riph=E9rique" is french for=20
> "No space left on device"

yes, see above.

>   | 0.00user 4.08system 0:15.95elapsed 25%CPU (0avgtext+0avgdata
>   | 0maxresident)k
>   | 0inputs+0outputs (1major+279minor)pagefaults 0swaps
>   | # time sync
>   | 0.00user 0.00system 0:00.17elapsed 0%CPU (0avgtext+0avgdata
>   | 0maxresident)k
>   | 0inputs+0outputs (0major+190minor)pagefaults 0swaps
>   | disk$
>   |=20
>   | See ? 3'30" versus 16".
>=20
> Are the 16" due to the fact that the above command exited earlier than it=
 should have ?

No, (see above), both FS were filled up to 0M free space.

> Thanks,
>=20
> Philippe
>=20

Thanks for your comments. I hope this made it clear.

To be fair, you can see there is some differences between the 2 FS :
- the copy is larger than the original one : 995998 bytes vs
1003520, which is 0.75% larger.
- the original FS resides on an extended partition (/dev/hda8) while
the copy is on a logical volume (/dev/vglinux1/test). This LV is
hosted on /dev/hda4.

I hope these differences do not have a high impact on the results.
I'll try to dd of=3D/dev/hda8 if=3D/dev/vglinux1/test, and see if it
makes some differences when I dd a 100M file on the FS.
~~
laurent
