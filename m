From: Lincoln Dale <ltd@cisco.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 18:40:48 +1000
Message-ID: <42BBC710.8010906@cisco.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>	 <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com> <42BB7083.2070107@cisco.com> <42BBAD0F.2040802@namesys.com> <42BBB1FA.7070400@cisco.com> <42BBC2EC.2080000@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BBC2EC.2080000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:

>>>ow, if his target is reduced to whether we can eliminate a function
>>>indirection, and whether we can review the code together and see if it
>>>is easy to extend plugins and pluginids to other filesystems by finding
>>>places to make it more generic and accepting of per filesystem plugins,
>>>especially if it is not tied to going into 2.6.13, well, that is the
>>>conversation I would have liked to have had.
>>>
>>fantastic - some common ground.
>>any reason WHY there has to be an abstraction of 'pluginid' when in
>>theory VFS operations can already provide the necessary abstraction on
>>a per-object basis?
>>    
>>
>VFS supplies instances, plugins are classes.  If a language can
>instantiate an object, that does not eliminate the value of being able
>to create classes.
>
>Does it make sense to you now?
>  
>
you've lost me . . .

regardless, it isn't /me/ that you need to convince.  how about a 
posting to l-k on "why Reiser4 cannot use VFS infrastructure for 
[crypto,compression,blahblah] plugins" - ideally, for each plugin.


cheers,

lincoln.
