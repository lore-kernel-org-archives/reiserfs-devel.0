From: Tom Vier <tmv@comcast.net>
Subject: Re: Can compression at filesystem level improve overall	performance?
Date: Mon, 29 Mar 2004 00:16:14 -0500
Message-ID: <20040329051614.GA19372@zero>
References: <405B02ED.4010602@solidcode.net> <1079713790.9729.1.camel@redeeman.linux.dk> <16475.9613.375262.677576@laputa.namesys.com> <1079978427.4658.63.camel@localhost.localdomain> <405F46D8.1040607@namesys.com> <1080011016.4658.408.camel@localhost.localdomain>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080011016.4658.408.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Mar 22, 2004 at 10:03:36PM -0500, Scott Young wrote:
> What I'm saying is that you can start writing uncompressed data to the
> drive while the yet-to-be-written data is being compressed.  The goal is

i like your race idea. one problem is all writes now take significant cpu
(depending on the method). i'm wondering about a daemon that (in userspace)
that scans for files that are worth compressing. that's what disk doubler
used to do. i'd be interested to see some benchmarks, to see if compression
has much effect on total throughput.

> As an example, take a web server that has HTTP compression enabled. 
> Instead of compressing the data once per request, simply store the
> compressed version and send that when the next request occurs.  The

the server should cache the compressed versions in files. i'm pretty sure
apache does.

> There could be a "live" derivative, where any change to the original
> file reflects in the derivative file, or they could be constant, where
> any change in the original does not reflect in the derivative.  When I
<snip>

i dunno about doing all this in the kernel. as it is, i wish the kernel
wasn't so complicated. 8) what about a preload lib that puts everything
through bitkeeper or cvs?

> developer wouldn't have to rerun gcc to run the executable.  The file
> would automagically be compiled from the sources.

ide's can do this. and do you really want to have it run every time you
save? i save often, many times when i know there are going to be problems
cuz i haven't finished what i'm working on. a "lint" button would be better,
imho.

> The more I think about it, it seems that derived-files could be
> implemented as plugin(s) with only one extra feature added to the core
> filesystem: copy-on-write.  (Copy-on-write could be extended to only
> write changes, and have the new version be constructed as a derived file
> from the original, thereby compactly maintaining multiple versions of a
> file and improving write performance, but I digress)

cow is something that i've wanted to have ever since using hard links for
kernel trees (cp -al).

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
