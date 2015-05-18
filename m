From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Debian cloud reiser4-patched kernel 3.19.8 [EOL] instance
Date: Mon, 18 May 2015 10:38:02 -0700
Message-ID: <CAM12Q5Qa6okHrZmeT=u6fqfHqgQeRLSZk8Eth9j0aiYHsQr41Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-cloud <debian-cloud@lists.debian.org>, Debian Release <debian-release@lists.debian.org>

Niltze, all-

Based on .config from Debian Jessie:
linux-image-3.16.0-4-amd64   3.16.7-ckt9-3~deb8u1 amd64 Linux 3.16 for
64-bit PCs
I have applied reiser4 for kernel 3.19.5 patch to pristine kernel
3.19.8 End Of Life.

I have uploaded the image to Google Compute Cloud GCE <
https://cloud.google.com/ > for testing purposes.

Thus far, reiser4 on root fs with an ext2 /boot seems to be cool on a
micro-instance (~600MB RAM small ;-) to save on charges

https://pbs.twimg.com/media/CFTgMwrUkAAbwav.png:large

If the image continues fine and there is interest I will make the
image public in case other people may find it useful.

Best Professional Regards.

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
