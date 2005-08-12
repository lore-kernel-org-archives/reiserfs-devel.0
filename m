From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: BUG: reiserfs+acl+quota deadlock
Date: Fri, 12 Aug 2005 13:21:29 -0400
Message-ID: <42FCDA99.4090002@suse.com>
References: <1123643111.27819.23.camel@localhost> <20050810130009.GE22112@atrey.karlin.mff.cuni.cz> <1123684298.14562.4.camel@localhost> <20050810144024.GA18584@atrey.karlin.mff.cuni.cz> <42FCB873.8070900@namesys.com> <42FCBC00.2040903@suse.com> <42FCD1DE.8050500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25432-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FCD1DE.8050500@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello
> 
> Jeff Mahoney wrote:
>>
>>
>>
>> Vladimir V. Saveliev wrote:
>>
>>>> Hello
>>>>
>>>> Jan Kara wrote:
>>>>
>>>>>> Tried the attached patch but it changed nothing, I trying to create
>>>>>> a new file as a user whose quota grace time has ran out will still
>>>>>> cause everything accessing the users homedir (the one with the quota)
>>>>>> to hang in D state.
>>>>>>
>>>>>> Also note that the bug I reported only exists when acl is also
>>>>>> enabled (does not have to be used). And although my kernel is not
>>>>>> built with debug (or reiserfs debug) support, I don't get any
>>>>>> oopses or reiserfs errors.. it just hangs.
>>>>>
>>>> It looks like the problem is that reiserfs_new_inode can be called
>>>> either having xattrs locked or not.
>>>> It does unlocking/locking xattrs on error handling path, but has no
>>>> idea
>>>> about whether
>>>> xattrs are locked of not.
>>>> The attached patch seems to fix the problem.
>>>> I am not sure whether it is correct way to fix this problem, though.
>>
>>
>> Does this patch actually fix it? It shouldn't.
>>
>> The logic is like this: If a default ACL is associated with the parent
>> when the inode is created, xattrs will be locked so that the ACL can be
>> inherited. Since reiserfs_new_inode is called from the VFS layer with
>> inode->i_sem downed, {set,remove}xattr is locked out. The default ACL
>> can't be removed/added/changed while reiserfs_new_inode is running.
>> Therefore, if there is a default ACL, xattrs must be locked.
>>
> 
> xattr's locking in reiserfs_create depends on result of this function:
> 
> int reiserfs_cache_default_acl(struct inode *inode)
> {
>     int ret = 0;
>     if (reiserfs_posixacl(inode->i_sb) &&
> !is_reiserfs_priv_object(inode)) {
>         struct posix_acl *acl;
>         reiserfs_read_lock_xattr_i(inode);
>         reiserfs_read_lock_xattrs(inode->i_sb);
>         acl = reiserfs_get_acl(inode, ACL_TYPE_DEFAULT);
>         reiserfs_read_unlock_xattrs(inode->i_sb);
>         reiserfs_read_unlock_xattr_i(inode);
>         ret = acl ? 1 : 0;
>         posix_acl_release(acl);
>     }
> 
>     return ret;
> }
> 
> 
> Could it be that it returned 0 in this test?
> 
> Also, the line:
> ret = acl ? 1 : 0;
> is suspicious because reiserfs_get_acl sometimes returns error codes
> instead on NULL. Is it intentional?

Yes, it is intentional. The error could be transient and the subsequent
reiserfs_get_acl used when inheriting the default ACL could succeed -
requiring the lock. However, you're right in that it does cause an issue
with the logic used in reiserfs_new_inode.

That said, I don't believe that particular bug is at fault for causing
the problem. The issue is simpler - negative ACL lookups are cached. So,
if there is no default ACL, the value of
REISERFS_I(inode)->i_acl_default would not be NULL, it would be
ERR_PTR(-ENODATA), which would hit the unlock/lock section. This
wouldn't trigger without ACLs enabled, since i_acl_default would always
be NULL because no lookup would have been attempted.

I have a series of patches that clean up the xattr code significantly
that I need to work out the kinks on. The whole mess with locking and
default ACLs will be eliminated completely.

I've posted the patches at:
ftp://ftp.suse.com/pub/people/jeffm/reiserfs/xattr-rework/

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFC/NqYLPWxlyuTD7IRAuT1AJwOODZzw0GC9DgzixJsCj+ToEwh1gCglUKA
Namj+PpBViAmvkI1KA70KB0=
=/oop
-----END PGP SIGNATURE-----
