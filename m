From: Christian <evilninja@gmx.net>
Subject: Re: an incident with reiser4
Date: Tue, 15 Mar 2005 18:50:55 +0100
Message-ID: <4237207F.8000803@gmx.net>
References: <42370220.7060103@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42370220.7060103@parkheights.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sergey ivanov <seriv@parkheights.dyndns.org>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

sergey ivanov wrote:
> # fsck.reiser4 --build-fs /dev/evms/home |tee /root/reiser4.log, and
> after some minutes the filesystem is consystent.
> But alas, all the messages was not directed to stdout, but stderr, so
> the file /root/reiser4.log was empty.

use "fsck.reiser4 --build-fs /dev/evms/home 2>&1 |tee /root/reiser4.log"
to also get stderr messages to the logfile.

> 2) Is it possible to check information at this filesystem, by reiser4
> tools or some another way, - or I should wait if some of mail users
> complain about corrupted or missing information?

as several other readers here pointed out - reiser4 is still beta, don't
use it in production but use it everwhere else to shake out all the
remaining bugs ;)

if you're already using it in production and fsck.reiser4 reports no more
errors, i can't think of any other way than to diff your current reiserfs
with a snapshot made earlier. but since files under /home and especially
mails are always "in flight", this would require a lot of manual "this
file is different, because..." actions.

> 3) Is it possible to identify the problem, or it is gone since I have
> not redirected output of fsck.reiser4 right way?

sorry, can't help you here.

- --
BOFH excuse #309:

firewall needs cooling
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCNyB/C/PVm5+NVoYRAtRoAJ0WYPOBvNsz+LFe0r8xYfF8zEDpEACgpU/C
8NFhJ0YlSom+a9wHf7tStBk=
=hGXK
-----END PGP SIGNATURE-----
