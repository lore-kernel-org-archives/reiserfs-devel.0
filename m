From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: reiser4 status (correction)
Date: Sat, 22 Jul 2006 01:55:56 -0700
Message-ID: <1153558557.6659.152.camel@ipso.snappymail.ca>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>
	 <44C093D2.1040703@namesys.com>
	 <1153514509.6659.41.camel@ipso.snappymail.ca>
	 <44C141C4.1030802@slaphack.com>
	 <1153517853.6659.56.camel@ipso.snappymail.ca>
	 <44C157D2.5060202@slaphack.com>
	 <1153525982.6659.108.camel@ipso.snappymail.ca>
	 <44C191FD.4010302@slaphack.com>  <44C1BD65.8070204@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-dZT+qD5bPJIri+r1zY9B"
Return-path: <reiserfs-list-return-29130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C1BD65.8070204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

--=-dZT+qD5bPJIri+r1zY9B
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-07-21 at 23:53 -0600, Hans Reiser wrote:
> We have 3 levels of optimization: 1) at each modification, 2) at each
> flush, and 3) at each repack.  Each of these operates on a different
> time scale, and all 3 are worthy of doing as right as we can.
>=20
> Now, the issue of where should airholes be?  Why, that is the grand
> experiment that will start to happen in a few months.  Nobody knows yet
> what defaults we should have, and whatever we choose, there will be some
> users who gain from explicit control of it.
>=20

Wouldn't the most recently modified files give a good hint to the
repacker? The files larger then a few kilobytes most recently modified
would be packed with air holes, and the files least recently modified
would be packed more tightly? Perhaps even files that are currently the
most fragmented would be repacked with air holes, as compared to files
least fragmented would be packed more tightly.

Could you not also write a small little app that gathers all kinds of
stats about a file system and sends it to a Namesys server in hopes of
finding better statistical data? I'm sure there are thousands of users
that would be willing to run this app for the "greater good" regardless
or not if they used ReiserFS in the first place. Things like the number
of files on the disk, what percentage of those files have been modified
in the last week, which files are the most/least fragmented, and when
they were last modified, etc...?

> >
> >> A much better approach in my opinion would be to have Reiser4 perform
> >> well in the majority of cases without the repacker, and sell the
> >> repacker to peopleisn' something  who need that extra bit of performan=
ce. If I'm not
> >> mistaken this is actually Hans intent.
> >
> >
> > Hans?
>=20
> Yes, that's the idea.  Only sysadmins of large corps are likely to buy.=20
> We throw in service and support as well for those who purchase it.
>=20
> If I was making money, I would not do this, but I am not.  I am not
> really willing to work a day job for the rest of my life supporting guys
> in Russia, it is only ok to do as a temporary measure.  I am getting
> tired....
>=20

Personally, as much as I would like it all to be free, I think I would
be much more willing to pay for compression/encryption (on both servers
and desktops) then I would be for a repacker. Hard disks cost money, and
if I can compress the vast majority of my data and save on purchasing a
new hard disk, that is well worth it. I also have some important data
that I would really like to encrypt, which is also worth spending money
on. But gaining ~10% in performance probably isn't worthwhile spending
money on as I most likely wouldn't notice a difference in my day to day
life, unless my server was incredibly busy.=20

There is no doubt there is a market for a repacker, but I think people
are much more likely to spend money on something that is immediately
tangible, like disk space instantly being free'd up by compression, or
data instantly being encrypted. As compared to something that is much
less tangible like fragmentation percentages and minor I/O throughput
improvements. I used to work at a large, world wide web hosting company
and I could see making a case to management for purchasing Reiser4
compression would be pretty easy for our shared servers. Instantly
freeing up large amounts of disk space (where .html/.php files were the
vast majority) would save huge amounts of money on disk drives,
especially since most of the servers used RAID1 and adding new drives
was a huge pain in the neck. Making a case to purchase a repacker would
be much, much more difficult.

See, customers who used lots of CPU were easy to up-sell to a dedicated
server because page load times were tangible and if they didn't move we
would be forced to shut them off. However customers who used gobs of
disk space were much more difficult to up-sell to dedicated servers
because it didn't affect themselves or other customers in a tangible
way. They wouldn't notice any difference by moving to a much more
expensive dedicated server.

I would like to see Namesys succeed and become incredibly profitable for
Hans, if nothing else for the fact that he has given a huge amount to
the open source community already. A profitable Namesys only means we'll
have a greater chance of seeing even more interesting stuff from them in
the future.=20

--=20
Mike Benoit <ipso@snappymail.ca>

--=-dZT+qD5bPJIri+r1zY9B
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEwegcMhKjsejwBhgRAj3uAJ4sypOZOvrCxSNqcI/ov3+ABE4f0wCggG89
iJhQ0fi+kMzecjp2UvyQQLc=
=viKO
-----END PGP SIGNATURE-----

--=-dZT+qD5bPJIri+r1zY9B--

