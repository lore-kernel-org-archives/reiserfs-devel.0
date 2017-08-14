From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4: Data striping support
Date: Mon, 14 Aug 2017 16:22:10 +0200
Message-ID: <d6ed76c6-66f6-0759-571b-e16a026bf6fd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=l/PP0wspLWKNuSkukysRGO3pExkHlvDGuNRb/10+jqM=;
        b=nASpDELdxPhw9wEOW6AuRePY3gaZLD3DJzO5F4yipmN9AYtnyOuLOjc6Wj8irAB7fC
         8Ztz78UUN/1695Zut/Fp2Deziqmpw3aaE4jgO5P3x08IKlhkGZEzcQMFicLHa1MPZtKu
         TNqxKKW1hNXzUpMR1ZgcuvgWvQQZq7EbdabgCn0nqrIl0OQsvv+NEOah1U4pR8qw5Zwp
         IDTqnFHCduXHrqVAnFkhB/ZkCSKeHkTQdNAz4bNnTuyRc134kJkhkpmuVc6wOhQ51l0C
         d6UkCuGOJO8WlYD5KQKS+0ftAdDAcShfULvZ41aadOh8Sl7gqXp4zbRp/cUg+sN8Mvhf
         q+YA==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>



                     Data striping in Reiser4


Now we support data striping. In terms of Reiser4 it means not
merging extent items at stripe boundaries. Stripe in Reiser4 is a
distribution unit. Whereas block is an allocation unit. Therefore,
stripe size can not be smaller than block size and is always a
multiple of block size.

Stripe size in Reiser4 is determined per logical (or simple volume).
We support only stripes of size which is power of 2. Logarithm of
stripe size in bytes is stored in Reiser4 master super-block. User can
specify it by mkfs option "-t", or "--stripe-bits". For example, if
you want stripe size 4M, then use "-t 22". By default stripes are not
supported and master super-block contains 0 in the field "stripe_bits"
(it doesn't mean stripe size (1 << 0) = 1 byte!). Alternatively you
can think of it as of stripes of infinite size.

We enabled data striping by simple modifications of existing extent
item plugin (there is no a need to add one more item plugin). Reiser4
with stripe support is available in the branch "format41". Also to
create volumes with stripe support use branch "format41" of
reiser4progs repo at https://github.com/edward6/

Example.

Let's create a volume with 4M data stripes:

# mkfs.reiser4 -t 22 -o vol=asym,create=reg40,formatting=extents /dev/sdb5

Create a 1G file on our volume:

# mount /dev/sdb5 /mnt/
# dd if=/dev/zero of=/mnt/file bs=1M count=1000
# sync

Take a look at the volume:

# umount /mnt
# debugfs.reiser4 -t /dev/sdb5 | less


NODE (256039) LEVEL=3 ITEMS=2 SPACE=3976 MKFS ID=0xd3f7d0b FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [25]
------------------------------------------------------------------------------
#1  NPTR (nodeptr40): [2a:4(FB):0:10000:3c800000] OFF=36, LEN=8, 
flags=0x0 [247846]
==============================================================================
NODE (25) LEVEL=2 ITEMS=2 SPACE=0 MKFS ID=0xd3f7d0b FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [26]
------------------------------------------------------------------------------
#1  EXTENT (extent40): [2a:4(FB):0:10000:0] OFF=36, LEN=3984, flags=0x0
UNITS=249 [27(1024) 1051(1024) 2075(1024) 3099(1024) 4123(1024) 
5147(1024) 6171(1024)

....

==============================================================================
NODE (26) LEVEL=1 ITEMS=3 SPACE=3652 MKFS ID=0xd3f7d0b FLUSH=0x0

....

==============================================================================
NODE (247846) LEVEL=2 ITEMS=1 SPACE=3902 MKFS ID=0xd3f7d0b FLUSH=0x0
#0  EXTENT (extent40): [2a:4(FB):0:10000:3c800000] OFF=28, LEN=128, 
flags=0x0
UNITS=8 [247847(1024) 248871(1024) 249895(1024) 250919(1024) 
251943(1024) 252967(1024)
253991(1024) 255015(1024)]
==============================================================================

As we can see, our file has been chopped into 4M-stripes.

Let's now overwrite first 1M of our file:

# mount /dev/sdb5 /mnt/
# dd if=/dev/zero of=/mnt/file bs=1M count=1 conv=notrunc

And take a look at the result:

# umount /mnt
# debugfs.reiser4 -t /dev/sdb5 | less


NODE (23) LEVEL=3 ITEMS=2 SPACE=3976 MKFS ID=0xd3f7d0b FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
------------------------------------------------------------------------------
#1  NPTR (nodeptr40): [2a:4(FB):0:10000:1800000] OFF=36, LEN=8, 
flags=0x0 [256297]
==============================================================================
NODE (24) LEVEL=2 ITEMS=2 SPACE=3872 MKFS ID=0xd3f7d0b FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [256040]
------------------------------------------------------------------------------
#1  EXTENT (extent40): [2a:4(FB):0:10000:0] OFF=36, LEN=112, flags=0x0
UNITS=7 [256041(256) 283(768) 1051(1024) 2075(1024) 3099(1024) 
4123(1024) 5147(1024)]
==============================================================================
NODE (256040) LEVEL=1 ITEMS=3 SPACE=3652 MKFS ID=0xd3f7d0b FLUSH=0x0

....

==============================================================================
NODE (256297) LEVEL=2 ITEMS=1 SPACE=14 MKFS ID=0xd3f7d0b FLUSH=0x0
#0  EXTENT (extent40): [2a:4(FB):0:10000:1800000] OFF=28, LEN=4016, 
flags=0x0
UNITS=251 [6171(1024) 7195(1024) 8219(1024) 9243(1024) 10267(1024) 
11291(1024)
....

==============================================================================

As we can see, according to default transaction model, first 1M of
file's data got relocated, so that the first data stripe was split
into 2 extents: first extents of 256 blocks got new location (with the
beginning in the block 256041. And the second extent consists of 768
untouched blocks with the beginning in 283.

NOTE: We don't support meta-data striping for now.

WARNING: for testing only! Don't put important data to volumes with
data striping support.

Thanks,
Edward.

