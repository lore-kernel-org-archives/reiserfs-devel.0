From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Tue, 3 Aug 2004 16:58:05 +0300
Message-ID: <20040803135805.GK1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <200407131427.58912.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408031750.00291.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, Aug 03, 2004 at 05:50:00PM +0400, Vitaly Fertman wrote:
>No kernel patch is needed for the disk format change, however fsck may 
>report about some corruptions on an existent fs if a block was allocated 
>for some data and has become a backup one. Fsck.reiser4 --build-fs is 
>able to fix it of course, although the data in these blocks are lost then.

What kind of probabilities and amounts of data are we talking about?

Thanks!

-- 
mjt

