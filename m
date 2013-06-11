From: dE <de.techno@gmail.com>
Subject: Re: (reiserfs 3.6) sync command causes continuous writes
Date: Tue, 11 Jun 2013 14:46:07 +0530
Message-ID: <51B6EAD7.7040300@gmail.com>
References: <loom.20130611T104322-574@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=f9Mcu1mU6h5GO4hV3FClQ48iN7+ExeYsXBW/KfOKOAc=;
        b=OT9vUjYEKs09maKbMzWzUY8YRZFUhfGPKq6HZm63ylFDs1mMwY+4E7/PdCsZAMxiSB
         ZAYG3Ard+Ycrk+UDTzZYQ6Lu5FmEzdbSAFgpb52qT6erAfOzLb/ZiVUxW0OXqAcLw4qs
         luH+tFRMXS2qynutm8lfy+qTvFJ53ii0ZZBh/hQW9N9PQXoK/m1GX2ECNLojMqM8iJ4w
         yeMO9EAm0CAUT6PRWx4FukHY8IGhOZ5kznxQK0ILEdf78JoiLm7k8lwiROjgagCOcgK5
         Mt1Zz8WswgpFE7DT07UqN2ea/PMWbHupsbUkL37kqJEce4lPp37SOLlqJ8wxfHD0OJYt
         OTwA==
In-Reply-To: <loom.20130611T104322-574@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 06/11/13 14:27, tomnm wrote:
> After typing the 'sync' command all reiserfs 3.6 mounted volumes will be
> continuously written.  For example, suppose 'sdb1' contains a reiserfs
> partition.
>
> mount /dev/sdb1 /mnt/data
>
> Now type:
> cat /sys/block/sdb/stat
> and note the number of I/O's to the partition.
> wait a couple seconds, look at I/O statistics and see they don't change.
>
> Now type:
> sync
>
> Subsequently typing 'cat /sys/block/sdb/stat' every few seconds shows
> increasing I/O.
>
> This can be confirmed by trying to spin the drive down:
> hdparm -y /dev/sdb
>
> The device spins down but then immediately spins back up due to above I/O
> taking place.
>
> If you umount the drive and mount again, the continuous I/O stops, only to
> resume again as soon as you type 'sync'.
>
> This behavior started with 3.5 kernel.  All 3.4.x kernels are ok.  All 3.5.x
> and newer kernels exhibit this behavior.
>
> This does not seem to occur with ext3 or FAT.

I think I can reproduce this with 3.8.5. SysRq + S seems to do the same 
thing.

I'm judging this from the HDD LED.
