From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 28 Mar 2004 19:57:56 +0100
Message-ID: <200403281957.57226.filipe@rnl.ist.utl.pt>
References: <200403271537.52955.sikkh@wp.pl> <40670001.60302@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40670001.60302@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, Piotr Neuman <sikkh@wp.pl>

On Sunday 28 March 2004 17:40, Hans Reiser wrote:
> Piotr Neuman wrote:
> >The new naming scheme for plugins ("metas" in snapshot 2004.03.26) may on
> >certain occasions cause name clashes. This patch changes "metas" into
> >"..metas" which should avoid this problem in most cases.
>
> The name clashing is less important than the greater user friendliness.
> Users on the mailing list convinced me of this.

Isn't this is introducing the kind of side effects that existed in windows 
machines with the "con" and "aux" special filenames?
IMHO, it doesn't seem wise to introduce a special filename called metas into 
unix. Something prefixed with a special character like ... would be much 
safer.

About the user user friendliness issue, would novice users be messing with the 
metadata exposed by reiser4 pseudo files? I think this will be a feature for 
software and advanced users.

Regards,
Filipe Almeida 
