From: Szabolcs Illes <illes@cpc.wmin.ac.uk>
Subject: Re: reiser4 bug
Date: Tue, 01 Mar 2005 12:31:19 +0000
Message-ID: <42246097.4000009@cpc.wmin.ac.uk>
References: <422220B3.8000800@cpc.wmin.ac.uk> <20050228144518.GK8161@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050228144518.GK8161@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Alex Zarochentsev wrote:

>On Sun, Feb 27, 2005 at 07:34:11PM +0000, Szabolcs Illes wrote:
>  
>
>>Hi All,
>>
>>I have been using reiser4fs for 4 months without any problem since 
>>today. After tryinig to open a movie with mplayer a have this in my log:
>>    
>>
>
>no other reiser4 messages in the log for 4 months? 
>
I have checked my logs. I was not able to find anything from reiserfs. 
But I have uploaded my syslog since feb 27 (this is when the bug occured):

http://nuk.teteny.elte.hu/~selli/syslog.1.bz2 ( 1.8 compressed, 300M 
uncompresed )

It may has more information about the bug, you should check it.  For 
example the very first message from reiser4 is:

Feb 27 12:59:38 sunset kernel: WARNING: Wrong level found in node: 1 != 95
Feb 27 12:59:38 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:

> like delimitingkey
>mismatch reports?
>
>there was wrong bitmap checksum.  actually I haven't seen such reports until
>now.  are you sure your computer's disk/ram work well?
>  
>
My machine (seems to be) is fun, I have run some tests.
Another info:
I was using an extrenal usb2 disk (120Gb/ reiser4) when this affair 
occurd. After rebooting I had to repair all my reiser4 partitions. ( / 
hda2,   /home hda5/,   /mnt/Movies sda1).

For the "/" I had to use --build-sb, then --build-fs, then --fix
For /home, and the external /mnt/Movies just the --build-sb

>  
>
>>Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: 
>>write_sd_by_inode_common (fs/reiser4/plugin/object.c:480)[nikita-2221]:
>>Feb 27 14:00:22 sunset kernel: WARNING: Failed to save sd for 1599330: -5
>>Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: create_child_common 
>>(fs/reiser4/plugin/dir/dir.c:501)[nikita-2219]:
>>Feb 27 14:00:22 sunset kernel: WARNING: Failed to create sd for 1599330
>>Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
>>(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
>>Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
>>Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
>>(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
>>Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
>>Feb 27 14:00:24 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
>>(fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
>>Feb 27 14:00:24 sunset kernel: WARNING: Wrong level found in node: 1 != 95
>>......
>>1000x times
>>    
>>
>
>were there unclear reboots?
>
I had some crash ( I think it was because of my bug ethernet driver, I 
have no crash since I replaced it)

>  That shouldn't be a problem unless disk write
>caching is disabled. 
>  
>
How can I chech this?

Szabolcs

>  
>
>>After trying to reboot:
>>
>>http://nuk.teteny.elte.hu/~selli/dscf0437.jpg  (using 2.6.9-cko3)
>>http://nuk.teteny.elte.hu/~selli/dscf0438.jpg
>>http://nuk.teteny.elte.hu/~selli/dscf0439.jpg
>>
>>I had to install a new root filesystem, and using that I was able to fix 
>>the filesystem. ( --build-sb, build-fs, and fix )
>>I have lost some file but fortunatly I was able to use my system again.
>>
>>The affair happend when I was using 2.6.10 with reiser4 patch(from 
>>namesys.com). I tried to reboot with my previos kernel (2.6.9-cko3) but 
>>had the some bug (see screenshots). Sorry but I forgot to save the 
>>outout of the fsck prog :(.
>>
>>If U need any information do not hesitate contacting me.( I am not on 
>>the mailing list)
>>
>>Some info in advanve:
>>Hardware: Dell Inpiron 8600c (1600Mhz Centrion processor)
>>
>>Kernel config:
>>    
>>
>[...] 
>
>  
>

