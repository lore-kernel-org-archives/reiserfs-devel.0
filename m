From: Chris Mason <mason@suse.com>
Subject: Re: SetPageReferenced usage
Date: Fri, 14 May 2004 09:00:44 -0400
Message-ID: <1084539644.2583.509.camel@watt.suse.com>
References: <200405141131.NAA159118@alpha12.frec.bull.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405141131.NAA159118@alpha12.frec.bull.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Patrick.Le-Dot@bull.net" <Patrick.Le-Dot@bull.net>
Cc: reiserfs-list@namesys.com

On Fri, 2004-05-14 at 07:31, Patrick.Le-Dot@bull.net wrote:
> Hi list,
> 
> I'm interested to understand why fs/reiserfs/file.c use SetPageReferenced
> instead of the mark_page_accessed function (like in all others FS) ?
> 
> Thanks to reply to me directly as I'm not on the list.

That would be a bug.  Thanks, I'll test the fix to make sure it doesn't
have any unexpected side effects.

-chris


