From: Oleg Drokin <green@namesys.com>
Subject: Re: Multiple data streams...
Date: Wed, 2 Apr 2003 19:18:22 +0400
Message-ID: <20030402191822.A5875@namesys.com>
References: <6167696812.20030402112847@tnonline.net> <200304022240.57346.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304022240.57346.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Hello!

On Wed, Apr 02, 2003 at 10:40:57PM +1000, Russell Coker wrote:

> The Linux API does not support multiple data streams.  Support for extended 
> attributes has recently been added, this will do most things that you might 
> want to do with multiple streams and does it in a standard way that is 
> supported.

Current API in the form I saw, greatly limits its usage.
E.g. get_attribute(name) kind of function can only return whole attribute
at a time. Also current ext3 realisation limits attributes size to be
not bigger than one block. I have not looked at XFS realisation yet.

Bye,
    Oleg
