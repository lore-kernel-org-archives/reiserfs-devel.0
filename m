From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 1 Jan 2005 14:20:42 +0100
Message-ID: <200501011420.44734.namesys.Sch@ttgen.net>
References: <1909372133-BeMail@cr593174-a> <200501011328.13093.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501011328.13093.sikkh@wp.pl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 01 January 2005 13:28, Piotr Neuman wrote:
> Linux has both inotify and dnotify. I really love the kind of threads where
> nobody cares to do the research into existing solutions /approaches and
> everybody are talking about their ideas (which is of course easier than
> searching on google).

I don't see how dnotify or inotify would help here. You can't monitor whole 
directory trees with it. inotify (which I admittedly didn't know about) seems 
to allow monitoring just about ~8000 files per device. And you don't have any 
guarantee that none of the files changed before the program using inotify 
starts up. 
It seems like I'm not the only one knowing about the existing solutions, or 
why else do I have to wait for several minutes each day until a cronjob has 
updated the locatedb? 

> ps. and yup the GNOME folks are busy coding for inotify instead of
> imagining "something that may or may not exist". Just becose you send stuff
> to technical mailing list, doesn't mean you have a clue...

So do the KDE folks (not sure if it's dnotify or inotify or simply resorting 
to whatever FAM uses). But that's just a solution to a slightly different 
problem. So with respect to the question I was asking (after searching on 
google) the comment of Alexander about BeOS was much more relevant than 
yours. I don't know if this was directed towards me, but it's true, I don't 
have a clue about file systems. Maybe that's the reason I had to ask my 
question here. Or where else am I allowed to ask such a question in your 
opinion?

Fred

-- 
Fred Schaettgen
Sch@ttgen.net
