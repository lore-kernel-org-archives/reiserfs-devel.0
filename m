From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Re: BTW: 2.4.19-patches-to-come?
Date: Sat, 18 May 2002 23:44:55 +0200
Message-ID: <3CE6CB57.4020002@netscape.net>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <200205172144.21544.Dieter.Nuetzel@hamburg.de> <20020518094440.A4435@namesys.com> <200205181518.24245.Dieter.Nuetzel@hamburg.de> <20020518202902.A6913@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>, Dieter Nuetzel <Dieter.Nuetzel@hamburg.de>

On 05/18/2002 06:29 PM, Oleg Drokin wrote:

> Hello!
> 
> On Sat, May 18, 2002 at 03:18:23PM +0200, Dieter N?tzel wrote:
> 
>>>>I can reproduce it with some "new" page coloring stuff (only).
>>>>When I modprobe the page coloring module (it is under development) the
>>>>system lookup from time to time during heavy (parallel) compilation for
>>>>example. Then I get the broken files.
>>>>
>>>Well, sounds like page colouring stuff mistakenly writes some pages in
>>>wrong location, no?
>>>
>>Yes, that could be the case.
>>
>>>If you cannot reproduce without page colouring patch, that would be the
>>>most probably theory, I'd say.
>>>
>>That isn't what I've said. I only said I can "reproduce" the kernel crash with 
>>page coloring the easiest way.
>>
> 
> Sorry, I misinterpreted it, then. Perhaps I was confused by "only" word in sentence above.
> 
> 
>>>>>BTW, I have a feeling that datalogging patches would help to get rid of
>>>>>garbage in the files, but files still will remain (may be of zero
>>>>>length).
>>>>>
>>>>Yes, Chris said this, too.
>>>>
>>>He said it will help your problem, I think. But zero length .o files will
>>>still confuse linker.
>>>
>>So what's your advice then? Mounting all FSs with "noatime"?
>>
> 
> noatime have nothing to do with wrong content of recently created files after
> crash.
> It was only my guess that atime updates might have caused corruptions on file
> read. But you are not using IDE. Anyway, you can try and tell us.
> 
> Bye,
>     Oleg
> 


Thank you all, for keeping me informed, too!

I have all my partitions mounted -o [...+]noatime and the reiserfs ones 
with [+]notail since many years as it was said to bring a performance 
gain (never proved it myself). As I get same errors as Dieter but on IDE 
disks (!)... that "noatime" might not solve the problem for recently 
accessed files (like it may occur on a crash with a running KDE with its 
setup files, too).

Though having some *.o files when a kernel-or-so compile fails and I 
need to make a "make mrproper", e.g., to get it in order again I don't 
want them all to be removed "intelligently" by the FS. Oleg, you 
explained it  right. I don't want some files vanishing completely upon 
intermediate crash (so, even if not everything has been built and I may 
need to recompile or reset /all/ after restart). But in fact it can be 
very complicated to find the corrupted=broken-but-not-deleted file 
sometimes.


Oleg, another approach to the original topics' problems as I can't say 
what files are accessed and unlinked/deleted before crash with sense 
with my typical crash pattern: How can I try to monitor accessed files 
just before my typical crash patterns (to see what reiserfs makes of 
them after crash)?
I really want to watch what gets restored, recovered or deleted if 
possible. So far I don't get a logic from your explanations to my 
ReiserFS' behaviour on this, sorry, though I understood your and Chris 
words on this. Is there a way to do this "snapshot"?

Dieter, do you have a time relation of your crashes? I mean e.g. related 
in secs or mins after system startup? My "most loved crashes" 
(without-page-colouring, of course) occur approx. 2min after startup 
with full Seti-load or formerly on a "make bzlilo" without "sync" after 
"make bzImage" (formerly = "with unusable bdflush and harddisk settings").

Chris, can we have an answer on Dieters questions ("What's wrong?") in 
thread "[reiserfs-list] Re: data-logging on top of 
linux-2.4.19p7-compound-speedup-2.patch", and a notification on your 
future patchset for latest official reiserfs stuff, thank you! Really, 
with your patches from ftp.suse.com I did not feel well adjusting lines 
by hand (see Dieters questions on this...)


Bye, and thanks, again,
have a nice Whitsun (never new the english words and that explanation 
before Dieter mentionning it, have to work all-day though, too, thanks!)


Manuel


