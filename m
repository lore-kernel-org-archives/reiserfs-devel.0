From: Tierra <etierra@gmail.com>
Subject: Re: Reiser4-ReiserFS recovery story
Date: Wed, 28 Jul 2004 12:27:19 -0600
Message-ID: <c7ef32a704072811279c7e88c@mail.gmail.com>
References: <200407281633.06373.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407281633.06373.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS <reiserfs-list@namesys.com>

Awesome tip, thanks a ton for posting it, I'm sure it'll come in handy late=
r.

Bryan

On Wed, 28 Jul 2004 16:33:06 +0200, Marcel Hilzinger
<marcel@hilzinger.hu> wrote:
> Did you know, that you can recover a ReiserFS partition, which you format=
ted
> with reiser4?
>=20
> Yesterday I formatted a ReiserFS partition with Reiser4. It was by mistak=
e, as
> I did not modify the partition in my slow.c bash-script. Nevertheless I
> learned from what I knew about Reiser4:
>=20
> "If Reiser4 writes during formatting only the really needed informations"=
 I
> thought, "then data must still be there..."
>=20
> So I run reiserfsck --rebuild-sb on the partition. I told the program, th=
at
> the partition is Reiser V 3.6 and it worked. Now I tried reiserfsck --che=
ck.
> As this one failed I had to run reiserfsck --rebuild-tree to be able to m=
ount
> the partition. Now I can mount the partition and all the data is still th=
ere.
>=20
> Nice feature :-) perhaps it can help someody else, too.
>=20
> Marcel
> --
> =DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
> Marcel Hilzinger
>
