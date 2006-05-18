From: Tom Vier <tmv@comcast.net>
Subject: Re: 2.6.16 + reiser4 -2 patch = gcc error
Date: Thu, 18 May 2006 15:01:52 -0400
Message-ID: <20060518190152.GB25823@zero>
References: <20060517190805.GB32223@zero> <1147945452.6417.24.camel@tribesman.namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1147945452.6417.24.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, May 18, 2006 at 01:44:12PM +0400, Vladimir V. Saveliev wrote:
> I guess you got broken lines 485 and 507 in file
> fs/reiser4/plugin/file_ops_readdir.c
> 
> Here is what you should have:
> 485:	mutex_lock(&inode->i_mutex);
> 507:	mutex_unlock(&inode->i_mutex);

Actually, it was my fault. I had forgotten to apply the 2.6.15->.16 patch.
Thanks for you help, tho.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
