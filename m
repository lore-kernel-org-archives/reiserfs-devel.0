From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 6 Jan 2005 15:27:06 +0100
Message-ID: <20050106142706.GE519@schmorp.de>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050106124505.GE5352@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com, stefan@hello-penguin.com

On Thu, Jan 06, 2005 at 03:45:06PM +0300, Alex Zarochentsev <zam@namesys.com> wrote:
> > generic bug in handling hash collisions?
> 
> Tea hash is designed to be more resistant.  

As the example posted shows, tea doesn't look better, it generates
nicely-looking collisions, too.

> Does the debian install all X font files into one dir?

No, but xfree nowadays comes with a lot of fonts because it stupidly makes
a copy of about each and every font in each and every encoding, leading to
many font files in the bitmapped category (75dpi and 100dpi).

> May be you have your own font files installed in the same dir?

I also have some other debian packages that install their fonts there, but
it should be less than 10 extra files.

> I suggest to split the dir into several ones.

I'd suggest getting rid of reiserfs on anything important. I can't have it
when my filesystem randomly returns errors when it should be working.

I wonder wether this hasn't any security relevance, as it allows attackers
easily to create filename holes in the filesystem that even root cannot
override.

Thanks for the suggestion, though! However, the workaround I currently use
(delete the dir, reinstall) works better, as it doesn't destroy debian's
idea of the filesystem layout.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
