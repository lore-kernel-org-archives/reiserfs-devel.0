From: Hans Reiser <reiser@namesys.com>
Subject: Re: Re: Corruption: --fix-fixable results in all
 nlink
Date: Thu, 22 Aug 2002 15:55:36 +0400
Message-ID: <3D64D138.50408@namesys.com>
References: <200208220002.17391.Dieter.Nuetzel@hamburg.de> <18954880703.20020822001139@tnonline.net> <3D64B980.1060909@namesys.com> <000d01c249c6$39d38170$2ad22fc2@acealex>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexander Saers <alex@saers.com>
Cc: reiserfs-list@namesys.com

Alexander Saers wrote:

>And sometimes you are using old disks (20 gb or so) that has around 500kb of
>bad blocks. They dont have warranty and i think it would be a waste to just
>trow them away.
>
>/Alexander
>
>----- Original Message -----
>From: "Hans Reiser" <reiser@namesys.com>
>To: "Anders Widman" <andewid@tnonline.net>
>Cc: "ReiserFS List" <reiserfs-list@namesys.com>
>Sent: Thursday, August 22, 2002 12:14 PM
>Subject: Re: [reiserfs-list] Re: Corruption: --fix-fixable results in all
>nlink
>
>
>  
>
>>Anders Widman wrote:
>>
>>    
>>
>>>>Why not get rid of the "bad block" thing one for all.
>>>>If a current SCSI or ATA disk show bad blocks (the remapping do not work
>>>>        
>>>>
>any
>  
>
>>>>longer) replace the disk! The manufacturer have to replace it if the
>>>>        
>>>>
>warranty
>  
>
>>>>didn't expired.
>>>>
>>>>
>>>>        
>>>>
>>>Bad Block relocation is nothing that really can be trusted, on either
>>>IDE nor SCSI drives. User wants their filesystem to be robust and
>>>safe, even if the drive has damaged blocks. Many filesystems,
>>>including very old ones has bad blocks handling, and it has saved many
>>>people from troubles too.
>>>
>>>
>>>
>>>      
>>>
>>>>-Dieter
>>>>
>>>>
>>>>        
>>>>
>>>
>>>
>>>
>>>      
>>>
>>Sometimes you can't replace the drive immediately (e.g. laptop while
>>traveling abroad), and then it is useful to have badblocks handling.
>>
>>
>>
>>    
>>
>
>
>
>
>  
>
The cost of losing data due to more blocks going bad is usually much 
more than the cost of the drives....


