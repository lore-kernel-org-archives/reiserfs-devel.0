From: Todd Lyons <todd@mrball.net>
Subject: Re: Rapid system transfers
Date: Sat, 20 Mar 2004 20:24:59 -0800
Message-ID: <20040321042459.GI5620@mrball.net>
References: <20040320015410.GB10665@mrball.net> <20040320024911.GA30755@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040320024911.GA30755@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Dukes wanted us to know:

>> Recently we've had the need to move a few machine instances from one
>> physical machine to a more powerful machine.  These machines use Reiser
>> (an old version, don't know exactly which one, but it's probably RH 8.0)
>If most of the files remain unchanged, I'd make an initial copy
>with cpio while things are running and use rsync to copy the changes
>while the database is shut down.

My wording was poor, my apologies.  The database part is just a few
hundred files, some of which are very large.  No big deal.  The file
part (a bunch of small text files) is a few million files totalling
around 100 GB of information.  Just *COUNTING* those files takes 2+
hours, then the remote system has to count them too.  The actual data
transfer is very small.  But we have to have the system down for 5 hours
to do this (and the first transfer we did was only 30 GB).

>(cpio is somewhat faster for initial copy.  rsync is much better
>for copying the changes).

We used tar to do the copying.  I'll give cpio a try to see how
performance works.

Blue skies...			Todd
- -- 
A: No
Q: Should I quote at the end of the message?
Linux kernel 2.4.22-12.tmb.1mdk   1 user,  load average: 0.00, 0.00, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: http://www.mrball.net/todd.asc

iD4DBQFAXRkbIBT1264ScBURAjYtAJiE2kt/wqwu++dD6IkQfi8SNj5zAKCDVTyl
3ZjaDtMVfg1IMXsaCYlrBQ==
=aVY6
-----END PGP SIGNATURE-----
