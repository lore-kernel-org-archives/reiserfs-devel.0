From: Chris Mason <mason@suse.com>
Subject: Re: Quotas aand 2.5.x
Date: 15 Jan 2003 08:48:37 -0500
Message-ID: <1042638517.31095.1333.camel@tiny.suse.com>
References: <20030114182217.4fa8f2f8.philippe.gramoulle@mmania.com>
	 <20030114203842.A18999@namesys.com> <3E2451B0.1020905@namesys.com>
	 <20030115104306.51404b4c.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030115104306.51404b4c.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: Hans Reiser <reiser@namesys.com>, green@namesys.com, reiserfs-list@namesys.com

On Wed, 2003-01-15 at 04:43, Philippe Gramoull=E9 wrote:
> Hi Hans,
>=20
> On Tue, 14 Jan 2003 21:06:40 +0300
> Hans Reiser <reiser@namesys.com> wrote:
>=20
>   |  Philippe, am I right in guessing that you don't need it urgently?  I=
f=20
>   |   so, I will let Chris do it, and it might take just a bit longer.
>=20
> Actually, right now, we still have that nasty bug every time we run quota=
check that prenvent us from enabling them on several filerservers which is =
a big problem right now (that's on 2.4.x)
>=20

Could you please list the revisions and patches you have testing the
overflow fix?

> As i thought that now most of efforts are put into 2.5.x, i might be able=
 to take advantage of all the new functionnalities but what i do need is Re=
iserfs + NFS + quota.
>=20
> On the NFS part , there have been so many enhancements in 2.5.x (and on o=
ther parts as well) that i'm really eager to give it a try.
>=20

2.5.x has many enhancements and many bugs.  I strongly recommend against
using it for any type of production work, since the development path
isn't stable.  By this I mean bug fixes might be mixed with other large
changes that break things.

> Could Chris tell me then how much time does he think it will take to have=
 quota in 2.5.x.
>=20

Honestly I'm not sure.  I'm trying for a minimal data logging port to
get the journaling improvements in, even the -o data=3Djournal isn't
immediately supported.

-chris


