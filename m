From: PFC <lists@boutiquenumerique.com>
Subject: Re: reiser4 performance
Date: Tue, 09 Aug 2005 09:41:55 +0200
Message-ID: <op.su8cz5y5th1vuj@localhost>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com> <e692861c05080816136f9d70bc@mail.gmail.com> <42F7F6DC.2080706@slaphack.com> <e692861c050808175818078a30@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c050808175818078a30@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>, David Masover <ninja@slaphack.com>, ReiserFS List <reiserfs-list@namesys.com>



> So for most webserver cases, FS speed doesn't matter. For the few
> cases where it does, locality is usually fairly good... so who cares
> if the new FS is 2x faster, when it is still 200x slower than ram. Add
> ram.

	But Reiser4 helps stuffing more files into the cache.
	It also helps when many people concurrently download (or upload) large  
files. Its streaming performances are very good.


