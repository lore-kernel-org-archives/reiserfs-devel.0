From: Spam <spam@tnonline.net>
Subject: Re: The argument for fs assistance in handling archives
Date: Sun, 5 Sep 2004 16:13:33 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <264532836.20040905161333@tnonline.net>
References: <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
 <4136A14E.9010303@slaphack.com>
 <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org>
 <4136C876.5010806@namesys.com>
 <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
 <4136E0B6.4000705@namesys.com> <4699bb7b04090202121119a57b@mail.gmail.com>
 <4136E756.8020105@hist.no> <4699bb7b0409020245250922f9@mail.gmail.com>
 <413829DF.8010305@hist.no> <20040905134428.GN26560@thundrix.ch>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040905134428.GN26560@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Helge Hafting <helge.hafting@hist.no>, Oliver Hunt <oliverhunt@gmail.com>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> Salut,

> On Fri, Sep 03, 2004 at 10:22:55AM +0200, Helge Hafting wrote:
>> Requiring another syscall to open forks other than the primary
>> breaks _all_ existing software because it obviously don't use that
>> syscall yet.  And then it doesn't provide any advantages over the
>> file-as-plain-directory way. . .

> Actually...

> We might tune the sys_open()  call to take an additional argument (the
> stream ID),  and introduce a compatibility interface  into *libc which
> chooses strid=0 by default if the plain old open call is being used.

> Maybe this can be handled transparently by cpp..

  How are things like copy handled today? Is it just some code linked
  in during compilation (ie, the application handles the copy itself)
  or is it a library function in libc? If it is in libc then it ought
  to be enough if libc is patched to support the new semantics with
  file-as-dir etc.

  ~S


> 		Tonnerre

