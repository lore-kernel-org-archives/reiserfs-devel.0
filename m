From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4+Flash: first considerations
Date: Thu, 26 May 2005 17:00:20 -0500
Message-ID: <429646F4.6040007@slaphack.com>
References: <4295F4B3.4050307@oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4295F4B3.4050307@oktetlabs.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Artem B. Bityuckiy" <dedekind@oktetlabs.ru>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Artem B. Bityuckiy wrote:
> Hello,
> 
> Here I list several issues which are relevant to Flash but may be not
> envisioned by Reiser4.
> 
> 1. Bad Blocks. NAND flashes are shipped with bad blocks randomly
> scattered over flash. Also new bad blocks may appear dynamically. Flash
> file system should handle this. Does Reiser4 take care about bad blocks
> (e.g., it should never access them) or it expects the underlying device
> hides bad blocks doing the required remapping transparently?

I think it expects the underlying device to hide them, and I think this
is by design.  I think this is because of the fact that so many
ReiserFS3 "bugs" were actually bad hardware, and so the Namesys team
would rather code with the assumption that hardware is good, on the
principle that dealing with bad hardware does belong to lower layers.

If that is the case, I think that Reiser4 should support bad blocks
internally.  A BBR scheme, hardware or software, still requires a fixed
amount of space be set aside.  If the space is not filled up, then we're
wasting space, but if it is filled up, then we can't deal with any more
bad blocks.  Filesystem-level support means that we can simply mark all
bad blocks as allocated, so that we only reserve exactly as much space
as we need to deal with the bad blocks.  Furthermore, the "remapping"
only has to happen once, as opposed to having the dm-bbr module
constantly relocate stuff.

> 2. The tree position. Is the Reiser4 tree is expected to physically
> reside in some fixed HDD area? Or its nodes my be placed anywhere?

No clue on that.  I'm pretty sure that at least some metadata moves, but
I have no idea how much.

> Since Flash blocks (NAND pages) may be written only once, any change of
> the tree node means that the node will be moved to another block, not at
> the same block where it was before the change. This also means that all
> nodes which refer this block (the whole path up to the root) must be
> changed as well.
> 
> 3. Garbage Collector (GC) thread. Are there ways to add one more thread
> to Reiser4?

AFAIK, garbage collection is still done with a refcounting system, which
doesn't need a separate thread.  No idea how threads work, other than
that they are there (I see them in 'top').

> I've started exploring the source code. Due to the large number of
> optimizations it is difficult to read it. It probably will take month(s)
> to become well aware of Reiser4. So please, if it is possible, comment
> on the above 3 points. Some *general/conceptual* info is welcome. The
> referrals to the corresponding source code peaces too.

My knowledge of the Reiser4 source is EXTREMELY limited right now, but I
do try to understand the conceptual stuff.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpZG9HgHNmZLgCUhAQIuag/+JcaJaT5EBLSzlmaC6wzjWGum8mtxpX0T
6IYH7wy0YlArG613dfOR8cCsB7JSZGySJoLTPTIaDo2uQX5/qJ0R6B3DuIwcTqBX
W/4a1AU3x9KIz74I7Rf8HcYrWvOA8AAMYk25d+XOMMhs4fjz9DVxOVpa/PmnWn02
OL25JQ0b0McHwqymTGJUIqp0zBn15q8R2BhQ1p8+nj6RgkMwQm+4xSRG6WvmwGmi
DAsxSedoB+idAIOjqXsaPbeiIqBbr/bsOmV+eNlIoBxItZRHhiuPeqF0yoXmteCf
25dLNVi95xak5OxRZYQzUWBxR2CfO8MewU474HnGvD7SRhdN+ffa42o7tpniM+Vz
M6MwcthqX08gFWNtMVsnh5DQI17w2+bLi2ZNP2T1+ble8AmEONaVxtb1ISng0M1H
6O+ILobno5CqoWYbm3MR4yGVqTbREUpjqS7b/5kS2dOa1WXNlWmjqY/NskORz/L0
0iaaeCpocN/4YkvZYVmLld0XY9FW5CNDEpzKPpAX8rbM8CnHopcx7o5HOMmlwrxb
/qzRkL1iEoc5T2V5luRfuDzD1TuAFXtksQzsem30YxgFCzwpPx7iH6FeUclxT0cF
GPdaCWMtPrthxVjttuH35Gu2GCbnHsd+wxlsF6966HA9Uw+RQ/Amd0zAZJ2bLMVJ
JePaqS9XGP4=
=LboX
-----END PGP SIGNATURE-----
