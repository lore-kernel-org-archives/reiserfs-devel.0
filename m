From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Fri, 06 Aug 2004 21:39:15 +0400
Message-ID: <4113C243.30105@namesys.com>
References: <20040806065705.E5A6515C76@mail03.powweb.com>	<4113A91E.3000500@namesys.com> <20040806191045.37527e99@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040806191045.37527e99@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?ISO-8859-1?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

Hello

Philippe Gramoull=E9 wrote:
> Hello,
>=20
> I've run David's version of Mongo and hit the following error during th=
e PHASE MODIFY sequence.
>=20
> reiser4[mongo_modify(4127)]: commit_current_atom (fs/reiser4/txnmgr.c:1=
206)[nikita-3176]:
> WARNING: Flushing like mad: 16384
>=20
This is harmless message

> All 3 mongo_modify processes are stuck in D+
>=20

So, it did not complete?
It is working yet here

> Running a fsck --check now.
>=20
> Thanks,
>=20
> Philippe
>=20
> On Fri, 06 Aug 2004 19:51:58 +0400
> "Vladimir V. Saveliev" <vs@namesys.com> wrote:
>=20
>   | > Should someone from Namesys downloads the bzip tar I mentioned be=
fore here's
>   | > a summary of the changes in my version of mongo:
>   | >=20
>   |=20
>   | Yes, i am running your version of mongo.
>=20
>=20


