From: Oleg Drokin <green@namesys.com>
Subject: Re: Quota problem
Date: Mon, 13 May 2002 08:54:14 +0400
Message-ID: <20020513085414.A32129@namesys.com>
References: <Pine.LNX.4.44.0205101500340.1699-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0205101500340.1699-100000@grignard.amagerkollegiet.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus B?g Hansen <moffe@amagerkollegiet.dk>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello!

On Fri, May 10, 2002 at 03:13:18PM +0200, Rasmus B?g Hansen wrote:

> May  6 12:39:03 carlsberg kernel: VFS: find_free_dqentry(): Data block full but it shouldn't.
> May  6 12:39:03 carlsberg kernel: VFS: Error -5 occured while creating quota.

error -5 means I/O error.
Any reiserfs related messages in logs?

Also please try to run latest reiserfsck on that partition and see if it finds
any problems.

Thank you for the report.

Bye,
    Oleg
