From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 10:25:49 -0400
Message-ID: <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
References: <rlrevell@joe-job.com>
Return-path: <reiserfs-list-return-21283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Lee Revell <rlrevell@joe-job.com> 
   of "Wed, 01 Sep 2004 18:51:12 -0400." <1094079071.1343.25.camel@krustophenia.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Jamie Lokier <jamie@shareable.org>, Pavel Machek <pavel@suse.cz>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Lee Revell <rlrevell@joe-job.com> said:

[...]

> FWIW, this is how Windows does it now.  As of XP, 'Find files' has an
> option, enabled by default, to look inside archives.  If you tell it to
> look for a driver in a given directory it will also look inside .cab 
> and .zip files.  It's extremely useful, I would imagine someone who uses
> XP a lot will come to expect this feature.

It is trivial to implement this by looking inside the files. I.e., the way
mc has done this for ages.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
