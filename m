From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Reiser4, SFRN 5.1.3 formatting root fs to install linux distribution
Date: Thu,  5 Mar 2020 07:49:30 -0800 (PST)
Message-ID: <20200305154933.031CA525B567@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1583423384; h=From: Date: Message-Id: To: Subject: Sender;
 bh=2cS94RDIKMBihfeXkra6iSdP+ekTuIshR7t7TsD4qVo=; b=yTpIZ6ePZDZPlvMA2XdOI6hcS58d1LvaPOh9n72C0k5jCQ4aWfKKj0IoOHVsaV3qrNG6EBKO
 metr61xL7WG18Xl36tRFDsWsZ/sDfr0Vnu9kUOQYGYqcit1IUiGdogWjDvyeiZSEXZZz0+Nf
 ekVwBx8T33hwJK8tSRGSWgOHBt0=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org

Niltze Ed-

Regarding reiser4, software framework release number (SFRN) 5.1.3, version of reiser4progs-2.0.0 utilities, is
 mkfs.reiser4 -yo "create=reg40"
 still appropriate to formatting a rootfs (/) media and/or a partition prior to
installation of a GNU/Linux distribution, i.e., Debian Buster for AMD64?

I have already built/embedded the SFRN5 kernel into preliminary metztli-reiser4-sfrn5.iso, minimal netboot installation media
< https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso >
< https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM >
and, using the formatting command above, installed onto ~2TB and ~200GB VirtualBox instances with Reiser5 rootfs, i.e.,
< https://metztli.systems/system/media_attachments/files/000/000/161/original/ca7acd7030d7565b.png?1583319334 >
< https://metztli.systems/system/media_attachments/files/000/000/162/original/e3e043e640d5ee97.png?1583319358 >
as well as into a ~100GB physical partition with Reise5 rootfs. But I wanted to ascertain
the default format command for the hacked SFRN5 Debian installer (d-i) for Buster (stable) distribution prior to making the image public.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.4.18 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
