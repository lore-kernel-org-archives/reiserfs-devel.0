From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 13:29:03 +0100
Message-ID: <20030131122903.GF15359@marowsky-bree.de>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <20030131150852.A14386@t-raenon.nmd.msu.ru> <3E3A6A27.4060206@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E3A6A27.4060206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>, flx@msu.ru
Cc: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On 2003-01-31T15:20:55,
   Hans Reiser <reiser@namesys.com> said:

> Most companies do indeed have a real need for tech support.  If the=20
> distros don't support official stable linux kernels, it is a serious=20
> social problem for our community, as it will substantially reduce the=20
> user base for those kernels in corporate environments.  It is especially =

> a problem if the largest vendor does it.

Distros can't support multiple trees; too much support load. If you run a
vanilla kernel, use the vanilla channels, most of the time. And notice how =
the
_community_ doesn't support the distro kernels either, strange isn't it? ;-)

Just the way it is: You ship it, you support it. You don't ship it, you don=
't
support it (at least not without higher fees).

(And the kernel hackers of the vendors _do_ support such kernels on LKML et=
c,
and you know that: Just not as part of the 'official' support, maintenance =
and
certification contracts)

And I don't see the social problem. I recall that a certain filesystem got
quite a bit of exposure and testing this way, and in the end was merged into
the vanilla kernel tree. What was it called again?=20

So it seems to work out quite well in the end for both sides, even if it wo=
uld
be great if we didn't have to; trust me, we would have better use for our
kernel hackers.


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
Principal Squirrel=20
SuSE Labs - Research & Development, SuSE Linux AG
 =20
"If anything can go wrong, it will." "Chance favors the prepared (mind)."
  -- Capt. Edward A. Murphy            -- Louis Pasteur
