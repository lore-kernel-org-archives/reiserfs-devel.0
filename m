From: David Greaves <david@dgreaves.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 10:36:42 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <412F00AA.9000402@dgreaves.com>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com><Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org> <45010000.1093553046@flay> <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org> <57730000.1093554054@flay> <Pine.LNX.4.58.0408261402400.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0408261402400.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: "Martin J. Bligh" <mbligh@aracnet.com>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Linus Torvalds wrote:

>On Thu, 26 Aug 2004, Martin J. Bligh wrote:
>  
>
>>I think what you're saying is that they'd both return positive, right?
>>    
>>
>
>No. I'd say that a file would look like a file, even if it has attributes.
>
>It wouldn't show as a directory at all - unless you start looking at 
>attributes. Because it really _is_ a file, and it's "directory aspect" is 
>really nothing but a way to make its named streams visible.
>
>So you really should consider it a perfectly regular file, and so only 
>S_ISREG() will return true, and S_ISDIR() will return false.
>
>  
>
ie, logically:

S_ISREG() no longer precludes O_DIRECTORY from succeeding
conversley
O_DIRECTORY succeeding no longer implies S_ISDIR()

However, apps making those assumptions will not notice new behaviour.

?

David

