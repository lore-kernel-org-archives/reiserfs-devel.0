From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [PATCH] fix problems related to journaling in Reiserfs
Date: Thu, 01 Sep 2005 11:47:11 +0400
Message-ID: <4316B1FF.6000008@namesys.com>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12> <b14e81f005083106423c6adc4@mail.gmail.com> <43164523.7030301@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43164523.7030301@lab.ntt.co.jp>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>
Cc: michael chang <thenewme91@gmail.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Hello

Hifumi Hisashi wrote:
> michael chang wrote:
> 
>> Surely we don't want this.  Look at the papers on Namesys's websites,
>> about the atomicaty and the banking example.  But that's just my
>> personal opinion.  Besides, I believe it's more likely that usually
>> the power gets lost than the SCSI or IDE cable gets disconnected,
>> AFAIK...
>>  
>>
>    A write()  syscall with the O_SYNC flag must ensure that not only
> file data block
> but also journal (meta-data update) are written to a disk when this
> syscall end.

yes

>   But, current implementation of Reiserfs does not do that. If a system
> crashes,
> a filesystem recovers from the journal transaction log.

There is nothing wrong that reiserfs replays journal after system crash.

 But, Reiserfs
> may not
> recover in some cases.

Well, we used to think that reiserfs's O_SYNC support works. It is very surprising that it does not.

>   I checked other filesystems like ext3, jfs, xfs. Those filesystem
> write transactions
> to a disk everytime  write()  with the O_SYNC is performed. In those
> filesystem,
> I have no trouble mentioned above.
>  
>  I should say, the Reiserfs would be "un"reliable filesystem..........
>  
> 
> 

