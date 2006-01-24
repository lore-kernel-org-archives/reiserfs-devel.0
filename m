From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 corruption (fsck.reiser4 broken?)
Date: Tue, 24 Jan 2006 12:23:13 -0800
Message-ID: <43D68CB1.1050809@namesys.com>
References: <200601242257.43836.rik@osrc.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601242257.43836.rik@osrc.info>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roman I Khimov <rik@osrc.info>
Cc: reiserfs-list@namesys.com, vitaly@thebsh.namesys.com

Our fsck guy (vitaly) is on vacation, I am really sorry to tell you
this.  Can you keep the drive around until he gets back?

Hans

Roman I Khimov wrote:

>Well, quite an interesting feeling when you lost 80G of music and 100G of 
>other great stuff... Refreshing, I should say.
>
>OK, let me explain in detail what's happening here. I have a 250Gb HDD in 
>external IEEE1394 aka Firewire enclosure. It's encrypted via dm-crypt (no 
>partitions, from block #0 to the end) and, you can guess it, I've placed a 
>Reiser4 partition on it.
>
>I'm using -mm tree kernels and right now I have two of them for my system - 
>2.6.15-rc5-mm3 and 2.6.15-mm4. The first one worked just fine for me, but 
>with second I've been experiencing some strange "Badness" from kernel block 
>level, which at that moment I had no time to save/report/analyse. That was 
>several times when using that external HDD. I have no logs for it, sorry 
>(I'm a bad user, I know...)
>
>So, despite of that "Badness" everything worked fine, I was using one or 
>another kernel depending on my mood. Until today, when I thought "man, are 
>you sure that everything is OK? Maybe it's time to make fsck on that drive, 
>you know, there is something you don't want to lose there..."
>
>So, I've ran fsck.reiser4 on dm-mapped drive (with kernel 2.6.15-rc5-mm3) 
>and it said that there is 1 inconsistency found. Not that bad for kernel 
>"Badness", it recommended to run itself with "--build-fs" parameter, I did 
>so and... Lots of output on the screen, some ~38000 files found and ~36000 
>files lost&found. Mounting my drive, what's here?
>
>rik@pu-erh:/media/ext-250/lost+found> ls | wc -l
>34799
>
>And, of course, lots of files just disappeared. I see some of them in 
>"lost+found" directory, but some of them are corrupted - I've tried to play 
>one with "suspicious" size and mplayer just quit seconds later with lots of 
>"[mpeg4 @ 0x84b4e88]marker does not match f_code" errors. That one was just 
>fine week or so ago.
>
>As I've said, I'm a bad user with no logs for any of that actions (didn't 
>expected that one inconsistency can be source of such badness). I'm not 
>asking for help with data restoring (although I would try anything to do 
>that), it's all my fault, but the question is - how can I help debugging 
>the situation (if there is something to debug at all), what info may I 
>provide (I'm very useful without logs, I know...)?
>
>Seems to me fsck.reiser4 is not that good at restoring file systems, because 
>in those fragments in "lost+found" I clearly see parts of files that were 
>just fine yesterday.
>
>Reiser4progs version 1.0.4.
>
>[ searching a bit... ]
>
>Cool, newest version is 1.0.5. My fault... again. So, just tell me that it's 
>fixed in this version - I'll laugh at myself a little... ;-)
>
>  
>

