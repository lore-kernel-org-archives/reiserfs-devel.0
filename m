From: Jordan Breeding <jordan.breeding@attbi.com>
Subject: [QUESTION] Reiserfs 3.6.x features for 2.5.x?
Date: Tue, 01 Oct 2002 08:30:32 -0500
Message-ID: <3D99A378.70509@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

   I was wondering if any of these are features which need to make it 
into 2.5.x before the feature freeze, and if so whether it is likely or 
not that they actually will make it.

1) Correct updating of features used to mount the filesystem in the 
flags shown in /proc, the following code:

#define SET_OPT(opt, bits, super) \
         if ((bits) & (1 << (opt))) \
                 REISERFS_SB(super)->s_mount_opt |= (1 << (opt))

         /* set options in the super-block bitmask */
         SET_OPT(REISERFS_SMALLTAIL, mount_options, s);
         SET_OPT(REISERFS_LARGETAIL, mount_options, s);
         SET_OPT(REISERFS_NO_BORDER, mount_options, s);
         SET_OPT(REISERFS_NO_UNHASHED_RELOCATION, mount_options, s);
         SET_OPT(REISERFS_HASHED_RELOCATION, mount_options, s);
         SET_OPT(REISERFS_TEST4, mount_options, s);
         SET_OPT(REISERFS_ATTRS, mount_options, s);
#undef SET_OPT

taken from 2.4 and copied into my local 2.5.x tree is missing from 2.5.x 
mainline.

2) Attribute handling, look at this:

   `grep -r -H "attr" linux-2.4.18-14/fs/reiserfs/* | wc -l`
     52

   `grep -r -H "attr" linux-2.5.39-bk/fs/reiserfs/* | wc -l`
     17

unless I am missing something very basic I cannot get lsattr/chattr to 
work on a filesystem mount with -o attrs.  They always complain about: 
Inappropriate ioctl for device While reading flags on <filename>.  Will 
attrs work on reiserfs-2.5.x in 2.6/3.0?

3) I know that Chris Mason has been doing a lot of work to bring data 
and ordered journaling to reiserfs 3.6.x and is working on porting it to 
2.5.x currently, does it look like this will be able to make it into 
2.6/3.0?

4) I believe there were some reiserfs 3.6.x changes which went into 
2.4.20-pre after the new block allocator, are these changes going to be 
applied to the 2.5.x tree as well?

Thanks for any information about the above and sorry if this mail was 
kind of long.

Jordan Breeding

