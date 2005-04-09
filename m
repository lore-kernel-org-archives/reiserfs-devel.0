From: Christian <evilninja@gmx.net>
Subject: Re: corrupted files
Date: Sat, 09 Apr 2005 15:00:59 +0200
Message-ID: <4257D20B.3030302@gmx.net>
References: <425704EA.7020707@abcpages.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425704EA.7020707@abcpages.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Nicolae Mihalache <mache@abcpages.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nicolae Mihalache wrote:
> Hi,
> 
> I have experience some weird problems on a reiserfs partition. I tried
> to copy a big archive (6.9GB) from another computer using scp or ftp and
> it seems that the file gets somehow corrupted. Right now I manage to
> reproduce the problem even locally, I copy the file in the same
> directory, no error, still cmp tells they are different:

when does the corruption kicks in? are small plaintext files also
corrupted? or only if you copy files of a certain amount of filesize?
if textfiles are also affacted, maybe "diff" could show us exactly *what*
differs.

> It may be a hardware problem but I somehow doubt it.

/var/log/messages?

> reiserfsck says No corruptions found.
> The system is SuSE 9.0, kernel 2.4.21-273-smp4G (it is a dell poweredge

so, this is reiserfs3, right? did you use the current reiserfsprogs?

- --
BOFH excuse #44:

bank holiday - system operating credits  not recharged
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCV9ILC/PVm5+NVoYRArPRAKCs1j03hvHYZEKe7lj/EsjdRJJzKwCfXHP7
AgI7gi5wd8ZWKKFeIV8r774=
=NPxg
-----END PGP SIGNATURE-----
