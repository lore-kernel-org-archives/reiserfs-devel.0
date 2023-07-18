From: Manas Ghandat <ghandatmanas@gmail.com>
Subject: Fixing syzkaller bugs
Date: Tue, 18 Jul 2023 21:13:35 +0530
Message-ID: <59bb83c2-0914-7cee-c1d2-0360cdfbc0ee@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689695020; x=1692287020;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/koSxq77hSR24QtFVNS0QJ26GEEQWB8WVjlFvhSTls=;
        b=Y959R8Ksn6jMbz80d40aR+I/ovr/QQfOmKWpOZsCRg1h8EeUUrV4kKRgZAEoprEjWA
         lqwupVOb59uzvYMofQoxtvyjqkrh9X+U4rsmhzVc97sA5rqqbliUTvATfaNoH5EnEuU3
         +MvaK03sWhodR2X9jzN2O+Rw2XBhgxeNCweQ/f2gi9Z9k6zIuoQ5Tt7lACDExd0YJNYn
         sdGoHXMoLxvxc2sahFXIEIOke+ituT4EQ6xoV+854mPvCF79gHYsGxcIQuB6dxkM+HI8
         hWpWBIYNl6WH/SZBuIWRmF9A4wmx+dimSEgW8LyJw+RmzlN6UTdYA2Cm+Kgpwv/OBFLM
         rmsQ==
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

I was looking at the following bug 
https://syzkaller.appspot.com/bug?extid=5184326923f180b9d11a . Adding a 
null check at line 2556 of fix_node.c should fix this issue but i am 
unable to understand on how to call reiserfs_panic.
