From: "David Dabbs" <david@dabbs.net>
Subject: RE: Performance improvements to key comparison functions
Date: Tue, 13 Jul 2004 17:18:43 -0500
Message-ID: <20040713221928.70FA315D92@mail03.powweb.com>
References: <40F42B13.3040009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F42B13.3040009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: reiserfs-list@namesys.com


Scratch the per-level caching idea. What was I thinking? A cached node's
level is not invariant. But (pardon my ignorance of the tree operations)
could nodes at different tree levels have ld_/rd_key ranges within which the
key sought could fit, or is the level check present to avoid key comparisons
against nodes that cannot possibly match (because the level is different)?


david


