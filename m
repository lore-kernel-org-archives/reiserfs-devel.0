From: Hans Reiser <reiser@namesys.com>
Subject: Re: Be's FS attribute and inoded functionality.
Date: Sun, 07 Apr 2002 14:14:42 +0400
Message-ID: <3CB01C12.8050709@namesys.com>
References: <20020406231056.B25412@gerf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: The Doctor What <docwhat@gerf.org>, ReiserFS List <reiserfs-list@namesys.com>

The Doctor What wrote:

>There was an article on Slashdot (and the interview on the
>Register):
>http://slashdot.org/article.pl?sid=02/03/30/1445257&mode=nested
>
>Hans, given the DB-like structure in ReiserFS, how hard would it be
>to add these features in ReiserFS?
>
>I like the Inode Daemon idea.  It's always pissed me off that "file
>managers" (finder, explorer, nautilus, gmc, etc) all are static
>views of a very dynamic world.  Even more so on systems like my OS X
>iBook where I have lots of processes running, doing work for me even
>as I type this letter.
>
>And being able to sort and organize views of files is just an
>increadible idea.
>
>Ciao!
>
It is all in the plan.  We're just making sure our performance is good 
for our storage layer before moving onto semantics.  That way we can 
avoid saying stupid things like B-trees are evil and slow like the BeFS 
guys do.:-)

Hans


