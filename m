From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 22:07:22 +0200
Message-ID: <1785708679.20040902220722@tnonline.net>
References: Message from Lee Revell <rlrevell@joe-job.com>  of "Wed, 01 Sep
 2004 18:51:12 -0400." <1094079071.1343.25.camel@krustophenia.net>
 <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
 <1535878866.20040902214144@tnonline.net>
 <1094151338.5645.32.camel@localhost.localdomain>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094151338.5645.32.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Lee Revell <rlrevell@joe-job.com>, Jamie Lokier <jamie@shareable.org>, Pavel Machek <pavel@suse.cz>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> On Iau, 2004-09-02 at 20:41, Spam wrote:
>> > It is trivial to implement this by looking inside the files. I.e., the way
>> > mc has done this for ages.
>> 
>>   Difference is that you can't do "locate" or "find" or "Search".. You
>>   would have to open the files in an archive-supporting application
>>   such as mc.

> And would you rather that logic was running swappable in shared library
> space or privileged and unswappable in kernel ?

  I would rather have it as a filesystem/vfs plugin that would allow
  all my programs to use the features the plugin gives, even if it
  would mean being totally in kernel space.

> Alan

