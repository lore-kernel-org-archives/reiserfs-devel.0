From: Raphael Bosshard <whistler@fnord.ch>
Subject: Re: windows ate my superblock (try 2)
Date: Sat, 28 Dec 2002 16:20:29 +0100
Message-ID: <3E0DC13D.7030103@fnord.ch>
References: <3E08FEC5.2060608@fnord.ch> <200212271819.SAA09071@wg.pu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212271819.SAA09071@wg.pu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hi there!

that did it. It took ages to restore the whole filesystem but now almost 
everthing is back in place. At least the important things. Many, many 
"thank you"s to you all (from my brother too ;)  )

And if I can help you by translating something (to german); please feel 
free to mail me.

Happy new year!

Raphael


Vitaly Fertman wrote:

>On Wednesday 25 December 2002 03:41, Raphael Bosshard wrote:
>  
>
>>Hi there!
>>    
>>
>
>Hi, I am on vacation now, sorry for my keeping silence. I guess, that if you take 
>reiserfsprogs-3.6.5-pre1 and run reiserfsck --rebuild-sb /dev/xxx 
>(without no-journal-available option), then you should have it all recovered. 
>If not, I am afraid I will be able to give a proper ansrew why only after 5th, when 
>get back to work and have a look at the 16th block of your fs. 
>
>  
>
>>My little brother tried to install windows on my computer this morning
>>("don't touch my linux-partitions" i told him) but he let windows eat
>>them anyway. my reiserfs-data partition also. (scandisk checking and
>>"repairing", only partly AFAIK, AFAIH)
>>
>>Mount failed with:
>>mount: wrong fs type, bad option, bad superblock on /dev/hdb,
>>      or too many mounted file systems
>>
>>so I tried a reiserfsck which resulted in a
>>
>>reiserfs_open: neither new nor old reiserfs format found on /dev/hdd2
>>reiserfsck: could not open filesystem on "/dev/hdd2"
>>
>>Some digging in the mailinglist pointed out that the superblock was
>>destroyed, so I tried to rebuild it with:
>>
>>reiserfsck --no-journal-available --rebuild-sb
>>
>>reiserfsck now recognises the reiserfs-partition, but fails because
>>there is no journal/wrong journal parameters.
>>
>>(Filesystem with standard journal found, --no-journal-available is ignored
>>reiserfs_open_journal: wrong journal parameters found in the super block.)
>>
>>
>>Finaly my question: Is there a way to find out the right parameters and
>>create a new journal?
>>
>>Any help is appreciated, really. ;)
>>Happy new year!
>>
>>Raphael
>>
>>(Please CC me, I'm not on the list.)
>>    
>>
>
>  
>


