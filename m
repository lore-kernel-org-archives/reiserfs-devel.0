From: Chris Mason <mason@suse.com>
Subject: Re: new v3 2.6.4  logging/xattr patches
Date: Fri, 19 Mar 2004 14:11:13 -0500
Message-ID: <1079723473.11058.160.camel@watt.suse.com>
References: <1079679539.11055.101.camel@watt.suse.com>
	 <405AA885.3030000@namesys.com> <1079705006.11062.134.camel@watt.suse.com>
	 <405B4405.4010804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405B4405.4010804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2004-03-19 at 14:03, Hans Reiser wrote:
> >
> I object to the xattr patch.  Is the write cache related work in this 
> anywhere?

The barrier patch depends on the entire set.

Lets talk about the xattr patch first.  Please outline the technical
reasons why you believe the patch is unfit for submission so that Jeff
and I can fix them.

It might be easier for us to discuss things over the phone, I can give
you a call.

-chris


