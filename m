From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [FEATURE][PATCH 0/2] reiser4: Auto-punching holes on commit
Date: Sun, 19 Jul 2015 23:42:33 +0800
Message-ID: <55ABC569.3040009@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030501090208050001060309"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=aeW7m6Kh2AafRVxjWbjfWc1SKszNPR0eg31cpy94qTI=;
        b=NZ7+laeUxhkH+ALFA07nTkgwwjwdOJ9G9tzN04FgpLUUEWLtEmZqZrodHArPV19i3N
         Kb/oJCJWHeR2dZZVM9Rzw6V/UWAo1T9EkbnFpOZuvJYQVZI83lCypWJGhbbuHYV4CR3y
         D4AyAWhi3I4Co0s0B2mprXrXr8fZyHXsWLON/as0/tjD5htYKqYxdwVDzFEylpZ5CDmJ
         uqmn8PCAGX+ZiS+xmzB/jwar1ad42bUc5oVibHhsL7bJGRpEX5oWv48UIdw6wDJNCZt2
         jFZPoORPIf3fw5K9j6o4jEylqVhjDbBWI/r7CuJMYdDJ1pMfPw0JGT51luSL94gLPMcT
         CBOw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030501090208050001060309
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


                    Auto-punching holes on commit


Storing zeros on disk is a rather stupid business. Indeed, right before
writing data to disk we can convert zeros to holes (this is abstract
objects described in POSIX), and, hence, save a lot of disk space.

Compressing zeros before storing them on disk is even more stupid
business: checking for zeros is less expensive procedure than
compression transform, so in addition we can save a lot of CPU
resources.

I'll remind how reiser4 implements holes.
The unix file plugin represents them via extent pointers marked by
some special way. The situation with cryptcompress file plugin is more
simple: it represents holes as literal holes (that is, absence of any
items of specific keys). It means that we can simply check and remove
all items, which represent a logical chunk filled with zeros. This is
exactly what we do now at flush time right before commit.

The best time for such check is atom's flush, which is to complete all
delayed actions. Specifically, it calls a static machine ->convert_node()
for all dirty formatted nodes. This machine scans all items of a node
and calls ->convert() method of every such item.

We used this framework for transparent compression on commit
(specifically to replace old fragments that compose compressed file's
body with the new ones). Now we use it also to punch holes at logical
chunks filled with zeros. That is, instead of replacing old items, we
just remove them from tree. Think of hole punching like of one more
delayed action.

I have implemented hole punching only for cryptcompress plugin. It also
can be implemented for "classic" unix-file plugin, which doesn't compress
data. However, it will be more complicated because of more complicated
format of holes. Finally, I think that having such feature only for one
file plugin is enough.


                           Solved Problems:


When flushing modified dirty pages, the process should be able to find
in the tree a respective item group to be replaced with new data. So we
should handle possible races when one process checks/creates the items
and the flushing process deletes those items during hole punching
procedure. To avoid this situation we maintain a special "economical"
counter of checked-in modifications for every logical cluster in struct
jnode. If the counter is greater than 1, then we simply don't punch a
hole.


                    Mount option "dont_punch_holes"


Since hole punching is useful feature for both HDD and SSD, I enabled it
by default. To turn it off use the mount option "dont_punch_holes". The
changes are backward and forward compatible, so no new format is needed.


                      How it looks on practice:


# mkfs.reiser4 -f -y /dev/sdaX
# mount /dev/sdaX /mnt
# dd if=/dev/zero of=/mnt/foo bs=65536 count=1000
# umount /mnt

Now dump the tree:

# debugfs.reiser4 -t /dev/sdaX | less

As we can see (attachment 1) the file foo doesn't have body, only stat-data
(on-disk inode): we removed its body at flush time, because it is composed
of zeros (see my remark above about holes). Let's now append non-zero
data to our file "foo":

# mount /dev/sdaX /mnt
# echo "This is not zeros" >> /mnt/foo
# umount /mnt
# debugfs.reiser4 -t /dev/sdaX | less

As we can see (attachment 2) the body of the file "foo" now consists of only
one item of length 59, which has offset 0x3e80000 (=65536000). This is 
exactly
the string "This is not zeros" supplemented with zeros up to page size 
(4096)
and compressed by LZO1 algorithm.


*******************************************************************************

NOTE: with the feature of hole auto-punching some benchmarks won't produce
any visible IO load.

********************************************************************************


                    WARNING   WARNING   WARNING:

This is only for testing.  Don't use it for important data for now!

********************************************************************************

If something goes wrong, then please let me know.

Thanks,
Edward.


--------------030501090208050001060309
Content-Type: application/x-troff-man;
 name="sda7.1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sda7.1"

NODE (25) LEVEL=2 ITEMS=1 SPACE=4022 MKFS ID=0x640e84e7 FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
==============================================================================
NODE (24) LEVEL=1 ITEMS=3 SPACE=3642 MKFS ID=0x640e84e7 FLUSH=0x0
...
------------------------------------------------------------------------------
#1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=122, LEN=152, flags=0x0
NR(3)  NAME              OFFSET HASH                              SDKEY             
  0 .                    80 0000000000000000:0000000000000000 0000291:000002a
  1 ..                   104 0000000000000000:0000000000000000 0000291:000002a
  2 foo                  128 0000000000000000:0000000000000000 00002a1:0010000
------------------------------------------------------------------------------
#2  SD (stat40): [2a:1(SD):666f6f00000000:10000:0] OFF=274, LEN=66, flags=0x0
...
==============================================================================

--------------030501090208050001060309
Content-Type: application/x-troff-man;
 name="sda7.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sda7.2"

NODE (25) LEVEL=2 ITEMS=1 SPACE=4022 MKFS ID=0x640e84e7 FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
==============================================================================
NODE (24) LEVEL=1 ITEMS=4 SPACE=3545 MKFS ID=0x640e84e7 FLUSH=0x0
#0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
...
------------------------------------------------------------------------------
#1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=122, LEN=152, flags=0x0
NR(3)  NAME                                  OFFSET HASH                              SDKEY             
  0 .                                         80 0000000000000000:0000000000000000 0000291:000002a
  1 ..                                       104 0000000000000000:0000000000000000 0000291:000002a
  2 foo                                      128 0000000000000000:0000000000000000 00002a1:0010000
------------------------------------------------------------------------------
#2  SD (stat40): [2a:1(SD):666f6f00000000:10000:0] OFF=274, LEN=66, flags=0x0
...
------------------------------------------------------------------------------
#3  CTAIL (ctail40): [2a:4(FB):666f6f00000000:10000:3e80000] OFF=340, LEN=59, flags=0x0 shift=16
==============================================================================

--------------030501090208050001060309--
