From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 11:27:46 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <412F7D22.5050101@namesys.com>
References: <Pine.LNX.4.44.0408271010300.10272-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0408271010300.10272-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Rik van Riel wrote:

>On Fri, 27 Aug 2004, Hans Reiser wrote:
>
>  
>
>>Why are you guys even considering going to any pain at all to distort 
>>semantics for the sake of backup?  tar is easy, we'll fix it and send in 
>>a patch. 
>>    
>>
>
>Because not everybody uses tar.  Quite a few people use a
>network backup system, while others use duplicity, RPM uses
>cpio internally and big companies tend to use proprietary
>network backup suites.
>
>Breaking people's setup is something to worry about.
>
>  
>
It is the tail that should not wag the dog.  New semantics are going to 
break backups other than dd.   We need a LOT of new semantics if we 
don't want to be inferior to Apple and MS.

We should implement backup plugin methods though, so that we only have 
to break things once....
