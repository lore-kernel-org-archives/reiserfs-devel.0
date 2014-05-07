From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.14
Date: Wed, 07 May 2014 23:48:45 +0200
Message-ID: <536AAA3D.5020008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=tfwBKuthOedogHihw9W3P+4aj9YaiHQVTabQe6JyXKg=;
        b=k4u6igWt8NQ860bLA0EoJoDV87fQXs7bpP+YVv2O8OEtarbaHHJp+bk3sVdVlU2Uaj
         cNsSR1kyep2KHDiJ3qQHeTpy4UW7yWeOu5XP4eHZit5lmXFVsda4SAvmvKO5LwruDUNw
         ZYwlpYhvymJR/Ht9mIeznqNPRtgEi6fvFp6FqAowLfkfK5Dh1mDK/oOnLYPqrlXMz9PP
         xPkgFSEbCzB1n0RbSHWw3c+QakncTRSAf2NVoH0J65Ko/7g71PucEIsUtYYqbGGov8Ye
         xBIi1SuN1ZpX5OFdhTgyDgNf5iz/kUA4sGUz4xbGrztbRdLNWON4USW3jwHPp2QZyTZy
         ShPw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Changes since reiser4-for-3.13:

Mathieu Belanger:
. Port for 3.14

Edward Shishkin:
. Add different transaction models

Now, when mounting your reiser4 partition, choose a suitable transaction 
model:

1. Mount option: "txmod=journal"
     Description: Classic journalling (like in ReiserFS(v3), Ext4, XFS, 
etc.)
     Intended: For users, who experienced degradation of reiser4 volumes 
on HDD drives
                     because of external fragmentation.
     Default: No

2. Mount option: "txmod=wa"
     Description: Classic Write-Anywhere aka Copy-on-Write (like in 
WAFL, ZFS, etc.)
     Intended: For SSD users
     Default: No

3. Mount option: "txmod=hybrid"
     Description: Hybrid transaction model
     Intended: For HDD users, who don't perform a lot of random overwrites
     Default: Yes

More details at: http://marc.info/?l=reiserfs-devel&m=139449965000686&w=2

Please, find at 
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.
