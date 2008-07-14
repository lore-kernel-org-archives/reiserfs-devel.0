From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Mon, 14 Jul 2008 23:39:06 +1000 (EST)
Message-ID: <13503.202.168.22.19.1216042746.squirrel@webmail.velocity.net.au>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>
    <485FAF96.40608@suse.com>
    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
    <48610B80.3020908@suse.com>
    <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>
    <48626E1B.6070604@suse.com>
    <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>
    <4866575D.1000305@suse.com>
    <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au>
    <4867DC31.2030702@suse.com>
    <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au>
    <4868F3C8.2090006@suse.com>
    <20253.202.168.22.19.1215615647.squirrel@webmail.velocity.net.au>
    <4874D51A.7020909@suse.com>
    <24383.202.168.22.19.1215703298.squirrel@webmail.velocity.net.au>
    <4876301A.6020208@suse.com>
    <27342.202.168.22.19.1215840119.squirrel@webmail .velocity.net.au>
    <84BA00E0-5BA8-41A3-9C7C-54723058D7F6@suse.com>
    <23441.202.168.22.19.1215958910.squirrel@webmail.velocity.net.au>
    <487A34B1.5010309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <487A34B1.5010309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>

Hello,
Thanks for all the tips from Jeff, Edward and Christian.
I used the following commands to make a reiser4 partition on a unformatted
/dev/sda

# mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sda -fy
# fsck.reiser4 --fix /dev/sda -y
# mkdir /reiser4
# mount -t reiser4 /dev/sda /reiser4

Other output notes, shows:
-------------------------
# modprobe -v  reiser4
insmod
/lib/modules/2.6.25.9-0.2-default/kernel/lib/zlib_deflate/zlib_deflate.ko
insmod /lib/modules/2.6.25.9-0.2-default/kernel/lib/lzo/lzo_compress.ko
insmod /lib/modules/2.6.25.9-0.2-default/kernel/lib/lzo/lzo_decompress.ko
insmod /lib/modules/2.6.25.9-0.2-default/weak-updates/reiser4.ko

# fsck.reiser4 --fix /dev/sda -y
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda block device.
Will fix minor corruptions of the Reiser4 SuperBlock.
Will fix minor corruptions of the Reiser4 FileSystem.
***** fsck.reiser4 started at Mon Jul 14 22:40:14 2008
Reiser4 fs was detected on /dev/sda.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           68060169-f8c4-4b80-9e04-38372aabf266
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        0
magic:          ReIsEr40FoRmAt
mkfs id:        0x2cebf3b
flushes:        0
blocks:         122096640
free blocks:    122092867
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     1
tree height:    2
key policy:     LARGE


CHECKING THE STORAGE TREE
        Read nodes 2
        Nodes left in the tree 2
                Leaves of them 1, Twigs of them 1
        Time interval: Mon Jul 14 22:40:40 2008 - Mon Jul 14 22:40:40 2008
CHECKING EXTENT REGIONS.
        Read twigs 1
        Time interval: Mon Jul 14 22:40:40 2008 - Mon Jul 14 22:40:40 2008
CHECKING THE SEMANTIC TREE
        Found 1 objects (some could be encountered more then once).
        Time interval: Mon Jul 14 22:40:40 2008 - Mon Jul 14 22:40:40 2008
***** fsck.reiser4 finished at Mon Jul 14 22:40:40 2008
Closing fs...done

FS is consistent.

On unmounting the filesystem I'll use:
# umount /dev/sda

I can do some basic file tests, I'll post the results.
Cheers Glenn


