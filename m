From: Chris Mason <mason@suse.com>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Tue, 20 Jan 2004 20:50:39 -0500
Message-ID: <1074649838.3378.3.camel@tiny.suse.com>
References: <1074530725.29546.178.camel@tiny.suse.com>
	 <200401192353.03670.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401192353.03670.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, green@linuxhacker.ru, Gerd Knorr <kraxel@suse.de>, Jeff Mahoney <jeffm@suse.com>

On Mon, 2004-01-19 at 17:53, Dieter N=FCtzel wrote:

> 05 and 06 needed some handwork 'cause the SuSE kernel inclues xattrs and =
posix=20
> acl's but nothing special.
>=20

Good to hear.  I wasn't expecting the suse merge to be difficult,
luckily it doesn't have many patches in it yet.  Jeff and I will look at
getting them into the suse kernel once data=3Djournal is done as well.

> An EXPORT was missing in linux/fs/buffer.c to compile ReiserFS 3.x.x as m=
odul=20
> (inode.c, unresolved symbol):
>=20

Thanks, I'll add it into the patch when I get back from linux world.

-chris


