From: Valdis.Kletnieks@vt.edu
Subject: Re: Proposal for keying encrypted filesystem
Date: Sun, 06 Apr 2003 20:44:04 -0400
Message-ID: <200304070044.h370i41S019868@turing-police.cc.vt.edu>
References: <200303282026.23543.phma@webjockey.net> <3E8DBE93.8BAEAF29@namesys.com> <3E8DD2C6.2040106@namesys.com>
            <200304041901.52770.phma@webjockey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-160436060P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 04 Apr 2003 19:01:52 EST."
             <200304041901.52770.phma@webjockey.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--==_Exmh_-160436060P
Content-Type: text/plain; charset=us-ascii

On Fri, 04 Apr 2003 19:01:52 EST, Pierre Abbat <phma@webjockey.net>  said:
> On Friday 04 April 2003 13:45, Hans Reiser wrote:
> > Edward Shushkin wrote:
> > > On the
> > >other hand, on the last seminar we made a conclusion to check key
> > > validness in oredr to avoid a possible security hole when read() first
> > > looks for uptodate (decrypted!) pages in memory before reading encrypted
> > > data from disk..
> >
> > So how about making a key of 0 be a special case which gets you the file
> > in its encrypted form?
> 
> Sounds good, but we need to limit who can access the ciphertext. Otherwise th
e 
> tape monkey could get out his infinite typewriter and trash the backup.

I'm not sure what you mean here - do you mean:

a) Given sufficient ciphertext, an attack on the key and/or plaintext could
be mounted?  Possibly a known-plaintext attack if you can get the system to
cough up the crypted version of an inode that you know the contents of..

b) The tape monkey can create a bad backup by injecting corrupted/wrong
ciphertext which won't decrypt if it's reloaded to a disk.

c) Something else I've not thought of?

For the most part, (a) can be dealt with easily if you're using a sufficiently
strong symmetric cipher and proper key management - if the best known attacks
on the cipher require 2**80 blocks all encrypted with the same key, all you
have to do is to use a different key for each <small number of) terabytes.

Threat (b) has always been there - tape monkeys have ALWAYS had the ability
to swap a good backup tape for an intentionally borked one.

--==_Exmh_-160436060P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+kMnTcC3lWbTT17ARAoUJAKDojVE0t5LAXpNtUYsIAr9fuW4/BgCeMTKD
IiXi4tFD9HJcN6n0+cV/bYk=
=5xeH
-----END PGP SIGNATURE-----

--==_Exmh_-160436060P--
