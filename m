From: Hans Reiser <reiser@namesys.com>
Subject: Re: Re: Corruption: --fix-fixable results in all
 nlink
Date: Thu, 22 Aug 2002 14:14:24 +0400
Message-ID: <3D64B980.1060909@namesys.com>
References: <200208220002.17391.Dieter.Nuetzel@hamburg.de> <18954880703.20020822001139@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Anders Widman wrote:

>>Why not get rid of the "bad block" thing one for all.
>>If a current SCSI or ATA disk show bad blocks (the remapping do not work any 
>>longer) replace the disk! The manufacturer have to replace it if the warranty 
>>didn't expired.
>>    
>>
>
>Bad Block relocation is nothing that really can be trusted, on either
>IDE nor SCSI drives. User wants their filesystem to be robust and
>safe, even if the drive has damaged blocks. Many filesystems,
>including very old ones has bad blocks handling, and it has saved many
>people from troubles too.
>
>  
>
>>-Dieter
>>    
>>
>
>
>
>  
>
Sometimes you can't replace the drive immediately (e.g. laptop while 
traveling abroad), and then it is useful to have badblocks handling.


