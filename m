From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 10:52:35 +0200
Message-ID: <41343C53.3080507@dermichi.com>
References: <20040831012446.631CB15E2E@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040831012446.631CB15E2E@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: David Dabbs <david@dabbs.net>

>=20
> My pleasure. Thank /you/ for helping to debug!
>=20
*-*-*-*-*-*-*-*-*-*
if have a rather long answer this time, this is a test run i made today.=20
i wanted to include full details. i'm wondering if there is still=20
something these files have in common. first i created some test files on=20
a spare partition with "touch":
*-*-*-*-*-*-*-*-*-*

criminal tmp # ls -lha
total 1.5K
drwxr-xr-x   3 root root  20 31. Aug 10:28 .
drwxr-xr-x  12 root root 392 29. Aug 16:31 ..
-rw-r--r--   1 root root   0 31. Aug 10:23 123456789012345678901234=F6
-rw-r--r--   1 root root   0 31. Aug 10:23 123456789012345678901234=F6.doc
-rw-r--r--   1 root root   0 31. Aug 10:23 12345678901234567890123=F6
-rw-r--r--   1 root root   0 31. Aug 10:23 1234567890123456789012=F6
-rw-r--r--   1 root root   0 31. Aug 10:23 123456789012345678901=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 12345678901234567890=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 1234567890123456789=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 123456789012345678=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 12345678901234567=F6
-rw-r--r--   1 root root   0 31. Aug 10:26 1234567890123456=E4=F6=FClala.txt
-rw-r--r--   1 root root   0 31. Aug 10:20 1234567890123456=F6
-rw-r--r--   1 root root   0 31. Aug 10:20 123456789012345=F6
-rw-r--r--   1 root root   0 31. Aug 10:25 BewerbungF=FCrAnwaltsb=FC
-rw-r--r--   1 root root   0 31. Aug 10:21 BewerbungF=FCrAnwaltsb=FCro.doc
-rw-r--r--   1 root root   0 31. Aug 10:27 BewerbungF=FCrAnwaltsb=FCro.txt
-rw-r--r--   1 root root   0 31. Aug 10:28 Graphik01Markenidentit=F6t.txt
-rw-r--r--   1 root root   0 31. Aug 10:27 L=E4ssigerDa=E4eina=FCasd.sxd
-rw-r--r--   1 root root   0 31. Aug 10:20 asdfghjklqwertz=F6

*-*-*-*-*-*-*-*-*-*
with these filename-set fsck reported only 1 fatal corruption
*-*-*-*-*-*-*-*-*-*

criminal mnt # fsck.reiser4 /dev/sda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): y
***** fsck.reiser4 started at Tue Aug 31 10:31:22 2004
Reiser4 journal (journal40) on /dev/sda1: 0 transactions replayed of the=20
total 0 blocks.
Reiser4 fs was detected on /dev/sda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           d0373d79-949c-4de8-aa88-fed3eb9690f9
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 1.0.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x1b9004a9
blocks:         31271
free blocks:    31246
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10014
file count:     19
tree height:    2
key policy:     LARGE


CHECKING STORAGE TREE
         Read nodes 2
         Nodes left in the tree 2
                 Leaves of them 1, Twigs of them 1
         Time interval: Tue Aug 31 10:31:22 2004 - Tue Aug 31 10:31:22 2004
CHECKING EXTENT REGIONS.
         Read twigs 1
         Time interval: Tue Aug 31 10:31:22 2004 - Tue Aug 31 10:31:22 2004
