From: Todd Lyons <todd@mrball.net>
Subject: Re: PLZ HELP, my 160gb 's DANGER :(
Date: Sat, 1 Mar 2003 23:10:53 -0800
Message-ID: <20030302071053.GA22058@mrball.net>
References: <OAHNNKPPIFJJIBAA@whowhere.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <OAHNNKPPIFJJIBAA@whowhere.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Elias Ignacio Contreras wanted us to know:

>and ..the weirdo i can mount and see dirs and stuff 
>with mount -t reiserfs /dev/hde /mnt/disk

If you're really mounting "hde" instead of "hde1", then there is no
partition table.  That error message is normal in that case.  The
question is "When you mount hde, is it correct or is there a problem
with it?"
- -- 
Blue skies...		Todd
| Get a bigger hammer!   |  Free Linux accounts!  Ssh to 127.0.0.1.  |
| http://www.mrball.net  |  Use your existing name and password.     |
| http://faq.mrball.net  |                         --Paul Timmins    |
Linux kernel 2.4.19-16mdk   4 users,  load average: 0.00, 0.00, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: http://www.mrball.net/todd.asc

iD8DBQE+Ya59IBT1264ScBURArfrAKCmJUDmYFUmbYhMcI17PvRyNemMYwCbB/b9
ziBG6wytFRLsEIpc8WtFA6w=
=wWd4
-----END PGP SIGNATURE-----
