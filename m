From: "Patrick.Le-Dot@bull.net" <Patrick.Le-Dot@bull.net>
Subject: Re: SetPageReferenced usage
Date: Fri, 14 May 2004 16:11:02 +0200
Message-ID: <200405141411.QAA249630@alpha12.frec.bull.fr>
Return-path: <reiserfs-list-return-18686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com
Cc: reiserfs-list@namesys.com

> From mason@suse.com Fri May 14 15:12:34 2004
> ...
> That would be a bug.  Thanks, I'll test the fix to make sure it doesn't
> have any unexpected side effects.

No (bad) side effect, just better performances :
mark_page_accessed() move the page into the active_list (under
conditions) and this is the only difference.
I'm confident:-)
Patrick
