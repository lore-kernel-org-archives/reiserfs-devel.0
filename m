From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 15:31:02 -0500
Message-ID: <3F6A1606.9070707@mrs.umn.edu>
References: <2692131547-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2692131547-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I was under the impression that in Reiser4 there are no such thing as 
attributes.  Everything is files.  Certain files have special meaning to 
the kernel (like the pseudo files).  Certain other files (would) have 
special meaning to applications, users, etc.  So essentially we're 
arguing about what to name certain files (like .../mime-type vs 
..mime-type vs mime-type)?

I would prefer no hidden files; I am of the opinion that no files should 
ever be hidden.  Imagine two users browsing a file, the first with a 
file manager that shows all files.  He sees ..user and thinks "I could 
copy ..user to that file's ..user to make each have the same owner.  Or 
I could edit it and change the owner that way." Now imagine the other 
user who does not see the hidden files.  To him, how owners are stored 
is a mystery.  He does not see the possibilities the other user sees.

Yet perhaps we should write the plugin first, before arguing about the 
naming? :)

