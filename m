From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: file as a directory
Date: Sat, 27 Nov 2004 14:49:37 +0200
Message-ID: <20041127124937.GO26192@nysv.org>
References: <2c59f00304112205546349e88e@mail.gmail.com> <1101287762.1267.41.camel@pear.st-and.ac.uk> <4d8e3fd304112407023ff0a33d@mail.gmail.com> <200411241711.28393.christian.mayrhuber@gmx.net> <1101379820.2838.15.camel@grape.st-and.ac.uk> <41A773CD.6000802@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41A773CD.6000802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

On Fri, Nov 26, 2004 at 10:19:57AM -0800, Hans Reiser wrote:

>For the case Peter cites, yes, it does add clutter to the pathname to 
>say "..metas" (actually, it is "...." now in the current reiser4, not 
>"..metas").  This is because you aren't looking for metafile 

"...." shound like something that could be an alias for ../..
so not much better than reserving the word "metas" from the namespace.

I guess I'll still go with ..metas here, as it's the best compromise
showed. Or maybe even ..meta (as there is no need for the plural imo)

Just re-opening a damned useless, old, tired and daft can of worms :P

-- 
mjt

