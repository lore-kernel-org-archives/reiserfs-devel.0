From: Chris Mason <mason@suse.com>
Subject: Re: BUG in submit_ordered_buffer at fs/reiserfs/journal.c:616!
Date: Mon, 14 Mar 2005 14:50:53 -0500
Message-ID: <200503141450.54309.mason@suse.com>
References: <20050311224936.GK1220@austin.ibm.com> <42322C38.1040106@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42322C38.1040106@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Linas Vepstas <linas@austin.ibm.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, vitaly@thebsh.namesys.com, Jeff Mahoney <jeffm@suse.com>

On Friday 11 March 2005 18:39, Hans Reiser wrote:
> "I/O errors usually indicate bad hardware not bad software,
> probably you need to get a new disk and use dd_rescue to copy everything

This is your user friendly error message targeted at users that don't know 
what an I/O error is?  

What's an I/O error?
What's software?
What's hardware?
What's a disk?
What's dd_rescue?
How do I copy everything?
How do I put a new disk in?
How do I make the kernel recognize use new disk instead of the old one?

The list goes on and on.  You'll never make the kernel more usable by making 
messages in the syslog more verbose.  You can make it more usable by having 
consistent error messages that can be found via search engines or the manual.

Jeff's completely right here.

-chris
