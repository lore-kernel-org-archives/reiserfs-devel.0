From: PFC <lists@boutiquenumerique.com>
Subject: Re: reiser4 performance
Date: Thu, 11 Aug 2005 21:00:25 +0200
Message-ID: <op.svcxqzsbth1vuj@localhost>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com> <e692861c05080816136f9d70bc@mail.gmail.com> <42F7F6DC.2080706@slaphack.com> <e692861c050808175818078a30@mail.gmail.com> <42F807D7.9090900@slaphack.com> <e692861c05080818551a300f36@mail.gmail.com> <42FB9DD7.6080003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25412-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FB9DD7.6080003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Gregory Maxwell <gmaxwell@gmail.com>
Cc: David Masover <ninja@slaphack.com>, ReiserFS List <reiserfs-list@namesys.com>


> Well, but then you have to tell postgres that it can assume these things
> about reiser4.....

you can already set the sync mode in the config file to a llot of  
different choices, like fdatasync, fsync, O_SYNC, etc, so a reiser4 option  
would be possibel I guess.


