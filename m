From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 as positional B-Tree
Date: Tue, 04 Nov 2003 01:00:26 -0800
Message-ID: <3FA76AAA.8080600@namesys.com>
References: <Pine.LNX.4.33.0311032059251.3088-100000@mitte.informatik.hu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0311032059251.3088-100000@mitte.informatik.hu-berlin.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gregor Zeitlinger <gregor@zeitlinger.de>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

Gregor Zeitlinger wrote:

>Hi,
>
>I've already been on this mailing list a year ago. I was wondering wheater
>I could make my native xml database a file plugin in reiser4.
>
>Now, that the code base is much more matured and that reiser4 is almost
>ready (as I understand), this seems much more feasable.
>
>Those are my questions
>1) As part of my xml database, I still need a positional B-Tree. Since
>files in reiserfs are stored in a (kinda) B+-Tree, I was wondering wheater
>a positional B-Tree could be made a file plugin. It's basically the same
>as the unix file plugin, with the exception that you'd need the additional
>operation of inserting (not overwriting) data in the middle of a file.
>
>2) If the plugin architecture is flexible enough, I'm wondering wheater I
>could port my xml database to being a file plugin. It uses a custom page
>layout and custom balance, split and merge algorithms. Also, I use c++,
>but the source could be ported to c, since I don't make heavy use of
>object oriented features. I haven't put the source code online, since it's
>not mature enough for that, but I can give to anyone interested.
>
>  
>
Please send a definition of a positional B-tree. Also indicate whether 
you are an individual vs. an organization that might be interested in 
sponsoring our creating a plugin of that kind to your specifications. 
(Yes, we are very poor this month, so I ask questions of that kind at 
every opportunity....;-) )

Purely guessing at what a positional B-tree is, I would say probably 
yes, and it would probably be valuable for the filesystem generally.

-- 
Hans 


