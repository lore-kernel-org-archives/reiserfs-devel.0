From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 16:18:43 +0400
Message-ID: <20030628121843.GA21209@namesys.com>
References: <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de> <20030628115343.GA21256@namesys.com> <3EFD8317.9000009@g-house.de> <3EFD86FC.6060307@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFD86FC.6060307@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Jun 28, 2003 at 02:15:56PM +0200, Christian Kujau wrote:
> >ok, to make sure i've done the right thing, i'll put your patch with 
> >this change on this webserver.
> i meant: i'll put bitmap.c in
> https://ephigenie.kicks-ass.net/browse/reiserfs/2.5.72-oleg/bitmap.c_removed-long

They are the same as my fixed version now:

green@angband:~/bk/linux-2.5-alpha/fs/reiserfs> diff -u bitmap.c_removed-long bitmap.c
green@angband:~/bk/linux-2.5-alpha/fs/reiserfs>

Bye,
    Oleg
