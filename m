From: Mathieu Belanger <admin@korinar.com>
Subject: [BUG] Big fiability issue?
Date: Sun, 3 Apr 2016 12:44:16 -0500
Message-ID: <20160403124416.40b26c9ff1b1c4b58e23024d@korinar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korinar.com; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:message-id:subject:subject:from:from:date:date
	:received:received; s=korinar; t=1459705464; bh=yC45r39T0Kaoh4tn
	r42XE5EeT8ShyTHNz9UyCCNS7Sc=; b=getwxL0OeJpj9nv8Vg6JuYq3rbBbwxl6
	zx5UU59CccRiRWxX7wtIyklGrMVrflV33+Rv03Pdx1mQtEjF4yV/TndXK5uZWTBC
	zlsvdy9W3PcnP4kOZBQYaJoHOMCJzAdrRSvE2wLDONZZo4pDyWbEnncxyulh+oM0
	yLgggS5X0cg=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi. I got a recurring problem since I began to use Reiser4 again (so with the kernel 4.4 and 4.6-r1)

This power here is not really good, sometime I get a power outrage... and I lose whole directory when that append, even if I was not using them/writing them...

- On my laptop (kernel 4.4), three week ago, when that appened, I was not able to launch firefox after the reboot so I did a fsck... it lost some file according to fsck, everything in /sbin. After the fsck I cound not boot that installation anymore (normal, without /sbin/udev.....)

- On my Desktop (kernel 4.6-rc1), I got two power outrage yesterday. to be preemptif, I did, right after the power problem, boot in single to do a fsck before anything (to be sure). I lost like 2 file and did put them in /lost+found... fine, no problem, it was a sqlite file and a mp3.. no problem... BUT today I needed to use CLion and guess what?

destroyfx@Tanith /tmp/comlin64 $ ls /opt
ls: reading directory '/opt': Input/output error

I did try to rm -Rf /opt, no succes.. I did another fsck today, it put 3 more file in lost+found... and did not fix /opt.

I did use Reiser4 about two years ago. on that time I did lot of overclocking testing and it crash so much time and did NOT lost anything. Plus, that machine was scrypt mining with 6 video cards (and cold join in PCI-e extender) that was making the machine crash a couple time a week, no problem there eater, no lost file.

So was I lucky two years ago to not loss anything after hundreads of crashs? Because now it's really bad.. (I did not even write in /opt in that running session.. and on my laptop I did not write in /sbin for at lease two week before it failed).

-- 
Mathieu Belanger <admin@korinar.com>
