From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not
	directory or indirect item
Date: Mon, 31 Jul 2006 23:02:10 +0400
Message-ID: <1154372530.6460.101.camel@tribesman.namesys.com>
References: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
	 <p737j1v3sum.fsf@verdi.suse.de>
	 <9a8748490607301039k1057da87i237ee42e83f8ef4b@mail.gmail.com>
	 <20060730203726.E5F7E16D7@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060730203726.E5F7E16D7@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jesper Juhl <jesper.juhl@gmail.com>, Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe@gramoulle.com>
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2006-07-30 at 22:37 +0200, Philippe Gramoull=C3=A9 wrote:
> Hello Jesper,
>=20
> On Sun, 30 Jul 2006 19:39:07 +0200
> "Jesper Juhl" <jesper.juhl@gmail.com> wrote:
>=20
>   | they don't seem to have caused any trouble/corruption here, so if you
>   | haven't experienced any problems either I think I'll relax and just
>   | wait for an explanation from some reiserfs folks.
>   |=20
>   | Thank you for replying - nice to know that I'm not the only one seeing
>   | this and that it's not something that has caused massive troubles for
>   | someone else.
>=20
> I reported such a message back in May 2004 ( kernel 2.6.6-rc3 ), to which=
=20
> Vladimir replied :
>=20
> On Thu, 06 May 2004 14:43:22 +0400
> Vladimir Saveliev <vs@namesys.com> wrote:
>=20
>   | I guess that warning became obsolete when Oleg <green@clusterfs.com>
>   | added possibility to insert long indirect items.
>=20
> Then Hans asked for that warning to be removed, and i guess it must have =
slipped through
> the TODO list :)
>=20

Instead of removing that warning we changed it to not complain about
inserted long indirect items.

Maybe the warning can be removed completely. The warning was not
supposed to ever come up. As long as it does - there is a balancing case
which we did not imagine.
If anybody can easly reproduce this problem - please let me know.

> Thanks,
>=20
> Philippe
>=20

