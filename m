From: Raphael Bosshard <whistler@fnord.ch>
Subject: Re: windows ate my superblock (try 2)
Date: Fri, 27 Dec 2002 12:45:36 +0100
Message-ID: <3E0C3D60.30500@fnord.ch>
References: <3E08FEC5.2060608@fnord.ch> <20021227000547.GK21906@jensbenecke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021227000547.GK21906@jensbenecke.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi there!

No, the partition table seems to be allright, at least I had no problems 
with it.

I tried "reiserfsck --rebuild-sb" without the "--no-journal-available" 
parameter, but it failed:

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
super.c 218 rebuild_sb
Reiserfs with standard journal found, but there was specified a journal dev

(The thing about the journal dev is strange; I'm quite sure I didn't 
specify an special journal device when I created the fs.)

If you think things are messed up beyond repair, just tell me. I'll 
invest my energy in recovering some of the data. ;)

But still; any help is appreciated.

And if there are some documentations to be translated to german, just 
tell me. My german is better than my english and I'm quite willing to help.

Raphael



Jens Benecke wrote:

>On Wed, Dec 25, 2002 at 01:41:41AM +0100, Raphael Bosshard wrote:
>  
>
>>Hi there!
>>
>>My little brother tried to install windows on my computer this morning 
>>("don't touch my linux-partitions" i told him) but he let windows eat 
>>them anyway. my reiserfs-data partition also. (scandisk checking and 
>>"repairing", only partly AFAIK, AFAIH)
>>    
>>
> 
>If your partition tables are (partly) b0rken, try gpart. gpart looks for
>FS signatures and recreates the partition table.
>
>You might want to patch gpart to look for new ReiserFS format (ReIsErFs
>vs. ReIsEr2Fs or something like that).
>
>
>  
>


