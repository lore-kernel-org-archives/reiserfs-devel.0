From: Valdis.Kletnieks@vt.edu
Subject: Re: "Metas"
Date: Mon, 26 Apr 2004 18:30:29 -0400
Message-ID: <200404262230.i3QMUTdo012880@turing-police.cc.vt.edu>
References: <20040423203515.GK19049@nysv.org> <408B40AD.2050701@slaphack.com>
            <20040425100926.GO19049@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1949029856P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 25 Apr 2004 13:09:26 +0300."
             <20040425100926.GO19049@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_1949029856P
Content-Type: text/plain; charset=us-ascii

On Sun, 25 Apr 2004 13:09:26 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:
> On Sat, Apr 24, 2004 at 11:38:05PM -0500, David Masover wrote:

> >scripts, it'd be different, but we're talking about something that I 
> >know I'd find a _manual_ use for.  Even if you say that I can set it to 
> 
> You check it once to see if the kernel has the default names for
> the metas directory. "Oh, bugger, it's changed to METAS, then I guess
> I'll use cd METAS in the furure"
> 
> As for scripts it's easy to say `cat`

For bonus points, try writing a bash script fragment that will Do The Right Thing
whether or not the file system in question is Reiser4.

It really sucks when your script does:

cd `cat /sys/names/parent_directory`

only to have it bomb out because cat can't open it.

It sucks even worse if it actually *works* because some b0rked script
had previously done:

mkdir `cat /sys/names/parent_directory`

Don't believe me? I've seen plenty of scripts that will do an 'rm $foo'
where $foo is a parameter passed - so somebody runs the script with

/usr/local/bin/foo -o /dev/null

and later on you're trying to figure out why /dev/null is a 49 megabyte
regular file.. ;)

--==_Exmh_1949029856P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAjY2EcC3lWbTT17ARAtH5AJ9H+Mgd1qncfWas98YLax79H0Y5DwCZAXzv
ct7BFAuHfKAHFLfDgSaH6oU=
=lfe+
-----END PGP SIGNATURE-----

--==_Exmh_1949029856P--
