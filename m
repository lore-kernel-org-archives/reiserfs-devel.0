From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Fri, 17 Dec 2004 08:54:16 -0800
Message-ID: <41C30F38.6090407@namesys.com>
References: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>	 <41ACA7C9.1070001@namesys.com>	 <1103043518.21728.159.camel@pear.st-and.ac.uk>	 <41BF21BC.1020809@namesys.com>	 <1103059622.2999.17.camel@grape.st-and.ac.uk>	 <41BFC1C5.1070302@slaphack.com> <1103102854.30601.12.camel@pear.st-and.ac.uk> <41C0CF3B.1030705@slaphack.com> <41C1D870.2020407@namesys.com> <41C30325.4040604@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41C30325.4040604@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

David Masover wrote:

> Hans Reiser wrote:
> | David Masover wrote:
> |
> |>
> |>
> |> Speaking of which, how much speed is lost by starting up a process?
> |>
> |> The idea of caching is that running
> |>
> |> cat *; cat *; cat *; cat *; cat *
> |>
> |> is probably slower than
> |>
> |> cat * > baz; cat baz; cat baz; cat baz; cat baz; cat baz
> |
> |
> | Only for small files where the per file overhead of a read is 
> significant.
>
> That's potentially a common problem, and "cat *" is an overly-simplified
> example.  Either you force the "plugin" to say whether it wants to be
> cached or not, or you cache everything, because there are going to be
> plugins like "tar -xjp" for which caching is a HUGE increase.

Ok, I accept the argument.
