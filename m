From: Russell Coker <russell@coker.com.au>
Subject: Re: Multiple data streams...
Date: Wed, 2 Apr 2003 22:40:57 +1000
Message-ID: <200304022240.57346.russell@coker.com.au>
References: <6167696812.20030402112847@tnonline.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6167696812.20030402112847@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Wed, 2 Apr 2003 19:28, Anders Widman wrote:
>    Is this supported, or will it be supported by ReiserFS?
>    I  use  this  feature quite quite much.. Maybe this is something to
>    add to ReiserFS?
>
>    There is very brief info at Microsoft's website:

Does MS support multiple data streams properly yet?

The last information I read about data streams indicated that commonly used 
operations (such as typing "copy" in a command-line session) would not work 
properly with multiple data streams.  Also many important programs such as 
anti-virus programs did not support it.

The Linux API does not support multiple data streams.  Support for extended 
attributes has recently been added, this will do most things that you might 
want to do with multiple streams and does it in a standard way that is 
supported.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

