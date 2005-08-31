From: David Masover <ninja@slaphack.com>
Subject: Re: WinFS beta out
Date: Wed, 31 Aug 2005 00:46:19 -0500
Message-ID: <4315442B.1060701@slaphack.com>
References: <e692861c0508292136543a02e1@mail.gmail.com> <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com> <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com> <43150100.40304@namesys.com> <43153918.2090402@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43153918.2090402@perkel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Perkel <marc@perkel.com>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Marc Perkel wrote:
> 
> 
> Hans Reiser wrote:
> 
>>Marc Perkel wrote:
>>
>>  
>>
>>>One think to remember when comparing different file systems is not
>>>just speed but functionality. Windows has a far better permission
>>>system than Linux does. ACLs bring Linux closer to Windows when it
>>>cones to fine grained permissions, but when you turn ACLs on with
>>>reiser 3 it slows down to 1/10 of normal speed and Reiser 4 ACLs just
>>>doesn't work. With ACLs as part of the mix ReiserFS would get its butt
>>>kicked.
>>>
>>>Welcome to the real world.
>>>
>>>
>>>
>>>    
>>>
>>I didn't have any role in the reiser3 acls.  I would never have designed
>>them the way they got written.  If you want high performance acls,
>>sponsor me to supervise the work for reiser4, and they will be very high
>>performance.  Making them high performance in reiser4 is straightforward
>>and easy.
>>
>>  
>>
> Well - if it's so easy then what don't you just do it?

#1:  Relatively easy.  Most of what Namesys does every day makes

#2:  Priorities.  They don't "just do" stuff, they do what they are
being paid to do.  If you want them to just do it, just pay them, more
than they're being paid for...