CHECKING SEMANTIC TREE
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:20c8b16c855]. Should be
[2a:0(NAME):131323334353637:3839303132333435:20c8b1617a5].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [14]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:1689f9f584a0]. Should be
[2a:0(NAME):131323334353637:3839303132333435:1689f9f4d3f0].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [15]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:dc740ba51264c]. Should be
[2a:0(NAME):131323334353637:3839303132333435:9326977e040dc].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [16]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:5090910834f0e6c]. Should be
[2a:0(NAME):131323334353637:3839303132333435:50909105bd60cbc].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [17]: entry=20
has wrong offset
[2a:0(NAME):142657765726275:6e6746fc72416e77:135160352fe624]. Should be
[2a:0(NAME):142657765726275:6e6746fc72416e77:13514d8cfe19f4].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [18]: entry=20
has wrong offset
[2a:0(NAME):142657765726275:6e6746fc72416e77:13516035356e9b]. Should be
[2a:0(NAME):142657765726275:6e6746fc72416e77:13514d8d03a26b].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [19]: entry=20
has wrong offset
[2a:0(NAME):14772617068696b:30314d61726b656e:e284761c4e0e6f]. Should be
[2a:0(NAME):14772617068696b:30314d61726b656e:e284746a1afbdf].
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [20]: entry=20
has wrong offset
[2a:0(NAME):15769655465616d:73456666697a6965:36c5742b38d77b7b]. Should be
[2a:0(NAME):15769655465616d:73456666697a6965:36c56b59b94df8cb].
         Found 1 objects.
         Time interval: Tue Aug 31 10:31:22 2004 - Tue Aug 31 10:31:22 2004
***** fsck.reiser4 finished at Tue Aug 31 10:31:22 2004
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs=20
option to fix them.

*-*-*-*-*-*-*-*-*-*
I know that this 1 fatal corruption appeared after "touching" the=20
filename "BewerbungF=FCrAnwaltsb=FCro.doc", because i always did (touch;=20
umount; fsck.reiser4; mount; touch...). all other files did not seem to=20
cause fatal corruption. So i wanted to see of only this filename gets=20
moved to lost+found.
*-*-*-*-*-*-*-*-*-*

criminal mnt # fsck.reiser4 /dev/sda1 --build-fs
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): y
***** fsck.reiser4 started at Tue Aug 31 10:31:44 2004
Reiser4 journal (journal40) on /dev/sda1: 0 transactions replayed of the=20
total 0 blocks.
Reiser4 fs was detected on /dev/sda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           d0373d79-949c-4de8-aa88-fed3eb9690f9
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 1.0.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x1b9004a9
blocks:         31271
free blocks:    31246
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10014
file count:     19
tree height:    2
key policy:     LARGE


CHECKING STORAGE TREE
         Read nodes 2
         Nodes left in the tree 2
                 Leaves of them 1, Twigs of them 1
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
CHECKING EXTENT REGIONS.
         Read twigs 1
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
LOOKING FOR UNCONNECTED NODES
         Read nodes 0
         Good nodes 0
                 Leaves of them 0, Twigs of them 0
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
CHECKING EXTENT REGIONS.
         Read twigs 0
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
         Twigs: read 0, inserted 0, by item 0, empty 0
         Leaves: read 0, inserted 0, by item 0
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
CHECKING SEMANTIC TREE
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:20c8b16c855]. Should be
[2a:0(NAME):131323334353637:3839303132333435:20c8b1617a5]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:1689f9f584a0]. Should be
[2a:0(NAME):131323334353637:3839303132333435:1689f9f4d3f0]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:dc740ba51264c]. Should be
[2a:0(NAME):131323334353637:3839303132333435:9326977e040dc]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):131323334353637:3839303132333435:5090910834f0e6c]. Should be
[2a:0(NAME):131323334353637:3839303132333435:50909105bd60cbc]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):142657765726275:6e6746fc72416e77:135160352fe624]. Should be
[2a:0(NAME):142657765726275:6e6746fc72416e77:13514d8cfe19f4]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):142657765726275:6e6746fc72416e77:13516035356e9b]. Should be
[2a:0(NAME):142657765726275:6e6746fc72416e77:13514d8d03a26b]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):14772617068696b:30314d61726b656e:e284761c4e0e6f]. Should be
[2a:0(NAME):14772617068696b:30314d61726b656e:e284746a1afbdf]. Removed.
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [13]: entry=20
has wrong offset
[2a:0(NAME):15769655465616d:73456666697a6965:36c5742b38d77b7b]. Should be
[2a:0(NAME):15769655465616d:73456666697a6965:36c56b59b94df8cb]. Removed.
FSCK: Node (24), item (0), [29:0:2a] (stat40): wrong size (21), Fixed to=20
(13).
FSCK: Node (24), item (0), [29:0:2a] (stat40): wrong bytes (1278), Fixed=20
to (650).
FSCK: No 'lost+found' entry found. Building a new object with the key=20
2a:0:ffff.
FSCK: Failed to recognize the plugin for the directory [2a:0:ffff].
FSCK: Trying to recover the directory [2a:0:ffff] with the default=20
plugin--dir40.
FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new=20
one. Plugin dir40.
FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new=20
one. Plugin (dir40).
FSCK: Node (24), item (2), [2a:0:ffff] (stat40): wrong size (0), Fixed=20
to (1).
FSCK: Node (24), item (2), [2a:0:ffff] (stat40): wrong bytes (0), Fixed=20
to (50).
         Found 21 objects.
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
CLEANUPING STORAGE TREE
         Removed items 0
         Time interval: Tue Aug 31 10:31:45 2004 - Tue Aug 31 10:31:45 2004
