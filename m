From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Wed, 21 Aug 2002 18:17:49 +0200
Message-ID: <3D63BD2D.1070602@web.de>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <1029875053.12387.521.camel@tiny> <20020821100452.A10765@namesys.com> <3D636C80.4030605@namesys.com>
Reply-To: degerrit@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hans Reiser wrote:

> It is not that I oppose putting it into the tree with a fixed key for 
> the file holding it, it is that I want us to work on other things instead.
>
> Hans


Why not just run 'badblocks' (or the failure mechanism which now aborts 
with "bread: Cannot read a block") as an (optional) part of fsck and use 
the output in a bad-block-marking phase? Then you don't need to store 
the list of bad blocks anywhere, at least not for fsck anyway ;-). 
Personally though, as a user, I'd like to confirm the list of bad blocks 
in this case (in case it's too large I might decide not to do it...)

It wasn't even clear to me until last week that the hard disk *also* did 
remapping of bad blocks, whether automatically or with some vendor-tool. 
Perhaps any fsck failure due to hardware error should recommend using 
low-level disk-checking tools provided by hard disk vendors prior to 
taking any action itself?

- Gerrit


