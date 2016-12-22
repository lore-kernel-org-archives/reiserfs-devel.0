From: Jose R R <jose.r.r@metztli.com>
Subject: Reiser4-for-4.8.0 patch and Debian Jessie Backports linux_4.8.11-1~bpo8+1
Date: Wed, 21 Dec 2016 23:40:34 -0800
Message-ID: <CAM12Q5Q9ohPAF02BV+mGabqp5RBbi79SSaGLdwzn1y4BXYUvwA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=WFIl8Qa2o3IKwrj6dA0Mh5Jr2GwR3paDmPl1M2lkuK4=;
        b=C5Fqw6AEqHU7i0l0UG4f1hb2S0X5Ek/6rUD8QTnS5tlWcbov1oA+OOyL5TYwvLP6qF
         p/WvY6l0NG0ihUOSw8NkPXhhw1v24dlQoKC/I+mwpO/hcJ3UOjWmW67/Peq3teGPYYe9
         tNIZU1KOl/KjL/VXU0yxZ5YblHU2X2m7tUC3qYznqoquF1rPPy54K7qIgVtr+9d0QDe2
         dbrbW9PxBv0H056MRBW9kIkUBH/H6zyJS+h9VT/AGC12ctXsF6wnGD8zdrXXhkrweMc6
         t9bcIcCPePEoffBY/eEXwmeLThABWuM5lDdhEjM0fot57736gJaJwWRvLQEY753Y/ize
         vm8Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org

Niltze!

Had to modify/rename Reiser4-for-4.8.0 patch with one-liner:

gzip -dc reiser4-for-4.8.0.patch.gz | \
sed 's/inode_change_ok(inode/setattr_prepare(dentry/' | \
gzip -9 - > reiser4-for-4.8.11+.patch.gz

to get around a build error in linux/fs/reiser4/plugin/inode_ops.c
as elaborated on
< https://metztli.it/blog/index.php/aH2?blog=4 >

And successfully generate U/DEBs for Debian-Installer (d-i)


Best Professional Regards.
-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Debian-Reiser4 for AMD64 https://sf.net/projects/debian-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
