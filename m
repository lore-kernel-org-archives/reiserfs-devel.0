From: Christian <evil@g-house.de>
Subject: Re: extremely strange behavior
Date: Fri, 07 Nov 2003 01:24:16 +0100
Message-ID: <3FAAE630.5040504@g-house.de>
References: <1068151323.2569.11.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068151323.2569.11.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Redeeman wrote:

> its probably just me that dont know whats going on, or doing something 
> wrong, what it does:
> i am building my own Gentoo LiveCD, and then i need to execute a script,
> when that script is on a reiserfs partition, it says it cant get
> permissions to /bin/bash, if i move the script to an ext3 partition, it
> just works!

you don't mount your reiserfs partition with "noexec" set, do you?

Christian.

-- 
BOFH excuse #395:

Redundant ACLs.

