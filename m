From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.9-mm1
Date: Sat, 23 Oct 2004 22:14:28 -0700
Message-ID: <417B3A34.2060306@namesys.com>
References: <20041023165712.GR26192@nysv.org> <417B1574.4090406@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417B1574.4090406@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

David Masover wrote:

>
> Some people don't care about speed but need space.  I'd leave them in on
> general principle, even if no one wants them now.

Software design is usually improved by identifying features that aren't 
worth much, and removing them from the interface and burying them where 
average users don't see them (or dumping them completely).  Interface 
clutter has a cost.

Hans
