From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Reiser4 -enabled Linux 5.10.26
Date: Fri, 02 Apr 2021 07:41:01 -0700
Message-ID: <76f176ce14bb469293e15172e6522081a3539126.camel@metztli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=+vgejU4/JZadtPYENjNbyRGMVCzwVSPUxWwXTslt1q4=;
        b=XqzBy8GABaaVCHwtvbceZdyfltyfLjwIlZXmZ/QUkubphwR6CWfRdX/a1C39I4Zkfo
         XGajLD4Fk968nQubxVGmz89TpfR6vyc7Y4+PHLMkvkowHGbMwbSuTK9K8iAbe/WqgkAU
         GWlUWu045uerbz43w+ZUdr/QrTi+QR86kCcbIpP39UIMXvdw1ZcWdLMEZr2Q8EhfTjPF
         WooT9wm0dXegr5gcyBcAyOZ1RbJmvEMCRPMcVOvU7puc5j9GMRQNhTdW0qtA6gd5vCfb
         zGXoauqwnhzLvZnGKRIS00fx/1WaIGX3MynWv81gx01mc4NeouVHfWmtF1OI81+7lOLL
         YbNg==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Niltze [Hello], all-

We have just released a preliminary reiser4 -enabled Debian 11,
codenamed Bullseye, minimal USB/ISO AMD64 image with Debianized kernel
5.10.26-2. It has been tested lightly -- as Debian gives the finishing
touches to their upcoming operating system distribution.

If anyone wants to give it a spin, here are the download link(s):
https://metztli.it/bullseye/netboot/metztli-reiser4.iso
https://metztli.it/bullseye/netboot/metztli-reiser4.iso.SHA256SUM

If using USB device /dev/sdb,
dd if=metztli-reiser4.iso of=/dev/sdb bs=4M; sync

https://metztli.it/bullseye
*No warranties whatsoever*


Best Professional Regards.

-- 
-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
----------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.10.20 AMD64
-----------------------------------------------------------------------
----------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
----------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
--------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/


