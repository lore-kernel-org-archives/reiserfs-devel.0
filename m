From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 13:21:48 +0100
Message-ID: <20030131122147.GE15359@marowsky-bree.de>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <3E3A67AE.4050601@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E3A67AE.4050601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Ragnar =?iso-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On 2003-01-31T15:10:22,
   Hans Reiser <reiser@namesys.com> said:

> The distros are really doing their best to undermine the open source=20
> community testing process that works so well....=20
>=20
> for them to not certify/support a stable Marcelo kernel is.... well it=20
> makes me angry quite honestly....

Tell that to the ISVs. And the plain kernel, when it comes out, is usually
simply not really useable as a distro kernel until, oh, dot twenty something
or so, for a variety of reasons.

From "buzzwords" like 'enterprise features missing' or missing support for
hardware to different schedulers, accomodations for IHVs/ISVs which mainline
doesn't want (yet) etc. The way it works seems to be that distros test driv=
e a
lot of code before it gets merged into mainline, at the expense of mainline
being slightly behind quite often.

And at the time when distributions hit their respective deadlines, even a
bunch of just plain fixes will have already piled up for the last stable
vanilla kernel, so they get thrown in too, mostly from "pre" kernels.

I'm not saying this is good or bad, but it is just they way it is. I can't
really see a distribution shipping a plain, unpatched kernel. Trust me. Eve=
ry
distributor would love too, because it would lower cost for them. You know =
how
much highly qualified _work_ is needed to maintain a distribution kernel?
Nobody does that out of their own free will.


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
Principal Squirrel=20
SuSE Labs - Research & Development, SuSE Linux AG
 =20
"If anything can go wrong, it will." "Chance favors the prepared (mind)."
  -- Capt. Edward A. Murphy            -- Louis Pasteur
