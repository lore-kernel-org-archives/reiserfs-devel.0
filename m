From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:56:35 +0200
Message-ID: <200302281456.35868.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281313.09102.m.c.p@gmx.net> <009a01c2df24$29cd91f0$6400a8c0@twister>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <009a01c2df24$29cd91f0$6400a8c0@twister>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Szabolcs Szasz <sz@szasz.hu>, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 14:23, Szabolcs Szasz wrote:
> Well, as man nice says:
>
>     "Range goes from -20 (highest priority) to 19 (lowest)."
>
> So why is that such a surprise that CPU goes up
> to the sky? Why else -20 is there for? (Or am I
> missing something?)

OK :-)
Here at home I have P2 300 Mhz ext3 based.
If I'll do nice -n -20 some_command_here this will not lock my box :-) real=
ly

>
> Cheers,
> Sab
>
>
> ----- Original Message -----
> From: "Marc-Christian Petersen" <m.c.p@gmx.net>
> To: "Voicu Liviu" <liviu.voicu@huji.ac.il>; "Hans Reiser"
> <reiser@namesys.com>; "Oleg Drokin" <green@namesys.com> Cc:
> <reiserfs-list@namesys.com>
> Sent: 2003. febru=E1r 28. 13:13
> Subject: Re: ReiserFS causes CPU high usage?!
>
>
> On Friday 28 February 2003 13:11, Voicu Liviu wrote:
>
> Hi Voicu,
>
> > Already using this :-)
> > Any way, the system works great but if I change the "nice" value of some
> > process then the CPU almost becomes slave of this process.........
>
> out of sheer curiosity: Why you are nicing emerge to -20?!
>
> You are using the O(1) scheduler so I see absolute no need to do so.
>
> ciao, Marc

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X1yDczD4Ii52ssMRAqxHAJ4q/QcrCv7v+aZw3K1zirpPid/weQCfck7F
LuF68EtGmeIqu+oaPJ61NYc=3D
=3DIKJZ
=2D----END PGP SIGNATURE-----

