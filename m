From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 16:53:02 -0700
Message-ID: <1153525982.6659.108.camel@ipso.snappymail.ca>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>
	 <44C093D2.1040703@namesys.com>
	 <1153514509.6659.41.camel@ipso.snappymail.ca>
	 <44C141C4.1030802@slaphack.com>
	 <1153517853.6659.56.camel@ipso.snappymail.ca>
	 <44C157D2.5060202@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-S5jQa71H5j149Vy+eTSn"
Return-path: <reiserfs-list-return-29121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C157D2.5060202@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

--=-S5jQa71H5j149Vy+eTSn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Your detailed explanation is appreciated David and while I'm far from a
file system expert, I believe you've overstated the negative effects
somewhat.

It sounds to me like you've gotten Reiser4's allocation process in
regards to wandering logs correct, from what I've read anyways, but I
think you've overstated its fragmentation disadvantage when compared
against other file systems.

I think the thing we need to keep in mind here is that fragmentation
isn't always a net loss. Depending on the workload, fragmentation (or at
least not tightly packing data) could actually be a gain. In cases where
you have files (like log files or database files) that constantly grow
over a long period of time, packing them tightly at regularly scheduled
intervals (or at all?) could cause more harm then good.=20

Consider this scenario of two MySQL tables having rows inserted to each
one simultaneously, and lets also assume that the two tables were
tightly packed before we started the insert process.

1 =3D Data for Table1
2 =3D Data for Table2=20

Tightly packed:

111111111111222222222222----------------------------

Simultaneous inserts start:

1111111111112222222222221122112211221122------------

I believe this is actually what is happening to me with ReiserV3 on my
MythTV box. I have two recordings running at the same time, each writing
data at about 500kb/s and once the drive has less then 10% free the
whole machine grinds to a screeching halt while it attempts to find free
space. The entire 280GB drive is full of files fragmented like this.
=20
Allocate on flush alone would probably help this scenario immensely.=20

The other thing you need to keep in mind is that database files are like
their own little mini-file system. They have their own fragmentation
issues to deal with (especially PostgreSQL). So in cases like you
described where you are overwriting data in the middle of a file,
Reiser4 may be poor at doing this specific operation compared to other
file systems, but just because you overwrite a row that appears to be in
the middle of a table doesn't mean that the data itself is actually in
the middle of the table. If your original row is 1K, and you try to
overwrite it with 4K of data, it most likely will be put at the end of
the file anyways, and the original 1K of data will be marked for
overwriting later on. Isn't this what myisampack is for?

So while I think what you described is ultimately correct, I believe
extreme negative effects from it to be a corner case, and probably not
representative of the norm. I also believe that other Reiser4
improvements would outweigh this draw back to wandering logs, again in
average workloads.=20

So the original point that I was trying to make comes back to the fact
that I don't believe Reiser4 _needs_ a repacker to maintain decent
performance. The fact that it will have a repacker just makes it that
much better for people who might need it. If Hans didn't think he could
make money off it, it probably wouldn't be so high on his priority list?
We can't fault him for that though.

Like you mentioned, if Reiser4 performance gets so poor without the
repacker, and Hans decides to charge for it, I think that will turn away
a lot potential users as they could feel that this is a type of
extortion. Get them hooked on something that only performs well for a
certain amount of time, then charge them money to keep it up. I also
think the community would write their own repacker pretty quick in
response.=20

A much better approach in my opinion would be to have Reiser4 perform
well in the majority of cases without the repacker, and sell the
repacker to people who need that extra bit of performance. If I'm not
mistaken this is actually Hans intent. If Reiser4 does turn out to
perform much worse over time, I would expect Hans would consider it a
bug or design flaw and try to correct the problem however possible.=20

But I guess only time will tell if this is true or not. ;)

