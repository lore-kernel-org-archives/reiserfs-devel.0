From: Hans Reiser <reiser@namesys.com>
Subject: Re: Is it good for a PDA fs?
Date: Sat, 22 Jun 2002 21:50:33 +0400
Message-ID: <3D14B8E9.4020808@namesys.com>
References: <20020622115207.E23457@gerf.org> <20020622175746.I13075@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Dukes <pakrat@www.uk.linux.org>
Cc: The Doctor What <docwhat@gerf.org>, reiserfs-list@namesys.com

Chris Dukes wrote:

>On Sat, Jun 22, 2002 at 11:52:07AM -0500, The Doctor What wrote:
>  
>
>>Having just bought a Sharp Zaurus with a 64meg MMC and a 256 CF, my
>>mind instantly jumps to the question, can it be used to pick up
>>chicks?
>>
>>When I was done with that avenue of thought, I wondered if it's
>>worth it to figure out how to build my own kernel just to add
>>reiserfs to it.
>>
>>I know about it's handiness with journalling, etc. and that'd be
>>useful for the occasional glitches I've had.
>>
>>Does ReiserFS has anything that is more useful or less usefull for
>>such a small memory application?
>>    
>>
>
>Standard journalling techniques just fry a portion of the compact flash
>faster.  The tail merging might save space, but I would like to see
>a study of its effects on the longevity of compact flash.
>
>I think, but could be mistaken, than you want JFFS or JFFS2.
>
>  
>
I also have a sharp zaurus with 256M CF......


Currently the CF uses VFAT, yes?

I bet it has the same wear issues, and no space savings....

The zaurus has a non-standard kernel though, and it is based off of some 
rather old release (2.4.4?).  You would want to apply their kernel 
extensions to 2.4.18 or later I think  before using reiserfs....  If you 
do so, and get it working, let me know, the only reason I haven't used 
reiserfs on my CF is that I don't know where to get a recent kernel with 
their (presumably useful to the PDA) extensions....

You know, using a kernel that old seems like a really bad idea, the 
early 2.4s were simply beta-tests in my mind, I'd like to upgrade for 
reasons not just filesystems.....

Marcelo is doing a great job with keeping 2.4 stable.....

-- 
Hans



