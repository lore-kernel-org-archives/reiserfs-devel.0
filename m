From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Reiser4 Debian Stretch onto 1.3TB raiser4 root fs
Date: Sat, 19 Aug 2017 06:05:33 -0700 (PDT)
Message-ID: <20170819130533.BAB8B5D680@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1503147936; h=From: Date: Message-Id: To: Subject: Sender;
 bh=KNCyNMXdE+1ulgoWEcF5cP2HH9tEQSa3vHonLME3rdA=; b=DmK9ctkCSb13uEzfa0IKFOkeh6QY1ifdJp+tFBqPhNSghvuMd5hhNdpcnN5eGI1zQtU+81yw
 KTxABB+hRYfbpqruL4DPU54dIaJHi/fVL4mvK/y/KRxQm6iCjnvBsTX6jXoIDITUB+XZMDv6
 65RI6+fckKunPE2U6MsfxMpTEbc=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: reiserfs-devel@vger.kernel.org

Niltze all-

Using Metztli-Reiser4 Stretch Debian-Installer(d-i) netboot, ‘burned’ to USB stick, I have initiated a new 2TB disk with GUID partition table (GPT) -- first time I test it with my custom installer.

Created a ~500MB ext2 boot partition, a 1.3TB reiser4 (transparent compression) root fs, and a 10GB swap file. Debian installation completed successfully and the system is performing ‘beautifully’ thus far.  I generated an installation report if anyone cares to browse over details:
< https://metztli.it/blog/index.php/amatl/reiser-nahui/metztli-reiser4-successful-debian-stretch >

Of course, the custom netboot installer runs Linux kernel 4.12.8, patched with Ed’s recent reiser4-for-4.12.1 and wrapped into a debian 4.12.6-2 packaging; it is a UDEB of the same kernel to be downloaded from Metztli IT -- also available at SourceForge site.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.12
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
