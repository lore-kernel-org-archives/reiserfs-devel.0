From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: reiser4 WARNING: discard atom failed (-95)
Date: Fri, 18 Sep 2015 16:38:39 +0200
Message-ID: <55FC21EF.6000804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=FkRuG/rNwCNF/EpzfsmoAEG9WFBjZb5tKQ5uH3BQJjk=;
        b=ap2c1todgQIGrONlllGv6x8tJ6sbrv1JOAJ6iKOE3Og15CTXulGHw0GMCFv2+Go+zf
         dP+5orNCuFV4HBF/ouovkk89MDH/C5gyW+uYmmlp9vx3pVY/0sPRyJ6FeZ5XGRca3DDr
         /UmDdN5OO8eaQGbl8KW50WLpt9BVpZMa5KD+XKZR3SRZD7QdaH6sRbU7SheUToh0ncGo
         mkn1Gf99eWHll7Z1pYtZqsAobFxO/R97mV/q1heoj8aM/Vbfch1rdV4v1OYZVV9wBnOK
         lFrVNziaP9AM2OpIlxiQ5EoaDvWQ4jPAXrptPho1z8iepkXufaTEAr+Tz45IgbYCesqN
         CjbA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi,

I'm trying out reiser4 discard feature (openSUSE with doiggl's package 
under VirtualBox) and getting this repeated warning. So I'd like to know 
if it is a known issue and how serious it is.


[  667.619577] Loading Reiser4 (format release: 4.0.1) See 
www.namesys.com for a description of Reiser4.
[  667.621406] reiser4: sdb1: found disk format 4.0.1.
[  667.658860] reiser4: sdb1: using Hybrid Transaction Model.
...
[  687.278657] reiser4[kcminit_startup(1503)]: 
reiser4_post_write_back_hook (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
                WARNING: discard atom failed (-95)
[  687.284161] reiser4[kcminit_startup(1503)]: 
reiser4_post_write_back_hook (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
                WARNING: discard atom failed (-95)
[  687.329700] reiser4[kcminit_startup(1503)]: 
reiser4_post_write_back_hook (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
                WARNING: discard atom failed (-95)
[  687.338194] reiser4[kcminit_startup(1503)]: 
reiser4_post_write_back_hook (../fs/reiser4/block_alloc.c:1153)[intelfx-8]:
                WARNING: discard atom failed (-95)


Linux version: 4.1.6
Format options: create=ccreg40,compress=gzip1
Mount options: noatime,onerror=remount-ro,discard


Best regards,
Gleb
