From: studdugie <studdugie@gmail.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Thu, 7 Jul 2005 13:59:35 -0400
Message-ID: <5a59ce530507071059731b30cc@mail.gmail.com>
References: <42CC4B7F.2070506@suse.com> <42CC5F1E.6060505@namesys.com>
	 <42CD528B.9040502@suse.com>
Reply-To: studdugie <studdugie@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CD528B.9040502@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

I agree w/ Jeff 100%. I'm not a kernel hacker, simply a user. As a
matter of fact, I was one of those people that Jeff aluded to when he
said: "There have been reports of large filesystems taking an
unacceptably long time to mount."
On 7/7/05, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hans Reiser wrote:
> > Jeff, are you sure that you need this code to exist?  Here are the
> > problems I see:
> >
> >     for the average case, it is suboptimal.  The seeks to the bitmaps
> > are far more expensive than the averaged cost of keeping them in ram.
> >
> >     for 16TB filesystems, they will have plenty of budget for ram
> >
> >     it complicates code if it has to worry about such things as not
> > enough clean memory for holding bitmaps, etc.
> >
> >     It is more appropriate to write this kind of code for the
> > development branch which is V4.  This kind of code is likely to have
> > hard to test and hit bugs.
> >
> >     The mount time problem should be solved by querying the device
> > geometry, and inserting into the queue requests for every disk drive in
> > parallel.  The current code fails to keep all the spindles busy.  It
> > would be nice if there was general purpose code for querying about how =
a
> > device divides into spindles so that scheduling in general can be optim=
ized.
> >
> >     This should be a nondefault mount option.
> >
> > That said, thanks for paying attention to a problem Namesys discussed
> > but lacked the manpower for addressing.  Do you think you could discuss
> > your plans before coding next time?  I agree that ReiserFS V3 and V4
> > mount time is too long.  15 minutes is clearly not acceptable.  Perhaps
> > there is a deeper IO scheduler problem beyond bitmaps that should be
> > addressed though.....
> >
>=20
> Hans -
>=20
> There are two issues here: The amount of time required to read in the
> bitmap blocks at mount time, and the resources that are wasted due to
> maintaining unused bitmap data in memory. Your arguments are reasonable,
> but the user response to each of them is the same: They will simply
> choose another filesystem to deploy rather than deal with the caveats of
> ReiserFS.
>=20
> I agree that there may be opportunities to optimize the I/O scheduler,
> but even if we ignored the blockdev<->filesystem layering violations,
> and had perfect knowledge of the storage subsystem, there is still
> latency associated with reading the data in. There may be any number of
> abstractions between the block device presented to the filesystem and
> the actual spindles (md, dm, loop, or hardware raid) and the block dev
> subsystem is best equipped to handle that. The goal is not to make mount
> times quicker than they are now, but to make them negligible. Suppose
> for the sake of argument that somehow the I/O scheduler could be
> leveraged to reduce the mount time by 90%. This is an incredibly
> optimistic number and still it only reduces the 15 minute mount time to
> 90 seconds. That's 90 seconds *every* boot that the system becomes
> unavailable. That 90 second addition adds up, and will be the difference
> between a site deploying reiserfs and choosing another solution that
> doesn't have that caveat.
>=20
> That said, the resource savings benefit is largely secondary, but may be
> quite important for many users including those deploying embedded
> devices. We are not in the position to be making hardware purchasing
> guidelines for our users. It's not reasonable to expect more than the
> disk space required to store the filesystem itself. "Huge" filesystems
> that were once reserved for large servers can now be found on the
> desktop. For a few hundred dollars in hardware, I can construct a
> multi-terabyte array under my desk. A typical usage for something like
> this would be to store music, movies, or say an A/V editing suite. On a
> system with 512MB of RAM, the 32 MB allocation for ONLY bitmaps is a
> huge resource hit. On embedded systems that are tight on RAM, where they
> are using alternate C libraries to shave off a few KiB of memory use,
> pinning bitmaps is a total waste of resources. Telling the user "go buy
> more memory" is not an acceptable solution. Again, this will only mean
> another user chooses a different solution than reiserfs.
>=20
> ReiserFS v3 has an established track record as a stable filesystem. V4
> may be an excellent successor, but many users simply aren't interested.
> They want particular features now and aren't willing to be guinea pigs
> for V4 in order to get them. We've seen this time and again with feature
> additions. Denying user demands with the mantra of "wait for it in V4"
> has left many users frustrated, and they will once again choose
> something else rather than deal without features they can have on other
> filesystems.
>=20
> The performance difference, I suspect, will be negligible. If the
> bitmaps are really in heavy use (which is only the case for a limited
> set of workloads) then the buffer cache will keep those around anyway.
> If the memory is needed elsewhere, the system has the "big picture" view
> and should be able to make those decisions. Having to swap out user code
> or data vs. keeping ReiserFS bitmaps in memory is going to have a
> performance impact either way, and I suspect the former will be the
> worse case. Regarding the unavailability of memory for bitmaps, we must
> already sleep in order to get the buffer heads for parts of the tree
> that aren't pinned in memory. This case isn't any different. We also
> already sleep waiting for bitmap blocks to become unlocked.
>=20
> As for it being the default case or not, I've only posted this code for
> testing purposes. Eventually, I think it should be the default case.
> We've seen what happens when useful features get buried under a mount
> time option (-oattrs, anyone?) - they get ignored. I think that once
> this code has seen active testing, -opin_bitmaps should become an option
> and reading them on-demand should become the default.
>=20
> - -Jeff
>=20
> - --
> Jeff Mahoney
> SuSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.0 (GNU/Linux)
>=20
> iD8DBQFCzVKKLPWxlyuTD7IRAm8AAJ9i8D5VTak/puOg0yLuUtmKxvWcZQCePGZu
> /UR00EcaRwM2t3qZ0D9vuF4=3D
> =3D7/vu
> -----END PGP SIGNATURE-----
>
