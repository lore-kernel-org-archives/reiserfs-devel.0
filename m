From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 15:50:25 +0300
Message-ID: <20040804125025.GP1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org> <200408031819.51600.vitaly@namesys.com> <4110A38A.7040807@namesys.com> <20040804095513.GL1284@nysv.org> <20040804144144.2f5fe7b3@philou.gramoulle.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040804144144.2f5fe7b3@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe@nysv.org, Gramoull@nysv.org
Cc: reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 02:41:44PM +0200, Philippe Gramoull? wrote:
>As Markus said, Reiser4 hasn't been officially released, so i'm all for format disk change if it improves things in the end
>and even if few people might get burnt with that.

For now, I just hope no one jumps the gun and fscks with the new
tools, unless they REALLY have to.

Point is, maybe the block could be relocated without data loss?
Is that not much more elegant a solution?

I'm at least waiting for Vitaly to comment on this issue, if it really
is too difficult or impossible, then we all risk data loss.
C'est la software beta.

But even if there was some misunderstanding between Vitaly and Hans
about data loss (Hans did say that there will be no inelegant format
changes), the new backup layout sounds like a reasonable and good idea.

-- 
mjt


