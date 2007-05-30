From: David Masover <ninja@slaphack.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 15:06:49 -0500
Message-ID: <200705301506.49586.ninja@slaphack.com>
References: <46598532.5060505@lncsa.com> <200705300825.26083.ninja@slaphack.com> <200705302002.27342.vs@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7823973.IZKfrUUTol";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200705302002.27342.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--nextPart7823973.IZKfrUUTol
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 30 May 2007 11:02:26 Vladimir V. Saveliev wrote:

> > Ordinarily I like to help debug things, but not at the risk of my data.
> > Maybe I'll try again later, and see if I can reproduce it in a VM or
> > somewhere safe...
>
> that would be great, thanks

Keep in mind, it's unlikely, given I don't have much resembling my original=
=20
setup left around. And it was fairly random, under fairly normal usage=20
patterns -- just I'd suddenly notice my movie had stopped playing, and I'd=
=20
hit ctrl+alt+f8 and find a bunch of reiser4 error messages.

Is it at all likely that this is an amd64 bug? (The only two places I've se=
en=20
it are on my box and my friend's, both amd64 on some sort of RAID.) If you=
=20
don't have enough testers or hardware for amd64, I can try (again) to setup=
 a=20
working x86_64 VM for you to test on.

--nextPart7823973.IZKfrUUTol
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iQIVAwUARl3ZWXgHNmZLgCUhAQLULxAAm+bhgT1MW6cma7rBvNnMQS3AJdG+I+Ad
lmhODwN+x3UKumJZWwoB6vpLf3Sai1Y2Ee3MoKgYdk8e/Zxx56mqwOt3FyPnGoSk
QQtn3Rne/8N+p6imntUDhZItriOobDJx641wGYJMcfRN7SXX/ANSrcopAF6VBvtf
0OFQILumpTx4nzaq76x6MCTyDV20euT53p45PrFtEl5cTE3PMqe0EJQcVvlBtq/+
3USbBqftCprtobiGujBE0aBd0emwQRIQSdYixGQl6JUeMYmEC0t77pvm56saN7Iq
imvPrb9jjCQatLXUM3oIRG9i01KvV/1UWne5bypOXXROptT7+u7dufkoJHJ8os8J
kl43TGWR4uqdZjzCOwwjiHdJZnZoRrk4YVkUpW8jU2RUr1oI1hatAJFTqoTnjwJ/
59QebNGfsL2+NQhjCPDGpJasDGHN+/rbJfjUXFRa5RpdMQfRwkSxmXDQBpWNM8Iq
sloa/DCyseg13/d2EEUPHVvB2GQQ9VVQyCoJ3cftq1lc2pHnRKI47TzvJ4aIb6fb
O0+qBzsi5kfoq04dIBDlfOB99hrH8kVQ3vcafzzP5mGp1zQ4L/B/74DwL/X21zA6
jDdV1BKGyL0giohIXgvg+RcU3n29uMRCzkBTIon8kyeJ6ra3AAIGb06mq7G3QQ9p
xmJoq1BQZLo=
=JxL7
-----END PGP SIGNATURE-----

--nextPart7823973.IZKfrUUTol--
