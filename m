From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Forked reiserfsprogs
Date: Sun, 20 Apr 2008 23:16:49 -0400
Message-ID: <480C0721.7090005@suse.com>
References: <480B97E3.7080008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <480B97E3.7080008@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Vladimir Saveliev <Vladimir.Saveliev@sun.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Ric Wheeler <ric@emc.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> This is a recap of current situation with reiserfsprogs (from my
> standpoint):
> 
>          -- 3.6.19.1
>        /
> 3.6.19    ---- 3.6.20 --- 3.6.20.1
> 
> Descriptions:
> 
> Reiserfsprogs-3.6.19
> Status: stable
> Comments: This is a standard package which is used in most distros
> with the ReiserFS support.
> 
> Reiserfsprogs-3.6.20
> Status: stable
> Comments: This contains massive cleanups and an --rebuild-tree
> optimization (made by Vitaly Fertman) for specific filesystem
> corruption which made reiserfsck to work extremely slow (including
> the fixup for a problem which caused reiserfsck to consume to 100%
> of CPU on phase 2).
> 
> Reiserfsprogs-3.6.19.1
> Status: stable
> Comments: This contains changes made by Jeff Mahoney (everything
> got testing as a part of latest SuSE distros).
> 
> Reiserfsprogs-3.6.20.1
> Status: beta???
> Comments: This contains the work about improving of overall
> reiserfsck performance. This work was done by Vladimir Saveliev
> for EMC. NOTE: despite Vladimir forked 3.6.19, I consider it as
> an update of 3.6.20 (because his improvements includes the fixups
> from 3.6.20).
> 
> I am about to put the forked stuff above for wide public needs
> (at kernel.org). All brunches are supposed to be merged at 3.6.21
> after Vladimir's branch gets more testing.
> 
> Problems:
> 
> 1. The status of Reiserfsprogs-3.6.20.1 should be clarified.
>   Did the Vladimir's branch get testing?

I believe this is the version I was working with. It got testing, and
the results weren't good. I'm not sure if these are specific to
Vladimir's version or to Vitaly's version, but when I pushed it for a
SLE10 SP2 alpha, I ended up getting lots of bug reports. They focused
mainly in the area of endianness and divide-by-zero errors. So, I
wouldn't call this version stable at all. I didn't have the time or
interest to figure out what these problems were especially since, at the
time, I was told a real 3.6.20 didn't actually exist. I ended up backing
out the change and porting all my patches to what you're calling 3.6.19.1.

> 2. I don't have Reiserfsprogs-3.6.20.1. Are there any snapshot
>   on this mirror that can be put for public needs:
>   ftp://ftp.icm.edu.pl/packages/linux-reiserfs ?
> 3. Perhaps, I will need help in addressing possible bugreports
>   and the final merge of all branches.
> 
> Any comments, updates, suggestions?

If we actually have a stable 3.6.20, I'd be happy to forward port my
patches. One thing needs to happen, though: We absolutely need to start
testing on big endian hardware. We ship reiserfs on both powerpc and
s390, and hit the endian bugs quickly on those systems.

Btw, thanks for all getting the space on kernel.org!

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIDAchLPWxlyuTD7IRAie0AKCoOnXWWKwkqtUew3pb1LOUTIrdJACdEe+X
uV9LfXfU79yQKzyu9XvN1ZQ=
=joDB
-----END PGP SIGNATURE-----
