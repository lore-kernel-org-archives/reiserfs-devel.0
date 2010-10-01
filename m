From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: fsck.reiser4 does not fix corruption
Date: Fri, 1 Oct 2010 06:32:15 +0200
Message-ID: <201010010632.16078.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:subject:date:user-agent
         :mime-version:to:content-type:content-transfer-encoding:message-id;
        bh=s/in8NJCBf4r7xdzn6PurMNXCeV5yD4WGiU+t78F7Bk=;
        b=HetKzennufE9BRqqXHuIdm2kiTlHzg8n3KrpS8i6blQ1XJi5pDo4vIHt5WYWUfbAOf
         dm+KWUef/aLipavaWFjdmrhPOXq46MF0pDXoJYhuVrFcoN/1ahXU7Z0tT4xYrPpMTpBx
         iN6ZTRsJFVSeFoaedUdZWbBef4DzH6wQIo++8=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

Hi,

I used 2.6.35 and after some BUG messages in dmesg appeared, I went bac=
k to=20
2.6.34. The damage was done, I did not want to make it worse.

fsck found errors and recommended running it with --build.fs

I did.

Afterwards I got this:

299.844055] reiser4[mlnet(2712)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[  299.844060] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?
[  299.844126] reiser4[mlnet(2712)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[  299.844130] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?
[  328.076637] reiser4[file(2740)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[  328.076641] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?
[  328.077674] reiser4[less(2733)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[  328.077679] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?
[  328.077806] reiser4[less(2733)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[  328.077810] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?

I run fsck again:

fsck.reiser4 --fix /dev/md3
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

=46scking the /dev/md3 block device.                                   =
                                                                       =
                       =20
Will fix minor corruptions of the Reiser4 SuperBlock.                  =
                                                                       =
                     =20
Will fix minor corruptions of the Reiser4 FileSystem.                  =
                                                                       =
                     =20
Continue?                                                              =
                                                                       =
                     =20
(Yes/No): Yes
***** fsck.reiser4 started at Wed Sep 29 21:32:22 2010
Reiser4 fs was detected on /dev/md3.                                   =
                                                                       =
                     =20
Master super block (16):=20
magic:          ReIsEr4=20
blksize:        4096=20
format:         0x0 (format40)=20
uuid:           740b0c92-ca44-4e73-8b0f-9e592947f177=20
label:          <none>=20
=20
=46ormat super block (17):=20
plugin:         format40=20
description:    Disk-format plugin.=20
version:        0=20
magic:          ReIsEr40FoRmAt=20
mkfs id:        0x40eea310=20
flushes:        0=20
blocks:         210953472=20
free blocks:    63198340=20
root block:     203394053=20
tail policy:    0x2 (smart)=20
next oid:       0xa8a637=20
file count:     1460992=20
tree height:    6=20
key policy:     LARGE=20
=20
=20
CHECKING THE STORAGE TREE                                              =
                                                                       =
                     =20
        Read nodes 38125202                                            =
                                                                       =
                     =20
        Nodes left in the tree 38125202=20
                Leaves of them 37668676, Twigs of them 449202=20
        Time interval: Wed Sep 29 21:33:07 2010 - Wed Sep 29 22:41:05 2=
010=20
CHECKING EXTENT REGIONS.                                               =
                                                                       =
         =20
        Read twigs 449202                                              =
                                                                       =
         =20
        Time interval: Wed Sep 29 22:41:05 2010 - Wed Sep 29 23:05:17 2=
010=20
CHECKING THE SEMANTIC TREE                                             =
                                                                       =
         =20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9037f7:6b646577616c6c:9e52e9] (ccreg40), node [107285699], item [0]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:626974746f7272:a8a629] (ccreg40), node [107356238], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:64697265637463:a8a62e] (ccreg40), node [107356238], item [3]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:646f6e6b65792e:a8a628] (ccreg40), node [107356256], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:646f776e6c6f61:a8a61c] (ccreg40), node [107366117], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:66617374747261:a8a62b] (ccreg40), node [107366121], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:66696c6554502e:a8a62a] (ccreg40), node [107366121], item [3]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:66696c65732e69:a8a622] (ccreg40), node [107826314], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:667269656e6473:a8a624] (ccreg40), node [107826314], item [6]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:676e7574656c6c:a8a62d] (ccreg40), node [107826315], item [3]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:676e7574656c6c:a8a62c] (ccreg40), node [107826315], item [2]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:6f6e6c696e6573:904276] (ccreg40), node [107820544], item [2]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:73656172636865:a8a623] (ccreg40), node [107820544], item [4]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:73657276657273:a8a625] (ccreg40), node [107820544], item [6]). =
