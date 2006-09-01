From: David Masover <ninja@slaphack.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Fri, 01 Sep 2006 18:12:56 -0500
Message-ID: <44F8BE78.1080503@slaphack.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <edae71$iqf$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Peter wrote:
> On Fri, 01 Sep 2006 17:27:20 -0500, David Masover wrote:
> snip...
>>> both mkfs.reiserfs and fsck.reiserfs have -B option to accept list of
>>> bad blocks. We thought that should be enough.
>> It really should.  Why bother with a patch?  Just write a wrapper script
>> that runs badblocks and passes in the list to mkfs.
> 
> It was just a thought from userland. My perspective was that a user, not a
> hard-boiled geek, might get lulled into a false sense of security but may
> not have the wherewithal to write a wrapper. If nothing else, when the
> final doc is written (did I say final?:)), it should include a notice
> about not running badblocks.

Well, let's see...  Most hard drives come more thoroughly tested at the 
factory than anything badblocks would do.  Also, it seems redundant to 
have every single mkfs have to implement a badblocks flag..

I'd suggest a universal wrapper, then, or a modification to the "mkfs" 
frontend, so that this works the same way across all filesystems. 
Something like "mkfs -B -t reiser4"
