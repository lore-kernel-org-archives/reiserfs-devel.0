From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: [PATCH] use S_ISDIR() in link_path_walk() to decide whether the last path component is a directory
Date: Mon, 13 Sep 2004 23:26:19 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040913222618.GE23987@parcelfarce.linux.theplanet.co.uk>
References: <20040913213429.6813115CA8@mail03.powweb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040913213429.6813115CA8@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dabbs <david@dabbs.net>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org, 'Alex Zarochentsev' <zam@namesys.com>

On Mon, Sep 13, 2004 at 04:34:15PM -0500, David Dabbs wrote:
> I'm working on something similar, but with alternate pathname resolution
> when the path begins with exactly two slashes. Only pseudocode here because
> I do not have access to my box:
> 
>     if (*name == '/') {
>        if (*(name+1)=='/' && *(name+2)==':') {
>           name+=3;

	Pathname resolution is a hell of a fundamental thing and kludges
like that are too ugly to be acceptable.  If you can't make that clean
and have to resort to stuffing "special cases" (read: barfbag of ioctl
magnitude) into the areas that might be unspecified by POSIX, don't do it
at all.

	I don't like the amount of handwaving from Hans, but *that* is far
worse.  Vetoed.
