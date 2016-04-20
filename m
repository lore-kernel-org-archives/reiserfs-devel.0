From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Debian with Reiser4-patched Linux kernel on IBM Power8
Date: Wed, 20 Apr 2016 03:53:48 -0700
Message-ID: <CAM12Q5Tu-Zg=wgUAbYh++0dwn-h8gNUNMraxFgVWCi-HzUpyJA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:cc;
        bh=PUNqEc/RqVZCzduGOi3OHUR6gx6KzQZehANslSeJzAI=;
        b=qKY3lX3sWAleD8+X8BE57fVxkwCczBRceO3IKxTLPNCbV5NAmLiAnt7HQUJFLkgG8v
         Mdi0Djsms8vSFzCjc/xMRo4nI167W243+rBnbCJ6kquHxVRYJV33nFS4F70wBWeKAe2q
         yfj41OPZ920M5p3WMqEDDdaz78/UMKtuiEpSmHmDS3BtsLRL+jNiDz8+YGlxu4WnOu5G
         TTv7j9/Nl5+lO/iL8bgS0LmSvPa2ck036SC+Qu3jpAnTKlxRpktlghEKm8OiA6kfjgIh
         rAryyB8xo+3SsQ6nBd5A0SpeGe3l+tOjiVpZjsXfEDkUlP10IEZI4jmDAj7qn8ghYAVF
         sYzg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-kernel@lists.debian.org, debian-boot@lists.debian.org

Niltze, all-

Looking over the Soflayer bare metal Power8 systems, I see that
Debian's kid, Ubuntu, is the default OS.

http://www.softlayer.com/power-servers

I was pondering an evaluation trial of Reiser4-enabled Debian on IBM
Power8. Up to now I have only successfully tested Reiser4 Software
Format Release Number (SFRN) 4.0.1 on AMD64 baremetal, virtualization
and cloud.

If am allowed to install my own OS,
is there any reason why Reiser4 SFRN 4.0.1-enabled Debian should not
run on Power8? I assume GPT should be selected whereas previously I
have tested -- on AMD64 baremetal and cloud -- only MSDOS disk
partitioning.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