***** fsck.reiser4 finished at Tue Aug 31 10:31:45 2004
Closing fs...done

FS is consistent.

*-*-*-*-*-*-*-*-*-*
OK, let's see which filenames were moved:
*-*-*-*-*-*-*-*-*-*

criminal tmp # ls -lha
total 2.0K
drwxr-xr-x   5 root root  14 31. Aug 10:29 .
drwxr-xr-x  12 root root 392 29. Aug 16:31 ..
-rw-r--r--   1 root root   0 31. Aug 10:23 1234567890123456789012=F6
-rw-r--r--   1 root root   0 31. Aug 10:23 123456789012345678901=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 12345678901234567890=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 1234567890123456789=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 123456789012345678=F6
-rw-r--r--   1 root root   0 31. Aug 10:22 12345678901234567=F6
-rw-r--r--   1 root root   0 31. Aug 10:20 1234567890123456=F6
-rw-r--r--   1 root root   0 31. Aug 10:20 123456789012345=F6
-rw-r--r--   1 root root   0 31. Aug 10:25 BewerbungF=FCrAnwaltsb=FC
-rw-r--r--   1 root root   0 31. Aug 10:27 L=E4ssigerDa=E4eina=FCasd.sxd
-rw-r--r--   1 root root   0 31. Aug 10:20 asdfghjklqwertz=F6
drwxr-xr-x   3 root root  10 31. Aug 10:31 lost+found

criminal tmp # ls lost+found/
lost_name_2a:131323334353637:1000b=FF=BF`o=FF=B7=EA=D3=E3=B7??=20
lost_name_2a:142657765726275:10004=FF=BF`o=FF=B7=EA=D3=E3=B7??
lost_name_2a:131323334353637:1000c=FF=BF`o=FF=B7=EA=D3=E3=B7??=20
lost_name_2a:142657765726275:10011=FF=BF`o=FF=B7=EA=D3=E3=B7??
lost_name_2a:131323334353637:1000d=FF=BF`o=FF=B7=EA=D3=E3=B7??=20
lost_name_2a:14772617068696b:10012=FF=BF`o=FF=B7=EA=D3=E3=B7??
lost_name_2a:131323334353637:1000f=FF=BF`o=FF=B7=EA=D3=E3=B7??=20
lost_name_2a:15769655465616d:10013=FF=BF`o=FF=B7=EA=D3=E3=B7??

*-*-*-*-*-*-*-*-*-*
Hey, 8 files are trash now! And look at the filenames in lost+found! I=20
can't even rm these files because they contain these weird characters...=20
So i guess i'll have to reformat.
*-*-*-*-*-*-*-*-*-*

Michael
