From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Data-logging and md as / fs bug
Date: Thu, 15 May 2003 15:31:28 +0200
Message-ID: <3EC396B0.7030605@netscape.net>
References: <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com> <3EC0FE02.9030007@netscape.net> <20030513142501.GI12963@namesys.com> <3EC10879.1040902@netscape.net> <20030513145923.GJ12963@namesys.com> <3EC111C0.2010602@netscape.net> <20030513154215.GK12963@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 05/13/2003 05:42 PM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, May 13, 2003 at 05:39:44PM +0200, Manuel Krause wrote:
> 
[...]
>>
>>Clearly, what I meant:
>>       with iget5-pre5-patch,  without,  with your posted patch
>>App.   NS7  OOo                NS7  OOo
>>(s)    10   17                 11+  19+     untested
>>-
>>(s) = startup times in seconds
> 
> 
> Hm. Strange. Of course there are some VFS changes present but they are
> inode loading related, so I do not think they should be visible at all.
> Can you retest and see if this is not a measurement error/random fluctuations?
> 

Please, excuse the delay. I had to dry and reassemble my notebook 
keyboard first. :-((

I was able to reproduce the differences shown above, grin, but as 
general fluctuations... Netscape7 always takes 10..12s and OpenOffice 
always 17...19s to start _no_matter_ whether iget5 is applied, with 
kinoded-9 with or without dirty-inodes-patch or none of these three.

So, simply forget what I've written.


Bye,

  Manuel

