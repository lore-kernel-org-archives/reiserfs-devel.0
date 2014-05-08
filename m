From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH 0/2] libaal: add device "discard" operation.
Date: Thu,  8 May 2014 23:13:22 +0400
Message-ID: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=4Z7rzqZSWAkfkmCUQbr1lZ/epobDlQm6ulG5bNmlY1E=;
        b=s+stSiYQmhlp9SgUszXEa7v8mI1CEHjHZpuHTsF3SBad1SD//MyRAqQJdhm4gdgPlT
         g4hh1C7M17pUI/V3EFRi+ZwALG/baIU4Wl3AyGMHUVhqLoaDQ9ea0ufP4gch1oJNQe4i
         9rB0XdXLC+cBqgesfdrk0uidKGo8i6up44qtHCjrNjixBzesANVLVQuZR7QmDaq4APYa
         gnxBpu2SwQftlS5v68y+M5H+3z4kt975RetQVcNl5WyZra5jihWdi+Z1W5Vi8OeFYmI5
         94tkasgPgD76wHid5mN+XvRhR4LjOzbiSM85hjXXyJLacldyjP8fUytfgJDGLL4w8hly
         ralw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This implements device discard functionality in libaal to be used
by mkfs and friends.

Note that the build system is _not_ regenerated, so the direct result of
applying these patches won't build.

Ivan Shapovalov (2):
  configure.in: check for fallocate() and related headers.
  Add aal_device_discard() function and implement it for file-based
    device.

 configure.in         |  4 +--
 include/aal/device.h |  4 +++
 include/aal/types.h  |  3 +++
 src/device.c         | 15 +++++++++++
 src/file.c           | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 98 insertions(+), 2 deletions(-)

-- 
1.9.2

