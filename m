From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:47:39 -0700
Message-ID: <412E769B.1090508@namesys.com>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408261315110.2304@ppc970.osdl.org> <412E69D2.50503@namesys.com> <Pine.LNX.4.58.0408261625180.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261625180.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Linus Torvalds wrote:

>
>  
>
>>>And you might not be able to change the 
>>>permissions or date on the named stream either, since it may or may not 
>>>have a separate date/permission thing from the container.
>>>      
>>>
>>You should be able to change the permission and data,
>>
^data^date

>> but when you 
>>change it, you change it for the whole container.
>>    
>>
>
>Why? I'd much rather disallow it, than allow it and then have "nonlocal" 
>effects.
>  
>
Sometimes you want the nonlocal effects and sometimes you don't, and by 
decomposing streams into smaller primitives we can let users choose as 
they want.



