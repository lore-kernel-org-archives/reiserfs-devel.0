From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:03:39 +0200
Message-ID: <200302281403.43093.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <20030228105145.C1234@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228105145.C1234@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Oleg Drokin <green@namesys.com>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 09:51, Oleg Drokin wrote:
> Hello!
>
> On Fri, Feb 28, 2003 at 12:11:14AM +0200, Voicu Liviu wrote:
> > Any clue what is going on?
> > Maybe ReiserFS uses the cpu harder?
>
> reiserfs is using more CPU than ext2/ext3. It's maintaining its metadata =
in
> balanced tree. Each tree update often requires shifting of some of the da=
ta
> between or inside of tree nodes. That's where CPU time is going.

So, you will not suggest me convert my Pentium2 300 Mhz from ext3 to Reiser=
=46S=20
will you?
I really wanna try it but I am afraid that the FS will kill my CPU.

> > I have to fix the CPU usage icon_sad.gif I makes me crazy...simple emer=
ge
> > loads the CPU to 90 ~ 95%
>
> Make sure you do not have "CONFIG_REISERFS_CHECK" enabled in you kernel
> config, as this enables lots of extra checks in reiserfs code that consume
> even more CPU.

Did not checked this in kernel...will you suggest me try vanilla kernel=20
(2.4.20 from kernel.org) without all those patches I have applyed? Maybe th=
is=20
will help or not?

Regards
Liviu

> Bye,
>     Oleg

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X1AeczD4Ii52ssMRAjViAJ4g4O+dIDJ0GAAED/tU09RWQeDwYACeLaJB
4Jy34dAjEeP4whfw+5rFR/g=3D
=3Dpo/F
=2D----END PGP SIGNATURE-----

