From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: labels like those in gmail
Date: 10 Sep 2004 10:13:49 +0100
Message-ID: <1094807629.11803.53.camel@pear.st-and.ac.uk>
References: <f18a8d9804090913107d67b94d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d9804090913107d67b94d@mail.gmail.com>
Content-Transfer-Encoding: 7bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bedros@computer.org
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

On Thu, 2004-09-09 at 21:10, Bedros Hanounik wrote:
> I use reiserfs but not familiar with the technical details. I'm
> wondering if it's possible to use meta tags in reiser4 fs to add
> labels to files.
> 
> for example, I could have labels: photo, work, personal, vacation....
> 
> then a jpg file from work would have the labels photo and work.
> 
> it allows searching my files easier. no need to create different
> directories for different subjects. All files are in the same
> directory and I could browse them using labels.
> 
> another advantage is that many files may fall in two categories and
> rather than have multiple copies one in each category, I just apply
> multiple labels for a single copy of the file.
> 
> if the answer is yes, does it require a core change to reiserfs or can
> be a plugin.

This is exactly the problem that Han's Future Vision whitepaper
http://www.namesys.com/whitepaper.html
is about and what you need is what Hans called "set vicinity
intersection" or grouping.

You should be able to store your photo associated to
(photo, work, personal, vacation)
and then you will be able to browse them by typing
[photo work personal]
together with all other personal work photos.

(Actually, if we go my way, using feature sets for inheritance then you
should probably associate
   ([photo], work, personal, vacation)
but that is a detail.)

I don't know whethet its implementation will involve anything like what
you mean by "meta tag labels".

> another question, is the meta tag structure is xml? should it be? XML
> documents waste a lot of space and require more cpu cycles to process,
> but they are extensible and I hope reiser4 tags are also extensible


We can probably map an XML structure into Reiser6 syntax using an XML
plugin. Peter


