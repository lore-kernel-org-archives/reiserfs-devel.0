From: Hans Reiser <reiser@namesys.com>
Subject: Re: Error messages.
Date: Thu, 06 Mar 2003 15:16:05 +0300
Message-ID: <3E673C05.7000202@namesys.com>
References: <7473069171.20030305201818@tnonline.net> <20030306095743.B5417@namesys.com> <170120728875.20030306093238@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <170120728875.20030306093238@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>>Well, I checked my logs:
>>kernel: hdg: status error: status=0x58 { DriveReady SeekComplete DataRequest }
>>kernel: hdg: drive not ready for command
>>    
>>
>
>   This is what I get all the time.
>
>  
>
>>And for this case I am sure this was a scratchy CD-ROM disk in my CD-ROM drive.
>>    
>>
>
>   Well, have no CD-ROM. :)
>
>  
>
>>Probably same stuff can be get when drive is busy remapping bad sectors?
>>Use smartctl to find out how these messages corellate with remapped bad sectors counts?
>>    
>>
>
>  Very strange. Would mean all of my harddrives would be broken, or on
>  their  way  to  get  broken.  I  do  not  believe that.  Most of the
>  hardware, including the cabling has been replaced and changed.
>
>  
>
>>Bye,
>>    Oleg
>>    
>>
>
>
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>
>
>
>  
>
Hardware is so much fun to debug sometimes, and when you are the 1% case 
life can really suck.

Do you have:

bad cooling

bad power supply

bad voltage from power company

electrical noise

?

I think though that Oleg is right that you should contact the IDE guys 
and ask them for their list of things to check for that particular error 
message (and tell us about it).

-- 
Hans


