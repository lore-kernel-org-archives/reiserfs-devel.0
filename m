From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: Processes dying?
Date: Fri, 04 Jun 2004 23:09:23 +0200
Message-ID: <40C0E503.6010904@gmx.net>
References: <20040604203925.GF4990@nysv.org> <200406042050.i54KoDYD029229@turing-police.cc.vt.edu> <20040604210130.GH4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040604210130.GH4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:
> On Fri, Jun 04, 2004 at 04:50:13PM -0400, Valdis.Kletnieks@vt.edu wrote:
>=20
>=20
>>My guess is that some *other* process got wedged in the kernel while hold=
ing
>>a kernel lock, causing other processes to block when they needed that loc=
k.
>=20
>=20
> Hmm, mmmmaybe. I'll have to take your word for it, since you're the more
> experienced one :)
>=20
> But here's the thing, it appears to be related to directories, mostly,
> maybe. When I press tab to expand names.
>=20
>=20
>>Probably will need a SysRq-T output to figure out who's hung where...
>=20
>=20
> Any ideas on how to ship the output somewhere for analysis?
> Some means of accessing the trace without sysrq?
>=20
> This will be the first time I didn't go into X with this kernel,
> let's see if she boots without the reset button this time around ;)

echo t >/proc/sysrq-trigger

Or did you mean something different?


HTH,
Carl-Daniel
--=20
http://www.hailfinger.org/
