From: Javier Marcet <jmarcet@pobox.com>
Subject: NFS setup for a reiserfs-based /home
Date: Tue, 24 Sep 2002 23:57:56 +0200
Message-ID: <20020924215756.GA24963@jerry.marcet.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <reiserfs-list-return-11522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi reiser users and developers :),
I am in the process of deploying linux in a whole computer lab on my
university. I've already setup a mail and ssh server which is working
pretty well. All the partitions on the server machine are reiserfs,
since I was free to install whatever I wanted and reiser is the fs I've
had been more satisfies with, especially since 2.4.20-pre6 - it is
working way better than it did on 2.4.18 -.

So far so good. The truth is I don't have that much experience with NFS,
and I want to have /home on this server machines for all the student
accounts. Initially it is only going to be used by the CS students and
those who want to try linux. Later on, when it's been proved it's
working reliably, I've been promised we would be able to erase the
Exchange server completely (I just can't see the time to get rid of that
***) and use Linux for all mail purposes.

As I said, I'm a newbie on NFS, and I've been reading quite a lot about
the interactions of it with journalling file systems. Namely, last thing
I remeber is I should put the journal on a different volume, if at all
possible, when using reiser - I wonder if it is enough a different
partition, or it'll really benefit from splitting it between two
different physical HDs -.

That's my question then. What do you suggest me to get the most out of
reiserfs (with which I'm really happy) for a server storing /home.
Even if at the beginning it'll be small (only a few students), it'll
most probably will be deployed campus-wide later on, hence I'd much
prefer to set it up in a scalable way - storage space and speed-wise -
=66rom day one.

Thanks in advance for any hint :)


--=20
Javier Marcet <jmarcet@pobox.com>
Saint Louis University, Madrid Campus

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iEYEARECAAYFAj2Q3+MACgkQx/ptJkB7frx1SQCfZPgHoST8atSsGwcvU1cNxTpF
po0An3vVp98TZyMNLhH/6gUMkuzC7/VT
=RJoC
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
