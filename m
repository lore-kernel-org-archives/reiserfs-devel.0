From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 12:55:13 +0300
Message-ID: <20040804095513.GL1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org> <200408031819.51600.vitaly@namesys.com> <4110A38A.7040807@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4110A38A.7040807@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 01:51:22AM -0700, Hans Reiser wrote:

>These blocks refers to blocks that were used by files and are now backup 
>super blocks?  These blocks could be critical database files, etc.?

Seems to me like yes, but Reiser4 hasn't launched yet officially, so
I somehow doubt people will have anything too critical on Reiser4.

I'm at least preparing myself to take backups of everything.

>If yes, then please pull this off our website until you come up with a 
>scheme that I am sure will not create more user problems than it solves, 
>on average.

Yeah, there is the other hand that said that the online format is
now set in stone...

Still the important question is, what's the net gain of this new format?

-- 
mjt

