From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 08:16:08 -0400 EDT
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <88320341394-BeMail@cr593174-a>
References: <41413A2B.9020405@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <41413A2B.9020405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Hans Reiser wrote on Thu, 09 Sep 2004 22:22:51 -0700:
> This was actually pretty decent as a design, but then a user on the 
> mailing list suggested replacing the '..' prefix with a subdirectory 
> prefix. I forget who suggested this and what the prefix was exactly. So 
> we then created a '..metas' subdirectory, and this had the advantage 
> that one could ls it to see all the builtins supported by a given 
> plugin. This is not an important advantage, and I encourage others to 
> critique it.

Like I said before, it breaks orthogonality by introducing a directory
which isn't a file/directory like the others.  ..metas can't have
attributes attached to it like other files can.  In practical use,
that makes it difficult to display in a GUI view, where you might want
to attach attributes describing the ..metas directory window size and
position.  The GUI code would have to special case it, for those times
when you want to drill down and see what's attached to a file.

On the other hand, it does satisfy the Human need to group things
together neatly, like you said.  But then so does Tetris :-).

- Alex
