From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 13:52:08 +0300
Message-ID: <20040804105208.GO1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <4110A38A.7040807@namesys.com> <20040804095513.GL1284@nysv.org> <200408041434.41816.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408041434.41816.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 02:34:41PM +0400, Vitaly Fertman wrote:

>the previous bakup layout had backup block locations depending on the fs 
>size, in other words every resize operation may need to relocate some nodes 
>in the tree to other blocks if the current ones are needed for the backup -- 
>even on expanding. there are no such problems with the current backup layout.

OK, this is a good enough motivation.

But does it have to be done here with fsck with data loss, is there no
other way around?

-- 
mjt

