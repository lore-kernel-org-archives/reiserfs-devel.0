From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: AMD64 progress?
Date: Mon, 7 Feb 2005 22:51:47 +0300
Message-ID: <20050207195147.GB7482@backtop.namesys.com>
References: <20050114201751.GB5883@backtop.namesys.com> <Pine.LNX.4.44.0501152102230.10167-100000@ccc7.wpi.edu> <20050207132934.GA7482@backtop.namesys.com> <1107804896.10689.17.camel@gentoo>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1107804896.10689.17.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Isaac Chanin <chanin@WPI.EDU>, reiserfs-list@namesys.com

On Mon, Feb 07, 2005 at 01:34:56PM -0600, Jake Maciejewski wrote:
> I'm running reiser4progs 1.0.3 and 2.6.10 patched with reiser4 from
> 2.6.11-rc3-mm1 (and this patch).
> 
> I've been doing the simultaneous dd and kernel compilation that has
> always crashed reiser4 on AMD64 in the past. After about an hour with
> debugging and two hours without debugging, I'm thinking of more ways to
> torture the FS. For now it looks like reiser4 is working on AMD64!

i think so.  reiser4/amd64 passed 5h of stress testing instead of crashing in
first 30min.

> 
> How did you track this bug down anyway? Do you have AMD64 hardware, or

yes, we have amd64 h/w now.

> did you look over the code and discover an invalid assumption? 

I found it only after realizing that reiser4_find_next_set_bit
is broken :( (its simple replacement worked fine)

> If this
> bug is indeed fixed, are we any closer to inclusion in vanilla?
> 
> On Mon, 2005-02-07 at 16:29 +0300, Alex Zarochentsev wrote:
> > Hello,
> > 
> > On Sat, Jan 15, 2005 at 09:26:01PM -0500, Isaac Chanin wrote:
> > > 
> > > Also tested this patch, similar results as to what I've been getting - 
> > > ie. working for awhile (more than a few hours even this time, but that 
> > > could just be coincidence, i suppose) and then going down with the normal 
> > > reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
> > > start_offset) >= end_offset error.  For the exact message see 
> > > http://users.wpi.edu/~chanin/r4newpatch.txt.
> > > 
> > 
> > please try attached patch (it is for fs/reiser4 subtree)
> > 
> -- 
> Jake Maciejewski <maciejej@msoe.edu>
> 

-- 
Alex.
