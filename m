From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Fri, 7 Jan 2005 18:26:48 +0100
Message-ID: <20050107172648.GB18191@schmorp.de>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD8998.3070604@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41DD8998.3070604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, stefan@hello-penguin.com

On Thu, Jan 06, 2005 at 09:55:20PM +0300, Edward Shishkin <edward@namesys.com> wrote:
> >On Thu, Jan 06, 2005 at 03:45:06PM +0300, Alex Zarochentsev 
> ><zam@namesys.com> wrote:
> >>>
> >>Tea hash is designed to be more resistant.  
> >>   
> >>
> 
> Actually this can not be more resistant as it use the same 32-bit output 
> size.

Sure it can, filenames are not randomly distributed, so your argument doesn't
suffice to show that tea cannot be more resistent, as it could be more
resistent for other reasons.

That's why I originally wrote "nicely-looking", which (if it wasn't clear)
was meant to say that filenames with somewhat similar names do collide
even with tea, which suppossedly was chosen to avoid this case.

> So to find a collision you just need to find hashes of 2^16 = 65536
> random documents.

True. It's even worse if these collisions happen to filenames occuring in
practise.

(I also agree to the rest of your mail)

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
