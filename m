From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Enabling files as directories?
Date: Fri, 15 Aug 2003 18:32:50 +0400
Message-ID: <16188.61202.939487.29190@laputa.namesys.com>
References: <3F3C3B76.1000002@umn.edu>
	<1060957048.20707.3.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1060957048.20707.3.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@umn.edu>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list@namesys.com

Yury Umanets writes:
 > On Fri, 2003-08-15 at 05:46, Grant Miner wrote:
 > > I am wondering how can I enable files as directories behavior.  For example:
 > > touch a; chmod a+x a
 > > cd a
 > > touch b -> error, not a directory
 > > 
 > > Thanks,
 > > Grant
 > 
 > linux kernel 2.4.x does not allow this. At least sys_fchdir() does not
 > allow this. linux-2.6.x does.
 > 

Err. Wait. Grant, you are talking about reiser4, right?

In reiser4 you cannot use plain regular files "as directories" that is,
create files within them. Set of files living within regular file is
predetermined. Take a look at http://namesys.com/v4/pseudo.html. We are,
however, planning having special type (plugin in reiser4 parlance) of
file that is both file and directory. But it is not yet implemented.

By the way, thanks again for benchmarks. I added them to the
http://www.namesys.com/benchmarks/v4marks.html.

 > 
 > -- 
 > We're flying high, we're watching the world passes by...
 > 

Nikita.
