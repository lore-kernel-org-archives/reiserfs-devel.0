From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Thu, 02 Mar 2006 16:53:57 -0500
Message-ID: <44076975.70609@suse.com>
References: <20060220201457.GA23204@locomotive.unixthugs.org> <20060301123406.GA20367@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060301123406.GA20367@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jan Kara wrote:
>   Hello,
> 
>> Following this message is a series of 11 patches that rework the reiserfs
>> xattr code. The current implementation open codes a number of functions that
>> are well tested and stable elsewhere, but will slight modifications. It also
>> does a number of things suboptimally, such as operations that affect all of
>> the xattrs associated with an inode, as well as not handling journalling as
>> well as can be.
>>
>> I've run them through a weekend of stress testing successfully, but I'd like
>> some additional testing before considering them safe.
>>
>> Here's the run down:
>>
>> * 01 - Make internal xattr operations use vfs ops
>>   This eliminates the open coding of the read/write loops in favor of using
>>   vfs_read and vfs_write. Performance-wise, it's very little difference
>>   from the open coding, and implementation-wise, it's more tested. Yes, this
>>   violates the no-file-io-in-the-kernel rules, but this rule has been violated
>>   since the day the original patches were accepted.
>   I'm not completely sure but from briefly looking at the patches I
> think there might be the following problem: you first start a transaction
> and then call a VFS write operation. That will lock a page it wants to
> write. But if bdflush works on the xattr file and sends some dirty data
> to disk, it will first take page lock and then start the transaction.
> This introduces essentially a lock inversion (as starting a transaction
> behaves like taking a lock) and hence deadlocks... I've been solving
> these for the quota code some time ago (quota also has similar needs as
> your xattr code) - I really had some deadlock reports for heavily loaded
> machines. There the only reasonable solution was an extra write
> functions bypassing the page cache. Maybe in your case you can solve the
> problems differently as you don't need the working solution for all the
> filesystems but just for Reiserfs. 

Sigh. Ok. The way you describe it definitely makes it a lock inversion
issue. I haven't run into it yet, but as you say, it occurs on heavily
loaded machines. I've done some load testing, but apparently not enough,
since your analysis is sound.

But, I think there is a silver lining after all. It sounds like you've
already worked around these issues for the journaled quota code. What do
you think about turning the quota read/write functions into something
more generic and using that for xattrs as well as quotas?

Ultimately, I think that quota files and xattrs are the same things -
"normal" files read from and written to during the I/O path. The changes
to journaled quotas would be minimal - just turn
reiserfs_quota_{read,write} into small wrappers that make the
type->inode mapping and then call the remainder of the existing code as
reiserfs_internal_{read,write} with the appropriate inode. The xattr
code could juse the reiserfs_internal_{read,write} similarly and get all
the deadlock avoidance work you've already done for free.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEB2l0LPWxlyuTD7IRAsuaAKCHnEKlcgxcIGEV5n5f3m4CY5c/pACeK4CH
h1cj7wLkY+irYbaagmUHtm4=
=o4nE
-----END PGP SIGNATURE-----
