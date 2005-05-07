From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 repackers
Date: Fri, 06 May 2005 23:41:16 -0500
Message-ID: <427C46EC.6080009@slaphack.com>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost> <427ADAA4.8000407@slaphack.com> <20050506035921.GF8179@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050506035921.GF8179@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clausen <clausen@gnu.org>
Cc: Jonathan Briggs <jbriggs@esoft.com>, "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Andrew Clausen wrote:
> On Thu, May 05, 2005 at 09:47:00PM -0500, David Masover wrote:
>
>>>Perhaps it would be a good idea to release at least an offline repacker.
>>
>>To be able to resize.  That is the crucial feature.  Performance isn't
>>quite so huge, although Hans may start squirming when someone benchmarks
>>performance before and after a year of normal use -- but asking users to
>>back up, recreate, and restore -- that's a bit much.
>
>
> Are you familiar with convertfs?
>
> 	http://members.optusnet.com.au/clausen/ideas/convertfs.txt

How easy is it to get the blocklist needed?  It seems like Reiser4's
packing doesn't help here...

Also, suppose I create a brand-new 200 gig Linux setup on Reiser4.
Later, I find I'm using less than half, so I want to give 50 gigs to a
WinXP setup so I can play Half-Life 2.

Or, we could go the other way.  Create a brand-new dual-boot, 100 gigs
each.  Then, my XP becomes irrelevant as Cedega becomes able to play
Half-Life 2.  So I nuke the XP partition, but now I want to be able to
reclaim the space into my one huge monolithic Reiser4 partition.

In both of these situations, convertfs seems workable, but overkill.  I
mean, a proper resizer would leave the FS in a useable state no matter
which way it went or when power was cut.  Convertfs means that if I lose
power at any point during the process, I'm very likely hosed, especially
with something doing lazy writes like Reiser4 as the original FS.  And
this is all assuming it would work at all.

These are not situations where enterprise users would pay thousands of
dollars to be able to do this -- they can afford to do a full
backup/restore, just throw hardware at a problem and make it go away.
These are the scenario where small users like me tend to give up, back
up, reformat, and never touch such an inflexible FS again.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnxG7HgHNmZLgCUhAQIK7g//Zfr32XVok+aoYjmWAGkje6Roxk3MTBwY
6EKx74Wj9e/6844S4CwMwyV1rLayUmIoEnNiCtwBeNchoI4BcEs1Ayca6L/cxSgZ
FNI+0bkF2KrKkqPtWvbFkFCWKAy0UKQcFrzOQ9DGUQU3m2V+E41YZzioEt4pmgV2
M/o0ZQ7N9mc6CIeZ/asXNopiPMYZV8fOLi/6RvuC7yPuBWeCXfNWHohjcYFappkR
JJtpxa++8fSxQi3zVUgtWeeocfw0YI10DkSJLnrdDzO2cesXx8krzmguVOw/Gp2l
v+KaH4hR6Csth2QqJbsjW9SEJ70esB+9NbvQiNwq9zPXZ7TQ8ROdO9RWWhu2lMe6
8mGHmqFVYbjmKvf+hk3c+4bznWag6Mz95tEn+OgL5SiyJx9bRqNWT3qtG7j5e7c8
R/ZCrybxZhvX26R/0HF9eo4+RX6rBvf5+BbqeSW95h3ymDmKPrQmwAXxP3913fE2
v1CfrEK8MSiyagEsbHsLc5Uq30jVD1dAWKJgtIngxQqGiIQR68/cR20VNMP2uA3z
/FAXLWUXPsa2mFRpsNtpHOeOPnC4cM/T8ng9+OR1nYqpIoJA6kJSX7DZoq24HfeD
Of7nJgV2BoJYbUqSS32EgLtSYS+p6BBMreE+JN2UBkNrYzUUvyw6evXP2FxPU3Ck
w0ikYRlu6o4=
=HMV+
-----END PGP SIGNATURE-----
