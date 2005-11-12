From: Edward Shishkin <edward@namesys.com>
Subject: Re: Technical plugin details
Date: Sat, 12 Nov 2005 23:32:58 +0300
Message-ID: <4376517A.4040402@namesys.com>
References: <200511111830.44199.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511111830.44199.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Peter van Hardenberg wrote:

>Hans,
>
>I am having trouble modifying a file to use our new plugin. I've tried writing 
>various values into "foo/.^4/plugin/file" but it won't stick.
>

This is a business of plugin->h.pops->change() method.
And for regular file plugin this method (change_file) does nothing.

> The code is 
>rather sparse on comments in this part of the tree, and this is really 
>something I would hope is documented somewhere.
>
>Can you point me in the right direction?
>
>-pvh
>
>  
>

