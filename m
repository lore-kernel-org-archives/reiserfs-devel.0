From: Hans Reiser <reiser@namesys.com>
Subject: Re: Errors requiring --rebuild-tree in 2.4.23
Date: Thu, 11 Dec 2003 22:20:56 +0300
Message-ID: <3FD8C398.6040903@namesys.com>
References: <br9soe$h0h$1@sea.gmane.org> <1071152521.11147.88.camel@tiny.suse.com> <bra6s2$9ug$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bra6s2$9ug$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com, mason <mason@suse.com>

Jens Benecke wrote:

>Chris Mason wrote:
>
>  
>
>>On Thu, 2003-12-11 at 08:51, Jens Benecke wrote:
>>    
>>
>>>Hi,
>>>
>>>I posted earlier about quota problems. WE updated to 2.4.23 b ecause of
>>>the logging patches because some power failures made our /home partition
>>>spew out these: (QUESTIONS at the end of the mail)
>>>      
>>>
>>Sorry, before we got to the questions, what was the order of the events
>>above?
>>    
>>
>
>Oops. I guess I was a bit too confused myself. :)
>
>1. Errors on /home in syslog, cron jobs running wild with i/o failures
>     system kept running for a couple days because nobody was there 
>     to fix it, though
>     Those errors were probably caused by power outages and 
>     a non-data-logging ReiserFS kernel.
>  
>
errors like this are not due to a lack of data-logging.

Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
free_space(entry_count) 65535

>2. Backup what's left of /home to firewire harddisk.
>3. Update to 2.4.23 with Chris' patches for data logging/quota
>4. Repartition hda2..4 (was needed anyway for drbd), 
>     reformat new /home (drbd), restore /home on drbd device
>5. crash of the server overnight, reboot (don't know why yet)
>6. couldn't reboot because root partition was totally b0rken
>7. reiserfsck --rebuild-tree under Knoppix, killed a couple files
>8. still running Knoppix, secondary server took over and is running now
>
>btw: Is there a "reiserfs stress test" kind of thing to make sure a
>configuration works before sending it two time zones away for production? I
>plan on doing that in the next couple weeks. =;)
>Would bonnie++ accomplish this or are there better tests?
>
>
>
>  
>


-- 
Hans


