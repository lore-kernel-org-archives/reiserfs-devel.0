From: Spam <spam@tnonline.net>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 3 Sep 2004 01:06:59 +0200
Message-ID: <1551538871.20040903010659@tnonline.net>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain>
 <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <20040902002431.GN31934@mail.shareable.org> <413694E6.7010606@slaphack.com>
 <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
 <4136A14E.9010303@slaphack.com>
 <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org>
 <4136C876.5010806@namesys.com>
 <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
 <4136E0B6.4000705@namesys.com> <4699bb7b04090202121119a57b@mail.gmail.com>
 <4136E756.8020105@hist.no> <4699bb7b0409020245250922f9@mail.gmail.com>
 <812032218.20040902120259@tnonline.net>
 <200409022239.i82MdmnO015327@turing-police.cc.vt.edu>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409022239.i82MdmnO015327@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Oliver Hunt <oliverhunt@gmail.com>, Helge Hafting <helge.hafting@hist.no>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


> On Thu, 02 Sep 2004 12:02:59 +0200, Spam said:

>>   The meta-data should be deleted if it the file is copied or moved to
>>   a medium that doesn't support it. However a _warning_ may be shown
>>   to the user if there is risk to loose data.

> OK... I'll bite.  How do you report the warning to the user if you're using
> an unenhanced utility to copy a file to a file system that may be lossy?

  That I do not really know. But I think this is somewhat the
  discussion here - how to make the support for metas and streams
  as good as possible.

  I suppose it would be difficult to actually query the user about
  something like this unless the applications themselves do. Perhaps
  warnings in the syslog is good for now?

  Already  now  things  like advanced attributes get lost when copying
  data from a supported fs to a non-supported one.

  Perhaps documentation around the ways to use streams and meta data
  should mention that only the supported fs will keep the extra info.

  As long as the user is aware that whatever information he puts in
  the meta or streams will be lost then it is ok, isn't it?

  ~S

  
  
  

