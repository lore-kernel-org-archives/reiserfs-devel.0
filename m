From: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>
Subject: Re: [PATCH] fix problems related to journaling in Reiserfs
Date: Thu, 01 Sep 2005 09:02:43 +0900
Message-ID: <43164523.7030301@lab.ntt.co.jp>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12> <b14e81f005083106423c6adc4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <b14e81f005083106423c6adc4@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: michael chang <thenewme91@gmail.com>
Cc: reiser@namesys.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

michael chang wrote:

>Surely we don't want this.  Look at the papers on Namesys's websites,
>about the atomicaty and the banking example.  But that's just my
>personal opinion.  Besides, I believe it's more likely that usually
>the power gets lost than the SCSI or IDE cable gets disconnected,
>AFAIK...
>  
>
    A write()  syscall with the O_SYNC flag must ensure that not only 
file data block
but also journal (meta-data update) are written to a disk when this 
syscall end.
   But, current implementation of Reiserfs does not do that. If a system 
crashes,
a filesystem recovers from the journal transaction log. But, Reiserfs 
may not
recover in some cases.
   I checked other filesystems like ext3, jfs, xfs. Those filesystem 
write transactions
to a disk everytime  write()  with the O_SYNC is performed. In those 
filesystem,
I have no trouble mentioned above.
  
  I should say, the Reiserfs would be "un"reliable filesystem..........
  
