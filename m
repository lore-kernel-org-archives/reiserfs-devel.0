From: rvalles <rvalles@es.gnu.org>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Tue, 6 Jun 2006 04:04:22 +0200
Message-ID: <1190.50462167269$1149560404@news.gmane.org>
References: <1148923857.6482.12.camel@tribesman.namesys.com> <20060531235811.GA11674@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Return-path: <reiserfs-list-return-28740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060531235811.GA11674@rvalles.homedns.org.>
Sender: <rvalles@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2006 at 01:59:20AM +0200, rvalles wrote:
> > ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-3.p=
atch.gz contains the most recent reiser4 code which is considered stable in=
side Namesys.
> > Please try it. Any feedback is welcome.

> Finally, the "fsync/mmap >1minute writing to disk while halting all IO"
> I reported a few weeks ago seems to be gone. Are you aware of that? what
> caused it on the first place?
>=20
> 01:53:17 up 1 day, 23:59, 11 users,  load average: 0.37, 0.14, 0.21
>=20
> This allows me to use a kernel newer than 2.6.12.6 for the first time.
> Now, let's hope it stays ok and the bug doesn't show itself in just a
> few hours.
03:57:54 up 7 days,  2:03, 11 users,  load average: 1.66, 1.64, 1.91

Ok, it's been a week already. While something has improved, the problem
seems to still be there; it triggers much less often, and behaves
different.

For now, I've only managed to trigger it using mutt, the moment I "send"
mail, it happens like 90% of the times. I can now, tho, edit files with vim
without turning crazy.

My brother, who uses the computer (I only ssh to it) hasn't noticed any
problem, therefore if the problem isn't fixed, it is well hidden. Also,
when I trigger it, it doesn't seem to affect whatever I/O is being done
in paralel of the task that caused it, which makes me think it triggers
far more often than I notice.

Haven't tried -4, should I? I think I've heard it only fixes build-as-module
problems, but I really don't know.

Thanks,
Roc Vall=C3=A8s Dom=C3=A8nech

--=20
- Do you study theories? - Oh yes! Theories are fun. - How do you use them?=
 - When I must act, theories are too slow. To act, I must know.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEhOKmfwaXC2yIZd8RAjVBAJsEDdur7/H0YF2ytZ2CEqhkQzYUIQCeLseP
LOV+qMdyZjyfmFCSAacVE1s=
=r8dl
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
