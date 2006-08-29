From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 13:59:37 +0900
Message-ID: <20060829045937.GA9181@localhost.hsdv.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1156801705.2969.6.camel@nigel.suspend2.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Cunningham <ncunningham@linuxmail.org>
Cc: Edward Shishkin <edward@namesys.com>, Stefan Traby <stefan@hello-penguin.com>, Hans Reiser <reiser@namesys.com>, Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, nitingupta.mail@gmail.com

On Tue, Aug 29, 2006 at 07:48:25AM +1000, Nigel Cunningham wrote:
> For Suspend2, we ended up converting the LZF support to a cryptoapi
> plugin. Is there any chance that you could use cryptoapi modules? We
> could then have a hope of sharing the support.
> 
Using cryptoapi plugins for the compression methods is an interesting
approach, there's a few other places in the kernel that could probably
benefit from this as well, such as jffs2 (which at the moment rolls its
own compression subsystem), and the out-of-tree page and swap cache
compression work.

Assuming you were wrapping in to LZF directly prior to the cryptoapi
integration, do you happen to have before and after numbers to determine
how heavyweight the rest of the cryptoapi overhead is? It would be
interesting to profile this and consider migrating the in-tree users,
rather than duplicating the compress/decompress routines all over the
place.
