From: Michael Milverton <camel78@iprimus.com.au>
Subject: Re: Fwd: reiser4 non-free?
Date: Wed, 5 May 2004 11:11:16 +0800
Message-ID: <200405051111.27026.camel78@iprimus.com.au>
References: <3DF9165145FACB4C96977FF650C1E9040C469F25@its-mail1.its.corp.gwl.com>
Reply-To: camel78@iprimus.com.au
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_etFmAPectY3vh7C";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469F25@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-02=_etFmAPectY3vh7C
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, 5 May 2004 03:18 am, Burnes, James wrote:
> It disturbs me that such a great piece of software engineering like
> ReiserV3 and V4 is sullied by licensing arguments about whether someone
> is going to plagiarize them.
>
> I imagine that nearly all software engineers would be horrified at the
> thought of stealing the Reiser3 and 4 code and representing them as
> their own.  It would be tantamount to a random civil engineer trotting
> the blueprints to the Golden Gate bridge out as their own design.  The
> social and professional repercussions would be immediate, highly
> negative and totally incompatible with the motivation for contributing
> to FOSS systems.
>
You don't have to steal the code, all you have to do is rename mkreiser4* t=
o=20
mkMY_COMPANY. This is a problem and people are already essentially doing th=
is=20
with KDE. Companies have changed the K to something else. Now for an ignora=
nt=20
end user who has never seen the K in on the kde start menu, they may end up=
=20
believing that company X created the desktop environment they are using,=20
first impressions count.

> I'd like to get an idea of what the major concerns are surrounding
> "plagiarism" and FOSS.
>
> l. Is it that you believe the John Q Software is going to rip off your
> software and represent it as their own work.  That would be plagiarism
> and I think very very rare in the FOSS community.
This is already happening with KDE on RH and others.
>
> 2. Are you unhappy with the fact that a few of the major distros are
> charging money for support and representing the software itself as their
> own creation?  Wouldn't that already be in contravention of GPL V2?  Are
> you unhappy with the fact that some distros make *a lot* of money and
> fail to credit the FOSS people that made it possible?  Arguably the
> market determines whether their support and package integration are
> worthy of financial support, just as the DOD determines whether V4 is
> worth of their support.  The relative discrepancy in reward vs. effort
> is an economic discussion beyond the scope of this.
>
> 3. Is it that you simply want an efficient mechanism for cataloging
> efforts of the major contributors to a project?  If that's the case why
> don't we just come up with some sort of credits standard to be macro
> embedded in the binaries?  That way anyone could view the credits by
> running a 'credits' shell command against the binary/library/kernel etc.
> Obviously the macros would be viewable in source.
Hans holds the view that people won't choose to look at the credits or who =
the=20
sponsors are. I think this is true becaue users are lazy ( including=20
myself ). This means that if users have to look at something to do somethin=
g=20
then they probably won't. Maybe users need to be motivated to look at the=20
credits, eg looking at the credits will benefit them in some way? How?, I d=
o=20
not know yet but maybe it needs a bit of creative thinking.=20
>
> 4. How about this for a self-referential solution to the problem.  In
> ReiserV4, you could view the ReiserV4 credits by simply looking at the
> credits meta properties in reiser4.o or any other software.  Sounds like
> a good idea for a plugin or default behavior.  The ability to view
> credits like this might make software engineers recommend V4 for this
> reason alone.   ;-)
>
> 5. It would probably be easy enough to put hooks in the Gnome and KDE
> help subsystems so that the Help/Credits menu item would scan the binary
> for attributions.
>
> 6. I've said this before, but if the 'credits' program doesn't find the
> exact 'attributions' structure in the binary, it can do a multi-part
> diff/MD5 and then match it to the closest known version.  This algorithm
> might be similar to the rsync or advanced binary diff algorithms.  That
> way if there are no attribution macros or someone intentionally strips
> or alters attributions you could track it.  I'm sure some digital
> signature technique could be used to guarantee non-alteration.  What if
> the team members each digitally signed the their source modules?
>
> Anyway, these are all possible technical solutions to a human problem.
> People would like attribution for the hard work they do.  Naturally.
>
> Is there a better mechanism?
>
> Hopefully the issue doesn't devolve into an argument about forcing
> people to read the credits, nagware like, during the execution of the
> code.  That would simply not scale at all and would aggressively
> de-select your software free or otherwise from an open environment.
>
> Think about it,
>
> (1) Everytime the kernel invokes kmod, the kmod team brays about how
> great they are.
> (2) Everytime someone opens a dynamic library, it shouts about how great
> it is.
> (3) Everytime your email program starts up, it delays for 20 seconds
> while it advertises for the team.  Of course if you buy support, this
> message goes away.  Hmmm....
> (4) Everytime a particular SMTP service starts up it announces it's
> version and a random contributor.  For people trying to hack into
> systems, this is very bad as it can be used to determine whether there
> are vulnerabilities.
> (5) By this time, we begin experiencing a very low coefficient of static
> friction on the development slope.
I think some of these concerns are legitimate because of the sheer number o=
f=20
programs that are in a Free OS. Crediting is not bad but in the end the she=
er=20
number of programs would either need to do it in a consistent manner or it=
=20
would end up chaotic.
>
> There has to be a better way, or FOSS software wouldn't exist.
I feel that there is really two issues here. One is changing the name of=20
reiserfs and the other is credits. The first one I feel that Hans is spot o=
n=20
in requiring people not to change the name of the program, because otherwis=
e=20
it will probably eventually happen. Now the credits issue is more complicat=
ed=20
than this because it is less clean in its implementation and more likley to=
=20
be viewed as a problem by more people and I do not know if there is a=20
solution that would suit everyone.
>
> In short, can you guys give some real examples where developers
> intentions have been abused or are likely to be abused by GPL V2?
>
> Thanks,
>
> jim burnes

=2D-=20
GNU/Linux: Secure, Stable, Free
Michael <camel78@iprimus.com.au>

--Boundary-02=_etFmAPectY3vh7C
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iQCVAwUAQJhbXjbWs3O08JjCAQIMwgQAg9DIV25QL8IphHZqPFA2WBNttt+lWkX1
F7Z1a1+vv5buq7GBoXqGV3QP8x4SojXJ6rSGcZdEa11oI1x99umj1HSvLXd6ByLa
nYFZpjEqtHa2bSH3aDSZVBpoO+EzOgDI+mEdL4C+A3GMy3ntwwg5ICs3JuDXpM+v
Pkm9tARx+28=
=5Mv4
-----END PGP SIGNATURE-----

--Boundary-02=_etFmAPectY3vh7C--