=20
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (107356236)=
, item=20
(18), [9041b5:7368617265645f:a8a626] (stat40): wrong bytes (1331200), F=
ixed to
(0).=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:17368617265645f:a8a61e] (ccreg40), node [20383895], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:73746174697374:a8a627] (ccreg40), node [107890282], item [1]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:73746174732e69:a8a61f] (ccreg40), node [107890282], item [3]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:73746174735f62:a8a621] (ccreg40), node [107890282], item [5]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:73746174735f6d:a8a620] (ccreg40), node [107890282], item [7]). =
=20
=46SCK: ccreg40_repair.c: 66: ccreg40_check_item: Found unprepped disk =
cluster                                                                =
           =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[9041b5:75736572732e69:a8a61d] (ccreg40), node [107833440], item [1]). =
=20
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (187761743)=
, item=20
(31), [8aa6b9:35333536443444:8e9fa0] (stat40): wrong bytes (172032), Fi=
xed to
(0).=20
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (187761743), ite=
m (31),=20
[8aa6b9:35333536443444:8e9fa0] (stat40): wrong size (171143), Fixed to =
(0).=20
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (187761743)=
, item=20
(32), [8aa6b9:35334132323236:8fdbb5] (stat40): wrong bytes (327680), Fi=
xed to
(0).=20
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (187761743), ite=
m (32),=20
[8aa6b9:35334132323236:8fdbb5] (stat40): wrong size (325122), Fixed to =
(0).=20
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (187761743)=
, item=20
(33), [8aa6b9:35334339303934:8ec2e7] (stat40): wrong bytes (8355840), F=
ixed to
(0).=20
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (187761743), ite=
m (33),=20
[8aa6b9:35334339303934:8ec2e7] (stat40): wrong size (8352691), Fixed to=
 (0).
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (187761743)=
, item=20
(34), [8aa6b9:35334346423332:8d3687] (stat40): wrong bytes (413696), Fi=
xed to
(0).=20
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (187761743), ite=
m (34),=20
[8aa6b9:35334346423332:8d3687] (stat40): wrong size (412494), Fixed to =
(0).=20
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (187761743)=
, item=20
(38), [8aa6b9:35334530433135:8e9fa1] (stat40): wrong bytes (626688), Fi=
xed to
(0).=20
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (187761743), ite=
m (38),=20
[8aa6b9:35334530433135:8e9fa1] (stat40): wrong size (623467), Fixed to =
(0).=20
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (187761743)=
, item=20
(39), [8aa6b9:35334638433931:8db91d] (stat40): wrong bytes (2056192), F=
ixed to
(0).=20
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (187761743), ite=
m (39),=20
[8aa6b9:35334638433931:8db91d] (stat40): wrong size (2053519), Fixed to=
 (0).
=46SCK: ccreg40_repair.c: 73: ccreg40_check_item: Found item with wrong=
 cluster=20
shift 0, should be 16                                                  =
  =20
=46SCK: ccreg40_repair.c: 98: ccreg40_check_item: (file=20
[8aa6b9:35343035323043:8f4769] (ccreg40), node [751678], item [0]). =20
=46SCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file=20
[6158d:16f70656e535553:4e2cca] (ccreg40): the cluster at [363397120] of=
fset=20
65536 bytes long
is corrupted. Removed.=20
        Found 1469098 objects (some could be encountered more then once=
).                                                                     =
         =20
        Time interval: Wed Sep 29 23:05:17 2010 - Thu Sep 30 00:12:56 2=
010=20
=46SCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and r=
eally used=20
block bitmap differ.                                                   =
=20
***** fsck.reiser4 finished at Thu Sep 30 00:12:56 2010
Closing fs...done

23 fatal corruptions were detected in FileSystem. Run with --build-fs o=
ption=20
to fix them.

energy ~ # fsck.reiser4 --build-fs /dev/md3
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

=46scking the /dev/md3 block device.                                   =
                                                                       =
           =20
Will check the consistency of the Reiser4 SuperBlock.                  =
                                                                       =
         =20
Will build the Reiser4 FileSystem.                                     =
                                                                       =
         =20
Continue?                                                              =
                                                                       =
         =20
(Yes/No): Yes
***** fsck.reiser4 started at Thu Sep 30 06:37:11 2010
Reiser4 fs was detected on /dev/md3.                                   =
                                                                       =
         =20
Master super block (16):=20
magic:          ReIsEr4=20
blksize:        4096=20
format:         0x0 (format40)=20
uuid:           740b0c92-ca44-4e73-8b0f-9e592947f177=20
label:          <none>=20
=20
=46ormat super block (17):=20
plugin:         format40=20
description:    Disk-format plugin.=20
version:        0=20
magic:          ReIsEr40FoRmAt=20
mkfs id:        0x40eea310=20
flushes:        0=20
blocks:         210953472=20
free blocks:    63198340=20
root block:     203394053=20
tail policy:    0x2 (smart)=20
next oid:       0xa8a637=20
file count:     1460992=20
tree height:    6=20
key policy:     LARGE=20
=20
=20
CHECKING THE STORAGE TREE                                              =
                                                                       =
         =20
        Read nodes 38125202                                            =
                                                                       =
         =20
        Nodes left in the tree 38125202=20
                Leaves of them 37668676, Twigs of them 449202=20
        Time interval: Thu Sep 30 06:38:01 2010 - Thu Sep 30 07:37:03 2=
