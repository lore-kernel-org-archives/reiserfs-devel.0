From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 12:45:41 -0700
Message-ID: <1142451941.16641.32.camel@localhost>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>
	 <1142336718.7415.55.camel@tribesman.namesys.com>
	 <194f62550603140732j6ef10757j@mail.gmail.com>
	 <4417BEC4.6060506@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9US4Wx5udORpwZYv2RRl"
Return-path: <reiserfs-list-return-28277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4417BEC4.6060506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--=-9US4Wx5udORpwZYv2RRl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-03-14 at 23:14 -0800, Hans Reiser wrote:
[snip]
> They claim that if we don't use the ext3 code
> in our fs then they will be forced to shoulder an extra burden to
> maintain our code.  We are not allowed to specify that they should not
> maintain our code at all.  I need to read more Kafka I think, it is hard
> for me to understand it all.

Err, this actually does make a lot of sense Hans.

The mainline Linux Kernel code is maintained by everyone that can
convince Linus or a sub-maintainer to accept their patch.  In order to
produce an acceptable patch to core kernel code that provides
file-system services, a patch author must also change the file systems
that use it.  He or she cannot just leave the change laying around for
everyone else to fix.  (At least, not usually.)

The only code that doesn't have to be maintained by main-line patch
contributors is out of tree, which is where Reiser4 is now.  Code that
no one is interested in maintaining or can't be maintained gets kicked
out of tree.

Some of your reasons to get it into main-line kernel include: more trust
by end users that your code is stable, avoiding your team having to do
their own fixes for cross-kernel changes, and a wider user base through
ease of use (not having to apply extra kernel patches).

Right?

User trust comes through passing the code reviews, and users knowing
that if the Reiser4 team vaporizes, the code can still be maintained and
the file-system won't disappear.

Avoiding extra work for cross-kernel patches means that other people
have to be able to make changes to your code.

That all means that accepting Reiser4 code into main-line does mean they
have to maintain it.

--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-9US4Wx5udORpwZYv2RRl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEGG7lG8fHaOLTWwgRAl6YAJ46Rh2+FhLKWMnj5/t0YVeFi4ldgACggFsv
bQWoae6AQkutn3sFF87+gxQ=
=zGqk
-----END PGP SIGNATURE-----

--=-9US4Wx5udORpwZYv2RRl--

