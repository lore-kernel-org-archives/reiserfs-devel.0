From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs corruption
Date: Mon, 18 Nov 2002 11:12:36 +0300
Message-ID: <20021118111236.D3827@namesys.com>
References: <3DD6C827.5090501@aevum.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DD6C827.5090501@aevum.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Wellnhofer <wellnhofer@aevum.de>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Nov 16, 2002 at 11:35:19PM +0100, Nick Wellnhofer wrote:

> But the system still runs fine, so I'm a bit scared to try a
> --rebuild-tree, especially because I have no direct access to the server
> right now. What are your experiences with --rebuild-tree? What are the
> chances of --rebuild-tree failing?

100%, there is no supported way to run reiserfsck --rebuild-tree on mounted fs.
You should boot off some other fs and run reiserfsck from there.

> Another thing: I expect that my reiserfs file system was already
> corrupted before the kernel upgrade, but only the new kernel version
> tells me about that. Does reiserfs report more error conditions in
> kernel 2.4?

Yes.

Bye,
    Oleg
