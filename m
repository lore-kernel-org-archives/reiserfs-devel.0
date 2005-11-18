From: Hans Reiser <reiser@namesys.com>
Subject: Re: [2.6 patch] fs/reiser4/: possible cleanups
Date: Fri, 18 Nov 2005 10:04:34 -0800
Message-ID: <437E17B2.9090009@namesys.com>
References: <20051118033310.GQ11494@stusta.de>	 <437D8FB3.2000108@namesys.com> <1132302717.2830.41.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132302717.2830.41.camel@laptopd505.fenrus.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@infradead.org>
Cc: Adrian Bunk <bunk@stusta.de>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Arjan van de Ven wrote:

> gcc can and does optimize static functions more. A function being static
>
>(and not having it's address taken) means that gcc is aware of all
>callers of this one function (unlike non-static obviously where places
>outside the current .c may call it). That knowledge can and is used for
>optimization. (and increasingly so in newer gcc's)
>
>
>
>  
>
Interesting.  We should use static wherever we can then.
