From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Re: r5 hash detected, unable to force r5 hash
Date: Sat, 20 Apr 2002 02:40:46 +0200
Message-ID: <3CC0B90E.3010101@mb.tu-ilmenau.de>
References: <20020419185715.GA3936@thebetteros.oche.de> <20020420012316.A11021@piosf0.pit.physik.uni-tuebingen.de> <20020419235914.GA4474@thebetteros.oche.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frederick Page <fpage@thebetteros.oche.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi Frederick!

On 04/20/2002 01:59 AM, Frederick Page wrote:

> Hi Arthur,
> 
> Arthur Erhardt wrote on Sat, Apr 20 2002:
> 
> 
>>Uh. Is it possible to create a backup of the partition in question
>>(with dd) before continuing? Or do you have a backup of that data?
>>
> 
> I'm not sure, if a "dd" copy would be useful (in case I mess up things
> completely). Unfortunately, I do not have a backup of the partition,
> it's "just" sound. I would normally recreate it from scratch, but I'd
> hate to lose all my mp3 songs and a few other things on it. Of course
> I made a mistake by playing with the hash algorithms, I still wonder,
> why I was able to change it from r5 to tea, but unable to change it
> back. It is entirely my fault, and since I have no backup, I'm really
> sweating now ;-)


When you have no backup in handy and want to try reiserfsck on this 
partition make a dd copy of it before, if you have enough disk space. 
The dd won't change the disk content.

Maybe you can get the newest reiserfsprogs and reiserfsck --rebuild-tree 
can fix the false entries. Otherwise you may need to wait for the 
reiserfs teams help. Maybe you can provide the error messages of 
reiserfsck --check and your actual reiserfsprogs version number until then.

My own experiences of the latest reiserfsck beta are very good, it's 
fast, and most things put to /lost+found are recoverable (if you can 
relate them to the original files) and I found nothing was missing.

> 
> As long as there's a chance of at least a read-only access, I'd hate
> to resort to permanent solutions. Maybe I see things too simple, but
> in my unprofessional opinion: wouldn't it suffice to just hex-edit the
> r5 flag into the superblock? (If so, I'd appreciate any tips on how to
> do this).
> 
> I found an old mail on this list (September 2001), according to this
> mail, the feature (?) "r5 detected, unable to force r5" is unintended.
> 
> 
>>I won't give any other advice on how to proceed, since I'm sure 
>>the reiserfs team knows better than me.
>>
> 
> Thank you anyway, nice to see that someone does care.
> 
> Kind regards     Frederick
> 


Best wishes,

Manuel

