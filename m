From: "David Dabbs" <david@dabbs.net>
Subject: RE: Re: [PATCH] use S_ISDIR() in link_path_walk() to decide whether the last path component is a directory
Date: Mon, 13 Sep 2004 17:47:50 -0500
Message-ID: <20040913224757.B2EAC15C76@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: 
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org
Cc: viro@parcelfarce.linux.theplanet.co.uk


> viro wrote:
>>     if (*name == '/') {
>>        if (*(name+1)=='/' && *(name+2)==':') {
>>           name+=3;
>
>	Pathname resolution is a hell of a fundamental thing and kludges
>like that are too ugly to be acceptable.  If you can't make that clean
>and have to resort to stuffing "special cases" (read: barfbag of ioctl
>magnitude) into the areas that might be unspecified by POSIX, don't do it
>at all.
>

Even though SuS allows for implementation-specific resolution for pathnames
starting with "//"? It's kludgy, and I suspected that might be the response,
but I thought I'd float it nonetheless.

>I don't like the amount of handwaving from Hans, but *that* is far
>worse.  Vetoed.

Kludgy, yes, but far worse?  At least I bothered to take the SuS into
consideration and took the time to try an approach, however kludgy, that
might work within them. 

Bilious or not, thanks for the feedback.


david


