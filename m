From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 10:12:53 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com>
References: <200408261700.43253.vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408261700.43253.vda@port.imtp.ilyichevsk.odessa.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Cc: Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Denis Vlasenko wrote:

> I think Hans is not planning turning old "file is a stream of bytes"
> into eight-stream octopus. One stream will remain as a 'main' one,
> which contains actual data. Others will keep metadata, etc...

This is exactly what the Samba people want, though. 

Office suites can store a document with embedded images
and spread sheets "easily" by putting the text, the
images and spread sheets all in different file streams.

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

