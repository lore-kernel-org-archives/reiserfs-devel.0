From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 13:06:41 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41323751.5000607@namesys.com>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com> <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com> <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk> <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, torvalds@osdl.org, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

viro@parcelfarce.linux.theplanet.co.uk wrote:

>On Sun, Aug 29, 2004 at 07:36:29PM +0100, viro@parcelfarce.linux.theplanet.co.uk wrote:
>  
>
>>>he wants without recompiling to do it.  This kind of a view requires no 
>>>coding because you can just mount the root filesystem two ways, one with 
>>>the -nopseudos mount option, and one without it.
>>>      
>>>
>>*What*?
>>
>>OK, now I want detailed explanation of the reasons why that doesn't create
>>cache coherency problems.
>>
>>Do you have an analysis of locking in the entire thing?
>>    
>>
>
>And I am very, very serious about that - we are talking about very nasty
>minefield and design choices in that area have fundamental impact on the
>entire layer, wherever it is located.
>
>It's *NOT* something that you can leave until later and hope it somehow
>falls into place - it can be merged in steps, but you MUST know the goal
>on that level.  To rearchitect later might be possible (even though you
>will a hell of a time avoiding plugins breakage), but it will be *hard*.
>
>
>  
>
How about if you educate me on the problems you see for a bit before I 
respond? I think it might help us move into a constructive discussion.

You are more experienced with your code than I am.... but I firmly 
believe that having different views of the same filesystem in which some 
files are visible in one view but not in another is technically feasible 
for some VFS, though I'd like to learn about the problems you see for 
doing it in the current VFS.
