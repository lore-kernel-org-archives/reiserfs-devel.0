From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 23:42:19 -0700
Message-ID: <4126EECB.1000504@namesys.com>
References: <20040820072324.CA4DA15D92@mail03.powweb.com> <200408201610.i7KGAwLm014275@turing-police.cc.vt.edu> <4126675F.9070202@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4126675F.9070202@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: Valdis.Kletnieks@vt.edu, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

We only do filesystem isolation because that is our specialty, 
filesystems, and it is better to do less well.

We fundamentally differ from other approaches because I don't think the 
problem is in developing tools to allow people to fine grain security if 
they take the time to do it, I think the problem is that nobody has the 
time to specify fine grained security for the executables on their 
computers, and our focus is on the filesystem aspects of automating the 
specification of the fine grained security for an executable.  
Researchers after us can generalize our approach to things outside the 
filesystem namespace, or, better, put those things into the filesystem 
namespace.;-)
