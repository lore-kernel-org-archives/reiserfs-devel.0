From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: new reiser4 snapshot
Date: Mon, 27 Oct 2003 12:25:56 -0800
Message-ID: <20031027202556.GI4511@matchmail.com>
References: <Pine.LNX.4.44.0310191956060.15715-100000@poorvi.cse.iitd.ernet.in> <3F92D35D.3090806@namesys.com> <3F93132D.70206@gmx.net> <16275.44662.847152.412738@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16275.44662.847152.412738@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Hans Reiser <reiser@namesys.com>, Nishant Sharma <nishantt@cse.iitd.ernet.in>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Mon, Oct 20, 2003 at 01:44:22PM +0400, Nikita Danilov wrote:
> Carl-Daniel Hailfinger writes:
>  > I thought CONFIG_REISER4_LARGE_KEY was force-enabled by now?
> 
> No. But:
> 
> 1. one has to use -o key=key_short option for mkfs.reiser4 to create
> file system with small keys.
> 
> 2. lately we mostly test/care about large keys performance and
> stability.

So why would one want short keys in the first place then?
