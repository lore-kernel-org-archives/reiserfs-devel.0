From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 01:06:37 -0700
Message-ID: <412EEB8D.5080309@namesys.com>
References: <20040826194010.548e4a4c.diegocg@teleline.es> <Pine.LNX.4.44.0408261358370.27909-100000@chimarrao.boston.redhat.com> <20040826182042.GU5733@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826182042.GU5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Jamie Lokier wrote:

>Rik van Riel wrote:
>  
>
>>>/bin could be separated (like linus said) but cat /bin/.compound could
>>>do it. This is the /etc/passwd Hans' example, I think:
>>>      
>>>
>>Arghhhh.  I wrote it down to ridicule the idea and now people
>>are taking it seriously ;(
>>
>>It should be obvious enough that anything depending on the
>>kernel parsing file contents will lead to problems.
>>    
>>
>
>This is one case where the kernel _isn't_ parsing file contents,
>but I agree it's ridiculous :)
>
>-- Jamie
>  
>
Umm, no, when you write the glued /etc/passwd file it parses the 
delimiters in it to determine what subfile to put the parts of 
/etc/passwd into.

Inheritance with delimiters is the best way to make emacs effective for 
editing lots of small files, Stallman was right and deserves credit for it.
