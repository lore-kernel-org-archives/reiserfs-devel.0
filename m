From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: [PATCH] use S_ISDIR() in link_path_walk() to decide whether the last path component is a directory
Date: Mon, 13 Sep 2004 16:43:16 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040913154316.GC23987@parcelfarce.linux.theplanet.co.uk>
References: <20040913074921.GA2252@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040913074921.GA2252@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, Sep 13, 2004 at 11:49:22AM +0400, Alex Zarochentsev wrote:
> Hi,
> 
> This patch does not allow open(name, O_DIRECTORY) to be successful for
> non-directories in reiser4.  It replaces ->i_op->lookup != NULL "is dir" check
> for the last path component by explicit S_ISDIR(->i_mode) check. 
> 
> Regardless to reiser4, S_ISDIR() looks more clear there.

The only objection here is that right now we are guaranteed that cwd and
root of every task have non-NULL ->lookup().  With your patch all we have
is S_ISDIR().

So we either need to check for non-NULL ->lookup() before the beginning of
loop in link_path_walk() or split the flag in two.  I would rather do the
former...
