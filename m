From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [PATH] "metas" in reiserfs v4 snapsot 2004.03.26
Date: Mon, 29 Mar 2004 13:43:59 +0300
Message-ID: <20040329104359.GP5229@nysv.org>
References: <40670001.60302@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40670001.60302@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hans Reiser wrote:

>The name clashing is less important than the greater user friendliness.  
>Users on the mailing list convinced me of this.

As an avid fan and supporter, active member on the IRC channel, I must
disagree.

There have been good points here on the list, about tar balls which
may contain a metas/ directory and that less special directories
are MORE user-friendlyness.

It may superficially seem equal, if there's a directory that's invisible,
but still exists. I mean, the name of the directory may seem unimportant.

It is not. Anyone who wants to use the metas will know how to do it,
no matter what the name. I think Piotr Neuman's patch is a prerequisite
for getting this baby into the mainline kernel.

..pseudo/ was a good solution, ..metas/ is more descriptive and just
as inoffensive.

I ask you to reconsider your take on this and I for one will continue
to use ..metas/ just because I want to be able to trust my computer.
It is my tool to do my bidding, not to think for me or make assumptions,
like "Gee, that mjt fool will never want a directory named metas/"

Thank you!

-- 
mjt

