From: Oleg Drokin <green@namesys.com>
Subject: Re: Getopt improvements
Date: Thu, 27 Feb 2003 19:25:13 +0300
Message-ID: <20030227192513.B858@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5E312C.50406@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Thu, Feb 27, 2003 at 10:39:24AM -0500, Jeff Mahoney wrote:

> 	However, I noticed in the stock 2.5.63 code that the bits during 
> remount don't get propogated at all to s_mount_opts.

Sure.
As I said, it would be trivial to do (and I was doing getopt update with this in mind),
but yet not done.

> 	Attached is your patch, updated to set the bits on remount.

Thank's for doing that.

> 	Any chance in getting the getopt update into the next 2.4 release?

I hope for that too. Current behaviour is pretty annoying, I'd say.
But we have 3 patches already in queue. This would be 4th, hope we will get that in time.
I'll port it to 2.4 shortly.

Thank you.

Bye,
    Oleg
