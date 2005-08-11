From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 performance
Date: Thu, 11 Aug 2005 11:49:59 -0700
Message-ID: <42FB9DD7.6080003@namesys.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>	 <e692861c05080816136f9d70bc@mail.gmail.com>	 <42F7F6DC.2080706@slaphack.com>	 <e692861c050808175818078a30@mail.gmail.com>	 <42F807D7.9090900@slaphack.com> <e692861c05080818551a300f36@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05080818551a300f36@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: David Masover <ninja@slaphack.com>, ReiserFS List <reiserfs-list@namesys.com>

Gregory Maxwell wrote:

>On 8/8/05, David Masover <ninja@slaphack.com> wrote:
>  
>
>>"Reiser4 would be great if..." is getting old.  It is great, and it's
>>getting even better pretty fast.
>>
>>And, by the way, if the transaction interface gets done, it's not just
>>databases that will benefit, but also small files.  After all, what kind
>>of transactions are used for your OpenOffice document?  
>>    
>>
>...
>
>Well there doesn't actually need to be a transaction interface for
>postgresql's needs.. it just needs a fairly limited set of assurances
>from the VFS/FS that ... aren't usually provided. Beyond that, it
>already handles its own transactions.  It looks like from Hans' reply
>the reiser4 already provides everything needed.. which I had
>suspected.
>
>
>  
>
Well, but then you have to tell postgres that it can assume these things
about reiser4.....
