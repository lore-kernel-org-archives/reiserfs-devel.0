From: Oleg Drokin <green@namesys.com>
Subject: Re: Re: BTW: 2.4.19-patches-to-come?
Date: Sun, 19 May 2002 13:44:54 +0400
Message-ID: <20020519134454.B11030@namesys.com>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <200205172144.21544.Dieter.Nuetzel@hamburg.de> <20020518094440.A4435@namesys.com> <200205181518.24245.Dieter.Nuetzel@hamburg.de> <20020518202902.A6913@namesys.com> <3CE6CB57.4020002@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CE6CB57.4020002@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>, Dieter Nuetzel <Dieter.Nuetzel@hamburg.de>

Hello!

On Sat, May 18, 2002 at 11:44:55PM +0200, Manuel Krause wrote:

> Oleg, another approach to the original topics' problems as I can't say 
> what files are accessed and unlinked/deleted before crash with sense 
> with my typical crash pattern: How can I try to monitor accessed files 
> just before my typical crash patterns (to see what reiserfs makes of 
> them after crash)?

Since usually you cannot reliable predict a crash time (note, that if you
can and it is SW fault, you should file a bug report instead, I think).

> I really want to watch what gets restored, recovered or deleted if 
> possible. So far I don't get a logic from your explanations to my 

You get keys of all objects truncated or deleted during mount.
deleted keys won't help you as they are deleted, truncated files can be found
by tjeir key (e.g. debugreiserfs -d /dev/hda and look for the first 2 
numbers in a key).

> ReiserFS' behaviour on this, sorry, though I understood your and Chris 
> words on this. Is there a way to do this "snapshot"?

I think Chris said you can get a snapshot using intermezzo + datalogging patchs
from Chris.

> Dieter, do you have a time relation of your crashes? I mean e.g. related 
> in secs or mins after system startup? My "most loved crashes" 
> (without-page-colouring, of course) occur approx. 2min after startup 
> with full Seti-load or formerly on a "make bzlilo" without "sync" after 
> "make bzImage" (formerly = "with unusable bdflush and harddisk settings").

You mean, once you start CPU-intensive task, everything dies pretty soon?
Are you sure you do not have hardware/overheating problems.
I had a problem on my WS, if I'd run 20 instances of
while :; do:; done
my WS would hang in under 5 minutes. This was fixed by adding 2
extra cooles to the case.

Bye,
    Oleg