010=20
CHECKING EXTENT REGIONS.                                               =
                                                                       =
         =20
        Read twigs 449202                                              =
                                                                       =
         =20
        Time interval: Thu Sep 30 07:37:03 2010 - Thu Sep 30 08:01:21 2=
010=20
LOOKING FOR UNCONNECTED NODES                                          =
                                                                       =
         =20
=46SCK: node.c: 108: repair_node_items_check: Node (189713135), items (=
44) and=20
(45): Wrong order of keys.                                             =
   =20
        Read nodes 1                                                   =
                                                                       =
         =20
        Good nodes 0=20
                Leaves of them 0, Twigs of them 0=20
        Time interval: Thu Sep 30 08:01:26 2010 - Thu Sep 30 08:01:26 2=
010=20
***** fsck.reiser4 finished at Thu Sep 30 08:01:26 2010
Closing fs...done

=46S is consistent.

and:

[75577.618768] reiser4: md3: found disk format 4.0.0.
[75664.731984] reiser4[cat(1669)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[75664.731988] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?
[75664.732040] reiser4[cat(1669)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[75664.732044] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?

and a third time:

 umount /mnt/data=20
energy ~ # fsck.reiser4 --build-fs /dev/md3
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

=46scking the /dev/md3 block device.                                   =
                                                                       =
           =20
Will check the consistency of the Reiser4 SuperBlock.                  =
                                                                       =
         =20
Will build the Reiser4 FileSystem.                                     =
                                                                       =
         =20
Continue?                                                              =
                                                                       =
         =20
(Yes/No): Yes
***** fsck.reiser4 started at Thu Sep 30 18:46:11 2010
Reiser4 fs was detected on /dev/md3.                                   =
                                                                       =
         =20
Master super block (16):=20
magic:          ReIsEr4=20
blksize:        4096=20
format:         0x0 (format40)=20
uuid:           740b0c92-ca44-4e73-8b0f-9e592947f177=20
label:          <none>=20
=20
=46ormat super block (17):=20
plugin:         format40=20
description:    Disk-format plugin.=20
version:        0=20
magic:          ReIsEr40FoRmAt=20
mkfs id:        0x40eea310=20
flushes:        0=20
blocks:         210953472=20
free blocks:    63198340=20
root block:     203394053=20
tail policy:    0x2 (smart)=20
next oid:       0xa8a637=20
file count:     1460992=20
tree height:    6=20
key policy:     LARGE=20
=20
=20
CHECKING THE STORAGE TREE                                              =
                                                                       =
         =20
        Read nodes 38125202                                            =
                                                                       =
         =20
        Nodes left in the tree 38125202=20
                Leaves of them 37668676, Twigs of them 449202=20
        Time interval: Thu Sep 30 18:46:57 2010 - Thu Sep 30 19:46:14 2=
010=20
CHECKING EXTENT REGIONS.                                               =
                                                                       =
         =20
        Read twigs 449202                                              =
                                                                       =
         =20
        Time interval: Thu Sep 30 19:46:14 2010 - Thu Sep 30 20:11:28 2=
010=20
LOOKING FOR UNCONNECTED NODES                                          =
                                                                       =
         =20
=46SCK: node.c: 108: repair_node_items_check: Node (189713135), items (=
44) and=20
(45): Wrong order of keys.                                             =
   =20
        Read nodes 1                                                   =
                                                                       =
         =20
        Good nodes 0=20
                Leaves of them 0, Twigs of them 0=20
        Time interval: Thu Sep 30 20:11:34 2010 - Thu Sep 30 20:11:34 2=
010=20
***** fsck.reiser4 finished at Thu Sep 30 20:11:34 2010
Closing fs...done

=46S is consistent.

energy ~ # mount /mnt/data                                             =
               =20

82392.412972] reiser4: md3: found disk format 4.0.0.
[82891.509317] reiser4[cat(22737)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[82891.509321] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?
[82891.509382] reiser4[cat(22737)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[82891.509386] WARNING: orphan unprepped cluster 0 (inode 11052572). Fs=
ck?


reiser4progs 1.0.7 with a build patch for gcc 4.4 + the patch from here=
:
http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2

md3 is a raid5 of 3 disks, which behaved normally until the 2.6.35 exce=
rcise.

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
