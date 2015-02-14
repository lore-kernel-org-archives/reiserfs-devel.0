From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [xfstests/generic/083] Warning: setattr_truncate (fs/reiser4/plugin/file/file.c:2597)[vs-1588]:
Date: Sat, 14 Feb 2015 11:54:22 +0100
Message-ID: <CADW=+3mSS+Haod3OzdS0dv8odjyn9RgJ_fZxRQkEqGcMsQGGvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Wx/B3j9pWBJbh75fe4rG6n8wHRMVUDifVfNbBxKThyo=;
        b=hfBLPZX4JQd7O/aEFjyb2m5o5OotC3SWFWOYAlr4x3nsh18mbZNUJHKnT8oErqjVup
         NT9cDmIFo9xAEy1Z1zW70qavbgFc+al6Kig7YHoP8oVaaesBGb+Glcsy4y8mgnN+BRbp
         wHK5J/mZfpSTh/qAhoX+soegyLWCllmaSmBHUXvVP/OLQvYc8efQlHz+SJJRO3OeCcl4
         hLVDfPOsNjp8GkTLRWmAYA79jK2xloCwyyRCF51PlIKKPsH7pUS6TR8yUABeqzm491R5
         x3roSvRwsgJ/g3Mltqk4S1R/KbH55SsDgejvnX8Bva9xsOU1r/Sv0vokF8bxb3y8KbZD
         0yZQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

When running [1] xfstests/generic/083 test [3] on ccreg40 partition
under reiser4 3.18.6 I get a lot of  warnings[2] when disk gets full
during test:


[1]:
reiser4 xfstests # ./check -s r4Hybrid 'generic/083'
SECTION       -- r4Hybrid
FSTYP         -- reiser4
PLATFORM      -- Linux/i686 reiser4 3.18.6
MKFS_OPTIONS  -- -o create=reg40 /dev/hda7
MOUNT_OPTIONS -- -o noatime /dev/hda7 /mnt/scratch

[2]:
Feb 14 13:46:06 reiser4 kernel: WARNING: truncate_file failed: oid 67772, old si
ze 0, new size 855601, retval -28
Feb 14 13:46:08 reiser4 kernel: reiser4[fsstress(1318)]: setattr_truncate (fs/re
iser4/plugin/file/file.c:2597)[vs-1588]:

[3]:

 FS QA Test No. 083

Exercise filesystem full behaviour - run numerous fsstress
processes in write mode on a small filesystem.

http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git;a=blob;f=tests/generic/083;hb=HEAD

Have a nice day

Dushan
