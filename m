From: Hans Reiser <reiser@namesys.com>
Subject: Re: Snapshots a la NetApp?
Date: Wed, 26 Mar 2003 21:37:10 +0300
Message-ID: <3E81F356.8090002@namesys.com>
References: <200303221822.34401.phma@webjockey.net>	 <33433.10.20.2.148.1048390681.squirrel@alpha>	 <1048411014.1427.5.camel@wusel.schnulli.de> <3E7F6F66.5050808@namesys.com>	 <1048542143.1332.31.camel@wusel.schnulli.de> <3E7FC055.2030903@namesys.com> <1048688107.8495.29.camel@kakapo.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1048688107.8495.29.camel@kakapo.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: kend@xanoptix.com, reiserfs-list@namesys.com, Alexander Lyamin <flx@namesys.com>

Heinz-Josef Claes wrote:

>
>btw: The only handycap of the used method is that all the links to a
>file can have only *one* set of permissions (chmod, chown). Will it be
>possible to change this with a loadable module in reiser4?
>
>best regards,
>HJC
>
>
>
>  
>
I am not sure if we will support that.  If someone wanted to write the 
code to do it, then I could examine the problem more closely and it 
could be done.....

-- 
Hans


