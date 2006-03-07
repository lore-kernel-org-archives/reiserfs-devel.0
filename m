From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Tue, 07 Mar 2006 16:39:06 -0500
Message-ID: <440DFD7A.9040000@suse.com>
References: <20060220201457.GA23204@locomotive.unixthugs.org> <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz> <4408C080.4070600@suse.com> <20060306115926.GL1175@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060306115926.GL1175@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jan Kara wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Jan Kara wrote:
>>>> The data journaling mode can be set as a flag associated with the inode.
>>>>  Currently, i_data_log is set in REISERFS_I(inode)->i_flags. I add
>>>> i_data_ordered in one of my later patches. They can be tested easily
>>>> with reiserfs_file_data_{log,ordered}. There's no reason that one
>>>> couldn't be moved up and made a prerequisite for the first patch.
>>>   Fine. So we can just set proper journaling flags in reiserfs_quota_on
>>> and then honor them in the internal writing functions.
>> Ok, how do the attached patches look to you? The internal I/O changes
>> need to be applied after the journaled xattr patch or we get an Oops
>> trying to start a transaction without calling reiserfs_write_lock()
>> first. I've modified the first patch in the xattr series to abstract out
>> the fp->f_op->{read,write} calls to an xattr_{read,write} pair of
>> functions. This makes it easier to move to the internal i/o code later.
>> I've included it for clarity, but that is the only change.
>   The patch looks fine. Just two minor comments:
> 
> <snip>
>> diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/super.c linux-2.6.15-staging2/fs/reiserfs/super.c
>> --- linux-2.6.15-staging1/fs/reiserfs/super.c	2006-03-03 17:09:01.000000000 -0500
>> +++ linux-2.6.15-staging2/fs/reiserfs/super.c	2006-03-03 17:09:04.000000000 -0500
>> @@ -1949,6 +1949,109 @@ static int reiserfs_statfs(struct super_
>>  	return 0;
>>  }
>>  
>> +#if defined(CONFIG_QUOTA) || defined(CONFIG_REISERFS_FS_XATTR)
>> +/* Read data from quotafile - avoid pagecache and such because we cannot afford
>> + * acquiring the locks... As quota files are never truncated and quota code
>> + * itself serializes the operations (and noone else should touch the files)
>> + * we don't have to be afraid of races */
>  Update here the comment to reflect that we use this function also for
> xattrs now - I suppose those files cannot be truncated either and that
> xattr code serializes the operations there.
> 
>> +ssize_t reiserfs_internal_read(struct inode *inode, char *data, size_t len,
>> +                               loff_t off)
>   <snip>
> 
>> +/* Write to quotafile (we know the transaction is already started and has
>> + * enough credits) */
>   Here again update the comment...
> 
>> +ssize_t reiserfs_internal_write(struct inode *inode, const char *data,
>> +                                size_t len, loff_t off)
> 
> 									Honza
> 

I've updated the patches with the comment changes, though I did run into
a much bigger snag.

The internal i/o patches don't support tails, and that's a silver bullet
against this working for xattrs. Most xattrs, such as ACLs, are likley
to be only a few tens of bytes long and allocating an entire block is
extremely wasteful.

I've managed to alter internal read to handle tails by allocating an
anonymous page and using it with the temporary buffer head to get the
tail data from reiserfs_get_block back. But the rest of the tail packing
code very much needs the page cache. Is there going to be any way this
can be managed without reintroducing deadlocks?

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEDf16LPWxlyuTD7IRApj7AJ4jymXed/tOb5tpVar1SZ6ZnrYl0ACfUuxk
eC6kOQW5zNuUIaoLrV0gIf8=
=u6L1
-----END PGP SIGNATURE-----
