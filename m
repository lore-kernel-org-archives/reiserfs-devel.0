From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [ANNOUNCE] Reiser4 (meta)data checksums
Date: Sun, 16 Aug 2015 15:21:53 +0200
Message-ID: <55D08E71.5080802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=GuYtaFNk/auEXBl5SCWJ59PbzT8CdHbBS6exLgiWbNM=;
        b=y/Lie2rThbDrttC3C8fl+FKHzrGt6hJXHvZIR+snRj7O7V81EzMTrgGmtumB91stRC
         vkBVTuyZoeTvO+boztSlwisiSaYZVXrIhx6yckjAgJxRid7tCXEPvFGfIS0dN6vUTjxH
         nC+pbcDXBZMrXsH/kUS5zexHB9edKpjwKX7PuBo77+9PhqdfBIbMQ3800j7SsFJmDlWb
         x9kIyI+oVs/XdCvdjVxxDCv6Ig41EOfsGpx1xL3/KRfAd1rDyogKfWLCUdXRMPa7RsoL
         kbgkHsdiVgThykC2GVj6RGamoex2iSbtWKOG5bpCH/pYqq9txcmX5liYFxInABOulwqk
         VdOw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


                  Reiser4 (meta)data checksums


                   1. Why protect (meta)data?


We want to be protected against hardware problems such as data rot in
memory and decay of storage media. We want to be sure that our data
structures are consistent, because working with corrupted data
structures is dangerous.

Strictly speaking, such protection is not a business of a file system.
It would be more logical to assume that this is a business of the
upper and the lower subsystems. To be precisely, protection against
data rot in memory is a business of the memory controller, and
protection against decay of storage media is a business of the block
device controller/driver.

However, frequently the mentioned subsystems don't provide such
protection for various reasons. As the result the file system suffers
(becomes corrupted, inconsistent), and poor users start to blame file
system developers.


                   2. Why "inline" checksums?


Reiser4 stores per-node checksum right in the node that we want to
protect. This is much more efficient than using dedicated data
structures for checksums, as we don't need to launch expensive search
procedures every time when we need to access a checksum. Using
dedicated data structures to store checksums is a design mistake.


             3. When we check/update per-node checksums?


Let's start from protection against storage media decay. If someone
wants protection against data rot in memory, then let me know.

Since we implement protection against storage media decay, it is
enough to check [update] a checksum right after IO completion [before
submitting IO request]. We don't need to update a checksum after every
modification. So, updating checksums in Reiser4 is a delayed action.
Reiser4 updates per-node checksum at commit time right before writing
the node to disk. At the moment of checksum update any process
modifying this node will be blocked on an attempt to acquire an
exclusive access:

longterm_lock_znode -> try_capture_block

Thus, updated checksum won't be "spoiled" before hitting the disk.

Checksum verification is going right after read IO completion in the
->parse() method of node plugin.


                    4. How we handle corruptions


If node's checksum verification failed, them further working with such
node is dangerous. Currently user has 2 options for online handling
this situation:

1) kernel panic (default behavior);
2) remount reiser4 partition as read-only (if mount option
    "onerror=remount-ro" was specified).
In both cases user should repair his partition offline by fsck.

TODO: Online failover mode is in plans.

For this mode we need to support mirror(s). Every in-memory replica
gets updated at the moment of the checksum update. At the finish of
transaction commit all replicas have to be written to the mirror.
If checksum verification failed, then we issue a read IO request for
the replica block of the mirror.
Comment. Mirrors can be internal (when we allocate replicas on the
same partition) and external (when we allocate replicas on different
device).


                 5. Why use crc32c for checksums?


Modern CPUs have instructions, which allow to compute a full 32-bit
CRC step in 3 cycles.


                      6. How to protect data?


Currently we don't support checksums for unformatted blocks, where
bodies of large files are stored.
If you want to protect your data (not only metadata), then you have
3 options:

1) Make sure that reiser4 stores bodies of your files in fragments

(i.e. "inline" data chunks). Fragments are always stored in formatted
nodes, which are protected by checksums.

It is possible with mkfs option "formatting=tails" for files managed
by unix_file plugin (if you don't use compression) or
"compressMode=latt" for files managed by cryptcompress plugin (if you
use compression).

NOTE. This option will lead to performance degradation (especially for
delete operations).

2) Protect your data by yourself.

If a file system guarantees consistency of metadata, then data
protection can be successfuly implemented in the user-space. Indeed,
since file body is uniquely determined by extent pointers, which are
guaranteed to be consistent, then checking consistency of the file's
body in user space is always a correct operation. So, feel free to
check your data in the user-space: we have provided basis for this.

3) Implement checksums for unformatted nodes in reiser4.

This option requires a new format for extent pointers (which will
include a 32-bit field for checksum), and, respectively, a new item
plugin (extent-pointer-with-checksum, or so).


          7. How to enable checksum support in reiser4


Specify mkfs.reiser4 option "-o node=node41" when formatting your
partition and mount as usual. We recommend to use mount option
"onerror=remount-ro", so reiser4 won't panic on failed checksum
verification.


              8. Compatibility with other features


Checksums are compatible with all reiser4 features.

Adding a checksum support is a great example of how reiser4 resists
the problem of creeping featurism. We just added a new node plugin,
which manages nodes of a new format (node41) with a 32-bit field for
the checksum. The new plugin mostly reuses methods of the old one
(node40) as you can see from the following patches:

http://marc.info/?l=reiserfs-devel&m=142359111509525&w=2
http://marc.info/?l=reiserfs-devel&m=142359112409527&w=2


                            9. TODO


A. Failover via mirroring (see section 4 for implementation hints).

B. Maintain checksums for the superblock and bitmap blocks.

Comment. We already have such support for bitmap blocks, however, it
uses adler32 and checksums update/verification is not invoked for some
historical reasons. I suggest to replace adler32 with crc32c and
trigger the update/verification.

Comment. For superblock protection we need to add a 32-bit field to
the disk superblock and update/verify it like in the case of formatted
nodes.

