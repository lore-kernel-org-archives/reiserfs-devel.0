From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Squid eating up all CPU
Date: Wed, 8 Sep 2004 13:19:10 +0300
Message-ID: <200409081319.13313.rmeijer@internet.gr>
References: <200409071528.06971.rmeijer@internet.gr> <200409071650.46311.rmeijer@internet.gr> <20040907150347.GD6294@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040907150347.GD6294@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tue 7 September 2004 18:03, Alex Zarochentsev wrote:

> > Apparently the QFA continued to do this even after closing both its
> > window and Firefox, without any relevant processes showing up with ps..?!

> there should be the QFA process, I think.

I thought so too, but I really couldn't find anything with ps, netstat or 
lsof...

Anyway, I don't think the problem's with Reiser4, but rather with QFA or 
Squid. I'll try to reproduce it later.

On topic: my machine crashed hard several hours ago because its UPS suddenly 
died. I'm happy to report that my file systems didn't have a single error at 
all! (I rebooted with "init=/bin/bash" to check them before mounting them)


Thanks,

Ray
