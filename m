From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [Testing Error] xfstests generic/130 - xfs_io vector read/write and
 trunc tests. modified from cxfsqa tests
Date: Fri, 5 Dec 2014 20:06:59 +0100
Message-ID: <CADW=+3m=VfWWwi4E1y0kJM99ejxOCY31upzbs79nw_1Jp-dqnA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=U/2umk7d8WMlebi2CySlOlUY9106xIK6stQeRnRUFoA=;
        b=TJo12cIsChUenbbGZV7+Rpxti9zcNQYpbcZDeiRli7ZSMYSzkBF369dPV5pIeMpSTx
         F63IwZHB9O5kGUsa7XwUpCYbLfaq+v7ERK9Mk8+HuYNGfqDsPPp2noVmRMDOfawohntT
         NZK5i3U8j8piZPGhW3NctjJxqMfy/CRe5coFJr7ZEGSzMsyYRB/xaVCp3rroiW8OJ2Za
         vx5+RRn+P1i2SyfyG7YQbg+L4HJ304O9I4MulHXy4+ZLmaWvbSy9S3NBUQf9QC5YBiC3
         g+gbdqSspiaNyoiuK+aiLETjdBpAABU9fBUuTYl/Z6TLxwOx3tzeKvaMIJpz80rs2ts3
         gYfw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

This test worked under ccreg40 but is stuck in D state under reg40 plug=
in.

Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=
=3Dblob;f=3Dtests/generic/130;
Patch: reiser4-for-3.16.2.patch
Extra mount options: none
Extra mkfs options: -o create=3Dreg40

=46SQA Test No. 130

xfs_io vector read/write and trunc tests. modified from cxfsqa tests
 - unixfile_basic_block_hole
- unixfile_buffer_direct_coherency
 - unixfile_direct_rw
 - unixfile_eof_direct
 - unixfile_fsb_edge
 - unixfile_open_append
 - unixfile_open_trunc
 - unixfile_small_vector_async_rw
 - unixfile_small_vector_sync_rw



root     31079  0.0  0.3   2844  1592 pts/1    D+   20:22   0:00
/usr/sbin/xfs_io -f -s -c pread -v 0 1 -c pread -v 1 1 -c pread -v 2 1
-c pread -v 3 1 -c pread -v 4 1 -c pread -v 5 1 -c pread -v 6 1 -c
pread -v 7 1 -c pread -v 8 1 -c pread -v 9 1 -c pread -v 10 1 -c pread
-v 11 1 -c pread -v 12 1 -c pread -v 13 13 -c pwrite -S 0x61 4090 1 -c
pwrite -S 0x62 4091 1 -c pwrite -S 0x63 4092 1 -c pwrite -S 0x64 4093
1 -c pwrite -S 0x65 4094 1 -c pwrite -S 0x66 4095 1 -c pwrite -S 0x67
4096 1 -c pwrite -S 0x68 4097 1 -c pwrite -S 0x69 4098 1 -c pwrite -S
0x6A 4099 1 -c pwrite -S 0x6B 4100 1 -c pwrite -S 0x6C 4101 1 -c
pwrite -S 0x6D 4102 1 -c pwrite -S 0x6E 4103 1 -c pwrite -S 0x6F 4104
1 -c pwrite -S 0x70 4105 1 -c pread -v 4090 4 -c pread -v 4094 4 -c
pread -v 4098 4 -c pread -v 4102 4 -c pwrite -S 0x61 10000000000 1 -c
pwrite -S 0x62 10000000001 1 -c pwrite -S 0x63 10000000002 1 -c pwrite
-S 0x64 10000000003 1 -c pwrite -S 0x65 10000000004 1 -c pwrite -S
0x66 10000000005 1 -c pwrite -S 0x67 10000000006 1 -c pwrite -S 0x68
10000000007 1 -c pwrite -S 0x69 10000000008 1 -c pwrite -S 0x6A
10000000009 1 -c pwrite -S 0x6B 10000000010 1 -c pwrite -S 0x6C
10000000011 1 -c pwrite -S 0x6D 10000000012 1 -c pwrite -S 0x6E
10000000013 1 -c pwrite -S 0x6F 10000000014 1 -c pwrite -S 0x70
10000000015 1 -c pread -v 10000000000 4 -c pread -v 10000000004 4 -c
pread -v 10000000008 4 -c pread -v 10000000012 4
/mnt/scratch/small_vector_async


On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
> I managed to get xfstests  (
> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3Dt=
ree ) to
> run on Reiser4 partition. Test for async, acl, quota still don't work=
 but a
> lot of the rest finishes successfully.
> Tests were run on reiser4-for-3.16.2.patch
> I'll post unsuccessful tests and their results in following e-mails.
>
> Dushan
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
