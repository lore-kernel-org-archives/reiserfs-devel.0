From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Reiser4 -enabled Debian Parted 3.2-14
Date: Sat, 30 Jan 2016 01:48:29 -0800
Message-ID: <CAM12Q5SBwORjey3gsDQDukzDgtSnfWctXx+oa40Gf=oZ5rjdvA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:cc:content-type;
        bh=naU7WQAphxt+DH7bROQxa13INJRQannXYJfbN9Yj72M=;
        b=HRMuKLbnQoHw0bOHZ5nepw2+mA+K/mNjDAIeECPZwhqUpU9rSR25EeYdmxfWoO5CXm
         /Z9R05wdDQQ9hOCmjah7tVHTKw30MZqbwrsq2lHlnvJt0U1y4V1uxYtxex+K1Zjdudi5
         DCzS6r8AW/Sdk/LPb4/taez0rU20LhpPDHheAKMczXnk31nNypTmjUQuC261ExOMbWw7
         4+CNqO1372NwouFayBabi6q3QWanQvZ2VHE2bMKSjbKg5hn2ECX4lgHidJp8rKZDxkfZ
         9CiGINCllGsXrlZnmfo/oVFOk859z99gHWzWAozJnduhyNlLSa4WVtpSdoTAdQ4NEtgI
         XbLQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-boot@lists.debian.org

Niltze-

Updated Debian Parted DEBs to reflect latest debian release of GNU utility:

http://metztli.it/readOnlyEphemeral/debian-parted-3.2-14_reiser4.tar

If in addition to DEBs in tar above, you need to build the UDEBs with
Reiser4-support for Parted in d-i, here is Reiser4 -enabled source:

https://github.com/Metztli/debian-parted-reiser4


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
