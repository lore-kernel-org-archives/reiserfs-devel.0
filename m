From: encieno@mirage.org
Subject: Re: Reiser questions on possible corruptions / sparc + scsi
Date: Thu, 17 Jun 2004 14:00:25 -0500 (CDT)
Message-ID: <Pine.LNX.4.60.0406171358290.29674@surreal.mirage.org>
References: <Pine.LNX.4.60.0406171212440.28356@surreal.mirage.org>
 <200406172251.39615.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406172251.39615.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

> what do you mean 'with no luck' ? I have just tested that fix-fixable can
> fix broken objectid map, reiserfsprogs-3.6.17. Do you run check just after
> --fix-fixable and get the same error messages? Or you mean that such
> errors appear again after using fs for a while?

Yeah, no luck as in, when it's complete, I run a --check again, and it 
still reports the exact same errors. The only thing I've noticed is that 
occasionaly it will dump a few things into lost+found.


-dave

