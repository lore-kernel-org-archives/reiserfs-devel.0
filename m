From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Wed, 21 Aug 2002 21:36:35 +0400
Message-ID: <3D63CFA3.9090303@namesys.com>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <1029875053.12387.521.camel@tiny> <20020821100452.A10765@namesys.com> <3D636C80.4030605@namesys.com> <3D63BD2D.1070602@web.de>            <3D63CA89.3050002@namesys.com> <200208211733.g7LHXZs0016127@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11275-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: degerrit@web.de, reiserfs-list@namesys.com, vitaly@thebsh.namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Wed, 21 Aug 2002 21:14:49 +0400, Hans Reiser said:
>
>  
>
>>>Why not just run 'badblocks' (or the failure mechanism which now 
>>>aborts with "bread: Cannot read a block") as an (optional) part of 
>>>fsck and use the output in a bad-block-marking phase? 
>>>      
>>>
>>This is good UI design.  Vitaly....
>>    
>>
>
>Certainly make it optional (or optionally disabled) - having to read 300G of
>data blocks when you know that the media is good would be massive overkill,
>when you're rebooting after a panic for other reasons. ;)
>  
>
The user should be interactively queried as to whether to do it.


