From: Oleg Drokin <green@namesys.com>
Subject: Re: Mounting reiserfs with nonstandard journal size fails
Date: Wed, 30 Oct 2002 09:39:11 +0300
Message-ID: <20021030093911.B5560@namesys.com>
References: <1035934581.1487.1409.camel@rivendell.arnor.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1035934581.1487.1409.camel@rivendell.arnor.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Torrey Hoffman <thoffman@arnor.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Tue, Oct 29, 2002 at 03:36:20PM -0800, Torrey Hoffman wrote:
> I'm having trouble mounting a reiserfs filesystem created with a
> nonstandard (smaller) journal size.  But if I use the default journal
> size, it works fine.

Sure. Non-standard journal is only supported in 2.5 kernel for now.

Bye,
    Oleg
