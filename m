From: Hans Reiser <reiser@namesys.com>
Subject: Re: My Dad suggests a redundant copies plugin
Date: Tue, 25 Oct 2005 02:28:05 -0700
Message-ID: <435DFAA5.9050206@namesys.com>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051025072537.GB8402@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: ReiserFS List <reiserfs-list@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, dad <ramon.reiser@us.army.mil>

Sander wrote:

>Hans Reiser wrote (ao):
>  
>
>>This would not be (at least in theory) useful for RAID devices, but for
>>a user with a single disk drive, it might be useful to have a plugin
>>that creates two (or N) copies, and tries to allocate the two copies at
>>opposite ends of the disk. Anyone out there still looking for a plugin
>>to write?
>>    
>>
>
>That will kill performance badly. First of all the two read/writes
>needed, and second because you have to seek from one end to the disk to
>the other every time you read/write something.
>
>And what is the advantage? You are not protected against a lot of disk
>failures (only against bad blocks, right?).
>
>There is a lot more advantage in buying two disks and do raid over them.
>This is (much) cheaper, gives better performance and gives more
>protection.
>
>Anyway, no need for a plugin. You can just divide your disk in two
>partitions and configure them as a raid1.
>
>Or am I missing something in your suggestion?
>
>  
>
It is only for very important files for computers which have only one
hard drive.  Some of the work is with changing fsck.....

Hans
