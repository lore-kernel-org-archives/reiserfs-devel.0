From: "David Dabbs" <david@dabbs.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Sat, 21 Aug 2004 07:38:18 -0000
Message-ID: <20040821073818.D5EB115CBA@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, George Beshers <gbeshers@comcast.net>
Cc: Valdis.Kletnieks@vt.edu, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com


>Hans Reiser wrote:
>We only do filesystem isolation because that is our specialty, 
>filesystems, and it is better to do less well.
>
>We fundamentally differ from other approaches because I don't think the 
>problem is in developing tools to allow people to fine grain security if 
>they take the time to do it, I think the problem is that nobody has the 
>time to specify fine grained security for the executables on their 
>computers, and our focus is on the filesystem aspects of automating the 
>specification of the fine grained security for an executable.  
>Researchers after us can generalize our approach to things outside the 
>filesystem namespace, or, better, put those things into the filesystem 
>namespace.;-)

Sounds like your approach will differ a) in scope, in that you are only concerned with securing filesystem access and b) in that you will provide "wizards" where the other approaches provide none or the ones they provide suck. If this is the case, then why are we talking about mask interpreters and how they will moderate file access? Why aren't we focusing on your "sweet spot"; the wizards that assist the clueless/lazy/overworked admin in profiling a process in order to create and maintain the viewprint/mask?

If your ultimate concern is truly in providing tools that make it easy to deploy
comprehensive security, then it seems the approach to take is to contribute wizards/whatever that make implementing your process-oriented fs security vision incredibly simple under LSM or other framework. If you're only going to focus on your metier, filesystems, and exclusively on your own filesystem, at least contribute something that doesn't reinvent any wheels and which "plays well with others." People do need to secure more than the filesystem. Reiser4's adoption curve would seem to benefit if people can implement advanced filesystem security and also use the same framework to secure other aspects.  


David


