From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 18:43:05 +0200
Message-ID: <200209161843.05278.bofh@coker.com.au>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <200209161713.52352.russell@coker.com.au> <20020916162359.421472926@hofmann.snowcra.sh>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020916162359.421472926@hofmann.snowcra.sh>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Vilain <sam@vilain.net>
Cc: 'reiserfs-list' <reiserfs-list@namesys.com>

On Mon, 16 Sep 2002 18:23, Sam Vilain wrote:
> Russell Coker <russell@coker.com.au> wrote:
> > A machine with an adequate security setup and with correctly configured
> > quotas should be able to operate correctly with hostile local users even
> > if it only has a single file system.
>
> Perhaps.  Quotas are non-trivial to set up, though.  As you pointed
> out, they're not in the standard kernel (and patching the latest
> kernel with the quotas patch isn't straightforward either).

Quotas are not THAT difficult to setup.  Quotas for Ext2 have been in the 
kernel for ages (long before ReiserFS even had it's current name).

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

