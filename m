From: Jeremy West <jkwest@gmail.com>
Subject: Re: Bug with fsck.reiser4 build-fs - Hangs at 100%
Date: Mon, 8 Nov 2004 14:28:08 -0500
Message-ID: <b28a886104110811287311b7@mail.gmail.com>
References: <Pine.LNX.4.51.0411052339130.5646@leandra.the-lab.virtadpt.net>
	 <200411071514.50082.vitaly@namesys.com>
	 <Pine.LNX.4.51.0411081412321.5646@leandra.the-lab.virtadpt.net>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.51.0411081412321.5646@leandra.the-lab.virtadpt.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Wolf <julia@virtadpt.net>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

So you were experiencing the filesystem hanging and then fixed it
using the latest reiser4progs?  I thought reiser4progs was basically
provided mkfs.reiser4 and fsck.reiser4?  I was thinking my issue was
kernel related, and not reiser4progs related.  I guess I totally
missed the mark there then.


On Mon, 8 Nov 2004 14:14:46 -0500 (EST), Julia Wolf <julia@virtadpt.net> wrote:
> 
> On Sun, 7 Nov 2004, Vitaly Fertman wrote:
> 
> > what version of reiser4progs are you using? the latest is 1.0.2, try
> > it please if you have not yet. if you get the same result, would you
> 
>   I was using 1.0.2-pre1.. so I emerged 1.0.2 and this version completed
> successfully (FS is consistent.) So, I guess everything is ok now.
> 


-- 
Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
