From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [xfstests/generic/224] read_some_cluster_pages (fs/reiser4/plugin/file/cryptcompress.c:2387)[edward-219]:WARNING:
 do_readpage_ctail failed
Date: Sat, 14 Feb 2015 18:09:03 +0100
Message-ID: <CADW=+3=-uRp38F=6QayantFYizMW7BpPuTOukcxWTP1dw_TfJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=KZ+ZjjyquxN3oE7zs/eJ0Amjpdk1KVJOO0yzWKHE8iM=;
        b=qnAXTFFKkolpiIZKCaOnNbPCYx+Fpjeojh7r0vQmxWVEi5zI9V/+i6zOxrZfz/Vg/D
         dbsFRYQBU9R+GTosUUji0Y/31eYhon/q4iZSsUC04bbx22nv5sWAbUow9uJCHLvnAfHS
         JZ+S438CHsMTC9hl9UYVuyF0IszS3tKVDeect9fxgUHrnY5vf/hM+odkVUH4GFNo4HjO
         gbrIo6ELdiyIUTXd2C7YeBqwyExph3Q5HfdCgkbjKU56slX5W8fba0fl66KBLS+dnFBt
         00Cl5ZLe7PJ9riflLoCCHpLl+WGMSwja2Hlt6LbJS1kQ5Dlbd21O7mSFMYrlesWTeRsh
         ooEw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

When running [1] xfstests/generic/224 test [3] on ccreg40 partition
under reiser4 3.18.6 I get ~8  warnings[2] when disk is not full (~50% full)
in the begining of the test that lasts 3808s:

[1]:
reiser4 xfstests # ./check -s r4Hybrid -s r4ccHybrid 'generic/224'
SECTION       -- r4ccHybrid
FSTYP         -- reiser4
PLATFORM      -- Linux/i686 reiser4 3.18.6
MKFS_OPTIONS  -- /dev/hda7
MOUNT_OPTIONS -- -o noatime /dev/hda7 /mnt/scratch

[2]:
Feb 14 13:56:29 reiser4 kernel: reiser4[dd(12125)]:
read_some_cluster_pages (fs/
reiser4/plugin/file/cryptcompress.c:2387)[edward-219]:
Feb 14 13:56:29 reiser4 kernel: WARNING: do_readpage_ctail failed

[3]:

FS QA Test No. 224
Delayed allocation at ENOSPC test

http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git;a=blob;f=tests/generic/224;hb=HEAD

Test is probably not reaching full disk because R4 transparently
compresses test data.

Same test with reg40 plugin reaches 100% full and gives a lot of
different warnings [4]:

[4]:


Feb 14 19:15:47 reiser4 kernel: reiser4[xfs_io(4640)]:
setattr_truncate (fs/reiser4/plugin/file/file.c:2597)[vs-1588]:
Feb 14 19:15:47 reiser4 kernel: WARNING: truncate_file failed: oid
66530, old size 0, new size 10485760, retval -28

Feb 14 19:16:13 reiser4 kernel: reiser4[dd(8416)]: extent2tail
(fs/reiser4/plugin/file/tail_conversion.c:744)[nikita-2282]:
Feb 14 19:16:13 reiser4 kernel: WARNING: Partial conversion of 66525:
1 of 4: -28
Feb 14 19:16:13 reiser4 kernel: reiser4[dd(8416)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
Feb 14 19:16:13 reiser4 kernel: WARNING: Failed (-28) to convert in
release_unix_file (66525)

Have a nice day
Dushan
