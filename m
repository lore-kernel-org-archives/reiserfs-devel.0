From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 11:11:30 -0700
Message-ID: <413DF9D2.5060703@namesys.com>
References: <200409070206.i8726vrG006493@localhost.localdomain>	<413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>	<1183150024.20040907143346@tnonline.net> <m38ybmjiyz.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m38ybmjiyz.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christer Weinigel <christer@weinigel.se>
Cc: Spam <spam@tnonline.net>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Christer Weinigel wrote:

>Spam <spam@tnonline.net> writes:
>
>  
>
>>>Additionally, files-as-directores does not solve the problem of 
>>>"cp a b" losing named streams.
>>>
reiser4 does not support streams, it supports files that can do what 
streams do. cp -r does not currently lose files.

