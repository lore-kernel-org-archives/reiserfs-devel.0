From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Reiser4 for 3.11
Date: Fri, 06 Sep 2013 09:36:39 +0400
Message-ID: <3473565.3piOE8Lf58@intelfx-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding:content-type;
        bh=23rgdGL0+WXdoF4hHBt1O1ujEVo6i9Hyo+P+BKQ0+MM=;
        b=B+qbL6ZrgqNGoxw3i56NAHj4dvsyqA9SCQHGuG7x5qGM+9LpYWHWOTacvr2cOOiYcz
         IyjIP8FkF2bS2/xzTyfFUofbfEOzHKi1cUH7ofT8iyLUCbLBCF7k3utfS+njrBiV1ktD
         U0DJ+oBb0UDiL9Cj03HDoNoH1AgfTxQxXwznbo4ECps44w+AXZYJeHHT0qo/XAGUQ82l
         KWdDBwLtSPtKsAQD+FTPE0zG46JQKrg6y7CBnlqfzp1naD/aY/vNBC1n9Lnr5vumZA2Z
         kOYbauI4jH5ygHcJp6RmOUO3Kvt4cNythvLsTgqAajadcFV+sF4e4rx4fv1CMSy21jlH
         M6jQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi Edward!

I'm sorry for the silence... The summer, as it usually happens, turned out to 
be not-easier-than-studying-days (personal life and all), so unfortunately 
there is not much progress with TRIM implementation for reiser4. There is some 
code, but it's stability is zero.

Anyway, here is my usual attempt to port reiser4 to next kernel. 3.11 got a 
significant API change (readdir() of file_operations changed to iterate()), 
and I'm unsure if I done that correctly. But it works, unlike TRIM. :)

(FYI, iterate() differs from readdir() mostly in that it works with a copy of 
f_pos instead of with f->f_pos directly.)

Thanks,
Ivan

