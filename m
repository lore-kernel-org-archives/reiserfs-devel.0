From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 03:49:06 +0200
Message-ID: <3CE46192.7080101@netscape.net>
References: <3CD72AB1.6010607@netscape.net>	<20020507092207.A6678@namesys.com>  <3CD82C76.2080706@netscape.net> <1020864892.32044.215.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 05/08/2002 03:34 PM, Chris Mason wrote:

> On Tue, 2002-05-07 at 15:35, Manuel Krause wrote:
> 
> 
>>Mmh. I meant to restore the affected files from existing backups. When
>>they are  removed by reiserfs on mount I know they are really corrupted
>>during crash. It often looks like:
>>  Removing [5523 5570 0x0 SD]..done
>>  Removing [5523 5569 0x0 SD]..done
>>  Removing [5523 5566 0x0 SD]..done
>>  There were 3 uncompleted unlinks/truncates. Completed
>>
> 
> Just to reiterate what Oleg said, these files were not corrupted during
> the crash.  


I was very satisfied with this special clarification as I thought I've 
finally understood it.

O.k. and for the moment or so far I have not been able to prove this. 
Your statement may be or may be not. I had many VMware sessions crashing 
while / before e.g. "May 17 03:41:30 firehead kernel: /dev/vmmon: 
Vmx86_ReleaseVM: unlocked pages: 44944, unlocked dirty pages: 26020"

That may not matter for you as my kernel is too experimental as I've 
explained before.

> Right before you crashed, something on your box deleted each
> of these files, but the delete did not have a chance to finish.  During
> the next mount we finish the delete, which brings the FS back to a
> consistent state.
> 
> -chris
> 


As I had often only running KDE and VMware [?crashing] I did want to 
know what files were removed - the VMware ones and/or the KDE session 
temporary ones. That was all.

I don't know what of them two deletes files "just directly before" a 
crash. VMware is known (as of newest _official_ docs to unlink its used 
memory&Co. file(s???) in /tmp during startup... but what happens during 
a crash?) Dunno.

I was curious and I stay curious, as I don't see any program deleting 3 
files just before every crash...  (I don't have sizes, places and names...)

For my side it does not depend on the "summary line" that says merely 
nothing to me so far.

Best wishes,

Manuel



