From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser4 Logical Volumes. Mirrors and Failover
Date: Sun, 20 Nov 2016 12:58:50 +0100
Message-ID: <58318FFA.6090806@gmail.com>
References: <57E7026B.20001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=9Cyzvs26m3RAy5WF0A9FAhxi7jVb1cAqW/T0Ho56jyQ=;
        b=ArylpLLg0ufG7eG5hoXP9tw562MaGgrFuokyMJ52ppNBoOfsy9ha6Q3yH/CIKTbC4B
         NtmDu+2MaFZOHTpWJqdwGbDjLQiRVQ6J8fXhmKnhcFhhUX7rOZru+O3npvxfEfT1Oo+z
         NoLlkeO8u4fyIAVww+69ahM/DZJ08hDcDi6+PDNNOegT+eIGCOnSwQ9xjJZHSrs18XUf
         AAG4qPR/eENItbyXdxfZYbEbLQd68Q8jq4KNoRZNwugc+ksxwORr6ddQ24DsO8GPA1gX
         IF8CQz5dpK/BqApHsVz2lC7GQbRfT4kir92ZgS+cqMLPk4YTHlDJTJlKz0IyMRzbBbb5
         MJSw==
In-Reply-To: <57E7026B.20001@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>

On 09/25/2016 12:47 AM, Edward Shishkin wrote:
> Logical Volumes
>
>
> Reiser4 will support logical (compound) volumes. For now we have
> implemented the simplest ones - mirrors. As a supplement to existing
> checksums it will provide a failover - an important feature, which
> will reduce number of cases when your volume needs to be repaired by
> fsck.
>
> Reiser4 subvolume is a component of logical volume. Subvolume is
> always associated with a physical, or logical (built of RAID, LVM,
> etc means) block device. Every subvolume possesses:
>
> . volume ID;
> . subvolume ID;
> . mirror ID;
> . number of replicas.
>
> mirror ID is a serial number from 0 till 65535. Subvolume with mirror
> ID 0 has a special name - original. Other ones are called replicas.
> We use to say "original A has a replica B" (or "B replicates A",
> which is the same), iff A and B possess the same subvolume ID.
> Original with all its replicas are called "mirrors".
>
> For subvolumes we have introduced a special disk format plugin
> "format41". In accordance with Reiser4 development model it means
> forward incompatibility. We have introduced it intentionally, for
> protection. Indeed, for clear reasons users must not have possibility
> to RW-mount separate replicas (without originals).
> The multi-device extension is backward compatible: all volumes of the
> old format (format40) are supported as logical volumes composed of
> only one (original) subvolume.
>
>
>            Registration and activation of subvolumes
>
>
> For now every Reiser4 logical volume has only one original subvolume.
> Number of replicas can be 0, or more. Logical volume can be mount
> by usual mount command. Simply specify any its subvolume (the
> original, or some its replica). The only condition is that original
> and all its replicas should be registered in the system. If original,
> or some its replica are not registered, then mount will fail with a
> respective kernel message.
>
> Currently there is no tool to register specified subvolume (TBD).
> However, mount command always tries to register the specified device.
> The registration policy is "sticky". It means that your device won't
> be unregistered after umount, as well as failed mount. (You will be
> able to unregister it mandatory by a special tool - TBD).
>
> Procedure of registration reads the master super-block of the
> subvolume and puts the subvolume header to a specilal list of
> registered subvolumes.
>
> Mounting a logical volume activates all its registered components.
> Procedure of activation reads format super-block of the subvolume, and
> performs other actions like initialization of space maps, transaction
> replay, etc. as specified by the method ->init_format() of respective
> disk format plugin. Pointer to an activated subvolume is placed to a
> special table of active subvolumes.
>
>
>                        Mirror operations
>
>
> So original and mirrors actually represent RAID0 on the filesystem
> level.
>
> COMMENT. We aren't engaged in marketing fraud on collecting all
> features of the block layer's RAID and LVM. Reiser4 mirrors implement
> a failover, that block layers's RAID0 is not able to provide.
>
> It will be possible to "upgrade", or "downgrade" a reiser4 array of
> mirrors by attaching / detaching online one, or more replicas by
> special user-space tools (mirror.reiser4, TBD). Also by those tools it
> will be possible to swap original with any its replica, or make a new
> original from any replica, if the old one is lost for some reasons.
>
> Fsck will refuse to check/repir replica. Fsck is supposed to work only
> with original subvolumes. After mounting an fsck-ed original, kernel
> will automatically run a special on-line backgroud procedure (scrub)
> in order to synchronize the repaired original with all its replicas.
>
> Once in a while user has to check his array of mirrors by running
> scrub in the background mode.
>
> WARNING: Bear in mind once and forever: Replica is not a backup!!!
>
>
>                        Technical Notes
>
>
> 1. Reiser4 Transaction Design document is transferred to logical
> volumes without any modifications, but with a small addition. Atom is
> now composed of per-subvolume components.
>
> 2. By design all mirrors differ only in mirror-IDs which are stored in
> master super-block. Format super-blocks of mirrors are identical. This
> approach provides best performance and full parallelism in issuing IO
> requests for mirrors. The minus is a small compromise in design,
> according to which master super-block doesn't participate in
> transactions. It means that mirror operations on upgrading/degrading/
> swapping can not spawn usual transactions, which can be committed
> and (re)played using existing transaction manager. That is, mirror
> operations won't survive a system crash. If a system crash happens
> during a mirror operation, then the mirror structure should be
> checked/fixed offline by the mirror tools (kernel will refuse to mount
> unchecked array of mirrors). Fortunately, all critical mirror
> operations issue small number of IO requests, so that probability of
> their interruption is close to zero.
>
> 3. We don't commit transactions on all mirrors, only on the original
> subvolume (this is the single functional difference of original and
> its replicas). Transaction (re)play, of course, is going on all
> mirrors using the wandering maps/blocks of the original subvolume.
>
>
>                    How to test the new features
>
>
> Checkout branch "format41" of the upstream reiser4 and reiser4progs
> git repos on https://github.com/edward6 Build and install as usual.
>
> Mirrors can be created by mkfs.reiser4 option -m. If this option is
> specified, then the first listed device will be the original, other
> ones - replicas. All devices of an array should have the same size.
> Further we'll avoid that restriction.
>
> IMPORTANT: when creating mirrors specify node41 plugin (with checksum
> support). Otherwise, your mirrors won't be more useful than block
> layer's RAID0.
>
> Register all your mirrors, trying to "mount" them one-by-one in any
> order. If you have N mirrors (i.e. one original and N-1 replicas),
> then first N-1 mount commands will fail. Of course, it is not too
> graceful, but this is temporal solution. The N-th "attempt" should
> succeed. Have a fun. Unmount as usual.
>
>
>                            Example
>
>
> Suppose we have 2 partitions /dev/sda7 and /dev/sda8 of equal
> size. Let's create an array of 2 mirrors:
>
> # mkfs.reiser4 -my -o node=node41 /dev/sda7 /dev/sda8
>
> Take a look at original subvolume:
>
> # debugfs.reiser4 /dev/sda7
>
> Take a look at replica:
>
> # debugfs.reiser4 /dev/sda8
>
> Find differences ;)
>
> Register the original subvolume
>
> # mount /dev/sda7 /mnt
> mount: wrong fs type, bad option, bad superblock blablabla....
> # dmesg
> reiser4[mount(20914)]: check_active_replicas 
> (fs/reiser4/init_volume.c:268)[edward-1750]:
> WARNING: /dev/sda7 requires replicas, which are not registered.
>
> Register the replica and mount the array:
>
> #mount /dev/sda8 /mnt
> #dmesg
>
> reiser4: registered subvolume (/dev/sda8)
> reiser4 (sda8): found disk format 4.0.1.
> reiser4 (/dev/sda7): using Hybrid Transaction Model.
>
> Let's copy a file /etc/services to our array of mirrors:
>
> # cp /etc/services /mnt/.
>
> Unmount the array:
>
> # umount /mnt
>
> Find a root block: it goes the first in the tree dump:
>
> # debugfs.reiser4 -t /dev/sda7
>
> In our case the root block has blocknumber #79
>
> Let's now take a look on how our failover works. The death defying
> act: we erase the root block of the original subvolume:
>
> # dd if=/dev/zero of=/dev/sda7 bs=4096 count=1 seek=79
>
> We know that the mount procedure load the root block. Let's try to
> mount our array with the corrupted root block:
>
> # mount /dev/sda8 /mnt
>
> Everything works..
> Take a look at kernel messages:
>
> # dmesg
> reiser4[mount(21224)]: parse_node41 
> (fs/reiser4/plugin/node/node41.c:79)[edward-1645]:
> WARNING: block 79 (/dev/sda7): bad checksum. Please, scrub the volume.
>
>
>                              TODO
>
>
> 1) Mirror tools (upgrade/downgrade a mirror array, swap original and
>     specified replica, convert replica to an original, visualization 
> of mirror
>     arrays, etc);
> 2) Scrub (online background checking and synchronizaton of mirrors);
> 3) Checksumming format super-block;
> 4) Issuing discard requests for replicas on SSD devices.
>
> All items are very simple to implement. If anyone cares, then I'll
> provide details.
>
>


So the latest update is that we don't need online scrub: this feature
is inherent to badly designed file systems.

Instead we provide transparent (on the fly) failover. That is, in the
case of IO error (because of death of device, etc), or if checksum
verification failed (because of bitrot, etc), reiser4 immediately
issues IO requests against replica devices.

Thus, the latest version of TODO list includes the following items:

1. Implementation of Mirror Tools (upgrade/downgrade/synchronize a
    mirror array, swap original and specified replica, convert replica
    to an original, visualization of mirror arrays, etc);

2. Checksumming format super-block and bitmap blocks;

3. Issuing discard requests for replicas on SSD devices.

4. Testing.

    a) Testing overall stability of format41:
       Create a mirrored volume and perform usual stressing by fsx,
       stress.sh, dbench, etc.

    b) Testing the feature of failover:
       Create a mirrored volume and emulate data corruption and death
       of devices under some workload. To emulate data corruption use
       dd to fill metadata blocks with zeros. To emulate death of
       devices, simply create one or more mirrors on USB sticks and
       remove them during heavy IO activity.

Thanks,
Edward.


