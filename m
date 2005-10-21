From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfstune: block allocator is not defined
Date: Fri, 21 Oct 2005 12:44:11 +0400
Message-ID: <4358AA5B.7000803@namesys.com>
References: <43583531.3040105@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43583531.3040105@muenning.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Cc: reiserfs-list@namesys.com

Hello

Konstantin M=FCnning wrote:
> Hi!
>=20
> Just tried to add some badblocks like this:
>=20
> reiserfstune -b /tmp/badblocklist /dev/hda5
>=20
> and I get the error:
>=20
>=20
> block allocator is not defined
>=20
> Aborted
>=20
>=20
> The same when I try it with -B. As this message means nothing to me, has
> somebody any idea what the problem might be? The man pages and
> interestingly a web search gave me nothing about it. Or is reiserfstune
> not to be used for adding bad blocks to the fs?

reiserfstune is supposed to be use for that. You encountered reiserfstune b=
ug.
We are working on a fix.

