From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Fri, 01 Jul 2005 01:44:28 -0700
Message-ID: <42C5026C.20807@namesys.com>
References: <hubert@uhoreg.ca>	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>	<8783be6605062914341bcff7cb@mail.gmail.com> <878y0svj1h.fsf@evinrude.uhoreg.ca> <42C4F97B.1080803@slaphack.com> <42C4FC0E.7010104@namesys.com> <42C4FE70.4020809@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C4FE70.4020809@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

> Hans Reiser wrote:
>
>> It was always the expectation that users would want to have one
>> mountpoint with the files having metafiles as files, and another with
>> the same files but strictly posix, and then their apps can use whichever
>> they have the power to understand.
>
>
> It was never in the early betas I tried :(

Yes, well, there are a lot of things missing in functionality still from
what was, and still is, in the plan.  Inheritance, files not listed by
readdir, etc., lots of things need coding.  We have done the hard stuff
first though, so these other things will mostly not be a lot of code....

Hans

