From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Subject: Real status of ReiserFS4?
Date: Tue, 3 Oct 2017 22:29:34 +0000
Message-ID: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'reiserfs-devel@vger.kernel.org'" <reiserfs-devel@vger.kernel.org>

All,

I've searched around on the web a bit and found various folks spouting
off about Reiser4 here and there.  I am about to reinstall a system and
want to choose the right filesystem.  I read some report about ReiserFS
v3 not being multi-thread safe and that ext4 ran circles around it.  I
was disappointed at the hanging I was getting on ext4, so switched back
to ReiserFS and got more consistent high performance.  I have a power-
house system built with a large HW Raid 5 drive and want to reformat
and repartition that sucker up.  In your opinion, what is the best
filesystem to use right now?  Keeping in mind that I do low-level
driver work for my company and am used to hacking around in the kernel,
so patching a kernel doesn't frighten me at all.

It looks like Reiser4 still isn't in the mainline kernel... which is
disappointing to me that we developers also allow political
bureaucracy to shadow over potentially better solutions.  So, what is
the sate of Reiser4 and should I go with that for my 16-core system,
stick with Reiser3, or grab hold to ext4?

Thanks for your opinion in advance!

Andy

