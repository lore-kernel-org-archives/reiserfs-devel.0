From: Basil Chupin <blchupin@tpg.com.au>
Subject: Re: What does this mean?
Date: Tue, 09 Jul 2002 02:13:51 +1000
Message-ID: <3D29BA3F.7010201@tpg.com.au>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, Jul 08, 2002 at 11:30:13PM +1000, Basil Chupin wrote:
>
>  
>
>>I am running SuSE 8 and the HD is being accessed every 5 seconds by 
>>"something". I thought I would just do a quick check of the reiserfs but 
>>    
>>
>
>atime updates and stuff?
>  
>
I really do not know what is causing this every-5-seconds access. This 
is why I am trying to check the integrity of the fs as part of my 
exercise of finding the reason for the access.

>>on executing "reiserfsck --check --logfile check.log  /dev/hda7" this 
>>produces the error message "/dev/hda7 is mounted w/ write permissions, 
>>can not check it." I cannot find this message documented so am wondering 
>>what it means, and what do I need to do in order to be able to check the 
>>integrity of the reiserfs on my sytem. Can anyone please help?
>>    
>>
>You can only check integrity on read-only mounted fs.
>You can only fix stuff on completely unmounted fs.
>
>Bye,
>    Oleg
>
>.
>
Someone else responded to me earlier with the statement to execute 
following: "mount -o remount,rw  /dev/hda7" which I thought had the "rw" 
wrong; but by changing the "rw" to "ro" I then got the error message, 
"mount: / busy".

All this is perplexing me, firstly because I am not tryng to change 
anything- all I am trying to do is to do what the blurb about reiserfs 
says which is "do this to CHECK the fs"; and secondly, how could one 
ever effect any corrections to the fs if it cannot be mounted!?

All too much for a country lad to fathom.

Cheers.



