From: Rik van Riel <riel@redhat.com>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 17:38:15 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0602251736340.13659@cuia.boston.redhat.com>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
 <9a8748490602250735l6161a96dte2805b772a89a436@mail.gmail.com>
 <612760535.20060225181521@dns.toxicfilms.tv> <Pine.LNX.4.63.0602251339320.13659@cuia.boston.redhat.com>
 <9a8748490602251052p3e56334ei755c9ce2100e03c@mail.gmail.com>
 <1391154345.20060225203352@dns.toxicfilms.tv> <4400DA93.9080901@st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4400DA93.9080901@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Maciej Soltysiak <solt2@dns.toxicfilms.tv>, Jesper Juhl <jesper.juhl@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

On Sat, 25 Feb 2006, Peter Foldiak wrote:

> "sub-file" corresponding to a key-range. Writing a chapter should change the
> book that the chapter is part of. That is what would make it really valuable.
> Of course it would have all sorts of implications (e.g. for metadata for each
> part) that need to be thought about, but it could be done properly, I think.

What happens if you read the first 10kB of a file,
and one of the "chapters" behind your read cursor
grows?

Do you read part of the same data again when you
continue reading?

Does the read cursor automatically advance?

Your idea changes the way userspace expects files
to behave...

-- 
All Rights Reversed
