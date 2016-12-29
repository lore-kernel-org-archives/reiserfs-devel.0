From: Jose R R <jose.r.r@metztli.com>
Subject: nfs-common 1.3.4-2.1 jessie-backported for Reiser4 newer kernel
Date: Thu, 29 Dec 2016 09:28:41 -0800
Message-ID: <CAM12Q5TvyRicxzHg6zPwN7ZrBMJsemk3prdDahSju5+kOr3CmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FIdk5zpk731uCDDg6/49kvZ4cVpaHXmlEwYCrf0k3BU=;
        b=R+eAUCIfHP7TU9e1oiNwZCg41YMcu74t1PT74lloTgGFzuwT5oM0S5bB3oFCcsoG2R
         GQjptF0MseBAB2ZE5dsrBj/UikT73Mcx3CDvMZoQpJD+ZJsC+qPpAOM3nnMzoOtCTY69
         94XYx55YNeUXNq/h8fG+pvxUoCOgweHMY3jGyNkWfGAdySIeG5X5fIvY6wK/5J81Gnug
         m+UlqCCG5Ne0WAn1swyqV/XHKKDtxId3bpCxmhqkap18jLR9jZnHiqaMK6f69PzGfrti
         r5ol04dwQZOsRwesHhbnX/ajbUIpanMAEFiy5WUKgFYbtZDi6rHvnBTilKUVuFSNfeHW
         rNVw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-boot@lists.debian.org

Niltze, all-

Jessie-Reiser4 had an issue with nfs-common package from the official
Debian Jessie repositories: it hung a newly installed Reiser4 root-fs
Debian and/or would hang during subsequent installation with message:
--------------------------------------------------------------------------------
Setting up nfs-common (1:1.2.8-9) ...

Creating config file /etc/idmapd.conf with new version
--------------------------------------------------------------------------------

Interesting thing is that Sid-Reiser4 would not be affected upon
installation of Sid nfs-common package.

Accordingly, I jessie-backport'ed the newer nfs-common to address the
bug that hung Jessie-Reiser4. It's my pleasure to communicate that the
port apparently resolved the bug-hang issue ;-)

Jessie-backport nfs-common 1.3.4-1 DEB is at usual location at
SourceForge --if anyone desires to provide feedback.

It will subsequently be integrated into Debian-Reiser4 neboot images
-- using SSL-enabled wget to download from metztli.it


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
