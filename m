From: Anders Widman <andewid@tnonline.net>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Wed, 16 Apr 2003 23:38:20 +0200
Message-ID: <78211964.20030416233820@tnonline.net>
References: <3E9D83B7.4050904@namesys.com> <1050528366.13617.16.camel@fortknox>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1050528366.13617.16.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: Reiserfs-List@namesys.com

> Yes, I just threw 2 promise controllers away because the drivers are
> damn instable (at least for kernels 2.4.19- 21pre7).

> If you don't want to risk unnecessary crashes buy a controller that is
> *really* supported like the highpointech/cmd/3ware/via ones.

  Just a note on this. I have found that Promise controllers (at least
  the  Ultra  100  Tx2  ones)  have  a nasty incapability problem with
  Maxtor  drives.  This cause me to have all sorts of random problems.
  Once  I  moved  the  Maxtor  drives to the VIA controller everything
  runs fine so far.

  Now I am only running Seagate and IBM on the Promise controllers and
  it  is  fine. The new Maxtor (which uses Quantum labeled chips) seem
  to work good too.

  //Anders

