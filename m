From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: I/O Errors
Date: Tue, 28 Sep 2004 19:02:01 +0400
Message-ID: <41597CE9.9020401@namesys.com>
References: <20040928002645.19446.qmail@web80810.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21948-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040928002645.19446.qmail@web80810.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: f00bar <f00bar@sbcglobal.net>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

Hello.

Would you please send us the #pvscan, #pvdisplay, #vgdislpay, 
#lvdisplay  and  #lvs --version outputs.

Thanks,
Lena.
 
f00bar wrote:

>Hi Alex,
>
>Thanks for your assistance.
>
>When I mount the partition, (actually a logical
>volume) the following is written to syslog.
>
>Sep 27 19:17:32 yin-yang ef_hash_table: 8192 buckets
>Sep 27 19:17:32 yin-yang z_hash_table: 8192 buckets
>Sep 27 19:17:32 yin-yang z_hash_table: 8192 buckets
>Sep 27 19:17:32 yin-yang j_hash_table: 16384 buckets
>Sep 27 19:17:32 yin-yang loading reiser4
>bitmap......done (148 jiffies)
>Sep 27 19:17:32 yin-yang d_cursor_hash_table: 256
>buckets
>
>
>I perform an "ls" the following is written to the
>console (I assume stderr) but nothing is written to
>syslog.
>
>ls: reading directory /var/tmp/portage: Input/output
>error
>total 0
>
>
>
>The following is the output from fsck:
>
>yin-yang log # fsck.reiser4 /dev/vgsdc1/reiser4
>*******************************************************************
>This is an EXPERIMENTAL version of fsck.reiser4. Read
>README first.
>*******************************************************************
>
>Fscking the /dev/vgsdc1/reiser4 block device.
>Will check the consistency of the Reiser4 SuperBlock.
>Will check the consistency of the Reiser4 FileSystem.
>Continue?
>(Yes/No): yes
>***** fsck.reiser4 started at Mon Sep 27 19:23:14 2004
>Reiser4 journal (journal40) on /dev/vgsdc1/reiser4: 0
>transactions replayed of the total 0 blocks.
>Reiser4 fs was detected on /dev/vgsdc1/reiser4.
>Master super block (16):
>magic:          ReIsEr4
>blksize:        4096
>format:         0x0 (format40)
>uuid:           3581757c-9576-4ed6-ba21-59863d2950b1
>label:          <none>
>
>Format super block (17):
>plugin:         format40
>description:    Disk-format for reiser4, ver.
>1.0.2-pre1
>magic:          ReIsEr40FoRmAt
>flushes:        0
>mkfs id:        0x4e9bfc27
>blocks:         553984
>free blocks:    553937
>root block:     23
>tail policy:    0x2 (smart)
>next oid:       0x10000
>file count:     0
>tree height:    2
>key policy:     LARGE
>
>
>CHECKING STORAGE TREE
>        Read nodes 2
>        Nodes left in the tree 2
>                Leaves of them 1, Twigs of them 1
>        Time interval: Mon Sep 27 19:23:14 2004 - Mon
>Sep 27 19:23:14 2004
>CHECKING EXTENT REGIONS.
>        Read twigs 1
>        Time interval: Mon Sep 27 19:23:14 2004 - Mon
>Sep 27 19:23:14 2004
>CHECKING SEMANTIC TREE
>        Found 1 objects.
>        Time interval: Mon Sep 27 19:23:14 2004 - Mon
>Sep 27 19:23:14 2004
>***** fsck.reiser4 finished at Mon Sep 27 19:23:14
>2004
>Closing fs...done
>
>FS is consistent.
>
>Regards,
>John Baxter
>
>
>
>  
>


