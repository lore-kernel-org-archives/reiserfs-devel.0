From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Wed, 29 Dec 2004 22:04:42 +0100
Message-ID: <20041229210442.GA5097@schmorp.de>
References: <20041228221218.GA6412@schmorp.de> <20041229185529.GA7513@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041229185529.GA7513@hello-penguin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Traby <stefan@hello-penguin.com>
Cc: reiserfs-list@namesys.com

On Wed, Dec 29, 2004 at 07:55:29PM +0100, Stefan Traby <stefan@hello-penguin.com> wrote:
> On Tue, Dec 28, 2004 at 11:12:18PM +0100,  Marc A. Lehmann  wrote:
>  
> >    ReiserFS: hdg2: warning: reiserfs_add_entry: Congratulations! we have got hash function screwed up
> > 
> > Sure sounds like a filesystem bug to me. Is this 2.6.10-rc3-specific or a
> > generic bug in handling hash collisions?
> 
> I can confirm that with 2.6.10.
> It is independent of hash function (r5, rupasov, tea) used.

Interesting, I would have hoped it's not so easy to generate
collisions. Now that a debian package creates collisions, this issue has
become very real.

Another note: It seems that the error returned is wrong. I would expect
ENOSPC if reiserfs runs out of (key-)space, not EBUSY or whatever it
returns.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
