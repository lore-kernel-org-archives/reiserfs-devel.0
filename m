From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Interview with Hans on KernelTrap
Date: Wed, 14 Sep 2005 14:08:56 +0100
Message-ID: <432820E8.9080201@st-andrews.ac.uk>
References: <878xy0sy0d.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <878xy0sy0d.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans, in the interview you give the example:

  cat /home/reiser/mp3s/..../childcat > /dev/dsp

to illustrate concatenation.

I sorry for repeating myself, but still think it would be a lot cooler 
to be able to simply do:

  cat /home/reiser/mp3s > /dev/dsp

to achieve the same effect.
(We had a discussion of this (as part of the huge "file as directory" 
thread on the lists)
http://www.ussg.iu.edu/hypermail/linux/kernel/0411.3/0044.html
http://www.ussg.iu.edu/hypermail/linux/kernel/0505.1/0365.html
and you seemed to agree then
http://www.ussg.iu.edu/hypermail/linux/kernel/0505.1/0423.html
)
The convention (I think also approved(suggested?) by Linus at some 
point) could be that where you say

  /home/reiser/mp3s

you get a the file (or concatenation, if the directory has no "file" 
content itself), but when you say

  /home/reiser/mp3s/

(with the trailing "/"), you get the directory.

So
  book/chapter3/paragraph2
is the second paragraph of the third chapter
(or even better, a la XPath:
  book/chapter[3]/paragraph[2]
)

  book/chapter3
is the chapter

  book
is the whole book.

The user (or tools) don't even have to know which is the "real" file, 
which are "parts of real files" and which are "concatenations of real 
files". This is really good for namespace unification across part-whole 
hierarchies. If you are required to use /..../ in the middle, it breaks 
this I think. Could we get rid of requiring "...." in the middle? (Would 
that break too much?)    Peter

