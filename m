From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Some ReiserFS failure situations and questions
Date: Fri, 05 Mar 2004 12:37:53 -0800
Message-ID: <4048E521.5010708@matchmail.com>
References: <20040303224848.GF31472@dbz.icequake.net> <20040305065837.GE15906@favonius> <20040305070842.GC3291@dbz.icequake.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040305070842.GC3291@dbz.icequake.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ryan Underwood <nemesis-lists@icequake.net>
Cc: reiserfs-list@namesys.com

Ryan Underwood wrote:
> Thank you Sander, you have been very helpful.  Sounds like I will be
> looking into that 'ordered' mount option.

It's been in the suse kernel for ages, and Chris Mason is the guy 
working on it.

It looks like it'll get into the 2.6 kernel eventually.

Though I'd hope suse would submit it for the 2.4 kernel also, since 
that's where it has been working in the suse production kernel.

Mike
