From: sirpj@ecs.csus.edu
Subject: FIFO and LIFO directory plug-in
Date: Tue, 15 Jun 2004 19:12:37 -0700 (PDT)
Message-ID: <47456.68.126.218.147.1087351957.squirrel@gaia.ecs.csus.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'd like to thank you guys for your help earlier this year with the
initial phase of my project. I was able to implement FIFO queueing
functionality in Reiser v3. It is not very elegant, but I am still
learning. I was able to steer my supervisor in the direction of Reiser4.
It appears that the design principles of the new system will make it very
valuable for many at the Lab.

That said, and back to Hans' suggestion of a readdir implementation for
FIFO and LIFO file queuing... I have some questions. If anyone can answer
them, has advice, or suggestions that would be so great.

Here's where I am at, and what I don't know:

From what I can tell, files in the 'directory Item' aren't preserved in
the order they are written due to deletes and other operations. So if I
were to access the Item I couldn't be certain that they would be in first
created -> last created order.

If readdir has to sort the files in the directory every time it is called
it seems like it would be a bit of a performance hit. Should another
structure be maintained that preserves the order as the files are
written... and should readdir use that as it's basis for returning the
directory contents?
If so, that would be cool cause I kinda' have that now.

Thanks a lot,

Jenn


