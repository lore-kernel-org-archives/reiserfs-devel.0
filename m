From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Re: Real status of ReiserFS4?
Date: Wed,  4 Oct 2017 22:56:50 -0700 (PDT)
Message-ID: <20171005055650.54653A9DE29@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1507183011; h=From: Date: Message-Id: To: Subject: Sender;
 bh=o8CWIVCuBn7KvYJTD5GsRD134f5A5dyWxeEUvTcJkYc=; b=kWQuV35o4U8BXCNTCi6YvT0mr9Iw+cjFi8UtbS63h0uC/nWZd7m1nNB4vRnhIM3dL0D0O5s7
 R1rps+TWE+Y0fYlY39PJQ3yK8eppyJiAlldB4oBWIzACS3xieH2s+ih5hrHzeLEppvF0Jwx8
 cx045ifd56NgyrYCZbEodjV16dc=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

> All,
> 
> I've searched around on the web a bit and found various folks spouting
> off about Reiser4 here and there.  I am about to reinstall a system and
> want to choose the right filesystem.  I read some report about ReiserFS
> v3 not being multi-thread safe and that ext4 ran circles around it.  I
> was disappointed at the hanging I was getting on ext4,
hmmm...
makes me wonder why it is the default filesystem for Debian, even on cloud images
 expanding to 2TB (Max); I thought it had to do more than being UNIX 2038 compliant:

< https://metztli.it/blog/index.php/amatl/reiser-nahui/reiser4-filesystem-and-the-unix >

> so switched back
> to ReiserFS and got more consistent high performance.  I have a power-
> house system built with a large HW Raid 5 drive and want to reformat
> and repartition that sucker up.  In your opinion, what is the best
> filesystem to use right now?  Keeping in mind that I do low-level
> driver work for my company and am used to hacking around in the kernel,
> so patching a kernel doesn't frighten me at all.
> 
> It looks like Reiser4 still isn't in the mainline kernel... which is
> disappointing to me that we developers also allow political
> bureaucracy
In my experience, FOSS has a lot of moralist-bullsh!tters (bullies actually);
both developers/maintainers and 'evangelists'
who even masturbate on a name change for reiser[fs/4] *without* even contributing
code to or builds of the source.

i.e., < https://twitter.com/BrideOfLinux/status/763008210856972288 >
even referencing Mr. Shishkin GitHub repo for specific critique:
< https://twitter.com/schestowitz/status/908782499714789377 >

> to shadow over potentially better solutions.  So, what is
> the sate of Reiser4 and should I go with that for my 16-core system,
> stick with Reiser3, or grab hold to ext4?
> 
> Thanks for your opinion in advance!

Quirk:
Upon rebooting in a cloud instance as well as in a laptop, there may be times when the patched kernel hangs early
without completing the full boot procedure.
Notwithstanding it is enough to power off the machine and power on back on again (even in cloud instances).
Nevertheless, no data loss I have experienced.

< https://metztli.it/blog/index.php/amatl/amatl-main/install-reports/metztli-reiser4-successful-debian-stretch >
 If you will be doing 15TB, I would
partition with GPT and I would not format with (default) transparent compression until Ed perfects the
technique (yet I am doing transparent compression in my daily use development 1.2TB laptop ;-)


> 
> Andy
> 

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
