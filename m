From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes
	too Far))
Date: Sat, 06 Dec 2003 21:06:00 +1100
Message-ID: <1070705160.6925.15.camel@willster>
References: <2342084747-BeMail@cr593174-a>
	 <3FD0912C.1090700@ninja.dynup.net>
	 <16336.37772.88198.217245@laputa.namesys.com>
	 <3FD0AB30.6060305@namesys.com>
	 <16336.45022.572929.274859@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-FvbK1yHOgWXqGEgTm+OW"
Return-path: <reiserfs-list-return-16261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16336.45022.572929.274859@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <jedi@ninja.dynup.net>, reiserfs-list@namesys.com

--=-FvbK1yHOgWXqGEgTm+OW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-12-06 at 03:18, Nikita Danilov wrote:
> http://citeseer.nj.nec.com/jones03garbage.html is a recent bibliography
> in this subject, containing more than 20000 references. I am afraid this
> is little too much for a brief description. But basically, instead of
> reclaiming garbage when "last reference" goes out, collectors typically
> run periodically trying to find unreachable objects. Common way to do so
> is to find -reachable- ones, and then to declare the rest
> unreachable. Also, do avoid scanning the whole heap^Wfile system,

What also may be interesting is the Charging in a Secure Environment
paper,

http://www.csse.monash.edu.au/courseware/cse4333/rdp-material/Bremen-paper.=
pdf

The way it works (as sort-of implemented on Walnut) is that objects are
charged for resources, and when they can no longer pay, they are
deleted.

Periodically you run through all the objects deducting rent, and
removing any objects that can no longer pay for themselves.

To adapt it to a hierarchical filesystem, you could have the root
directory being the thing that generates money, and then gives it to all
the objects in it (which then give it to their sub objects) etc.

just a thought.
--=20
Stewart Smith (stewart@flamingspork.com)
http://www.flamingspork.com/


--=-FvbK1yHOgWXqGEgTm+OW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/0aoHFtJC9tN9SokRAglRAJ484b9hVTSXffcW9J6vD8q4nVeSfACfQPhT
oPOjTv99N8Jbg+hDk9kJHsg=
=7EtV
-----END PGP SIGNATURE-----

--=-FvbK1yHOgWXqGEgTm+OW--

