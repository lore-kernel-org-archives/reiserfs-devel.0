From: evseenko@msiu.ru (Basil A. Evseenko)
Subject: reiserfs_read_inode2: dead inode read from disk
Date: 29 Apr 2002 15:13:35 +0400
Sender: svpcom@alone.msiu.ru
Message-ID: <x1w4rhuep0g.fsf@alone.msiu.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

clm-6004: convert tail failed inode 2300597, error -122
clm-6004: convert tail failed inode 2300597, error -122
clm-6004: convert tail failed inode 2300597, error -122
clm-6004: convert tail failed inode 2300597, error -122
clm-6004: convert tail failed inode 4563293, error -122
vs-13075: reiserfs_read_inode2: dead inode read from disk [3547658 9266355 0x0 SD]. This is likely to be race with knfsd. Ignore
vs-2100: add_save_link:search_by_key ([-1 9266355 0x1001 DIRECT]) returned 1
PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [3547658 9266355 0xfffffffffffffff DIRECT]
vs-5355: reiserfs_delete_solid_item: [3547658 9266355 0x0 SD] not found

Is this a bug, or a warning ?
This appear very seldom (approx. 1 time per month) on high filesystem load. 
(This is a NFS server, that share home directories to ~ 200 clients) 

Linux version 2.4.19-pre5 (root@home) (gcc version 2.95.3 20010315 (release)) #1 Sat Mar 30 14:26:43 MSK 2002
Reiserfs quota patch from ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/quota-2.4


processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 10
cpu MHz         : 1002.304
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 mmx fxsr sse
bogomips        : 1998.84

Module                  Size  Used by
nfs                    72640   0  (autoclean)
nfsd                   66800   8  (autoclean)
lockd                  48064   1  (autoclean) [nfs nfsd]
sunrpc                 59744   1  (autoclean) [nfs nfsd lockd]
eepro100               17184   1  (autoclean)

