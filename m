From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Tue, 04 Jun 2002 06:16:11 +0200
Message-ID: <3CFC3F0B.6060707@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny> 	<3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023159462.31682.54.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/04/2002 04:57 AM, Chris Mason wrote:
> On Mon, 2002-06-03 at 21:49, Manuel Krause wrote:
> 
> 
>>Now it is "only":
>>Kernel.2.4.19-pre9
>>ReiserFS.pending.01..03,05 (rest doesn't cooperate cleanly)
>>ReiserFS.mason.01..03 (maybe slightly modified for this)
>>rml.preempt-kernel (          -"-                 )
>>
>>/ mounted -o noatime,notail,data=logging
> 
> 
> Ah, still on the todo list for the current patch is safe handling of
> remount.  

O.k.

 >
> Currently data=logging and data=ordered are ignored on
> remount, which is probably why your results were so fast in data logging
> mode.

Yes, as-is on SuSE typical bootup. But, o.k., I know to handle,  I've 
changed and reset my lilo-setup accordingly to your mail...

So, I just retested, with your recommended append to lilo.conf 
"rootflags=data=journal" -- but timings stay the same. And mount says 
still the same, too:
/dev/hda7 on / type reiserfs (rw,noatime,notail,data=logging)

So should you be glad or not!?
The NS7 and OOo.1.0 load timings are generally measured in secs +-1 and 
stay to be faster, like I posted before.

> 
> You'll want to pass rootflags=data=ordered or rootflags=data=journal at
> the lilo prompt.
> 
> -chris
> 

No, no mistake on this way, on my side, really, you could finally (if 
you don't find a solution within your new coding) blame it to my bad 
previous patches' setup... ;-)))
(yes, finally -- at the real end, of course!!! ;-)  )

Thank you, works very well,

Manuel

P.S.: Please, keep me informed, as Namesys seems to need a pushup for 
2.4. kernels... ;-) Sorry, Hans! ;-)

