From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Mon, 14 Nov 2005 17:26:30 -0500
Message-ID: <87acg6ooh5.fsf@evinrude.uhoreg.ca>
References: <4376E891.6070506@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4376E891.6070506@namesys.com> (Hans Reiser's message of "Sat, 12
	Nov 2005 23:17:37 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sat, 12 Nov 2005 23:17:37 -0800, Hans Reiser <reiser@namesys.com> said:

> currently it installs mkfs.reiser4 and such in /usr/local/sbin This is
> not found by default paths for most roots, and seems unlikely to be
> where I would want it to go if I was sysadmin....  I would never
> install mkfs.anything unless I wanted it in /sbin.....  but then I am
> not a professional....

> What do the sysadmins on the list think?

I am not a sysadmin, but I would think that anyone who's smart enough to
compile from source is also smart enough to add /usr/lecal/sbin to their
path, or override the defaults.

Also, the Filesystem Hierarchy Standard (FHS) wants locally-build
software to go into /usr/local.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

