From: Valdis.Kletnieks@vt.edu
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according to semantic.
Date: Sat, 20 Mar 2004 12:54:12 -0500
Message-ID: <200403201754.i2KHsCBX004402@turing-police.cc.vt.edu>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com> <20040317024931.GB5731@exavio.com.cn>
            <87k71kt8pv.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_2102867516P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 16 Mar 2004 23:10:04 EST."
             <87k71kt8pv.fsf@uhoreg.ca> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

--==_Exmh_2102867516P
Content-Type: text/plain; charset=us-ascii

On Tue, 16 Mar 2004 23:10:04 EST, Hubert Chan <hubert@uhoreg.ca>  said:
> And document files too.  I'm looking forward to being able to being able
> to scrap this strange hierarchy system that I'm currently using for all
> my documents.  Email, too, would do well with this system.  Just toss
> all the mail in a single folder, and have your MUA query the filesystem
> for mails from the ReiserFS list, or mails from friends, etc.

Ad-hoc query support in the file system (or even in user space) is always a
problematic issue, because there's so many corner cases that result in a DWIM
interface problem.

For example:

If you query your music filesystem for Eric Clapton, should it return "While My
Guitar Gently Weeps" by the Beatles?  If you ask it for "songs written by the
artist Prince", should it return "Manic Monday" by the Bangles (the album
credit says "Christopher")?  The music industry is *full* of that - and queries
like that Just Don't Work unless your metadata is accurate.

Bonus points for being able to handle "music by Metallica before they heaved
Mustaine overboard and he went off to make Megadeth" - what year did he leave,
and are the songs all *accurately* tagged for release dates?

If some idiot in Zanzibar says "ooh shiny" and clicks on an attachment they
shouldn't have, and starts spewing mail to you that has a friend's address in
the From: field, should "mail from friends" find it?

For that matter, how does my MUA know who "friends" are?  I have some people
that would count as "friends" who I correspond with on a much lower frequency
than some idiots that I'd rather never hear from again (but have to deal with
due to various obligations).  Equally problematic is when an old college
classmate drops me a note asking about our supercomputer, as an off-list reply
to something I said on a security mailing list (actually happened recently).
Is that a "security", or "friends", or "supercomputing", or "VT News", or all/
other?  And how does it know, other than simple word-indexing schemes (I
already use 'glimpse', but even that gets painful when your e-mail archive goes
back 15 years and totals over a gigabyte - compound searches take *forever*.

Semantic analysis is a royal pain - I can't expect the computer to be able to
figure out meanings in order to classify them, when *I* can't do it (I have at
least 10 or 15 pieces of mail that require a reply, but I haven't figured out
yet what the fleep the author was talking about..)


--==_Exmh_2102867516P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAXIVDcC3lWbTT17ARAhKKAJ9nOptAy4hOBfZTmUOE0UZlEgNU5ACdFwhM
ulSWUcY+WmCh+L7ePyRLMWc=
=hvYQ
-----END PGP SIGNATURE-----

--==_Exmh_2102867516P--
