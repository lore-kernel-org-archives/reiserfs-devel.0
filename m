From: Oleg Drokin <green@namesys.com>
Subject: Re: /proc/mounts doesn't show attrs
Date: Mon, 9 Sep 2002 08:58:04 +0400
Message-ID: <20020909085803.A4851@namesys.com>
References: <20020907213110.GA6012@yzero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020907213110.GA6012@yzero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Sep 07, 2002 at 05:31:10PM -0400, Tom Vier wrote:
> i added the attrs mount option in my fstab, and it's definetly worked. it's
> not showing up in /proc/mounts, though:

This is because reiserfs lacks the function through which kernel might query
current mount options in effect for given filesystem.

Bye,
    Oleg 
