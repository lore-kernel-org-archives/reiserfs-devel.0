From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2 Terabyte install
Date: Fri, 07 May 2004 09:17:20 -0700
Message-ID: <409BB690.6030604@namesys.com>
References: <409AC2FF.7080800@lindows.com> <1083917932.14089.281.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18535-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1083917932.14089.281.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Clifford Beshers <clifford.beshers@lindows.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

Vladimir Saveliev wrote:

>Hello
>
>On Fri, 2004-05-07 at 02:58, Clifford Beshers wrote:
>  
>
>>What are the current size limitations for disks/partitions/filesystems
>>with the following combinations?  My googling has produced
>>inconsistent answers.
>>        { linux 2.4.24, linux 2.6.5 } X { reiserfs3, reiser4 }
>>    
>>
>
>http://namesys.com/faq.html#reiserfsspecs
>
>  
>
>>We have a new machine with a 3-ware 8 port controller (looks like a
>>scsi controller to the system, but actually drives 8 ide drives).  We
>>have 8 x 300GB drives attached for a total > 2TB.
>>
>>Our IT guy has been unable to install Linspire on it (linux 2.6.5,
>>reiserfs3).  I'm about to go look in more detail, but I thought I'd
>>find out what the bounds were for sure.
>>
>>    
>>
>
>I assume mkreiserfs was not the reason why you guys failed to install
>linux on your hardware. It works for > 2tb devices.
>
>  
>
>>Thanks,
>>
>>Cliff
>>
>>--
>>
>>This message contains information which may be confidential and privileged. Unless you are the 
>>addressee (or authorized to receive for the addressee), you may not use, copy or disclose to anyone 
>>the message or any information contained in the message. If you have received the message in error, 
>>please advise the sender and delete the message.  Thank you.
>>    
>>
>
>
>
>  
>
Please provide exact answer to this question about what are V3 limits.  
Vitaly, please assist.
