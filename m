From: Andrew Clausen <clausen@gnu.org>
Subject: Re: aal_assert()
Date: Sat, 11 Jan 2003 00:36:57 +1100
Message-ID: <20030110133657.GE1056@gnu.org>
References: <20021231005440.GA1573@gnu.org> <3E1E74C3.8050707@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E1E74C3.8050707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, Jan 10, 2003 at 10:22:43AM +0300, Yura Umanets wrote:
> Actually there was the code earlier like you have proposed. And it was 
> changed to the current state due to the following reasons:
> 
> * there are two developers working on reiser4progs currentry (Vitaly 
> Fertman and Yury Umanets). And our parts is much different. So, each of 
> us should work on own code.
> * there is not neccessary an assertion is corect and only the author can 
> decide is it correct.

Well, that decision is made by the developers, not the users.
Presumebly, you know who wrote what code.  If an assertion is
contentious (and 99.9% of them aren't), you should document *why*,
anyway.

> * NAMESYS has some development policies. And hints is the one of them.

Why?

Cheers,
Andrew

