From: Matias Seco <matias.jose.seco@gmail.com>
Subject: Plugin Option Settings
Date: Mon, 21 Nov 2011 19:22:19 +0100
Message-ID: <CAMjNLwq-5SS=Z3EoGseGLHwBO+rcCV55zq1K5F6dXzfCUSv8JA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=255jgQ7/vXkHLhwGJB+647bK7tkhOUQXpvhCKD1d9oU=;
        b=nOYwia3I8IIJ714ZVdTYK/KAPiYZ4hN6VMQkWoFgyPoiVNsaX2VAg1bdDD37V2vuvG
         oC/EU0c4Nq2Sn+cn8OuDgRJwiGJ+y8nxwYIrD9ZQ14i+UlNoLuVqkwrNWHVHNP07O5OD
         9dOnsghj/4A+IWFo2OFOP5wNSbVcE/udmvl78=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

I've wanted to ask an information about the plugin options:
I've noted that default plugins setting listed over mkfs.reiser4 -p,
dont include all different kinds of settable plugins types (id's: 0x1,
0x2, 0x6, 0x7, 0x8, 0x9, 0xa)
For most of them it probably be because there is one option: but for
0x1 and 0x6, what are there behavior?
1 - we can avoid setting them ?
2 - there changes from time to time, depending on other settings ?
3 - there dfefault set is not listed?

Greetings
