From: Andrew Morton <akpm@osdl.org>
Subject: Re: reiser4 read performance loss of 17% in latest -mm kernel
Date: Thu, 30 Dec 2004 21:46:39 -0800
Message-ID: <20041230214639.71dd6e82.akpm@osdl.org>
References: <41D4D358.2010406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D4D358.2010406@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
>
> Just an FYI, we are still figuring it out.  andrew, you might note it in 
> release notes, especially if we don't fix it before your next release.

I'd try reverting simplified-readahead*.patch.
