From: Hans Reiser <reiser@namesys.com>
Subject: Re: Authoring a versioning plugin
Date: Wed, 11 Jan 2006 22:44:48 -0800
Message-ID: <43C5FAE0.5090602@namesys.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <43C5D694.9050402@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C5D694.9050402@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Cc: reiserfs-List@namesys.com

Hans Reiser wrote:

>:
>
>  
>
>  I am skeptical that having it occur with every
>write is desirable actually.
>  
>
Consider the case where you type cat file1 >> file2.  This will produce
a version of file2 for every 4k that is in file1, because (well I didn't
look at the bash source, but I would guess) it appends in 4k incremental
writes rather than one big write.  Versioning on file close makes more
sense, but I suggest manual control using the ..../checkin pseudofile,
and then we can reasonably make it the default plugin for the whole FS
(write it so that it calls the other plugins so that when we change the
other plugins we don't need to change your code to do it).  People who
don't want versioning will simply never touch the checkin pseudofile. 
Make sure that for that case there is just an if statement condition
check as overhead, and there will be no reason to not make versioning
the default plugin that happens to do nothing unless you use the checkin
pseudofile at least once during the life of the file.

hmm, maybe ..../snap is better than ..../checkin ?  Well, let's decide
that once the code is written....;-)

Do you agree with my points here?

Hans


