From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: Fwd: reiser4 non-free?
Date: Sun, 2 May 2004 23:03:53 +0200
Message-ID: <20040502210353.GA9218@hello-penguin.com>
References: <20040424193246.GA2490@raptus.homelinux.org> <200405010026.59064.camel78@iprimus.com.au> <40928521.2080107@namesys.com> <200405011303.07645.camel78@iprimus.com.au> <40954804.6050901@namesys.com>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40954804.6050901@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: camel78@iprimus.com.au, reiserfs-list@namesys.com

On Sun, May 02, 2004 at 12:12:04PM -0700, Hans Reiser wrote:

> the main killer for 8 of the 9 reviewers, at least one of whom seemed to 
> think that it would make the project unlikely to get anywhere in the 
> Linux community....  )  I spent weeks on that proposal....

ooops. Hans, don't get me wrong now.
I really think that you have great visions and that you discovered
the golden rule: "visions are useless if you can't transform them
into reality".

I do not know if there any discussions about getting reiser4 into
the standard kernel but I guess some people are at least not
amused to see a random syscall that has a version number in
it's name to go into the standard kernel.
I didn't care - until you declared reiserfs3 obsoleted by reiser4
in public.

syscalls tend to have a longer expectation of life than
filesystems - I'm very sure that fork(2) is older than
ext2 - so please at least consider the removal of the
version number and think about active long-term support.

If the syntax of the reiser[4]()-syscall is really
as desribed on http://namesys.com (reiser4() System Call Description)
I do not expect that stuff will make it into the
mainstream kernel.

Please really don't get me wrong - I just remember
EHASHCOLLISION which was simply unacceptable for the
mainstream kernel - IIRC Chris patched it out not
many seconds before Linus accepted reiserfs - after
many discussions.

-- 

  ciao - 
    Stefan
