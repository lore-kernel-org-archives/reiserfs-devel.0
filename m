From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 17:44:13 -0400 EDT
Message-ID: <7936815179-BeMail@cr593174-a>
References: <3F6A1606.9070707@mrs.umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F6A1606.9070707@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Grant Miner wrote on Thu, 18 Sep 2003 15:31:02 -0500:
> I was under the impression that in Reiser4 there are no such thing as 
> attributes.  Everything is files.

Conceptually there are just names and objects.  Yes, Hans Reiser mentions in http://www.namesys.com/v4/v4.html "... and why we aren't eager to support objects with unnecessarily different namespaces/interfaces --- such as "attributes" that cannot interact with files in all the same ways that files can interact with files."

> Certain files have special meaning to 
> the kernel (like the pseudo files).  Certain other files (would) have 
> special meaning to applications, users, etc.  So essentially we're 
> arguing about what to name certain files (like .../mime-type vs 
> ..mime-type vs mime-type)?

Yup.  Names are important.  Sure, it's all equivalent to a flat file space in some sense, but pretending there is a fancy structured naming system is useful.  Particularly since building it into the OS or file system gets more end-programmers and end-users to use it (unlike libferris http://witme.sourceforge.net/libferris.web/index.html).

> I would prefer no hidden files; I am of the opinion that no files should 
> ever be hidden.  Imagine two users browsing a file, the first with a 
> file manager that shows all files.  He sees ..user and thinks "I could 
> copy ..user to that file's ..user to make each have the same owner.  Or 
> I could edit it and change the owner that way." Now imagine the other 
> user who does not see the hidden files.  To him, how owners are stored 
> is a mystery.  He does not see the possibilities the other user sees.

They need to be hidden sometimes.  Simple users don't need to know about everything, like ownership of files.  Or be prepared for them to make a mess, like storing all their e-mail inside an attribute on an e-mail icon.

On a side note, copying the fildirute (files that are also directories and attributes) tree should recreate the same disk volume.  So you should be able to copy ".../userid" like you suggest, and have it work sensibly.

> Yet perhaps we should write the plugin first, before arguing about the 
> naming? :)

Fair enough.  Though arguing here about naming helps with my pet project, an unrelated RAM file system for BeOS.

- Alex
