From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Fri, 26 Nov 2004 10:19:57 -0800
Message-ID: <41A773CD.6000802@namesys.com>
References: <2c59f00304112205546349e88e@mail.gmail.com>	 <1101287762.1267.41.camel@pear.st-and.ac.uk>	 <4d8e3fd304112407023ff0a33d@mail.gmail.com>	 <200411241711.28393.christian.mayrhuber@gmx.net> <1101379820.2838.15.camel@grape.st-and.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101379820.2838.15.camel@grape.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

Peter Foldiak wrote:

>
>The problem with the
>cat /etc/passwd/..metas/contents/shell[username = "joe"]
>syntax is that it doesn't really achieve namespace unification.
>
>
>
>
>  
>
For the case Peter cites, yes, it does add clutter to the pathname to 
say "..metas" (actually, it is "...." now in the current reiser4, not 
"..metas").  This is because you aren't looking for metafile 
information, you are looking for a subset and describing the subset, and 
that just requires a file-directory plugin that can handle the name of 
that subset and parse the file to find it.
