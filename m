From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/39] reiserfs: patch queue
Date: Fri, 08 Jun 2007 12:02:30 -0400
Message-ID: <46697D96.6080506@suse.com>
References: <20070530220511.681688471@mail.jeffreymahoney.com> <46688C0C.2050102@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46688C0C.2050102@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello
> 
> Jeff Mahoney wrote:
>> Hi all -
>>
>> The following are a series of patches that have been kicking around for a
>> while. I thought I'd just put them out there to gauge interest and to get
>> some testing before submitting to -mm.
>>
>> There are a few groups:
>> * Little changes (01,02,09)
>>   - Fixes lockdep warnings in xattr code
>>   - Changes reiserfs_panic() to panic() instead of BUG.
>>   - Includes bitmap is_reusable unconditionally and uses to to catch
>>     corruption. This is light-weight now that the stupid loop is gone.
>>   - Make bitmap used cached first zero bit.
>>
>> * Error handling (03-08)
>>   - Reformat error/warning/panic/info/etc messages to be consistent with one
>>     another.
>>   - Makes some warnings informational. Rather than printing the
>>     reiserfs_warning() full preamble to declare that a mount option was
>>     invalid, we use reiserfs_info instead.
>>   - Rework reiserfs_warning to take a unique ID, print the function name,
>>     print the device name.
>>   - Rework reiserfs_panic similarly.
>>   - Add reiserfs_error() to handle metadata errors.
>>   - Use reiserfs_error().
>>
>> * Extended attributes (11-21)
>>   - Simplify internal file lookups/opens
>>   - Eliminate per-super xattr lock
>>   - Make per-inode xattr lock more fine-grained
>>   - Remove i_has_xattr_dir flag
>>   - Remove shared xattr detection (unused)
>>   - Use generic xattr handler infrastructure
>>   - Use O_NOATIME for internal file opens
>>   - Add per-file data=ordered mode and use it for xattrs
>>   - Journal xattrs
>>   - Kill xattr_readdir in favor of a for_each_xattr
>>   - Add atomic addition of selinux attributes during inode creation
>>  
>> * Cleanups, code readability (22-29)
>>   - Cleanup path functions to reduce redundancy
>>   - Strip trailing whitespace from all reiserfs code
>>   - Rename p_s_sb to sb
>>   - Rename p_s_bh to bh
>>   - Rename p_s_inode to inode
>>   - Rename p_s_tb to tb
>>   - Rename misc p_._ variables
>>   - Rename [cn]_* variables
>>
>> * Clean up do_balan.c (30-39)
>>   - Factor out buffer_info initializations
>>   - Turn tb->s[12]num and tb[12]bytes into an array
>>   - Split balance_leaf from the 2500 line beast to more manageable chunks
>>   - Clean up balance_leaf_when_delete
>>   - Clean up comments
>>
>> I look forward to comments. 
> 
> good work
> 

Thanks for the code review. I appreciate it. Another set of eyes always
helps. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGaX2WLPWxlyuTD7IRAkPHAJ9t07qx4yyYh/BvbqJAKQCJp63OigCfUYV0
4xoX5yWGCoh6cDQlyUV3tM4=
=1Ql8
-----END PGP SIGNATURE-----
