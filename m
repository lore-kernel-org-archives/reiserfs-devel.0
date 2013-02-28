From: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <dieter@nuetzel-hh.de>
Subject: [RFA] reiserfs 3.6 on SSD software RAID1 with TRIM/DISCARD on
 SMP-system =?UTF-8?Q?doable=3F?=
Date: Thu, 28 Feb 2013 04:29:18 +0100
Message-ID: <30c9401395b356be4b2cdf42e1afa833@mail.ud03.udmedia.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=mail.ud03.udmedia.de; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:cc:subject:message-id; s=beta; bh=onU0YRedTTxZLUABL9AJXsG2eHpJN
	cw9Uq7Y+fML0W0=; b=SGeZrIiK8WKrLkiwHap/I5H/5tQyfqqJfLeFGraEIaxIP
	Ll78p+ptet4Fsu8TNt5Cah/xPqZc/lGyy5tFTizdIREy3eR0sM37Eaa9vSOzIZCg
	R4taqyNzJXb3UEmdwDTx9ylQ7NhUArW5sI30lhxj4/wMdnsF8OMxDSBj4sx6V0=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Neil Brown <neilb@suse.de>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

Hello,

I'm on ReiserFS 3.6 since the beginning (under S.u.S.E. :-) even with 
beta stuff.
Now it is time for SSDs.
I migrated one UP workstation (openSUSE 12.2 + stable + etc.) and have 
to switch all other servers + workstations onto SSDs, too.

Please give me your advice if I better should switch to ext4 or 
whatever.
All systems should run your great MD software RAID1 on SSD hopefully 
with TRIM and/or DISCARD.

Thanks,
    Dieter

PS @Neil:
I get /dev/md0 (swap) and poorly /dev/md127 (root).
But YaST created this /etc/mdadm.conf on the first workstation:

DEVICE containers partitions
ARRAY /dev/md0 UUID=bd5xxxxx
ARRAY /dev/md1 UUID=e74xxxxx

Ahhh, now I see something (below).
Can we clean this?

Sonja /home/dieter# cat /proc/mdstat
Personalities : [raid1] [raid0] [raid10] [raid6] [raid5] [raid4]
md0 : active raid1 sdb1[0] sda1[1]
       1051584 blocks super 1.0 [2/2] [UU]
       bitmap: 0/1 pages [0KB], 65536KB chunk

md127 : active raid1 sdb2[0] sda2[2]
       30209920 blocks super 1.0 [2/2] [UU]
       bitmap: 1/1 pages [4KB], 65536KB chunk

unused devices: <none>

Should I generate partition tables on the devices or are the raw 
devices enough?
