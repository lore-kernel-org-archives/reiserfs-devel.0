From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 11:51:48 -0700
Message-ID: <41337744.1070003@namesys.com>
References: <20040826154446.GG5733@mail.shareable.org> <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com> <20040826165351.GM5733@mail.shareable.org> <20040830173757.GU5108@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040830173757.GU5108@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Jamie Lokier <jamie@shareable.org>, Rik van Riel <riel@redhat.com>, Christophe Saout <christophe@saout.de>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Alex Zarochentsev wrote:

>On Thu, Aug 26, 2004 at 05:53:51PM +0100, Jamie Lokier wrote:
>  
>
>>Rik van Riel wrote:
>>    
>>
>>>And if an unaware application reads the compound file
>>>and then writes it out again, does the filesystem
>>>interpret the contents and create the other streams ?
>>>      
>>>
>>Yes, exactly that.  The streams are created on demand of course, and
>>by userspace helpers when that's appropriate which I suspect it almost
>>always is.
>>
>>    
>>
>>>Unless I overlook something (please tell me what), the
>>>scheme just proposed requires filesystems to look at
>>>the content of files that is being written out, in
>>>order to make the streams work.
>>>      
>>>
>>Yes.  Hence the idea of coherent views between two files: writing to
>>one affects the content of the other, although the calcalation is only
>>done on demand (or when the fs wants to migrate the representation --
>>for example, creating the flat container prior to deleting the
>>regeneratable pieces in order to save space).
>>
>>I haven't seen anything from Namesys that says they'll do that.
>>
We do that, err, it is our design to do that. Hmm, the plugins to do 
that seem to all be in the next to implement list and not on the 
implemented already list.....

However, with respect to streams, those are just files in a 
file-directory object in our scheme. If you want them unified, well, 
then you cat compound-document/pseudos/glued, or you link 
compound-document/pseudos/glued to compound-document/pseudos/body, where 
body is our term for the default stream, and then you just cat 
compound-document

If you have the impression I am being vaporwarish, well, you are 
right.... glued is not yet on the already implemented list.

Hans
