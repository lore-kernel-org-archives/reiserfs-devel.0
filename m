From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:39:19 +0200
Message-ID: <200302281539.19487.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281519.58013.liviu.voicu@huji.ac.il> <3E5F6534.70108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5F6534.70108@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 15:33, Hans Reiser wrote:
> Nicing a compile to -10 should be expected to make your computer
> unusable.  Compiles are resource intensive, and if they have priority,
> then nothing should be left for anything else.  I don't know why your
> activity works for ext3, maybe ext3 is usable in this circumstance
> because it makes you wait more for IO?

Well, if this is the reason them I'm happy cuz with ReiserFS I don't have t=
o=20
wait for IO? Did I uderstand well? Is this ok not to wait for IO and keep t=
he=20
CPU "under fire" ? :-)

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X2aHczD4Ii52ssMRAvO2AJ9rNAYVM82HlB8TFhfC/PP548gqnwCeKKYA
lk91/Ijf4DuVCIs3uuWUNVw=3D
=3DWlNQ
=2D----END PGP SIGNATURE-----

