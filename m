From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Consistent corruptions with 2.6.3/Reiser4/LATEST
Date: Tue, 02 Mar 2004 11:32:20 +0300
Message-ID: <1078216339.1634.73.camel@tribesman.namesys.com>
References: <32862.68.10.246.123.1077992082.squirrel@webmail4.pair.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <32862.68.10.246.123.1077992082.squirrel@webmail4.pair.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bobvin@pillars.net
Cc: reiserfs-list@namesys.com

Hello

On Sat, 2004-02-28 at 21:14, Bob Vincent wrote:
> I'm seeing consistent data corruption with Reiser4 on linux 2.6.3 with
> all patches from http://thebsh.namesys.com/snapshots/LATEST/ applied.
> 
> Finally got a debugging trace uploaded to my website; you can find it
> at:
> 
>         http://pillars.net/debugfs.reiser4.-P.dev.hda1.bz2
> 
> Other files which you may find relevant:
> 
>         http://pillars.net/lspci.-v.bz2
>         http://pillars.net/proc.config.gz
> 
> The problem seems to appear when I boot into a reiser4 filesystem.
> 
> As long as my boot/root partition is reiserfs or ext2, I can create,
> mount, read, write, and unmount reiser4 filesystems with no problem.
> 
> But when I set that same reiser4 filesystem as my root partition,
> either the system hangs on bootup, or critical files become unreadable
> with the warning from /fs/reiser4/plugin/file/file.c tagged "vs-1297",
> "File (ino xxxxxx) has unknown state: 3".
> 

Yes, thanks, we are working on a fix for this

> Running "debugfs.reiser4 --build-fs /dev/hda1" produces multiple
> warnings as discussed before:
> 
>         Warning: Can't find stat data extension plugin by its id 0x4.
> 
> I am curious about other errors it sometimes reports, such as:
> 
>         Error: failed to open the object [object-id]
> 
> or:
> 
>         Error: the object [object-id] (reg40), node (node-id), item
>         (76): the found item [item-id] of the plugin
>         (extent40) does not match the detected tail policy (smart).
>         Converted.
> 
> By the way, in order to get the patches in /snapshots/LATEST/extra/ to
> compile, I had to resolve two patch rejects and also add a
> 
>         #include <asm/current.h>
> 
> to the file /usr/src/linux/include/sched.h.

You might want to follow instructions from
http://thebsh.namesys.com/snapshots/2004.02.25/READ.ME





