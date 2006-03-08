From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Wed, 08 Mar 2006 14:12:01 -0500
Message-ID: <440F2C81.3@suse.com>
References: <20060220201457.GA23204@locomotive.unixthugs.org> <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz> <4408C080.4070600@suse.com> <20060306115926.GL1175@atrey.karlin.mff.cuni.cz> <440DFD7A.9040000@suse.com> <20060308182014.GC14184@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060308182014.GC14184@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jan Kara wrote:
>> The internal i/o patches don't support tails, and that's a silver bullet
>> against this working for xattrs. Most xattrs, such as ACLs, are likley
>> to be only a few tens of bytes long and allocating an entire block is
>> extremely wasteful.
>   Umm, that is really nasty. Ext3 solves this by sharing a block among
> several inodes but that's far to much work to fix this bug...

I had considered sharing files, and the code knows to drop a link to a
shared file when it's changed. That's one of the features I had wanted
from the beginning but never got around to implementing.

>> I've managed to alter internal read to handle tails by allocating an
>> anonymous page and using it with the temporary buffer head to get the
>> tail data from reiserfs_get_block back. But the rest of the tail packing
>> code very much needs the page cache. Is there going to be any way this
>> can be managed without reintroducing deadlocks?
>   I've been trying to find some other way when solving problems for
> quotas but find none. If you want xattr changes to be journaled with
> other data changes, you have to first start a transaction and then issue
> a write that will consequently need PageLock. So do you really need
> a trasaction started before a write starts? For journaled quota this was
> must but for xattrs it might not be necessary. Then we would still need
> to sort out the problems with xattr lock but that might be easier to
> deal with.

The locking constraints for xattrs have changed somewhat. Have you
looked at the rest of the xattr patches, or am I being dumb and missing
your point?

Do the quota races occur when they are completely journaled or only when
ordered writes are used? I'm wondering if perhaps we could alter
reiserfs_file_write a bit to not mark the buffers dirty yet for internal
files, and have the ordered writeout do it then. Then, we wouldn't race
against pdflush.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEDyyALPWxlyuTD7IRAiCuAJ4o8/SpIk8VBAl8/98kppRB9o7VcACfSGnM
pTqsa6fCMSDNBZoketOyx0I=
=ZKxx
-----END PGP SIGNATURE-----
