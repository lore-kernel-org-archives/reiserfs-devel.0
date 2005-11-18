From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [2.6 patch] fs/reiser4/: possible cleanups
Date: Fri, 18 Nov 2005 09:31:57 +0100
Message-ID: <1132302717.2830.41.camel@laptopd505.fenrus.org>
References: <20051118033310.GQ11494@stusta.de>
	 <437D8FB3.2000108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437D8FB3.2000108@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Adrian Bunk <bunk@stusta.de>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Fri, 2005-11-18 at 00:24 -0800, Hans Reiser wrote:
> Seems ok to me.  Is it valuable reasons I don't know about to keep
> reiser4_* functions from crowding the namespaces of the rest of the
> kernel?  Is linking faster or?

gcc can and does optimize static functions more. A function being static
(and not having it's address taken) means that gcc is aware of all
callers of this one function (unlike non-static obviously where places
outside the current .c may call it). That knowledge can and is used for
optimization. (and increasingly so in newer gcc's)

