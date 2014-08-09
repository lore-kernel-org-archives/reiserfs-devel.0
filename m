From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4: discard support with delayed issuing of discard requests
Date: Sun, 10 Aug 2014 01:00:01 +0200
Message-ID: <53E6A7F1.6030006@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=d5W+ZQ7yaAX2sA0pFooLNG1FHLlq6sGcFfOO1bdciOg=;
        b=wQvI4pH/kcHKesejylbUjudMuBguytBuRICAmPOJp2voSSy3awmKlFFrHbNtYhG75z
         5hrRtkGjIJhUI9N32Ad3h+kMVlhn8niC5suPOIIm4FBhg+sreha1OJow6Kg9QHiG5HkY
         rOBBbV9ltiyBZhV2hp5mayTt7Fk4PherJOkDO0zhg1iNwZhX2yO9ib3jFuHflbPaPr1m
         NDuEboP2lrcg0ItEEyuxOoLBAoLf6XyE0G71axx15RRrZ+YcqPgxKlM2utXiIMXXyVWl
         cg5O4r30SCF9mt7niykN8ERYHA8TEaVhKxg35Qv1NYyzFP3dfH7vUSmw/7NDj4Fg2jUq
         vkIQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Hello everyone,

Ivan Shapovalov kindly implemented discard support for us.

Now SSD users can mount their reiser4 partitions with the option
"discard" and the file system will issue discard requests to inform
the device that blocks are not longer used.

In reiser4 issuing discard requests is a delayed action (like many
other actions including block allocation, compression, etc). It means
that discard requests are accumulated as the release of blocks and
issued as background process after issuing of all other usual
requests.

Such delayed technique allows to issue discard requests of better
quality, because the discard requests get merged in the process of
accumulation. Another advantage of the delayed discard is that the
"non-queued TRIM" is not a problem for us.


                     Implementation notes


Managing discard requests is a business of reiser4 transaction
manager. This is because blocks deallocation is a kind of events
which are tracked by the transaction manager. Deallocted extents
are captured by a respective transaction atom. At commit time all
the extents are sorted, merged and discarded right after overwriting
journalled blocks at their permanent location on disk. After issuing
the discard requests we complete the transaction by deallocating
respective blocks at working bitmap (which always resides in memory).
Thus, we guarantee consistency (nobody touches our extents before
discard completion). We don't record information about discard
extents in the journal. The worst thing that can happen after system
crash is missing a number of discard requests. It doesn't break
consistency of the file systems however. For such unpleasant
situations we'll provide support of FITRIM ioctl later.

Also in plans: garbage collection at the head and tail of every
extent to be discarded. The algorithms are complicated, however,
the game is worth the candle.
The patch against reiser4-for-3.15 can be found here:
http://sourceforge.net/projects/reiser4/files/patches/

WARNING: Don't use it for important data for now. Even in the case
of no visible problems, please, check your partition by fsck.reiser4
as frequently as possible. Report about found inconsistency.


                 Discard support in reiser4progs:


When formatting your SSD partition by mkfs.reiser4 use the option -d:
it will issue discard request for the whole partition before creating
reiser4 structure on it. This option is available in reiser4progs-1.0.9,
please find here:
http://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs

In order to build reiser4progs-1.0.9 you will need libaal-1.0.6,
please find here:
http://sourceforge.net/projects/reiser4/files/reiser4-utils/libaal

Thanks,
Edward.
