From: Basil Chupin <blchupin@tpg.com.au>
Subject: Re: What does this mean?
Date: Fri, 12 Jul 2002 15:52:19 +1000
Message-ID: <3D2E6E93.2050703@tpg.com.au>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au> <20020708222746.A1516@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10986-reiserfs=m.gmane.org@namesys.com>
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
 >On Tue, Jul 09, 2002 at 02:13:51AM +1000, Basil Chupin wrote:
 >
 >
 >
 >>>>I am running SuSE 8 and the HD is being accessed every 5 seconds by
 >>>>"something". I thought I would just do a quick check of the 
reiserfs but
 >>>>
 >>>>
 >>>atime updates and stuff?
 >>>
 >>>
 >>I really do not know what is causing this every-5-seconds access. This
 >>is why I am trying to check the integrity of the fs as part of my
 >>exercise of finding the reason for the access.
 >>
 >>
 >
 >Integrity have nothing to do with that with 99.9% probability.
 >
 >
 >
 >>>>on executing "reiserfsck --check --logfile check.log  /dev/hda7" this
 >>>>produces the error message "/dev/hda7 is mounted w/ write permissions,
 >>>>can not check it." I cannot find this message documented so am 
wondering
 >>>>what it means, and what do I need to do in order to be able to 
check the
 >>>>integrity of the reiserfs on my sytem. Can anyone please help?
 >>>>
 >>>>
 >>>You can only check integrity on read-only mounted fs.
 >>>You can only fix stuff on completely unmounted fs.
 >>>
 >>>
 >>Someone else responded to me earlier with the statement to execute
 >>following: "mount -o remount,rw  /dev/hda7" which I thought had the "rw"
 >>wrong; but by changing the "rw" to "ro" I then got the error message,
 >>"mount: / busy".
 >>
 >>
 >
 >Sure. You can do this in single user mode, though.
 >
 >
 >
 >>All this is perplexing me, firstly because I am not tryng to change
 >>anything- all I am trying to do is to do what the blurb about reiserfs
 >>says which is "do this to CHECK the fs"; and secondly, how could one
 >>ever effect any corrections to the fs if it cannot be mounted!?
 >>
 >>
 >
 >This is a balanced tree filesystem, so metadata flies all over the 
place on
 >disk, so to ensure metadata stability, for check you need your volume to
 >at least to be mounted read only.
 >
 >Bye,
 >    Oleg
 >.
 >
Thank you for the explanation.  I am on a learning curve in Linux so the
above is most useful - one learns something new everyday.

Cheers.






