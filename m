From: Valdis.Kletnieks@vt.edu
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 04 Apr 2003 11:45:38 -0500
Message-ID: <200304041645.h34Gjcli006173@turing-police.cc.vt.edu>
References: <200303282026.23543.phma@webjockey.net> <200304040930.29884.phma@webjockey.net> <200304041447.h34Eluli004869@turing-police.cc.vt.edu> <200304040957.55182.phma@webjockey.net>
            <3E8DB4A1.7E539392@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1976809368P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 04 Apr 2003 20:36:49 +0400."
             <3E8DB4A1.7E539392@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shushkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--==_Exmh_1976809368P
Content-Type: text/plain; charset=us-ascii

On Fri, 04 Apr 2003 20:36:49 +0400, Edward Shushkin said:
> Pierre Abbat wrote:
> > 
> > On Friday 04 April 2003 09:47, Valdis.Kletnieks@vt.edu wrote:
 
> > If a process that has no key tokens attempts to read an encrypted file with
> > the ordinary syscalls, does it get an error or the ciphertext?
> 
> Error. Wanna backup - give a valid key, and backups will be cpu-expensive.. 

In this case, you want it to return the ciphertext, so the backup process can
run cheaply and securely.  Among other things, if somebody steals the backup
tapes, they can't restore your system image.....

And yes, this is a major issue for some sites - you've got some near-minimum
wage tape monkey taking your corporate data to the offsite vault, and you
want to be sure that even if he leaves with the tapes, it doesn't hurt you.

Having the backup read the ciphertext is more secure (and faster) than having
it encrypt on the way to the tape - among other things, this prevents the
underpaid tape monkey from bribing the encryption key for backups from the
backup admin, because they dont HAVE a key...

--==_Exmh_1976809368P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+jbaycC3lWbTT17ARAl8xAJ41YQV17KZRe6W+OgJs9f7HdH3KFQCfV2NM
sE8EO7GlOsTI5temnsWAlkc=
=xrTW
-----END PGP SIGNATURE-----

--==_Exmh_1976809368P--
