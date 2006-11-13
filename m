From: Enrico Cavalli <cavalli@cilea.it>
Subject: kernel oops with 10T filesystem
Date: Mon, 13 Nov 2006 14:09:11 +0100
Message-ID: <1163423352.5434.59.camel@cavalli-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello, we are getting random kernel opps with a 10T reiserfs (v 3.6)

The filesystem is mounted from a FC controller. We exclude hardware
problems at the moment. Another machine works on a 11T fs without any
apparent problems.

We are using linux 2.6.18.1, on debian 3.1.

FC driver is qla2300 from qlogic.

This is what I see in logs

BUG: unable to handle kernel paging request at virtual address 07b5f4df
 printing eip:
c01a7828
*pde = 00000000
Oops: 0002 [#1]
SMP
Modules linked in: xt_tcpudp xt_state iptable_filter iptable_nat ip_nat
ip_tables x_tables ipv6 8250 serial_core dm_mod qla2300 qla2xxx
qla2xxx_conf intermodule ip_conntrack_ftp ip_conntrack
CPU:    0
EIP:    0060:[<c01a7828>]    Tainted: GF     VLI
EFLAGS: 00010287   (2.6.18.1 #2)
EIP is at cleanup_bitmap_list+0x53/0xa7
eax: 07b5f4df   ebx: f8d3e000   ecx: f8d3e0d0   edx: cfb9d248
esi: 07b5f4d7   edi: 00002c90   ebp: f8d3e0fc   esp: d5631d40
ds: 007b   es: 007b   ss: 0068
Process umount (pid: 5879, ti=d5630000 task=c6b10a70 task.ti=d5630000)
Stack: d5f3ee00 eef7e440 eef7e440 00000002 d5f3ee00 c01a7cde 00000001
c01a86fa
       00001000 00000705 f6db1f58 00000000 00000803 00000000 ddc2f000
000007f1
       00000100 00000000 00000000 f8d3e000 00000001 


This is a debugreisers output.


 debugreiserfs /dev/sde
debugreiserfs 3.6.19 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x840 of format 3.6 with standard
journal
Count of blocks on the device: 2441871360
Number of bitmaps: 8984
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 2265270265
Root block: 10606881
Filesystem is NOT clean
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x7efbef9d]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 13972
UUID: <no libuuid installed>
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

Also, if I try reiserfsck I get this error:

###########
reiserfsck --check started at Mon Nov 13 13:05:01 2006
###########
Replaying journal..
Reiserfs journal '/dev/sde' in blocks [18..8211]: 0 transactions
replayed
reiserfs_open_ondisk_bitmap: wrong either bitmaps number,
count of blocks or blocksize, run with --rebuild-sb to fix it
reiserfsck: Could not open bitmap

Problem persists even if I use the --rebuild-sb switch. (This happens
also on the twin machine that works correctly).

What can It be? I would be grateful if someone could give me any usefulf
hint.

Best regards,


-- 
Enrico Cavalli
CILEA - via R. Sanzio 4, 20090 - Segrate (MI), Italy
phone: +39 02 26995.1 - fax: +39 02 2135520 - skype: enricocavalli
PGP Fingerprint: 3762 7B1B 743E 029C 8F94  8ADE BC4B 43A7 0485 30E5