On Fri, 2006-07-21 at 17:40 -0500, David Masover wrote:
> Maybe not XFS, but in any case, Reiser4 fragments more because of how=20
> its journaling works.  It's the wandering logs.
>=20
> Basically, when most Linux filesystems allocate space, they do try to=20
> allocate it contiguously, and it generally stays in the same place.=20
> With ext3, if you write to the middle of a file, or overwrite the entire=20
> file, you're generally going to see your writes be written once to the=20
> journal, and then again to the same place the file originally was.
>=20
> Similarly, if you delete and then create a bunch of small files, you're=20
> generally going to see the new files created in the same place the old=20
> files were.
>=20
> With Reiser4, wandering logs means that rather than write to the=20
> journal, if you write to the middle of the file, it writes that chunk to=20
> somewhere else on the disk, and somehow gets it down to one atomic=20
> operation where it simply changes the file to point to the new location=20
> on disk.  Which means if you have a filesystem that is physically laid=20
> out on disk like this (for simplicity, assume it only has a single file):
>=20
> # is data
> * is also data
> - is free space
>=20
> ######*****########--------------
>=20
> When you try to write in the middle (the '*' chars) -- let's say we're=20
> changing them to '%' chars, this happens:
>=20
> ######*****########%%%%%---------
>=20
> Once that's done, the file is updated so that the middle of it points to=20
> the fragment in the new location, and the old location is freed:
>=20
> ######-----########%%%%%---------
>=20
> Keep in mind, because of lazy writes, it's much more likely for the=20
> whole change to happen at once.  Here's another example:
>=20
> #####------------
>=20
> Let's say we just want to overwrite the file with another one of the=20
> same length:
>=20
> #####%%%%%-------
>=20
> then, commit the transaction:
>=20
> -----%%%%%-------
>=20
> You see the problem?  You've now split the free space in half.=20
> Realistically, of course, it wouldn't be by halves, but you're basically=20
> inserting random air holes all over the place, and your FS is becoming=20
> more like foam, taking up more of the free space, until you can no=20
> longer use the free space....  In the above example, if we then have to=20
> come write some huge file, it looks like this:
>=20
> *****%%%%%*******
>=20
> Split right in half.  Now imagine this effect multiplied by hundreds or=20
> thousands of files, over time...
>=20
> This is why Reiser4 needs a repacker.  While it's fine for larger files=20
> -- I believe after a certain point, it will write twice, so looking at=20
> our first example:
>=20
>=20
> ######*****########--------------
>=20
> Write to a new, temporary place:
>=20
> ######*****########%%%%%---------
>=20
> Write back to the original place:
>=20
> ######%%%%%########%%%%%---------
>=20
> Complete the transaction and free the temporary space:
>=20
> ######%%%%%########--------------
>=20
>=20
> This technique is what other journaling filesystems use, and it also=20
> means that writing is literally twice as slow as on a non-journaling=20
> filesystem, or on one with wandering logs like Reiser4.  But, it's a=20
> practical necessity when you're dealing with some 300 gig MySQL database=20
> of which only small 10k chunks are changing.  Taking twice as long on a=20
> 10k chunk won't kill anyone, but fragmenting your 300 gig database (on a=20
> 320 gig partition) will kill your performance, and will be very=20
> difficult to defragment.
>=20
> But on smaller files, it would be very beneficial if we could allow the=20
> FS to slowly fragment (to foam-ify, if you will) and defrag once a week.=20
>   The amount of speed gained in each write -- and read, if it's not=20
> getting too awful during that week -- definitely makes up for having to=20
> spend an hour or so defragmenting, especially if the FS can be online at=20
> the time.
>=20
> And you can probably figure out an optimal time to wait before=20
> defragmenting, since your biggest fragmentation problems happen when the=20
> chunk of contiguous space at the end of the disk disappears, and all of=20
> your free space is scattered (fragmented) throughout the disk.
>=20
> Anyway, that's why.  If you disable the wandering log behavior, your=20
> write performance drops in half.  If you don't have a repacker, your FS=20
> becomes very fragmented, very fast.
>=20
> I apologize for my poor ASCII art, especially if I'm dead wrong...
>=20
>=20
> > No Linux file system that I'm aware of has a defragmentor, but they DO
> > become fragmented, just not near as bad as FAT32 used to when MS create=
d
> > their defragmentor. The highest "non-contiguous" percent I've seen with
> > EXT3 is about 12%, FAT32 I have seen over 50%, and NTFS over 30%. In
>=20
> I'd like to see some numbers on Reiser4, then.  Maybe a formal=20
> fragmentation benchmark?
--=20
Mike Benoit <ipso@snappymail.ca>

--=-S5jQa71H5j149Vy+eTSn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEwWjeMhKjsejwBhgRArP9AJ9ftRsLwRw+lY5vpT4rum0uH8IvXACdHCWt
QujEx7xsP6Xb193PhxwEPQE=
=jdw4
-----END PGP SIGNATURE-----

--=-S5jQa71H5j149Vy+eTSn--

