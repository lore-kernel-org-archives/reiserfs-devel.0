From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 17:22:27 +0300
Message-ID: <20040804142227.GR1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org> <200408031819.51600.vitaly@namesys.com> <4110A38A.7040807@namesys.com> <20040804095513.GL1284@nysv.org> <20040804144144.2f5fe7b3@philou.gramoulle.local> <1091627399.4791.22.camel@watt.suse.com> <4273.192.168.0.30.1091628986.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19983-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4273.192.168.0.30.1091628986.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 10:16:26PM +0800, Thomas Graham wrote:
>if a convertor are not done yet, I think we could wait until it's bundle
>into the .tar.gz and we could use it, actually, do we HAVE TO do that
>format changes ? or normal user could just ignore that except for some of
>them who reach problem with that ?

I don't think you HAVE to do it, if you would, there would be a compensation
in the kernel, and Vitaly said there is not.

So just avoid the reiser4progs like the plague, call the Namesys helpdesk,
whatever and ask Vitaly to remove the file from the web, remove the
code that changes the format, whatever.

I just hope I won't hit a corruptive bug on my machine, it would be pretty
anticlimactic if I did and I would lose data because it decides to
change the format.

-- 
mjt

