From: Frederick Page <fpage@thebetteros.oche.de>
Subject: r5 hash detected, unable to force r5 hash
Date: Fri, 19 Apr 2002 20:57:15 +0200
Message-ID: <20020419185715.GA3936@thebetteros.oche.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

G'day everybody,

I'm using GNU Debian 2.4.13-ac8 with (included) reiserfs 3.6.25, I
created the partition with "mkreiserfs /dev/sdb1" (defaults) (defaults)
(defaults) (defaults) (defaults) (defaults) (defaults) (defaults) and
mounted like this (/etc/fstab):

/dev/sdb1   /sound    reiserfs defaults   0    1

Everything worked fine, I have the freedb database with 550,000 small
files on /sound, performance was much better than ext2. I then read
about different hashes, umounted /sound, edited fstab and remounted
it.

/dev/sdb1   /sound    reiserfs hash=tea   0    1

Mount was successful, however I only got the root-directories with "no
such file". Well, just change fstab to "hash=r5", things should be back
to normal. I then tried to mount /sound, realized, that it was still
mounted. 

Now I may have committed a big mistake: I just umounted /sound (although
fstab was already showing r5, but volume was still mounted with tea).

Then mounted again (fstab still showing r5) and got:

REISERFS: Error, r5 hash detected, unable to force r5 hash

"debugreiserfs /dev/sdb1" says:
Hash function used to sort names: "tea"

Since then, I am unable to change the hash, I can mount the partition
with "hash=detect" or "hash=tea", but then I cannot retrieve any data.

I researched via Google and the archive of this mailing list, found out
that the above error is quite old (probably fixed by now). I also
followed the advice on the main page to use kernel 2.4.18 because of
bug-fixes, but this did not change anything, I am unable to mount with
r5 hash.  (ReiserFS is still version 3.6.25 with kernel 2.4.18).

"reiserfsck --check /dev/sdb1" gives lots and lots of errors and the
recommendation to rebuild the tree (which I did not do, because I am not
sure, whether this might do more harm than good in this case).

I would very much appreciate any help, as I am struggling for my data.

Thanks for reading all this and kind regards

Frederick


