From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-5.12
Date: Wed, 7 Apr 2021 23:15:58 +0200
Message-ID: <e3a3910f-6ae4-833f-e6c5-f560597cb2e1@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tx47fhbhPlWUeE59U3Ur/v3UUGiiFnso4iDnaPxAMm0=;
        b=CC2CWx3YmR4W9Bzs1AhlV5ZRJnb2iCY0EVltkmBZRu797rf7qOTZsLxU6a/pXKMPvo
         hY4/M6lFpSG1DkYRf9zSSQD+8VOGb2Y7BuVvXeXi/1iK5ycKVu7e92u8kI4KzkGLW8DW
         c6E4wowhI4FIiPwVlpmTANZBbPt7CeLHVBREu4/bDWef0Ck0kWH2AZtWCUezG7LTbqgE
         LVkMPzX3rW7Lh7YmAtUJoRan+Uu35KMAgevke+2XANaG5TObWul38MoNA6iM/4b5cskw
         vy05hCB2jOsUvys8JgaO066u3w1H5AbNg6NEIPynUd0J6UEy/pqb9Ne8QIbWCH5NmQ7o
         YmTA==
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

5.11 -> 5.12:

. Implement ->read_iter(), get rid of deprecated ->read() file operation
. Port for Linux-5.12
   . Macro BIO_MAX_PAGES has gone;
   . The following methods got a new argument struct user_namespace *:
     . reiser4_setattr_common
     . reiser4_getattr_common
     . reiser4_create_common
     . reiser4_symlink_common
     . reiser4_mkdir_common
     . reiser4_mknod_common
     . reiser4_permission_common
     . reiser4_rename2_common

Find at
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/
