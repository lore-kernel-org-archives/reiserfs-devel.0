From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Mon, 19 Aug 2002 14:07:26 +0400
Message-ID: <3D60C35E.7000903@namesys.com>
References: <200208152007.42370.degerrit@web.de> <200208152329.40707.degerrit@web.de> <200208161205.00550.vitaly@namesys.com> <200208170254.48383.degerrit@web.de> <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Mon, Aug 19, 2002 at 01:14:10PM +0400, Hans Reiser wrote:
>  
>
>>>He argues that if we'd had corrupted tree, how would we know that the 
>>>bablocks
>>>list is corrupted or not. Or something like that.
>>>      
>>>
>>And he suggests doing what instead?
>>    
>>
>
>He suggests that user should specify list of bad blocks each time user runs
>reiserfsck.
>
>Bye,
>    Oleg
>
>
>  
>
This sounds reasonable.  You can probably even have a default location 
to check for the list somewhere in /etc if you want.  Remind the user 
that you are using it everytime you find it though, that way if a 
different sysadmin is running fsck, they can know why not all the blocks 
they expect to be there are accessible.

Hans


