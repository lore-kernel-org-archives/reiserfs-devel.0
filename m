From: Oleg Drokin <green@namesys.com>
Subject: Re: duplicate files and recent changes
Date: Thu, 6 Jun 2002 09:45:04 +0400
Message-ID: <20020606094504.A851@namesys.com>
References: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "S. Alexander Jacobson" <alex@shop.com>
Cc: reiserfs-list@namesys.com

Hello!


On Thu, Jun 06, 2002 at 01:30:46AM -0400, S. Alexander Jacobson wrote:
> I just joined this list.  Two question:
> 1. Can reiserfs detect that I have two copies of
> the same file on disk and store tham as one file

Hm, you mean, each time you create a file, reiserfs should scan all
other files and see if there is exactly a file like you just wrote?
Hm, even something more complicated as you are writing to a file in
4k chunks.
Definitely no.

> (doing a lazy copy) if someone writes to one of
> them?

> 2. Is there a fast way to get access to the file
> change list?  It would be nice to be able to do
> fast backup of changed files without having to
> traverse entire directory trees.

No.

But if you really need these features, you can ask Hans to implement these.
(Hans can be easily conviced to implementing arbitrary features by passing
him money).

Bye,
    Oleg
