From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Wed, 29 Mar 2006 00:49:44 +0200
Message-ID: <20060328224945.0A258134@philou.gramoulle.local>
References: <44206D3C.7050504@free.fr>
	<4420FFA2.1090908@namesys.com>
	<44219CC2.3060405@free.fr>
	<44219FA8.2050606@namesys.com>
	<44299A35.50800@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44299A35.50800@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hello Laurent,

On Tue, 28 Mar 2006 22:19:01 +0200
Laurent Riffard <laurent.riffard@free.fr> wrote:

  | These FS are quite similars. Now guess what ? I filled these FS with
  |  dd.
  |=20
  | Original FS
  | =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  | # sync
  | # time dd if=3D/dev/zero of=3Dtoto bs=3D1M count=3D150
  | 103+0 enregistrements lus.
  | 102+0 enregistrements =E9crits.
  | Command exited with non-zero status 1

Well, at least on my system , such a command exits with a 0 status

Also, not a single of your posts in this thread has this error except this =
one
and the one below

  | 0.00user 2.94system 3:32.18elapsed 1%CPU (0avgtext+0avgdata
  | 0maxresident)k
  | # time sync
  | 0inputs+0outputs (0major+279minor)pagefaults 0swaps
  | 0.00user 0.01system 0:00.18elapsed 6%CPU (0avgtext+0avgdata
  | 0maxresident)k
  | 0inputs+0outputs (0major+191minor)pagefaults 0swaps
  |=20
  | Copy FS
  | =3D=3D=3D=3D=3D=3D=3D
  | # sync
  | # time dd if=3D/dev/zero of=3Dtoto bs=3D1M count=3D150
  | dd: =E9criture de `toto': Aucun espace disponible sur le p=E9riph=E9riq=
ue
  | 132+0 enregistrements lus.
  | 131+0 enregistrements =E9crits.
  | Command exited with non-zero status 1

Here, i can understand the "exited with non-zero status 1" as
"Aucun espace disponible sur le p=E9riph=E9rique" is french for=20
"No space left on device"

  | 0.00user 4.08system 0:15.95elapsed 25%CPU (0avgtext+0avgdata
  | 0maxresident)k
  | 0inputs+0outputs (1major+279minor)pagefaults 0swaps
  | # time sync
  | 0.00user 0.00system 0:00.17elapsed 0%CPU (0avgtext+0avgdata
  | 0maxresident)k
  | 0inputs+0outputs (0major+190minor)pagefaults 0swaps
  | disk$
  |=20
  | See ? 3'30" versus 16".

Are the 16" due to the fact that the above command exited earlier than it s=
hould have ?

Thanks,

Philippe
