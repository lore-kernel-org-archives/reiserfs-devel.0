From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: write barrier patches for 2.4.21
Date: Tue, 26 Aug 2003 11:03:48 +0200
Message-ID: <20030826090348.GA29526@mfa.kfki.hu>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826081715.GA5816@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030826081715.GA5816@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hi!

 > > Where can I get Jens Axboe's + Chris Mason's (reiserfs) ide write
 > > barrier patches for kernel 2.4.21 ?
 > > I'd like to test a 3ware based raid setup (8xide) with write cache
 > > enabled.
 > 
 > I think that the patch does not have 3ware support. Only conventional IDE
 > controllers are supported by the patch.

Thanks.

So the only way for production servers is still with write cache
disabled.

Gergely
