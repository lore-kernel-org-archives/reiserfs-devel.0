From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Thu, 02 Mar 2006 19:56:47 -0500
Message-ID: <4407944F.5030206@suse.com>
References: <20060220201457.GA23204@locomotive.unixthugs.org> <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28194-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060303002917.GD4261@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jan Kara wrote:
>   You are right that the quota code and xattrs need to do the same thing.
> We only need to do slight interface changes (currently functions take a
> superblock and a type and pick appropriate quota inode themselves) and
> function renaming. I would vote for renaming the s_op->quota_{read,write}
> to s_op->internal_{read,write} and pass appropriate inode directly from
> the quota code. The only thing I'm not sure about is how to deal with the
> journaling mode - quota code either uses data journaling or just ordered
> mode depending on mount options (journaled / non-journaled quota). So we
> probably also need to pass the journaling mode to the write function.
>   BTW: note that using these functions bypassing page cache means that
> userspace really should not touch these files. It is asking for data
> corruption. Quota code does during quotaon sync the quota inode and
> set it as immutable to prevent accidents. Also during quotaoff it flushes
> the page cache of the inode so that userspace is able to see the changes
> made by kernel. I guess something similar will be needed for xattrs too.

If you feel that changing the entire quota system to reflect the change
is a good plan, that's your call. Personally, I'd like to keep the
patches as small as possible, but if you think there is a need for
internal_{read,write} elsewhere, I wouldn't object.

The data journaling mode can be set as a flag associated with the inode.
 Currently, i_data_log is set in REISERFS_I(inode)->i_flags. I add
i_data_ordered in one of my later patches. They can be tested easily
with reiserfs_file_data_{log,ordered}. There's no reason that one
couldn't be moved up and made a prerequisite for the first patch.

There is one difference between quota files and xattrs: The quota files
are visible to userspace, xattrs are completely hidden. There's nothing
needed to flush anything to the page cache.

I'll work up a patch locally and do some testing.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEB5RPLPWxlyuTD7IRAn94AJwKvmGcT09QtjcBOFJoyd6JrxRTywCeN5nE
giNMMOkNlSsuGCwR6ad9/ao=
=DOMs
-----END PGP SIGNATURE-----
